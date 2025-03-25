#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <clientprefs>

#include "death-beam/color-storage"
#include "death-beam/cookie"
#include "death-beam/menu"
#include "death-beam/use-case"
#include "death-beam/visualizer"

#include "modules/color-list.sp"
#include "modules/color-storage.sp"
#include "modules/console-variable.sp"
#include "modules/cookie.sp"
#include "modules/hook.sp"
#include "modules/menu.sp"
#include "modules/use-case.sp"
#include "modules/visualizer.sp"

public Plugin myinfo = {
    name = "Death beam",
    author = "Dron-elektron",
    description = "Shows the beam between killer and victim",
    version = "1.2.0",
    url = "https://github.com/dronelektron/death-beam"
};

public void OnPluginStart() {
    ColorList_Create();
    Cookie_Create();
    Variable_Create();
    Menu_AddToPreferences();
    CookieLateLoad();
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

public void OnClientPutInServer(int client) {
    Hook_TakeDamagePost(client);
}

public void OnClientCookiesCached(int client) {
    Cookie_Load(client);
}

static void CookieLateLoad() {
    for (int client = 1; client <= MaxClients; client++) {
        if (AreClientCookiesCached(client)) {
            OnClientCookiesCached(client);
        }
    }
}
