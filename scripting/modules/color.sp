void Color_RgbaStringToArray(const char[] text, int color[4]) {
    char parts[4][4];

    ExplodeString(text, " ", parts, 4, 4);

    color[R] = StringToInt(parts[R]);
    color[G] = StringToInt(parts[G]);
    color[B] = StringToInt(parts[B]);
    color[A] = StringToInt(parts[A]);
}
