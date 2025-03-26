#include <sourcemod>
#include <sdktools>
#include <clientprefs>

#include "death-beam/color-storage"
#include "death-beam/cookie"
#include "death-beam/menu"
#include "death-beam/visualizer"
#include "death-beam/weapon-filter"

#include "modules/color-list.sp"
#include "modules/color-storage.sp"
#include "modules/console-variable.sp"
#include "modules/cookie.sp"
#include "modules/event.sp"
#include "modules/menu.sp"
#include "modules/use-case.sp"
#include "modules/visualizer.sp"
#include "modules/weapon-filter.sp"

public Plugin myinfo = {
    name = "Death beam",
    author = "Dron-elektron",
    description = "Shows the beam between killer and victim",
    version = "1.3.0",
    url = "https://github.com/dronelektron/death-beam"
};

public void OnPluginStart() {
    ColorList_Create();
    Variable_Create();
    Cookie_Create();
    Cookie_LateLoad();
    Event_Create();
    Menu_AddToPreferences();
    WeaponFilter_Create();
    LoadTranslations("death-beam-core.phrases");
    LoadTranslations("death-beam-colors.phrases");
    AutoExecConfig(_, "death-beam");
}

public void OnMapStart() {
    Visualizer_Precache();
    ColorStorage_Load();
}

public void OnConfigsExecuted() {
    UseCase_CheckDefaultColorName();
}

public void OnClientCookiesCached(int client) {
    Cookie_Load(client);
}
