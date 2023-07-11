static Handle g_showBeamCookie;
static char g_showBeamValue[MAXPLAYERS + 1][COOKIE_VALUE_SIZE];
static bool g_showBeam[MAXPLAYERS + 1];

void Cookie_Create() {
    g_showBeamCookie = RegClientCookie("deathbeam_show", "Show death beam", CookieAccess_Private);
}

void Cookie_Reset(int client) {
    g_showBeamValue[client] = COOKIE_SHOW_BEAM_YES;
    g_showBeam[client] = true;
}

void Cookie_Load(int client) {
    char value[COOKIE_VALUE_SIZE];

    GetClientCookie(client, g_showBeamCookie, value, sizeof(value));

    if (value[0] != NULL_CHARACTER) {
        Cookie_CopyValue(g_showBeamValue[client], value);
        Cookie_UpdateShowBeam(client, value);
    }
}

bool Cookie_IsShowBeam(int client) {
    return g_showBeam[client];
}

void Cookie_SetShowBeam(int client, const char[] value) {
    SetClientCookie(client, g_showBeamCookie, value);
    Cookie_CopyValue(g_showBeamValue[client], value);
    Cookie_UpdateShowBeam(client, value);
}

static void Cookie_CopyValue(char[] destination, const char[] source) {
    strcopy(destination, COOKIE_VALUE_SIZE, source);
}

static void Cookie_UpdateShowBeam(int client, const char[] value) {
    g_showBeam[client] = strcmp(value, COOKIE_SHOW_BEAM_YES) == 0;
}
