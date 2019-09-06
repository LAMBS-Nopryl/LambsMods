// find nearby buildings 
// version 1.0
// by nkenny 

// init 
private _unit = param [0,ObjNull]; // pos 
private _range = param [1,100]; // range
private _housePos = param [2,false]; // return house positions
private _indoor = param [3,false]; // return only indoor positions 

// houses 
_houses = nearestObjects [_unit,["House","Strategic","Ruins"],_range,true];
_houses = _houses select {count (_x buildingPos -1) > 0};

// house pos
if (_housePos) then {
	_housePos = []; 
	{_housePos append (_x buildingPos -1);true} count _houses; 
	
	// sort indoor 
	if (_indoor) then {
		_housePos = _housePos select {lineIntersects [AGLToASL _x, (AGLToASL _x) vectorAdd [0,0,6]]}; 
	};
	
  // update array 
  _houses = _housePos; 	 
  
}; 

// return 
_houses 


