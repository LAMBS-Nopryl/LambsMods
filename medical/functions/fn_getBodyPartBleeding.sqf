/*
  Author: diwako
  Description:
  Returns the amount of blood loos from a body part
*/
params ["_unit","_index",["_ignoreTourniquet",false]];


private _tourniquets = _unit getVariable ["ace_medical_tourniquets", [0,0,0,0,0,0]];
if (!_ignoreTourniquet && {(_tourniquets select _index) > 0}) exitWith {0};

private _totalBloodLoss = 0;
{
    if ((_x select 2) == _index) then {
        // total bleeding ratio * percentage of injury left
        _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));
    };
} forEach (_unit getVariable ["ace_medical_openWounds", []]);

_totalBloodLoss