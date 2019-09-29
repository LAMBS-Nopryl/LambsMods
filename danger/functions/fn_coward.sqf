// check to see if unit should be coward 
// version 1.4
// by nkenny 

// init 
private _unit = param [0];
private _target = param [1];

// vehicles exit 
if (!isNull objectParent _unit) exitWith {false};

// same side? stay 
if (side _unit isEqualTo side _target) exitWith {false}; 

// no weapons? exit 
if (count weapons _unit < 1) exitWith {true}; 

// Enemy vehicles? 
_enemyVehicle = _target isKindOf "Tank" || {_target isKindOf "Air"}; 
_noLauncher = secondaryWeapon _unit isEqualTo "";

// tough vehicle and no launcher
if (_enemyVehicle && {_noLauncher}) exitWith {true}; 

// else 
false 