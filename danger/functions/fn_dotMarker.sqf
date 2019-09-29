// Dot marker
// pilfered from somewhere, tweaked, rewritten, tweaked again. 
// nkenny

/*
Arguments
  1 position
  2 text -- string 
  3 colour
  4 type
*/

  // init 
  private _pos = (_this select 0) call bis_fnc_position;
  private _text = param [1,""]; 
  private _color = param [2,"colorBlack"]; 
  private _type = param [3,"mil_dot"];

  // create 
  _m = createMarkerLocal [format["mdot_%1%2%3",(floor(_pos select 0)),(floor(_pos select 1)),count allmapMarkers],_pos];
  _m setMarkerShapeLocal "Icon";
  _m setMarkerColorLocal _color;
  _m setMarkerTypeLocal _type;
  _m setMarkerTextLocal _text;

  // Return marker! 
  _m
  

