// Suppression 
// version 1.2
// by nkenny 

// init 
private _unit = param [0]; 
private _target = param [1]; 

// Target dead? A little random to keep things interesting 
if (!alive _target && {random 1 > 0.8}) exitWith {false}; 

// settings 
vehicle _unit setVariable ["lastAction",time + 15 + random 15];

// no primary weapons exit? 
if (primaryWeapon _unit isEqualTo "") exitWith {false}; 

// find good suppression spots 
_tpos = nearestTerrainObjects [_target, ["HOUSE","WALL"],3,true];
_tpos = _tpos apply {getpos _x}; 
_tpos append [(getposATL _target),(_unit getHideFrom _target)];

// do it
_tpos = ATLtoASL ((selectRandom _tpos) vectorAdd [0,0,random 1.2]);
_unit doSuppressiveFire _tPos;

// debug
if (lambs_danger_debug_functions) then {systemchat format ["Danger.fnc Suppression (%1 %2s)",name _unit,round ((_unit getVariable "lastAction") - time)]; }; 

// end 
true 



