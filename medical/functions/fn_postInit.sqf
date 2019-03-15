/*
  Author: diwako
  Description:
  Post init method to set up eventhanlders and the like
*/
lambs_medical_MenuPFHID = -1;
lambs_medical_menu_interaction_target = objNull;

["lambs_local_limbscheck",{
	_this call lambs_medical_fnc_checkAndFixLimbs;
}] call CBA_fnc_addEventhandler;

["lambs_local_epi",{
	_this call lambs_medical_fnc_handleEpinephrine;
}] call CBA_fnc_addEventhandler;

["lambs_local_tourniqut_apply",{
	_this call lambs_medical_fnc_applyTourniquet;
}] call CBA_fnc_addEventhandler;

["lambs_local_tourniqut_remove",{
	_this call lambs_medical_fnc_removeTourniquet;
}] call CBA_fnc_addEventhandler;


["ace_medicalMenuOpened", {
	params ["_player", "_target"];
	private _units = [_player];
	_units pushBackUnique _target;

	{
		private _unit = _x;
		{
			private _bodyPart = _x;
			{
				_unit setVariable [format ["ace_medical_cantreat_%1_lambs_%2", _bodyPart, _x], nil];
			} forEach ["bandage_head","bandage_torso","bandage_larm","bandage_rarm","bandage_rleg","bandage_lleg","apply_tourniquette","remove_tourniquette"];

			{
				_unit setVariable [format ["ace_medical_cantreat_%1_%2", _bodyPart, _x], nil];
			} forEach ["packingbandage","elasticbandage","fielddressing","quikclot","tourniquet","removetourniquet"];
		} forEach ["head","body","hand_r","hand_l","leg_r","leg_l"];
	} forEach _units;
}] call CBA_fnc_addEventhandler;
