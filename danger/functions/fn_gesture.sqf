// Do Gesture
// version 1.2
// by nkenny 

// init 
private _unit = param [0]; 
private _gesture = param [1,["gestureFreeze"]]; 

// do it 
_unit playActionNow selectRandom _gesture; 

// settings 
vehicle _unit setVariable ["lastGesture",time + 15 + random 30];

// end 
true 