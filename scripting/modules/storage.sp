void Storage_LoadColors() {
    ColorList_Clear();

    char colorsPath[PLATFORM_MAX_PATH];

    BuildPath(Path_SM, colorsPath, sizeof(colorsPath), COLORS_PATH);

    if (!FileExists(colorsPath)) {
        SetFailState("Config file '%s' is not found", colorsPath);
    }

    KeyValues kv = new KeyValues("Colors");

    kv.ImportFromFile(colorsPath);

    if (!kv.GotoFirstSubKey(KEY_ONLY_NO)) {
        delete kv;

        return;
    }

    char colorName[COLOR_NAME_SIZE];
    int color[4];

    do {
        kv.GetSectionName(colorName, sizeof(colorName));
        kv.GetColor4(NULL_STRING, color);

        ColorList_Add(colorName, color);
    } while (kv.GotoNextKey(KEY_ONLY_NO));

    delete kv;

    ColorList_UpdateSnapshot();
}
