static char g_configPath[PLATFORM_MAX_PATH];

void Storage_BuildPath() {
    BuildPath(Path_SM, g_configPath, sizeof(g_configPath), CONFIG_PATH);

    if (!FileExists(g_configPath)) {
        SetFailState("The config file '%s' is not found", g_configPath);
    }
}

void Storage_LoadColors() {
    KeyValues kv = GetKeyValues();

    LoadColors(kv);
    CloseHandle(kv);
}

static KeyValues GetKeyValues() {
    KeyValues kv = new KeyValues(SECTION_COLORS);

    kv.ImportFromFile(g_configPath);

    return kv;
}

static void LoadColors(KeyValues kv) {
    ColorList_Clear();

    if (!kv.GotoFirstSubKey(KEY_ONLY_NO)) {
        SetFailState("The '%s' section is empty", SECTION_COLORS);

        return;
    }

    char colorName[COLOR_NAME_SIZE];
    int color[4];

    do {
        kv.GetSectionName(colorName, sizeof(colorName));
        kv.GetColor4(NULL_STRING, color);

        ColorList_Add(colorName, color);
    } while (kv.GotoNextKey(KEY_ONLY_NO));
}
