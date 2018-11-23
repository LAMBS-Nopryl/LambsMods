/*
  Author: diwako
  Description:
  Post init method to set up eventhanlders and the like
*/

if (lambs_quickActions_add_detonator) then {
	[["<t color='#FF0000'>Touch off all explosives</t>", {
		[ace_player, -1, ([ace_player] call ACE_Explosives_fnc_getPlacedExplosives), "ACE_Clacker"] call ACE_Explosives_fnc_detonateExplosiveAll;
	},nil,10,false,true,"","count ([ace_player] call ACE_Explosives_fnc_getPlacedExplosives) > 0"]] call CBA_fnc_addPlayerAction;
};