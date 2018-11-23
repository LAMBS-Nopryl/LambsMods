/*
  Author: diwako
  Description:
  Function to bandage the right leg
*/
params ["_caller", "_target", "_selectionName", "_className", "_items", "", ["_specificSpot", -1]];
[_caller, _target, "leg_r", "FieldDressing", _items, _specificSpot] call ace_medical_fnc_treatmentAdvanced_bandage;
if (local _target) then {
	["lambs_local_limbscheck", [_target, "leg_r"]] call CBA_fnc_localEvent;
} else {
	["lambs_local_limbscheck", [_target, "leg_r"], _target] call CBA_fnc_targetEvent
};
true;