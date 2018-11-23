#define CBA_SETTINGS_CAT "Lambs Quick Actions"

[
	"lambs_quickActions_add_detonator"
	,"CHECKBOX"
	,["Add detonate action", "Adds the detonation quick action to detonate all placed explosives"]
	,CBA_SETTINGS_CAT
	,true
	,true
] call CBA_Settings_fnc_init;

[
	"lambs_quickActions_add_fast_rope"
	,"CHECKBOX"
	,["Add fast rope action", "Adds the fast rope action to the quick action menu to fast rope"]
	,CBA_SETTINGS_CAT
	,true
	,true
] call CBA_Settings_fnc_init;