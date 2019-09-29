// Hide in buildings
// verison 1.4
// by nkenny 

// init 
private _unit = param [0]; 
private _danger = param [1];
private _range = param [2,55]; 
private _buildings = param [3,[_unit,_range,true,true] call lambs_danger_fnc_nearBuildings]; 

// stopped -- exit 
//if (attackEnabled _unit) exitWith {false}; 

// alreayd inside -- exit 
if (_unit call lambs_danger_fnc_indoor) exitWith {
	if (stance _unit isEqualTo "STAND") then {_unit setUnitPosWeak "MIDDLE"};
	false
	}; 

// settings 
_unit forceSpeed selectRandom [-1,24,25];

// Randomly scatter into buildings or hide! 
if (count _buildings > 0 && {random 1 > 0.05}) then {
	doStop _unit; 
	_unit doMove ((selectRandom _buildings) vectorAdd [0.7 - random 1.4,0.7 - random 1.4,0]);
	_unit setUnitPosWeak "MIDDLE";
	if (lambs_danger_debug_functions) then {systemchat format ["%1 hide in building",side _unit];};	
	 
} else {
	_unit setUnitPosWeak "DOWN";
	_newPos = (_unit getPos [50 + random _range,(_danger getDir _unit) + 45 - random 90]); 
	if (surfaceIsWater _newPos) exitWith {_unit suppressFor 5;}; 
	_unit doMove _newPos;
	if (lambs_danger_debug_functions) then {systemchat format ["%1 hide in bush",side _unit];};
}; 

// end 
true 