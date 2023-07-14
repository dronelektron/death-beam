static ConVar g_pluginEnabled;

void Variable_Create() {
    g_pluginEnabled = CreateConVar("sm_deathbeam_enable", "1", "Enable (1) or disable (0) plugin");
}

bool Variable_PluginEnabled() {
    return g_pluginEnabled.IntValue == 1;
}
