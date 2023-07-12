void Menu_AddToPreferences() {
    SetCookieMenuItem(MenuHandler_DeathBeam, 0, DEATH_BEAM);
}

public void MenuHandler_DeathBeam(int client, CookieMenuAction action, any info, char[] buffer, int maxLength) {
    if (action == CookieMenuAction_SelectOption) {
        Menu_ShowBeam(client);
    } else {
        Format(buffer, maxLength, "%T", DEATH_BEAM, client);
    }
}

void Menu_ShowBeam(int client) {
    Menu menu = new Menu(MenuHandler_ShowBeam);

    menu.SetTitle("%T", DEATH_BEAM, client);

    if (Cookie_IsShowBeam(client)) {
        Menu_AddShowBeamItem(menu, client, COOKIE_SHOW_BEAM_NO, ITEM_ENABLED);
    } else {
        Menu_AddShowBeamItem(menu, client, COOKIE_SHOW_BEAM_YES, ITEM_DISABLED);
    }

    menu.ExitBackButton = true;
    menu.Display(client, MENU_TIME_FOREVER);
}

public int MenuHandler_ShowBeam(Menu menu, MenuAction action, int param1, int param2) {
    if (action == MenuAction_Select) {
        char info[INFO_SIZE];

        menu.GetItem(param2, info, sizeof(info));

        Cookie_SetShowBeam(param1, info);
        Menu_ShowBeam(param1);
    } else if (action == MenuAction_Cancel && param2 == MenuCancel_ExitBack) {
        ShowCookieMenu(param1);
    } else if (action == MenuAction_End) {
        delete menu;
    }

    return 0;
}

void Menu_AddShowBeamItem(Menu menu, int client, const char[] info, const char[] state) {
    char item[ITEM_SIZE];

    SetGlobalTransTarget(client);
    Format(item, sizeof(item), "%t", ITEM_BEAM_DISPLAY, state);

    menu.AddItem(info, item);
}
