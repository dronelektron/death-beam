void UseCase_CheckDefaultColorName() {
    char colorName[COLOR_NAME_SIZE];

    Variable_ColorName(colorName);

    if (!ColorList_IsColorNameExists(colorName)) {
        SetFailState("Default color name '%s' is not found", colorName);
    }
}

void UseCase_OnPlayerDeath(int victim, int attacker, const char[] weapon) {
    if (!Cookie_IsShowBeam(victim) || IsEntity(attacker) || WeaponFilter_IsBad(weapon)) {
        return;
    }

    float origin[3];
    float target[3];
    float angles[3];
    float direction[3];
    int color[4];

    GetClientEyePosition(attacker, origin);
    GetClientEyePosition(victim, target);
    GetClientEyeAngles(attacker, angles);

    float distance = GetVectorDistance(origin, target);

    GetAngleVectors(angles, direction, NULL_VECTOR, NULL_VECTOR);
    ScaleVector(direction, distance);
    AddVectors(origin, direction, target);
    Cookie_GetBeamColor(victim, color);
    Visualizer_DrawBeam(victim, origin, target, color);
}

static bool IsEntity(int entity) {
    return entity < 1 || entity > MaxClients;
}
