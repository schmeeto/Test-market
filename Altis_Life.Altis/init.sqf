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