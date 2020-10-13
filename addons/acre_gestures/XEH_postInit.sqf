#include "script_component.hpp"
if (is3DEN || {!hasInterface}) exitWith {};

GVAR(blackListAnims) = ["amovppnemstpsraswrfldnon", "aadjppnemstpsraswrfldleft", "aadjppnemstpsraswrfldright"];
GVAR(binoClasses) = "getText (_x >> 'simulation') == 'Binocular'" configClasses (configFile >> "CfgWeapons") apply {configName _x};

["acre_startedSpeaking", {
    params ["_unit", "_onRadio", "_radio"];

    if (!_onRadio ||
        { !GVAR(enabled) } ||
        { !isNull objectParent _unit } ||
        { !(cameraView in ["INTERNAL","EXTERNAL"]) } ||
        { ace_common_isReloading } ||
        { isWeaponDeployed _unit } ||
        { animationState _unit in GVAR(blackListAnims) } ||
        { currentWeapon _unit in GVAR(binoClasses) } ) exitWith {};

    private _hasVest = vest _unit != "";
    private _hasHeadgear = headgear _unit != "";
    if (!_hasVest && !_hasHeadgear) exitWith {};

    private _shortRange = "343" in _radio;

    private _isInAds = cameraOn isEqualTo _unit && {cameraView isEqualTo "GUNNER"};

    // 343 is vest mounted
    if (_hasVest && _shortRange) then {
        _unit playActionNow (["acre_radio_vest_NoADS", "acre_radio_vest"] select _isInAds);
    };

    // 148/152 is ear piece
    if (_hasHeadgear && !_shortRange) then {
        _unit playActionNow (["acre_radio_helmet_NoADS", "acre_radio_helmet"] select _isInAds);
    };

    _unit setVariable [QGVAR(onRadio), true];
}] call CBA_fnc_addEventHandler;

["acre_stoppedSpeaking", {
    params ["_unit", "_onRadio"];

    if (!_onRadio || {!GVAR(enabled)}) exitWith {};

    if (ace_common_isReloading || {_unit getVariable [QGVAR(onRadio), false]}) then {
        // If the unit started a reload while already talking, need to wait to finish to not delete a magazine
        [
            {!ace_common_isReloading},
            {
                // Wait 1 frame as mag doesn't report as loaded til events completed
                [FUNC(stopGesture), _this] call CBA_fnc_execNextFrame;
            },
            _unit
        ] call CBA_fnc_waitUntilAndExecute;
    };
}] call CBA_fnc_addEventHandler;

player addEventHandler ["GetInMan", {
    params ["_unit"];

    _unit call FUNC(stopGesture);
}];

player addEventHandler ["WeaponDeployed", {
    params ["_unit", "_isDeployed"];

    if (_isDeployed) then {
        _unit call FUNC(stopGesture);
    };
}];
