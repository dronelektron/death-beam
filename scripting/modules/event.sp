void Event_Create() {
    HookEvent("player_death", OnPlayerDeath);
}

static void OnPlayerDeath(Event event, const char[] name, bool dontBroadcast) {
    int victimId = event.GetInt("userid");
    int attackerId = event.GetInt("attacker");
    int victim = GetClientOfUserId(victimId);
    int attacker = GetClientOfUserId(attackerId);
    char weapon[WEAPON_NAME_SIZE];

    event.GetString("weapon", weapon, sizeof(weapon));

    UseCase_OnPlayerDeath(victim, attacker, weapon);
}
