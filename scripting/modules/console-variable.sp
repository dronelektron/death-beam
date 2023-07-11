static ConVar g_pluginEnabled;
static ConVar g_beamColor;

void Variable_Create() {
    g_pluginEnabled = CreateConVar("sm_deathbeam_enable", "1");
    g_beamColor = CreateConVar("sm_deathbeam_color", "255 255 255 255");
}

bool Variable_PluginEnabled() {
    return g_pluginEnabled.IntValue == 1;
}

void Variable_BeamColor(int color[4]) {
    char value[16];
    
    g_beamColor.GetString(value, sizeof(value));

    Color_RgbaStringToArray(value, color);
}
