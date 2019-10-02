/*
  Author: diwako
  Description:
  Function used to apply epi
*/
params ["_caller", "_target", "_selectionName", "_className", "_items"];
if !(local _target) exitWith {
	["lambs_local_epi",_this,_target] call CBA_fnc_targetEvent;
};

private _inCardiac = _target getVariable ["ace_medical_inCardiacArrest",false];
private _inRevive = _target getVariable ["ace_medical_inReviveState",false];
private _reviveEnabled = missionNamespace getVariable ["ace_medical_enableRevive",0];

if (lambs_medical_magic_epi && {_target getVariable ["ACE_isUnconscious",false] && {([_target] call ACE_medical_fnc_getBloodLoss) == 0 && {_target getVariable ["ace_medical_bloodVolume",100] < 65 || {_inRevive || {_inCardiac || {_target getVariable ["ace_medical_pain",0] > 0.9}}}}}}) then {
	_target setVariable ["ace_medical_inReviveState",nil,true];
	_target setVariable ["ace_medical_inCardiacArrest",nil,true];
	_target setVariable ["ace_medical_bloodVolume",65 max (_target getVariable ["ace_medical_bloodVolume",100]), true];
	_target setVariable ["ace_medical_pain",0.9 min (_target getVariable ["ace_medical_pain",0]), true];
	if (_target getVariable ["ace_medical_pain",0] > 0.9) then {
		[_target, -((_target getVariable ["ace_medical_pain",0]) - 0.9)] call ace_medical_fnc_adjustPainLevel;
	};
	private _gotEpi = _target getVariable ["ace_medical_epinephrine_insystem",0];
	private _heartrate = 0 call {
		if (_target getVariable ["ace_medical_bloodVolume",100] > 60 && !(_gotEpi > 0.5)) exitWith {
			30
		};
		40
	};
	_target setVariable ["ace_medical_heartRate",_heartrate max (_target getVariable ["ace_medical_heartRate",80]), true];
} else {
	_this call ace_medical_fnc_treatmentAdvanced_medication;
};

true;