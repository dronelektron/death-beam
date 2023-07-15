static ConVar g_pluginEnabled;
static ConVar g_colorName;

void Variable_Create() {
    g_pluginEnabled = CreateConVar("sm_deathbeam_enable", "1", "Enable (1) or disable (0) plugin");
    g_colorName = CreateConVar("sm_deathbeam_color_name", "White", "Default beam color name");
}

bool Variable_PluginEnabled() {
    return g_pluginEnabled.IntValue == 1;
}

void Variable_ColorName(char[] colorName) {
    g_colorName.GetString(colorName, COLOR_NAME_SIZE);
}
