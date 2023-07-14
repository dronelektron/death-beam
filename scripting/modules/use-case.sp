void UseCase_DrawBeam(int victim, int attacker, int damageType, const float end[3]) {
    bool draw = true;

    draw &= Variable_PluginEnabled();
    draw &= UseCase_IsBulletDamage(damageType);
    draw &= UseCase_IsClient(attacker);
    draw &= Cookie_IsShowBeam(victim);
    draw &= !IsPlayerAlive(victim);

    if (draw) {
        float start[3];
        int color[4];

        GetClientEyePosition(attacker, start);
        Cookie_GetBeamColor(victim, color);
        Visualizer_DrawBeam(victim, start, end, color);
    }
}

bool UseCase_IsBulletDamage(int damageType) {
    return (damageType & DAMAGE_BULLET) == DAMAGE_BULLET;
}

bool UseCase_IsClient(int entity) {
    return 1 <= entity && entity <= MaxClients;
}
