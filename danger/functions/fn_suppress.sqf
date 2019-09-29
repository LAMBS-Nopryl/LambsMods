// Suppression 
// version 1.4
// by nkenny 

// init 
private _unit = param [0]; 
private _pos = param [1]; 

// no primary weapons exit? 
if (primaryWeapon _unit isEqualTo "") exitWith {false}; 

// do it! 
_unit doSuppressiveFire ((AGLToASL _pos) vectorAdd [0,0,0.2 + random 1.2]);

// debug
if (lambs_danger_debug_functions) then {systemchat format ["%1 Suppression (%2 @ %3m)",side _unit,name _unit,round (_unit distance _pos)];}; 

// end 
true 



