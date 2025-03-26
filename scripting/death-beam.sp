#include <sourcemod>
#include <sdktools>
#include <clientprefs>

#include "death-beam/cookie"
#include "death-beam/menu"
#include "death-beam/storage"
#include "death-beam/visualizer"
#include "death-beam/weapon-filter"

#include "modules/color-list.sp"
#include "modules/console-variable.sp"
#include "modules/cookie.sp"
#include "modules/event.sp"
#include "modules/storage.sp"
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
    Storage_BuildPath();
    WeaponFilter_Create();
    LoadTranslations("death-beam-core.phrases");
    LoadTranslations("death-beam-colors.phrases");
    AutoExecConfig(_, "death-beam");
}

public void OnMapStart() {
    Visualizer_Precache();
    Storage_LoadColors();
}

public void OnConfigsExecuted() {
    UseCase_CheckDefaultColorName();
}

public void OnClientCookiesCached(int client) {
    Cookie_Load(client);
}
