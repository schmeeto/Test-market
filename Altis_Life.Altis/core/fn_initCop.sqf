#include <macro.h>
/*
File: fn_initCop.sqf
Author: Bryan "Tonic" Boardwine


Description:
Cop Initialization file.
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};


if((__GETC__(life_copLevel)) < 1) exitWith {
["Blacklisted",FALSE,TRUE] call BIS_fnc_endMission;
sleep 35;
};


[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.