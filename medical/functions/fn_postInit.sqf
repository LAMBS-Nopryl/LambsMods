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
	
	private _display = (uiNamespace getVariable "ace_medical_menu_medicalMenu");
	if (lambs_medical_showTourniquet) then {
		lambs_medical_MenuPFHID = [{
			// stop this pfeh if the menu is closed
			if (ace_medical_menu_MenuPFHID == -1) exitWith {
				[lambs_medical_MenuPFHID] call CBA_fnc_removePerFrameHandler;
				lambs_medical_MenuPFHID = -1;
			};
			(_this select 0) params ["_display","_curTourniquets"];
			if (isNull ACE_MEDICAL_MENU_INTERACTION_TARGET) then {
				ACE_MEDICAL_MENU_INTERACTION_TARGET = ACE_player;
			};
			if (ACE_MEDICAL_MENU_INTERACTION_TARGET != lambs_medical_menu_interaction_target) then {
				lambs_medical_menu_interaction_target = ACE_MEDICAL_MENU_INTERACTION_TARGET;
				_curTourniquets = [-1,-1,-1,-1,-1,-1];
				(_this select 0) set [1, _curTourniquets];
			};
			private _tourniquets = ACE_MEDICAL_MENU_INTERACTION_TARGET getVariable ["ace_medical_tourniquets", [0,0,0,0,0,0]];
			private _idcs = [0,0,56,57,58,59];
			for "_i" from 2 to 5 do {
				private _tourn = _tourniquets select _i;
				if (_tourn != (_curTourniquets select _i)) then {
					_curTourniquets set [_i,_tourn];
					private _opacity = [1,0] select (_tourn == 0);
					(_display displayCtrl (_idcs select _i)) ctrlSetTextColor [0, 0, 0.8, _opacity];
				};
			};
		}, 0, [_display,[-1,-1,-1,-1,-1,-1]]] call CBA_fnc_addPerFrameHandler;
	} else {
		{
			(_display displayCtrl _x) ctrlSetTextColor [0, 0, 0, 0];
		} forEach [0,0,56,57,58,59];
	};
}] call CBA_fnc_addEventhandler;
