// Suppression 
// version 1.1
// by nkenny 

// init 
private _unit = param [0]; 
private _target = param [1]; 

// Target dead? A little random to keep things interesting 
if (!alive _target && {random 1 > 0.8}) exitWith {false}; 

// settings 
vehicle _unit setVariable ["lastAction",time + 15 + random 15];

// do it
_tpos = ATLtoASL ((_unit getHideFrom _target) vectorAdd [0,0,random 1.2]);
_unit doSuppressiveFire _tPos;

// debug
if (lambs_danger_debug_functions) then {systemchat format ["Danger.fsm Suppression (%1 %2s)",name _unit,round ((_unit getVariable "lastAction") - time)]; }; 

// end 
true 



