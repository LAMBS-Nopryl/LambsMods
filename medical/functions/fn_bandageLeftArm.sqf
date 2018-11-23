/*
  Author: diwako
  Description:
  Function to bandage the left arm
*/
params ["_caller", "_target", "_selectionName", "_className", "_items", "", ["_specificSpot", -1]];
[_caller, _target, "hand_l", "FieldDressing", _items, _specificSpot] call ace_medical_fnc_treatmentAdvanced_bandage;
if (local _target) then {
	["lambs_local_limbscheck", [_target, "hand_l"]] call CBA_fnc_localEvent;
} else {
	["lambs_local_limbscheck", [_target, "hand_l"], _target] call CBA_fnc_targetEvent
};
true;