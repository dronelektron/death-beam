static ConVar g_colorName;

void Variable_Create() {
    g_colorName = CreateConVar("sm_deathbeam_color_name", "White", "Default beam color name");
}

void Variable_ColorName(char[] colorName) {
    g_colorName.GetString(colorName, COLOR_NAME_SIZE);
}
