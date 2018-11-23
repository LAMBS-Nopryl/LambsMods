/*
  Author: diwako
  Description:
  Function that applies a tourniquet to the part that is bleeding the most
*/
params ["_caller", "_target", "_selectionName", "_className", "_items"];

private _bloodloss = [_target] call ACE_medical_fnc_getBloodLoss;

if (_bloodloss == 0) exitWith {};

private _tourniquets = _target getVariable ["ace_medical_tourniquets", [0,0,0,0,0,0]];

private _index = -1;
private _bloodloss = 0;
for "_i" from 2 to 5 do {
	private _blood = [_target,_i] call lambs_medical_fnc_getBodyPartBleeding;
	if (_blood > _bloodloss) then {
		_index = _i;
		_bloodloss = _blood;
	};
};

if (_index == -1) exitWith {};

private _selectionNames = [
	"",
	"",
	"hand_l",
	"hand_r",
	"leg_l",
	"leg_r"
];

[_caller, _target, (_selectionNames select _index), _className, _items] call lambs_medical_fnc_applyTourniquet;