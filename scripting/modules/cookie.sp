static Handle g_showBeamCookie;
static Handle g_beamColorCookie;
static bool g_showBeam[MAXPLAYERS + 1];
static int g_beamColor[MAXPLAYERS + 1][4];

void Cookie_Create() {
    g_showBeamCookie = RegClientCookie("deathbeam_show", "Show death beam", CookieAccess_Private);
    g_beamColorCookie = RegClientCookie("deathbeam_color", "Death beam color", CookieAccess_Private);
}

void Cookie_Load(int client) {
    Cookie_LoadShowBeam(client);
    Cookie_LoadBeamColor(client);
}

static void Cookie_LoadShowBeam(int client) {
    char showBeam[COOKIE_SHOW_BEAM_SIZE];

    GetClientCookie(client, g_showBeamCookie, showBeam, sizeof(showBeam));

    if (Cookie_IsEmpty(showBeam)) {
        Cookie_SetShowBeam(client, COOKIE_SHOW_BEAM_YES);
    } else {
        Cookie_UpdateShowBeam(client, showBeam);
    }
}

static void Cookie_LoadBeamColor(int client) {
    char colorName[COLOR_NAME_SIZE];

    GetClientCookie(client, g_beamColorCookie, colorName, sizeof(colorName));

    if (Cookie_IsEmpty(colorName)) {
        Cookie_SetDefaultColor(client);
    } else {
        Cookie_UpdateBeamColor(client, colorName);
    }
}

static bool Cookie_IsEmpty(const char[] value) {
    return value[0] == NULL_CHARACTER;
}

bool Cookie_IsShowBeam(int client) {
    return g_showBeam[client];
}

void Cookie_SetShowBeam(int client, const char[] showBeam) {
    SetClientCookie(client, g_showBeamCookie, showBeam);
    Cookie_UpdateShowBeam(client, showBeam);
}

static void Cookie_UpdateShowBeam(int client, const char[] showBeam) {
    g_showBeam[client] = StrEqual(showBeam, COOKIE_SHOW_BEAM_YES);
}

void Cookie_GetBeamColorName(int client, char[] colorName) {
    GetClientCookie(client, g_beamColorCookie, colorName, COLOR_NAME_SIZE);
}

void Cookie_GetBeamColor(int client, int color[4]) {
    color = g_beamColor[client];
}

void Cookie_SetBeamColor(int client, const char[] colorName) {
    SetClientCookie(client, g_beamColorCookie, colorName);
    Cookie_UpdateBeamColor(client, colorName);
}

static void Cookie_UpdateBeamColor(int client, const char[] colorName) {
    bool colorExists = ColorList_Get(colorName, g_beamColor[client]);

    if (!colorExists) {
        Cookie_SetDefaultColor(client);
        LogError("Color '%s' is not found for player \"%L\"", colorName, client);
    }
}

static void Cookie_SetDefaultColor(int client) {
    char colorName[COLOR_NAME_SIZE];

    Variable_ColorName(colorName);
    Cookie_SetBeamColor(client, colorName);
}
