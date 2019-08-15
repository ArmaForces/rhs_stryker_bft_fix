
class Extended_PreInit_EventHandlers
{
    class armaforces_cool_addon_something
    {
        serverInit = "call compile preprocessFileLineNumbers 'armaforces\cool_addon\something\XEH_preInitServer.sqf'";
        clientInit = "call compile preprocessFileLineNumbers 'armaforces\cool_addon\something\XEH_preInitClient.sqf'";
    };
};
