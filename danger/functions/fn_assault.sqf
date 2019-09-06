// Clear buildings 
// version 1.12
// by nkenny 

// init 
private _unit = param [0]; 
private _target = param [1,objNull]; 
private _range = param [2,30];

// check if stopped 
//if (!(_unit checkAIFeature "PATH") || {!(_unit checkAIFeature "MOVE")}) exitWith {}; 
if (stopped _unit || {!(attackEnabled _unit)}) exitWith {false}; 

// settings 
_unit setUnitPosWeak "UP";
vehicle _unit setVariable ["lastAction",time + 14];

// exit if in CQB mode 
private _CQB = group _unit getVariable ["isCQB",[]]; 
if (count _CQB > 0) exitWith {

	// Ready units clear rooms
	//doStop _unit;

	// execute move
	if (unitReady _unit) then {
		
		// move 
		_unit doMove (_CQB select 0);
	
		// if near meters -- clean up CQB lists 
		if (_unit distance (_CQB select 0) < 15) then {
			_CQB deleteAt 0;
			group _unit setVariable ["isCQB",_CQB];
		} else {

			// if stuck indoors -- teleport 
			if (_unit distance (_CQB select 0) > 40 && {random 1 > 0.6} && {(LineIntersects [eyePos _unit, (eyePos _unit) vectorAdd [0,0,6]])}) then {
				_unit setVehiclePosition [getPos _unit, [], 5];
				if (lambs_danger_debug_functions) then {systemchat format ["Danger.fsm %1 teleport debug %2",side _unit,name _unit];}; 
			}; 
		};

	} else {

		// visual indicator of range 
		_unit setUnitPosWeak "MIDDLE";	
	}; 
		
	// debug 
	if (lambs_danger_debug_functions) then {systemchat format ["Danger.fsm %1 assault CQB (positions : %2)",side _unit,count _CQB];}; 
}; 

// Near buildings 
_buildings = [_target,_range,true,true] call lambs_danger_fnc_nearBuildings; 
_buildings pushBack (getPosATL _target);

// exit without buildings? -- Assault!
if (count _buildings < 2) exitWith {
	
	// execute move 
	_unit doMove (_unit getHideFrom _target);

	// debug 
	if (lambs_danger_debug_functions) then {systemchat format ["Danger.fsm %1 assaulting position (%2m)",side _unit,round (_unit distance2d _target)]; };
}; 

// execute move 
_unit doMove selectRandom _buildings; 

// debug
if (lambs_danger_debug_functions) then {systemchat format ["Danger.fsm %1 checking buildings (%2m)",side _unit,round (_unit distance2d _target)];}; 
 
// end 
true 