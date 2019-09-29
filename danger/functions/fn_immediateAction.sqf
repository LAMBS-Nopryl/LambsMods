// Immediate reaction on getting hit 
// version 1.4
// by nkenny 

// init 
private _unit = param [0]; 
private _stance = param [1,stance _unit]; 

// prone -- exit quickly 
if (_stance isEqualTo "PRONE") exitWith {
	[_unit,["EvasiveLeft","EvasiveRight"]] call lambs_danger_fnc_gesture;
	true 
};

// Not standing -- No weapon --  ACE3 captive exit 
if !(_stance isEqualTo "STAND") exitWith {false}; 
if (primaryWeapon _unit isEqualTo "" || {!(primaryWeapon _unit isEqualTo currentWeapon _unit)} || {!canMove _unit}) exitWith {false}; 
if ((_unit getVariable ["ace_captives_isHandcuffed",false]) || {_unit getVariable ["ace_captives_issurrendering",false]}) exitWith {false};


// stopped or path/move disabled 
//if (stopped _unit) exitWith {false}; 

// standing to rush 
if (random 1 > 0.5) exitWith {
	_unit switchMove selectRandom [
		"AmovPercMrunSrasWrflDfl_AmovPercMrunSrasWrflDf",
		"AmovPercMrunSrasWrflDfl_AmovPercMrunSrasWrflDfr",
		"AmovPercMrunSrasWrflDfr_AmovPercMrunSrasWrflDf",
		"AmovPercMrunSrasWrflDfr_AmovPercMrunSrasWrflDfl"
	];
	true 
};

// standing to prone 
if (random 1 > 0.9) exitWith {
	_unit switchMove "AmovPercMsprSlowWrflDf_AmovPpneMstpSrasWrflDnon";
	_unit setUnitPosWeak "DOWN";
	true 
};

// standing to crouched 
_unit setUnitPos "MIDDLE"; 
_unit switchMove selectRandom [
	"AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon",
	"AmovPercMevaSrasWrflDfl_AmovPknlMstpSrasWrflDnon",
	"AmovPercMevaSrasWrflDfr_AmovPknlMstpSrasWrflDnon"
]; 

// end
true 