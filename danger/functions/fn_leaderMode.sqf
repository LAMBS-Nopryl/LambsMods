// Add to group leader modes 
// version 1.4 
// by nkenny 

// init 
private _unit = param [0];
private _setting = param [1,0];
private _target = param [2,ObjNull,[ObjNull,[]]];

// get variable 
private _dangerMode = group _unit getVariable ["dangerMode",[[],[],true,time]]; 

// old dangers discarded
if ((_dangerMode select 3) < time) then {_dangerMode = [[],[],true,0]};

// Update danger type and target/position
(_dangerMode select 0) pushBackUnique _setting;
(_dangerMode select 1) set [_setting,_target]; 
_dangerMode set [2,false];
_dangerMode set [3,time + 360];

// update variable 
group _unit setVariable ["dangerMode",_dangerMode,false]; 

// end 
true 