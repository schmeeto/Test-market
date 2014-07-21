#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the invite process?
*/
private["_unit"];
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint "You need to select a person to invite!"};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "You cannot kick yourself!"};

_action = [
	format["You are about to invite %1 to your gang, if they accept the invite they will have access to the gang's funds.",_unit getVariable ["realname",name _unit]],
	"Transfer Gang Leadership",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[[profileName,grpPlayer],"life_fnc_gangInvite",_unit,false] spawn life_fnc_MP;
	hint format["You have sent a invite to your gang to %1",_unit getVariable["realname",name _unit]];
} else {
	hint "Invitation Cancelled";
};