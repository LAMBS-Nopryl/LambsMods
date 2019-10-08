/*
  Author: diwako
  Description:
  Fixes arms or legs if there is no ace damage to them anymore
*/
params ["_target", "_selectionName"];

// no need to check if head or the torse was just bandaged
if (_selectionName in ["head","body"]) exitWith {};
if !(local _target) exitWith {};

private _fnc_doFix = {
	params ["_selectionOne","_selectionTwo","_openWounds"];

	private _partOne = [_selectionOne] call ace_medical_fnc_selectionNameToNumber;
	private _partTwo = [_selectionTwo] call ace_medical_fnc_selectionNameToNumber;
	if (_partOne < 0 && _partTwo < 0) exitWith {false};

	private _fixLimbs = true;
	{
		_x params ["", "_damType", "_partX",["_amount",0]];
		// Only parse injuries that are for the selected bodypart.
		if ((_partX == _partOne || {_partX == _partTwo}) && {!(_damType in [6,7,8]) && {_amount > 0}}) exitWith {
			_fixLimbs = false;
		};
	} forEach _openWounds;
	_fixLimbs
};

private _openWounds = _target getVariable ["ace_medical_openWounds",[]];
if (_selectionName in ["leg_r","leg_l"]) then {
	// heal limping
	if (["leg_r","leg_l",_openWounds] call _fnc_doFix) then {
		_target setHit ["legs", 0];
	};
} else {
	// heal the shakes
	if (["hand_r","hand_l",_openWounds] call _fnc_doFix) then {
		_target setHit ["hands", 0];
	};
};