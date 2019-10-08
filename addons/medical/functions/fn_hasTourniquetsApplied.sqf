/*
  Author: diwako
  Description:
  Returns if there is any tourniqet applied to that unit
*/
params ["_unit"];
private _tourniquets = _unit getVariable ["ace_medical_tourniquets", [0,0,0,0,0,0]];

(_tourniquets findIf {_x > 0} > -1)