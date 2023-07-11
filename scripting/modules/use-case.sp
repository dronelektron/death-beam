void UseCase_DrawBeam(int victim, int killer, const float end[3]) {
    if (!Variable_PluginEnabled()) {
        return;
    }

    float start[3];
    int color[4];

    GetClientEyePosition(killer, start);
    Variable_BeamColor(color);
    Visualizer_DrawBeam(victim, start, end, color);
}

bool UseCase_IsClient(int entity) {
    return 1 <= entity && entity <= MaxClients;
}
