// Do Gesture
// version 1.4
// by nkenny 

// init 
private _unit = param [0]; 
private _gesture = param [1,["gestureFreeze"]]; 

// do it 
_unit playActionNow selectRandom _gesture; 

// end 
true 