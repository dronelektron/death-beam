static StringMap g_colors;
static ArrayList g_names;

void ColorList_Create() {
    int blockSize = ByteCountToCells(COLOR_NAME_SIZE);

    g_colors = new StringMap();
    g_names = new ArrayList(blockSize);
}

void ColorList_Clear() {
    g_colors.Clear();
    g_names.Clear();
}

void ColorList_Add(const char[] name, int color[4]) {
    g_colors.SetArray(name, color, sizeof(color));
    g_names.PushString(name);
}

bool ColorList_Get(const char[] name, int color[4]) {
    return g_colors.GetArray(name, color, sizeof(color));
}

void ColorList_GetName(int index, char[] name) {
    g_names.GetString(index, name, COLOR_NAME_SIZE);
}

int ColorList_Size() {
    return g_colors.Size;
}

bool ColorList_Exists(const char[] name) {
    return g_colors.ContainsKey(name);
}
