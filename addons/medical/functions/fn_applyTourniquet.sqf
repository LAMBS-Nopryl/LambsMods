/*
  Author: diwako
  Description:
  Function to apply tourniquets and fill the reopening wounds array
*/
params ["_caller", "_target", "_selectionName", "_className", "_items"];

if !(local _target) then {
	["lambs_local_tourniqut_apply", _this, _target] call CBA_fnc_targetEvent;
} else {
	// if (lambs_medical_showTourniquet) then {
		// private _part = [_selectionName] call ace_medical_fnc_selectionNameToNumber;
		// private _bandagedWounds = _target getVariable ["ace_medical_bandagedWounds", []];
		// private _index = -1;
		// {
		// 	if (_part == _x select 2) exitWith {
		// 		_index = _forEachIndex;
		// 	};
		// } forEach _bandagedWounds;
		// if (_index == -1) then {
		// 	_bandagedWounds pushBack [_selectionName,24,_part,1,10];
		// 	_target setVariable ["ace_medical_bandagedWounds", _bandagedWounds, true];
		// };
	// };
	_this call ace_medical_fnc_treatmentTourniquet;
};