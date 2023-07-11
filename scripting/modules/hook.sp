void Hook_TakeDamagePost(int client) {
    SDKHook(client, SDKHook_OnTakeDamagePost, Hook_OnTakeDamagePost);
}

public void Hook_OnTakeDamagePost(int victim, int attacker, int inflictor, float damage, int damageType, int weapon, const float damageForce[3], const float damagePosition[3]) {
    UseCase_DrawBeam(victim, attacker, damageType, damagePosition);
}
