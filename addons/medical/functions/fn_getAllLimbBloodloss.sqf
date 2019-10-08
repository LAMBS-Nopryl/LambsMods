/*
  Author: diwako
  Description:
  Returns current blood loss on legs and arms, takes tourniquets in consideration
*/
params ["_unit"];

private _tourniquets = _unit getVariable ["ace_medical_tourniquets", [0,0,0,0,0,0]];

private _totalBloodLoss = 0;
{
    private _index = _x select 2;
    if (_index > 1 && {_tourniquets select _index == 0}) then {
        // total bleeding ratio * percentage of injury left
        _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));
    };
} forEach (_unit getVariable ["ace_medical_openWounds", []]);

_totalBloodLoss