// find nearby buildings 
// version 1.2
// by nkenny 

/*
	Arguments 
	0, _unit 		Unit in question 
	1, _range 		Range buildings are found 
	2, _housePos	Return house positions 
	3, _indoor		sort indoor house positions 
*/

// init 
private _unit = param [0]; 
private _range = param [1,100];
private _housePos = param [2,false];
private _indoor = param [3,false];

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


