// Leader calls for aggresive manoeuvres
// version 1.41
//by nkenny

// init
params ["_unit","_target",["_units",[]];

// find units 
if (_units isEqualTo []) then {
    _buildings = units group _unit;
};

// find overwatch positions
_pos = [_target, _unit distance _target, 100 min (_unit distance _target), 40, getPosATL _unit] call BIS_fnc_findOverwatch;

// gesture
[_unit,["gestureAdvance"]] call lambs_danger_fnc_gesture;
[selectRandom _units,["gestureGoB"]] call lambs_danger_fnc_gesture;

// ready units -- half suppress -- half cover
{
    // Half suppress -- Half manoeuvre
    if (random 1 > 0.6) then {

        [_x,_target] call lambs_danger_fnc_suppress;

    // manoeuvre
    } else {

        doStop _x;
        _x forceSpeed 25;
        _x doMove (_pos getPos [10 + random 20,random 360]); 
        if !(stance _x isEqualTo "PRONE") then {
            _x switchMove selectRandom [
                "AmovPercMrunSrasWrflDfl_AmovPercMrunSrasWrflDf",
                "AmovPercMrunSrasWrflDfl_AmovPercMrunSrasWrflDfr",
                "AmovPercMrunSrasWrflDfr_AmovPercMrunSrasWrflDf",
                "AmovPercMrunSrasWrflDfr_AmovPercMrunSrasWrflDfl"
            ];
        };
    };

  // end
  true

} count (_units select {_x distance2d _unit < 300});

// end
true