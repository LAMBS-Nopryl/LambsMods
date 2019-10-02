/*
  Author: diwako
  Description:
  Function to remove tourniquets and clear the reopening wounds array entries
*/
params ["_caller", "_target", "_selectionName"];

if !(local _target) then {
	["lambs_local_tourniqut_remove", _this, _target] call CBA_fnc_targetEvent;
} else {
	if (lambs_medical_showTourniquet) then {
		private _part = [_selectionName] call ace_medical_fnc_selectionNameToNumber;
		private _bandagedWounds = _target getVariable ["ace_medical_bandagedWounds", []];
		{
			if (_part == _x select 2) exitWith {
				_bandagedWounds deleteAt _forEachIndex;
			};
		} forEach _bandagedWounds;
		_target setVariable ["ace_medical_bandagedWounds", _bandagedWounds, true];
	};
	_this call ace_medical_fnc_actionRemoveTourniquet;
};