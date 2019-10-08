// remove from group leader modes
// version 1.41
// by nkenny

// init
params ["_unit",["_setting",0],["_delay",1]];

// get variable
private _dangerMode = group _unit getVariable ["dangerMode",[[],[],true,time]];

// Update danger type and target/position
_dangerMode set [0,(_dangerMode select 0) - [_setting]];
_dangerMode set [3,time + 360 + random _delay];

// update variable
group _unit setVariable ["dangerMode",_dangerMode,false];

// return
true