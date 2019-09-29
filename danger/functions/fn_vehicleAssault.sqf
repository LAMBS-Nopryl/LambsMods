// Assault with vehicle
// version 1.2
// by nkenny 

// init 
private _unit = param [0]; 
private _pos = param [1]; 
private _target = param [2];
private _buildings = param [3,[_pos,28,false,false] call lambs_danger_fnc_nearBuildings];

//  target on foot
if (_unit distance2d _pos < lambs_danger_minSuppression_range) exitWith {false}; 
if !(_target isKindOf "Man") exitWith {false}; 

// tweaks target to remain usefully close 
if (_pos distance2d _unit < 50) then {_pos = (_unit getHideFrom _target)}; 

// settings 
private _veh = vehicle _unit; 

// delay 
sleep (3 + random 3); 
if (!canFire _veh) exitWith {false};

// find closest building
if (count _buildings > 0) then {
  _buildings = [_buildings,[],{_unit distance _x},"ASCEND"] call BIS_fnc_sortBy;
  _buildings = if (random 1 > 0.4) then {_buildings select 0} else {selectRandom _buildings};
  _buildings = _buildings buildingPos -1; 
}; 

// add predicted location -- just to ensure shots fired! 
_buildings pushBack _pos; 

// pos 
_pos = (AGLToASL (selectRandom _buildings)) vectorAdd [0.5 - random 1,0.5 - random 1,0.2 + random 1.2]; 

// minor manoeuvres -- moved to FSM
//[_veh,_unit getHideFrom _target] spawn lambs_danger_fnc_vehicleRotate; 

// look at position 
_veh doWatch _pos;

// shoot cannon
_cannon = count _buildings > 2 && {random 1 > 0.2} && {_veh distance _pos > 100}; 
if (_cannon) then {
	_veh action ["useWeapon", _veh, gunner _veh,random 2];
}; 

// suppression 
_veh doSuppressiveFire _pos;

// debug
if (lambs_danger_debug_functions) then {systemchat format ["%1 Vehicle assault building (buildingPos: %2 cannon: %3)",side _unit,count _buildings,_cannon];}; 

// end 
true 
