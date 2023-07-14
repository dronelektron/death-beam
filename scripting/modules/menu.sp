void Menu_AddToPreferences() {
    SetCookieMenuItem(MenuHandler_DeathBeam, 0, DEATH_BEAM);
}

public void MenuHandler_DeathBeam(int client, CookieMenuAction action, any info, char[] buffer, int maxLength) {
    if (action == CookieMenuAction_SelectOption) {
        Menu_BeamSettings(client);
    } else {
        Format(buffer, maxLength, "%T", DEATH_BEAM, client);
    }
}

void Menu_BeamSettings(int client) {
    Menu menu = new Menu(MenuHandler_BeamSettings);

    Menu_SetTitle(menu, client, DEATH_BEAM);

    if (Cookie_IsShowBeam(client)) {
        Menu_AddShowBeamItem(menu, client, COOKIE_SHOW_BEAM_NO, ITEM_ENABLED);
    } else {
        Menu_AddShowBeamItem(menu, client, COOKIE_SHOW_BEAM_YES, ITEM_DISABLED);
    }

    Menu_AddBeamColorItem(menu, client);

    menu.ExitBackButton = true;
    menu.Display(client, MENU_TIME_FOREVER);
}

public int MenuHandler_BeamSettings(Menu menu, MenuAction action, int param1, int param2) {
    if (action == MenuAction_Select) {
        char info[INFO_SIZE];

        menu.GetItem(param2, info, sizeof(info));

        if (StrEqual(info, ITEM_BEAM_COLOR)) {
            Menu_BeamColor(param1);
        } else {
            Cookie_SetShowBeam(param1, info);
            Menu_BeamSettings(param1);
        }
    } else if (action == MenuAction_Cancel && param2 == MenuCancel_ExitBack) {
        ShowCookieMenu(param1);
    } else if (action == MenuAction_End) {
        delete menu;
    }

    return 0;
}

void Menu_BeamColor(int client) {
    Menu menu = new Menu(MenuHandler_BeamColor);
    char beamColor[COOKIE_BEAM_COLOR_SIZE];

    Cookie_GetBeamColorName(client, beamColor);
    Menu_SetTitle(menu, client, ITEM_BEAM_COLOR, beamColor);

    Menu_AddColorItem(menu, client, COLOR_RED);
    Menu_AddColorItem(menu, client, COLOR_LIME);
    Menu_AddColorItem(menu, client, COLOR_BLUE);
    Menu_AddColorItem(menu, client, COLOR_YELLOW);
    Menu_AddColorItem(menu, client, COLOR_FUCHSIA);
    Menu_AddColorItem(menu, client, COLOR_AQUA);
    Menu_AddColorItem(menu, client, COLOR_WHITE);

    menu.ExitBackButton = true;
    menu.Display(client, MENU_TIME_FOREVER);
}

public int MenuHandler_BeamColor(Menu menu, MenuAction action, int param1, int param2) {
    if (action == MenuAction_Select) {
        char info[INFO_SIZE];

        menu.GetItem(param2, info, sizeof(info));

        Cookie_SetBeamColor(param1, info);
        Menu_BeamColor(param1);
    } else if (action == MenuAction_Cancel && param2 == MenuCancel_ExitBack) {
        Menu_BeamSettings(param1);
    } else if (action == MenuAction_End) {
        delete menu;
    }

    return 0;
}

void Menu_SetTitle(Menu menu, int client, any ...) {
    char title[ITEM_SIZE];

    SetGlobalTransTarget(client);
    VFormat(title, sizeof(title), "%t", 3);

    menu.SetTitle(title);
}

void Menu_AddShowBeamItem(Menu menu, int client, const char[] info, const char[] state) {
    char item[ITEM_SIZE];

    SetGlobalTransTarget(client);
    Format(item, sizeof(item), "%t", ITEM_BEAM_DISPLAY, state);

    menu.AddItem(info, item);
}

void Menu_AddBeamColorItem(Menu menu, int client) {
    char beamColor[COOKIE_BEAM_COLOR_SIZE];
    char item[ITEM_SIZE];

    Cookie_GetBeamColorName(client, beamColor);
    SetGlobalTransTarget(client);
    Format(item, sizeof(item), "%t", ITEM_BEAM_COLOR, beamColor);

    menu.AddItem(ITEM_BEAM_COLOR, item);
}

void Menu_AddColorItem(Menu menu, int client, const char[] phrase) {
    char item[ITEM_SIZE];

    SetGlobalTransTarget(client);
    Format(item, sizeof(item), "%t", phrase);

    menu.AddItem(phrase, item);
}
