static StringMap g_weapons;

void WeaponFilter_Create() {
    g_weapons = new StringMap();
    g_weapons.SetValue("riflegren_us", NO_VALUE);
    g_weapons.SetValue("riflegren_ger", NO_VALUE);
    g_weapons.SetValue("smoke_us", NO_VALUE);
    g_weapons.SetValue("smoke_ger", NO_VALUE);
    g_weapons.SetValue("frag_us", NO_VALUE);
    g_weapons.SetValue("frag_ger", NO_VALUE);
    g_weapons.SetValue("bazooka", NO_VALUE);
    g_weapons.SetValue("pschreck", NO_VALUE);
}

bool WeaponFilter_IsBad(const char[] weapon) {
    return g_weapons.ContainsKey(weapon);
}
