/*
  Author: diwako
  Description:
  Function to bandage torso
*/
params ["_caller", "_target", "_selectionName", "_className", "_items", "", ["_specificSpot", -1]];
[_caller, _target, "body", "FieldDressing", _items, _specificSpot] call ace_medical_fnc_treatmentAdvanced_bandage;
true;