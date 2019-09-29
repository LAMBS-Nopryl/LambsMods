// Check Body 
// version 1.4
// by nkenny 

// init 
private _unit = param [0]; 
private _pos = param [1];
private _range = param [2,10]; 

// check if stopped 
if (stopped _unit || {!(attackEnabled _unit)}) exitWith {false}; 

// if too far away 
if (_unit distance _pos > lambs_danger_CQB_range) exitWith {false}; 

// half chance-- indoors
if (_unit call lambs_danger_fnc_indoor && {random 1 > 0.5}) exitWith {false};

// find body 
_body = allDeadMen select {_x distance _pos < _range};
_body = _body select {!(_x getVariable ["isChecked",false])};

// ready 
doStop _this; 

// Not checked? Move in close 
if (count _body > 0) exitWith {

	// one body 
	_body = _body select 0; 
	
	// do it 
	[_unit,_body] spawn {
		params ["_unit","_body","_bodyPos"];
		_bodyPos = getPosATL _body; 
		_unit doMove _bodyPos; 
		waitUntil {(_unit distance _bodyPos < 0.5) || {_unit getVariable ["lastAction",0] < time} || {!alive _unit}}; 
		if (alive _unit && {!isNil str _body} && {_unit distance _bodyPos < 0.4}) then {_unit action ["rearm",_body];}; 
	};

	// update variable 
	_body setVariable ["isChecked",true,true]; 

	// debug 
	if (lambs_danger_debug_functions) then {systemchat format ["%1 checking body (%2 %3m)",side _unit,name _unit,round (_unit distance _body)];}; 
	
	// end 
	true 
}; 

// checked? Move in close 
_unit doMove (_pos getPos [2 + random 10,random 360]); 

// debug
if (lambs_danger_debug_functions) then {systemchat format ["%1 checking body area (%2m)",side _unit,round (_unit distance _pos)];}; 

// end 
true 


