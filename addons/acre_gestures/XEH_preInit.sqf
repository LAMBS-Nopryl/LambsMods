#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Enable ACRE gestures", "Enable ACRE gestures"],
    "Lambs Acre Gestures",
    true,
    false
] call CBA_fnc_addSetting;

ADDON = true;
