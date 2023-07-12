static Handle g_showBeamCookie;
static bool g_showBeam[MAXPLAYERS + 1];

void Cookie_Create() {
    g_showBeamCookie = RegClientCookie("deathbeam_show", "Show death beam", CookieAccess_Private);
}

void Cookie_Load(int client) {
    char showBeam[COOKIE_SHOW_BEAM_SIZE];

    GetClientCookie(client, g_showBeamCookie, showBeam, sizeof(showBeam));

    if (showBeam[0] == NULL_CHARACTER) {
        Cookie_SetShowBeam(client, COOKIE_SHOW_BEAM_YES);
    } else {
        Cookie_UpdateShowBeam(client, showBeam);
    }
}

bool Cookie_IsShowBeam(int client) {
    return g_showBeam[client];
}

void Cookie_SetShowBeam(int client, const char[] showBeam) {
    SetClientCookie(client, g_showBeamCookie, showBeam);
    Cookie_UpdateShowBeam(client, showBeam);
}

static void Cookie_UpdateShowBeam(int client, const char[] showBeam) {
    g_showBeam[client] = strcmp(showBeam, COOKIE_SHOW_BEAM_YES) == 0;
}
