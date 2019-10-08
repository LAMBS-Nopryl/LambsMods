#include "script_component.hpp"

if !(hasInterface) exitWith {};

[
    COMPONENT_NAME,
    QGVAR(toggleScreenshot),
    ['Toggle Screenshot Mode', 'Hides UI elements for taking screenshots'],
    {
        [] call FUNC(toggleScreenshotMode);
        false
    },
    ''
] call CBA_fnc_addKeybind;
