static StringMap g_colors;
static StringMapSnapshot g_names;

void ColorList_Create() {
    g_colors = new StringMap();
}

void ColorList_UpdateSnapshot() {
    g_names = g_colors.Snapshot();
}

void ColorList_Clear() {
    g_colors.Clear();

    delete g_names;
}

int ColorList_Size() {
    return g_colors.Size;
}

void ColorList_Add(const char[] name, int color[4]) {
    g_colors.SetArray(name, color, sizeof(color));
}

void ColorList_GetName(int index, char[] name) {
    g_names.GetKey(index, name, COLOR_NAME_SIZE);
}

bool ColorList_Get(const char[] name, int color[4]) {
    return g_colors.GetArray(name, color, sizeof(color));
}

bool ColorList_IsColorNameExists(const char[] name) {
    return g_colors.ContainsKey(name);
}
