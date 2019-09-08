// Unit leader declares building assault position! 
// version 1.2
// by nkenny 

// init 
private _unit = param [0]; 
private _target = param [1];
private _range = param [2,25]; 

// already in CQB? exit 
private _CQB = group _unit getVariable ["isCQB",[]]; 
if (count _CQB > 0) exitWith {

	// too far away? Cancel list 
	if (_unit distance (_CQB select 0) > 300) then {
		_CQB = []; 
		group _unit setVariable ["isCQB",_CQB];  
	}; 

	// Near enemy! 
	if (_unit distance _target < lambs_danger_CQB_range && {alive _target}) then {
		_CQB pushBackUnique getPosATL _target;
		group _unit setVariable ["isCQB",_CQB];  
	}; 
}; 

// find buildingPos 
private _buildings = [_target,_range,true,true] call lambs_danger_fnc_nearBuildings;

// sort em 
_buildings = [_buildings,[],{_unit distance _x},"ASCEND"] call BIS_fnc_sortBy;

// declare 
group _unit setVariable ["isCQB",_buildings]; 

// debug
if (lambs_danger_debug_functions) then {systemchat format ["Danger.fsm %1 declared CQB (%2m) (positions : %3)",side _unit,round (_unit distance2d _target),count _buildings];}; 
 
// end 
true 