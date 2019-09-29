// Zone marker
// version 1.0
// nkenny

/*
Create a marker Zone
Arguments
  1 position
  2 size -- Array
  3 colour
  4 brush type:
    "Solid"
    "SolidFull"
    "Horizontal"
    "Vertical"
    "Grid"
    "FDiagonal" (Default)
    "BDiagonal"
    "DiagGrid"
    "Cross"
    "Border"
    "SolidBorder"  
  5 rectangle -- true/false 
*/

// init
private _pos = (_this select 0) call bis_fnc_position;
private _size = param [1,[100,100]]; 
private _color = param [2,"ColorEAST"]; 
private _brush = param [3,"FDiagonal"]; 
private _shape = param [4,false];

// create 
private _m = createMarker [format["mzone_%1%2%3",(floor(_pos select 0)),(floor(_pos select 1)),count allmapMarkers],_pos];
_m setMarkerShape "ELLIPSE";
_m setmarkerColor _color;
_m setMarkerBrush _brush;
_m setMarkerSize _size;

// optional Rectangle
if (_shape) then {_m setMarkerShape "RECTANGLE";};

// Return marker! 
_m
  

