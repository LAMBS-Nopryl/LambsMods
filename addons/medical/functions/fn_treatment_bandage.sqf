/*
  Author: diwako
  Description:
  Replacement function for the original treat bandage function. Now this one is called when using bandages.
*/
params ["_caller", "_target", "_selectionName", "_className", "_items", "", ["_specificSpot", -1]];
_this call ace_medical_fnc_treatmentAdvanced_bandage;
if (local _target) then {
	["lambs_local_limbscheck", [_target, _selectionName]] call CBA_fnc_localEvent;
} else {
	["lambs_local_limbscheck", [_target, _selectionName], _target] call CBA_fnc_targetEvent
};