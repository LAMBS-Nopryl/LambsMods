#define CBA_SETTINGS_CAT "Lambs Medical"

[
	"lambs_medical_magic_epi"
	,"CHECKBOX"
	,["Enable magic Epipen", "Gets an unconscious person up immediately if they are not bleeding if enabled"]
	,CBA_SETTINGS_CAT
	,true
	,true
] call CBA_Settings_fnc_init;

[
	"lambs_medical_showTourniquet"
	,"CHECKBOX"
	,["Show tourniqet in medical menu", "Shows tourniquets in medical menu on not wounded limbs"]
	,CBA_SETTINGS_CAT
	,true
	,true
] call CBA_Settings_fnc_init;