static StringMap g_colors;

void Color_Create() {
    g_colors = new StringMap();
    g_colors.SetArray(COLOR_RED, {255, 0, 0, 255}, 4);
    g_colors.SetArray(COLOR_LIME, {0, 255, 0, 255}, 4);
    g_colors.SetArray(COLOR_BLUE, {0, 0, 255, 255}, 4);
    g_colors.SetArray(COLOR_YELLOW, {255, 255, 0, 255}, 4);
    g_colors.SetArray(COLOR_FUCHSIA, {255, 0, 255, 255}, 4);
    g_colors.SetArray(COLOR_AQUA, {0, 255, 255, 255}, 4);
    g_colors.SetArray(COLOR_WHITE, {255, 255, 255, 255}, 4);
}

void Color_Get(const char[] name, int color[4]) {
    g_colors.GetArray(name, color, 4);
}
