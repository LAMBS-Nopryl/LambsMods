// remove from  group leader modes 
// version 1.0 
// by nkenny 

// init 
private _unit = param [0];
private _setting = param [1,0];
private _delay = param [2,1];

// get variable 
private _dangerMode = group _unit getVariable ["dangerMode",[[],[],true,time]]; 

// Update danger type and target/position
_dangerMode set [0,(_dangerMode select 0) - [_setting]];
_dangerMode set [3,time + 360 + random _delay];

// update variable 
group _unit setVariable ["dangerMode",_dangerMode,false]; 