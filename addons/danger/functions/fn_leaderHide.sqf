// Leader Calls for group to hide
// version 1.4.1
//by nkenny

// init
// init
params ["_unit","_target",["_buildings",[]]];

// find buildings 
if (_buildings isEqualTo []) then {
    _buildings = [_unit getPos [10,_target getDir _unit],45,true,true] call lambs_danger_fnc_nearBuildings;
};

// gesture
[_unit,["gestureCover"]] call lambs_danger_fnc_gesture;

// units
_units = units group _unit;
_units = _units select {isNull ObjectParent _x && {secondaryWeapon _x isEqualTo ""}};

// units without launchers hide!
{
    // add suppression
    _x setSuppression (getSuppression _x + random 1);

    // hide
    [_x,_target,45,_buildings] call lambs_danger_fnc_hideInside;
    
    // end
    true

} count _units;

// end
true