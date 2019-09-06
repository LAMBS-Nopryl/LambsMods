// check to see if unit should be coward 
// version 1.1
// by nkenny 

// init 
private _unit = param [0];
private _target = param [1];

// vehicles exit 
if (!isNull objectParent _unit) exitWith {false};

// infantry exit -- but count! 
if (isNull objectParent _target) exitWith {
	private _check = (((count (units group _unit)) + 2) < ((count units group _target) / 3)) || {fleeing _unit};
	_check
};

// Enemy vehicles? 
_enemyVehicle = _target isKindOf "Tank" || {_target isKindOf "Air"}; 
_noLauncher = secondaryWeapon _unit == "";

// tough vehicle and no launcher
if (_enemyVehicle && {_noLauncher}) exitWith {true}; 

// else 
false 