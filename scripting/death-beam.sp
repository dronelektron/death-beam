#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <clientprefs>

#include "db/color-storage"
#include "db/cookie"
#include "db/menu"
#include "db/use-case"
#include "db/visualizer"

#include "modules/color-list.sp"
#include "modules/color-storage.sp"
#include "modules/console-variable.sp"
#include "modules/cookie.sp"
#include "modules/hook.sp"
#include "modules/menu.sp"
#include "modules/use-case.sp"
#include "modules/visualizer.sp"

#define AUTO_CREATE_YES true

public Plugin myinfo = {
    name = "Death beam",
    author = "Dron-elektron",
    description = "Shows the beam between killer and victim",
    version = "1.1.0",
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
    AutoExecConfig(AUTO_CREATE_YES, "death-beam");
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
