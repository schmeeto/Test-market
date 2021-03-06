enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

if(isDedicated && isNil("life_market_prices")) then
{
        [] call life_fnc_marketconfiguration;
        diag_log "Market prices generated!";
           
        "life_market_prices" addPublicVariableEventHandler
        {
                diag_log format["Market prices updated! %1", _this select 1];
        };
           
        //Start server fsm    
        [] execFSM "core\fsm\server.fsm";
        diag_log "Server FSM executed";
};
	
life_versionInfo = "Altis Life RPG v3.1.3.5";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

StartProgress = true;

//admin
[] execVM "anticheat.sqf";

//fast rope
[] execVM "Scripts\zlt_fastrope.sqf";

///messages
[]execVM "scripts\message.sqf";

//welcome
[] execVM "custom\Welcome.sqf";

// Walk
[] execVM "DCL\init.sqf";

//IgiLoad
_igiload = execVM "IgiLoad\IgiLoadInit.sqf";

//Dynamic Weather
[] execVM "scripts\DynWeather.sqf";

//No Side Voice
[] execVM "scripts\fn_noSideVoice.sqf";

//Stats Bar
[] execVM "scripts\fn_statusBar.sqf";