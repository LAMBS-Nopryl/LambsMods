// Checks if unit is indoors
// version 1.0
// by nkenny 


// init
private _unit = param [0]; 

// check 
_unit = lineIntersects [eyePos _unit,eyePos _unit vectorAdd [0,0,4]];

// return 
_unit 