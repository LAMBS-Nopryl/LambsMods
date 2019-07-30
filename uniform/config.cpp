class CfgPatches
{
  class lambs_uniform
  {
    units[] = {
        "LAMBS_Soldier_F",
        "LAMBS_Scout_F",
        "LAMBS_SoldierD_F",
        "LAMBS_ScoutD_F",
        "LAMBS_SoldierMC_F",
        "LAMBS_ScoutMC_F",
        "LAMBS_Sniper_F"
    };
    weapons[] = {
        "LAMBS_U_CombatUniform",
        "LAMBS_U_CombatUniform_shortsleeve",
        "LAMBS_U_CombatUniformD",
        "LAMBS_U_CombatUniformD_shortsleeve",
        "LAMBS_U_CombatUniformMC",
        "LAMBS_U_CombatUniformMC_shortsleeve",
        "LAMBS_U_GhillieSuit"
    };
    requiredVersion = 1.82;
    requiredAddons[] = {
        "A3_Characters_F_Beta",
        "A3_Characters_F",
        "A3_Characters_F_BLUFOR"
    };
    version = "1.0"; 
    versionStr = "1.0";
    author = "nopryl.no";
    authorUrl = "http://www.nopryl.no";
  };
};

class cfgVehicles {
    class B_soldier_F;
    class I_Sniper_F;
    // Woodland M98 
    class LAMBS_Soldier_F : B_soldier_F {
        scope = 1; 
        author = "nopryl.no";
        side = 1; 
        displayName = "Rifleman [M98]";
        uniformClass ="LAMBS_U_CombatUniform";
        model = "\A3\Characters_F_Beta\INDEP\ia_soldier_01.p3d";
	    hiddenSelections[] = {
			"Camo",
            "insignia"
		};
		hiddenSelectionsTextures[] = {
			"\uniform\data\texture\uniform_m98.paa"
		};        
    };
    class LAMBS_Scout_F : LAMBS_Soldier_F {
        displayName = "Rifleman [M98] (Rolled-up)";
        uniformClass ="LAMBS_U_CombatUniform_shortsleeve";
        model = "\A3\Characters_F_Beta\INDEP\ia_soldier_02.p3d";
    };
    // Desert M03 
    class LAMBS_SoldierD_F : LAMBS_Soldier_F {
        displayName = "Rifleman [M03]";
        uniformClass ="LAMBS_U_CombatUniformD";
	    hiddenSelections[] = {
			"Camo",
            "insignia"
		};
		hiddenSelectionsTextures[] = {
			"\uniform\data\texture\uniform_m03.paa"
		};        
    };
    class LAMBS_ScoutD_F : LAMBS_SoldierD_F {
        displayName = "Rifleman [M03] (Rolled-up)";
        uniformClass ="LAMBS_U_CombatUniformD_shortsleeve";
        model = "\A3\Characters_F_Beta\INDEP\ia_soldier_02.p3d";
    };
    // Multicam
    class LAMBS_SoldierMC_F : LAMBS_Soldier_F {
        displayName = "Rifleman [Multicam]";
        uniformClass ="LAMBS_U_CombatUniformMC";
	    hiddenSelections[] = {
			"Camo",
            "insignia"
		};
		hiddenSelectionsTextures[] = {
			"\uniform\data\texture\uniform_mc.paa"
		};        
    };
    class LAMBS_ScoutMC_F : LAMBS_SoldierMC_F {
        displayName = "Rifleman [Multicam] (Rolled-up)";
        uniformClass ="LAMBS_U_CombatUniformMC_shortsleeve";
        model = "\A3\Characters_F_Beta\INDEP\ia_soldier_02.p3d";
    };    
    // Ghillie suit 
    class LAMBS_Sniper_F : I_Sniper_F {
        scope = 1; 
        author = "nopryl.no";
        side = 1; 
        displayName = "Sniper [M98]";
        uniformClass = "LAMBS_U_GhillieSuit";
        model = "A3\Characters_F_Beta\INDEP\ia_sniper.p3d";
	    hiddenSelections[] = {
			"Camo",
            "insignia"
		};
		hiddenSelectionsTextures[] = {
			"\uniform\data\texture\uniform_m98.paa"
		};        
    };
};

class cfgWeapons {
    class U_I_CombatUniform;
    class U_I_CombatUniform_shortsleeve;
    class U_I_GhillieSuit;    
    class UniformItem; 

    // Woodland M98 
    class LAMBS_U_CombatUniform : U_I_CombatUniform {
        author = "nopryl.no";
        displayName = "Combat Fatigues [M98]";
        class ItemInfo : UniformItem {
            uniformModel = "-";
			uniformClass = "LAMBS_Soldier_F";
			containerClass = "Supply40";
			mass = 40;
		};
    };
    class LAMBS_U_CombatUniform_shortsleeve : U_I_CombatUniform_shortsleeve {
        author = "nopryl.no";
        displayName = "Combat Fatigues [M98] (Rolled-up)";
        class ItemInfo : UniformItem {
            uniformModel = "-";
            uniformClass = "LAMBS_Scout_F";
            containerClass = "Supply40";
            mass = 40;
        };
    };
    // Desert M98
    class LAMBS_U_CombatUniformD : U_I_CombatUniform {
        author = "nopryl.no";
        displayName = "Combat Fatigues [M03]";
        class ItemInfo : UniformItem {
            uniformModel = "-";
			uniformClass = "LAMBS_SoldierD_F";
			containerClass = "Supply40";
			mass = 40;
		};
    }; 
    class LAMBS_U_CombatUniformD_shortsleeve : U_I_CombatUniform_shortsleeve {
        author = "nopryl.no";
        displayName = "Combat Fatigues [M03] (Rolled-up)";
        class ItemInfo : UniformItem {
            uniformModel = "-";
            uniformClass = "LAMBS_ScoutD_F";
            containerClass = "Supply40";
            mass = 40;
        };
    };
    // Multicam
    class LAMBS_U_CombatUniformMC : U_I_CombatUniform {
        author = "nopryl.no";
        displayName = "Combat Fatigues [Multicam]";
        class ItemInfo : UniformItem {
            uniformModel = "-";
            uniformClass = "LAMBS_SoldierMC_F";
            containerClass = "Supply40";
            mass = 40;
        };
    };
    class LAMBS_U_CombatUniformMC_shortsleeve : U_I_CombatUniform_shortsleeve {
        author = "nopryl.no";
        displayName = "Combat Fatigues [Multicam] (Rolled-up)";
        class ItemInfo : UniformItem {
            uniformModel = "-";
            uniformClass = "LAMBS_ScoutMC_F";
            containerClass = "Supply40";
            mass = 40;
        };
    };
    // ghillie 
    class LAMBS_U_GhillieSuit : U_I_GhillieSuit {
        author = "nopryl.no";
        displayName = "Ghillie Suit [M98]";
        class ItemInfo : UniformItem {
            uniformModel = "-";
			uniformClass = "LAMBS_sniper_F";
            containerClass = "Supply60";
            mass = 60;
		};
    };
};