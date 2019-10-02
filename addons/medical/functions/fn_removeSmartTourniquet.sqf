/*
  Author: diwako
  Description:
  Function to remove tourniquets and clear the reopening wounds array entries
*/
params ["_caller", "_target", "_selectionName"];

private _tourniquets = _target getVariable ["ace_medical_tourniquets", [0,0,0,0,0,0]];

private _index = -1;
private _blood = 999;
{
	if (_x > 0) then {
		private _bloodLoss = [_target, _forEachIndex, true] call lambs_medical_fnc_getBodyPartBleeding;
		if (_bloodLoss < _blood) then {
			_blood = _bloodLoss;
			_index = _forEachIndex;
		};
	};
} forEach _tourniquets;

if (_index == -1) exitWith {};

private _selectionNames = [
	"",
	"",
	"hand_l",
	"hand_r",
	"leg_l",
	"leg_r"
];

[_caller, _target, (_selectionNames select _index)] call lambs_medical_fnc_removeTourniquet;