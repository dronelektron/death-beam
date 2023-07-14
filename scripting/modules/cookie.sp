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
    char beamColor[COOKIE_BEAM_COLOR_SIZE];

    GetClientCookie(client, g_beamColorCookie, beamColor, sizeof(beamColor));

    if (Cookie_IsEmpty(beamColor)) {
        Cookie_SetBeamColor(client, COLOR_WHITE);
    } else {
        Cookie_UpdateBeamColor(client, beamColor);
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

void Cookie_GetBeamColorName(int client, char[] beamColor) {
    GetClientCookie(client, g_beamColorCookie, beamColor, COOKIE_BEAM_COLOR_SIZE);
}

void Cookie_GetBeamColor(int client, int color[4]) {
    color = g_beamColor[client];
}

void Cookie_SetBeamColor(int client, const char[] beamColor) {
    SetClientCookie(client, g_beamColorCookie, beamColor);
    Cookie_UpdateBeamColor(client, beamColor);
}

static void Cookie_UpdateBeamColor(int client, const char[] beamColor) {
    Color_Get(beamColor, g_beamColor[client]);
}
