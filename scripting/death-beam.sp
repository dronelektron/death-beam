#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#include "db/color"
#include "db/hook"
#include "db/visualizer"

#include "modules/color.sp"
#include "modules/console-variable.sp"
#include "modules/hook.sp"
#include "modules/use-case.sp"
#include "modules/visualizer.sp"

public Plugin myinfo = {
    name = "Death beam",
    author = "Dron-elektron",
    description = "Shows the beam between killer and victim",
    version = "0.1.0",
    url = "https://github.com/dronelektron/death-beam"
};

public void OnPluginStart() {
    Variable_Create();
}

public void OnMapStart() {
    Visualizer_Precache();
}

public void OnClientPutInServer(int client) {
    Hook_TakeDamagePost(client);
}
