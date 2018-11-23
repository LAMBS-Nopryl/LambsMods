class ACE_Medical_Actions {
    class Basic;
    class Advanced {
        class FieldDressing {
            condition = "ace_medical_menu_MenuPFHID == -1";
            callbackSuccess = "lambs_medical_fnc_treatment_bandage";
            // items[] = {"ACE_fieldDressing","ACE_packingBandage","ACE_elasticBandage","ACE_quikclot"};
        };
        class ElasticBandage: FieldDressing {
            condition = "ace_medical_menu_MenuPFHID == -1";
        };
        class PackingBandage: FieldDressing {
            condition = "ace_medical_menu_MenuPFHID == -1";
        };
        class QuikClot: FieldDressing {
            condition = "ace_medical_menu_MenuPFHID == -1";
        };
        class Tourniquet: FieldDressing {
            callbackSuccess = "lambs_medical_fnc_applyTourniquet";
            condition = "(ace_medical_menu_MenuPFHID == -1 && {!([_this select 1, _this select 2] call ace_medical_fnc_hasTourniquetAppliedTo)})";
        };
        class SurgicalKit: FieldDressing {
            condition = "";
            callbackSuccess = "";
        };
        class PersonalAidKit: FieldDressing {
            condition = "";
            callbackSuccess = "ace_medical_fnc_treatmentAdvanced_fullHeal";
        };
        class RemoveTourniquet: Tourniquet {
            callbackSuccess = "lambs_medical_fnc_removeTourniquet";
            condition = "(ace_medical_menu_MenuPFHID == -1 && {[_this select 1, _this select 2] call ace_medical_fnc_hasTourniquetAppliedTo})";
        };
        /*class BodyBag: FieldDressing {
            condition = "ace_medical_menu_MenuPFHID == -1";
        };*/
        class lambs_apply_tourniquette: Tourniquet {
            //condition = "(ace_medical_menu_MenuPFHID > -1 && {!([_this select 1, _this select 2] call ace_medical_fnc_hasTourniquetAppliedTo)})";
            displayName = "Smart Tourniquet";
            callbackSuccess = "lambs_medical_fnc_applySmartTourniquet";
            condition = "([_this select 1] call lambs_medical_fnc_getAllLimbBloodloss) > 0";
            items[] = {"ACE_tourniquet"};
            allowedSelections[] = {"All"};
        };
        class lambs_bandage_head: FieldDressing {
            displayName = "Bandage head";
            items[] =  {{"ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_quikclot"}};
            callbackSuccess = "lambs_medical_fnc_bandageHead";
            condition = "([_this select 1,0,true] call lambs_medical_fnc_getBodyPartBleeding) > 0";
            litter[] = {
                {"All", "", {"ACE_MedicalLitter_packingBandage"}},
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection <= 0", {"ACE_MedicalLitter_clean"}}
            };
        };
        class lambs_bandage_torso: lambs_bandage_head {
            displayName = "Bandage Torso";
            condition = "([_this select 1,1,true] call lambs_medical_fnc_getBodyPartBleeding) > 0";
            callbackSuccess = "lambs_medical_fnc_bandageTorso";
        };
        class lambs_bandage_rArm: lambs_bandage_head {
            displayName = "Bandage Right Arm";
            condition = "([_this select 1,3,true] call lambs_medical_fnc_getBodyPartBleeding) > 0 || {((_this select 1) getHit 'hands') > 0 && {([_this select 1,2,true] call lambs_medical_fnc_getBodyPartBleeding) == 0}}";
            callbackSuccess = "lambs_medical_fnc_bandageRightArm";
        };
        class lambs_bandage_lArm: lambs_bandage_head {
            displayName = "Bandage Left Arm";
            condition = "([_this select 1,2,true] call lambs_medical_fnc_getBodyPartBleeding) > 0 || {((_this select 1) getHit 'hands') > 0  && {([_this select 1,3,true] call lambs_medical_fnc_getBodyPartBleeding) == 0}}";
            callbackSuccess = "lambs_medical_fnc_bandageLeftArm";
        };
        class lambs_bandage_rLeg: lambs_bandage_head {
            displayName = "Bandage Right Leg";
            condition = "([_this select 1,5,true] call lambs_medical_fnc_getBodyPartBleeding) > 0 || {((_this select 1) getHit 'legs') > 0 && {([_this select 1,4,true] call lambs_medical_fnc_getBodyPartBleeding) == 0}}";
            callbackSuccess = "lambs_medical_fnc_bandageRightLeg";
        };
        class lambs_bandage_lLeg: lambs_bandage_head {
            displayName = "Bandage Left Leg";
            condition = "([_this select 1,4,true] call lambs_medical_fnc_getBodyPartBleeding) > 0 || {((_this select 1) getHit 'legs') > 0 && {([_this select 1,5,true] call lambs_medical_fnc_getBodyPartBleeding) == 0}}";
            callbackSuccess = "lambs_medical_fnc_bandageLeftLeg";
        };
        class lambs_remove_tourniquette: RemoveTourniquet {
            callbackSuccess = "lambs_medical_fnc_removeSmartTourniquet";
            condition = "[_this select 1] call lambs_medical_fnc_hasTourniquetsApplied";
            items[] = {};
            allowedSelections[] = {"All"};
        };
        /*class lambs_place_in_bodybag: BodyBag {
            condition = "ace_medical_menu_MenuPFHID > -1";
            items[] = {"ACE_bodyBag"};
        };*/
        class lambs_surgicalKit: SurgicalKit {
            condition = "ace_medical_menu_MenuPFHID > -1";
            items[] = {"ACE_surgicalKit"};
        };

        class BloodIV:FieldDressing {
            condition = "";
            treatmentTime = 3;
            allowedSelections[] = {"All"};
        };
        class BloodIV_500: BloodIV {
            allowedSelections[] = {"All"};
        };
        class BloodIV_250: BloodIV {
            allowedSelections[] = {"All"};
        };
        class PlasmaIV: BloodIV {
            allowedSelections[] = {"All"};
        };
        class PlasmaIV_500: PlasmaIV {
            allowedSelections[] = {"All"};
        };
        class PlasmaIV_250: PlasmaIV {
            allowedSelections[] = {"All"};
        };
        class SalineIV: BloodIV {
            allowedSelections[] = {"All"};
        };
        class SalineIV_500: SalineIV {
            allowedSelections[] = {"All"};
        };
        class SalineIV_250: SalineIV {
            allowedSelections[] = {"All"};
        };

        class Morphine: FieldDressing {
            condition = "";
            allowedSelections[] = {"All"};
        };
        class Epinephrine: Morphine {
            callbackSuccess = "lambs_medical_fnc_handleEpinephrine";
            allowedSelections[] = {"All"};
        };
        class Atropine: Morphine {
            allowedSelections[] = {"All"};
        };
        class Adenosine: Morphine {
            allowedSelections[] = {"All"};
        };
    };
};

class ACE_Medical_Advanced {
    class Injuries;
    class Treatment {
        class Bandaging {
            class Bandage;
            class FieldDressing {
                 // How effect is the bandage for treating one wounds type injury
                effectiveness = 4;
                // What is the chance and delays (in seconds) of the treated default injury reopening
                reopeningChance = 0;
                reopeningMinDelay = 120;
                reopeningMaxDelay = 200;

                class Abrasion {
                    effectiveness = 4;
                    reopeningChance = 0;
                    reopeningMinDelay = 200;
                    reopeningMaxDelay = 1000;
                };
                class AbrasionMinor: Abrasion {};
                class AbrasionMedium: Abrasion {};
                class AbrasionLarge: Abrasion {};

                class Avulsions: Abrasion {};
                class AvulsionsMinor: Avulsions {};
                class AvulsionsMedium: Avulsions {};
                class AvulsionsLarge: Avulsions {};

                class Contusion: Abrasion {};
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};

                class CrushWound: Abrasion {};
                class CrushWoundMinor: CrushWound {};
                class CrushWoundMedium: CrushWound {};
                class CrushWoundLarge: CrushWound {};

                class Cut: Abrasion {};
                class CutMinor: Cut {};
                class CutMedium: Cut {};
                class CutLarge: Cut {};

                class Laceration: Abrasion {};
                class LacerationMinor: Laceration {};
                class LacerationMedium: Laceration {};
                class LacerationLarge: Laceration {};

                class velocityWound: Abrasion {};
                class velocityWoundMinor: velocityWound {};
                class velocityWoundMedium: velocityWound {};
                class velocityWoundLarge: velocityWound {};

                class punctureWound: Abrasion {};
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {};
                class punctureWoundLarge: punctureWound {};
            };

            class PackingBandage: FieldDressing {};
            class ElasticBandage: FieldDressing {};
            class QuikClot: FieldDressing {};
        };
        class IV {
            class BloodIV {
                volume = 2000;
            };
            class BloodIV_250: BloodIV {
                volume = 500;
            };
            class BloodIV_500: BloodIV {
                volume = 1000;
            };
            class PlasmaIV: BloodIV {
                volume = 2000;
            };
            class PlasmaIV_250: PlasmaIV {
                volume = 500;
            };
            class PlasmaIV_500: PlasmaIV {
                volume = 1000;
            };
            class SalineIV: BloodIV {
                volume = 2000;
            };
            class SalineIV_250: SalineIV {
                volume = 500;
            };
            class SalineIV_500: SalineIV {
                volume = 1000;
            };
        };
    };
};