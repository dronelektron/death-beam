static Handle g_showBeamCookie;
static Handle g_beamColorCookie;
static bool g_showBeam[MAXPLAYERS + 1];
static int g_beamColor[MAXPLAYERS + 1][4];

void Cookie_Create() {
    g_showBeamCookie = RegClientCookie("deathbeam_show", "Show death beam", CookieAccess_Private);
    g_beamColorCookie = RegClientCookie("deathbeam_color", "Death beam color", CookieAccess_Private);
}

void Cookie_Load(int client) {
    LoadShowBeam(client);
    LoadBeamColor(client);
}

void Cookie_LateLoad() {
    for (int client = 1; client <= MaxClients; client++) {
        if (AreClientCookiesCached(client)) {
            OnClientCookiesCached(client);
        }
    }
}

static void LoadShowBeam(int client) {
    char showBeam[COOKIE_SHOW_BEAM_SIZE];

    GetClientCookie(client, g_showBeamCookie, showBeam, sizeof(showBeam));

    if (IsEmpty(showBeam)) {
        Cookie_SetShowBeam(client, COOKIE_SHOW_BEAM_YES);
    } else {
        UpdateShowBeam(client, showBeam);
    }
}

static void LoadBeamColor(int client) {
    char colorName[COLOR_NAME_SIZE];

    GetClientCookie(client, g_beamColorCookie, colorName, sizeof(colorName));

    if (IsEmpty(colorName)) {
        SetDefaultColor(client);
    } else {
        UpdateBeamColor(client, colorName);
    }
}

static bool IsEmpty(const char[] value) {
    return value[0] == NULL_CHARACTER;
}

bool Cookie_IsShowBeam(int client) {
    return g_showBeam[client];
}

void Cookie_SetShowBeam(int client, const char[] showBeam) {
    SetClientCookie(client, g_showBeamCookie, showBeam);
    UpdateShowBeam(client, showBeam);
}

static void UpdateShowBeam(int client, const char[] showBeam) {
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
    UpdateBeamColor(client, colorName);
}

static void UpdateBeamColor(int client, const char[] colorName) {
    bool colorExists = ColorList_Get(colorName, g_beamColor[client]);

    if (!colorExists) {
        SetDefaultColor(client);
        LogError("Color '%s' is not found for player \"%L\"", colorName, client);
    }
}

static void SetDefaultColor(int client) {
    char colorName[COLOR_NAME_SIZE];

    Variable_ColorName(colorName);
    Cookie_SetBeamColor(client, colorName);
}
