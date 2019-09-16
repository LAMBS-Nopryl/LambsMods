// Hide in buildings
// verison 1.21
// by nkenny 

// init 
private _unit = param [0]; 
private _target = param [1];
private _range = param [2,55]; 

// stopped -- exit 
//if (attackEnabled _unit) exitWith {false}; 

// buildings 
private _buildings = [_unit,_range,true,true] call lambs_danger_fnc_nearBuildings; 

// settings 
_unit forceSpeed selectRandom [-1,24,25];
vehicle _unit setVariable ["lastAction",time + 120 + random 60];

// Randomly scatter into buildings or hide! 
if (count _buildings > 0) then {
	doStop _unit; 
	_unit doMove selectRandom _buildings;
	_unit setUnitPosWeak "MIDDLE";
	if (lambs_danger_debug_functions) then {systemchat "Danger.fnc hide in building";};	
	 
} else {
	_unit doMove (_unit getPos [50 + random _range,(_target getDir _unit) + 45 - random 90]);
	_unit setUnitPosWeak "DOWN";
	if (lambs_danger_debug_functions) then {systemchat "Danger.fnc hide in bush";};
}; 

// end 
true 