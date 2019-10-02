class CfgWaypoints {
    class LAMBS_DangerAI { 
		displayName = "Advanced AI [LAMBS]";
        class LAMBS_Danger_Attack {
            displayName = "0 TASK ATTACK [Enters buildings]";
            displayNameDebug = "LAMBS_Danger_Attack";
            file = "\dangerWP\ai\fn_taskAttack.sqf";	// SQF file 
            icon = "\a3\3DEN\Data\CfgWaypoints\SeekAndDestroy_ca.paa";
			tooltip = "Units assault position and check buildings around waypoint out to WP completion radius (default 25m)";
        };        
        class LAMBS_Danger_Garrison {
            displayName = "1 TASK GARRISON";
            displayNameDebug = "LAMBS_Danger_Garrison";
            file = "\dangerWP\ai\fn_taskGarrison.sqf";	// SQF file 
            icon = "\a3\3DEN\Data\CfgWaypoints\Guard_ca.paa";
			tooltip = "Garrisons units in buildings around waypoint out to WP completion radius (default 50m)";
        };
        class LAMBS_Danger_Patrol {
            displayName = "2 TASK PATROL";
            displayNameDebug = "LAMBS_Danger_Patrol";
            file = "\dangerWP\ai\fn_taskPatrol.sqf";	// SQF file 
            icon = "\a3\3DEN\Data\CfgWaypoints\Loiter_ca.paa";
			tooltip = "Randomised patrol within WP completion radius (Default 200m)";
        };	
        class LAMBS_Danger_Rush {
            displayName = "3 TASK RUSH";
            displayNameDebug = "LAMBS_Danger_Rush";
            file = "\dangerWP\ai\fn_taskRush.sqf";	// SQF file 
            icon = "\a3\3DEN\Data\CfgWaypoints\Sentry_ca.paa";
			tooltip = "Rushes towards enemy with WP completion radius (Default 500m)";
        };
        class LAMBS_Danger_Hunt {
            displayName = "4 TASK HUNT";
            displayNameDebug = "LAMBS_Danger_Hunt";
            file = "\dangerWP\ai\fn_taskHunt.sqf";	// SQF file 
            icon = "\a3\3DEN\Data\CfgWaypoints\Sentry_ca.paa";
			tooltip = "Hunts the AI around group leader out to WP completion radius (Default 500m)";
        };
        class LAMBS_Danger_Creep {
            displayName = "5 TASK CREEP";
            displayNameDebug = "LAMBS_Danger_Creep";
            file = "\dangerWP\ai\fn_taskCreep.sqf";	// SQF file 
            icon = "\a3\3DEN\Data\CfgWaypoints\Sentry_ca.paa";
			tooltip = "Stalks the AI around group leader out to WP completion radius (Default 500m)";
        };		
        class LAMBS_Danger_CQB {
            displayName = "6 TASK CQB [Experimental]";
            displayNameDebug = "LAMBS_Danger_CQB";
            file = "\dangerWP\ai\fn_taskCQB.sqf";	// SQF file 
            icon = "\a3\3DEN\Data\CfgWaypoints\SeekAndDestroy_ca.paa";
			tooltip = "Clears buildings around the waypoint out to WP completion radius (Default 50m)";
        };
        class LAMBS_Danger_Artillery {
            displayName = "9 REGISTER ARTILLERY";
            displayNameDebug = "LAMBS_Register_Artillery";
            file = "\dangerWP\ai\fn_taskArtilleryRegister.sqf";	// SQF file 
            icon = "\a3\3DEN\Data\CfgWaypoints\Scripted_ca.paa";
			tooltip = "Registers artillery for dynamic use";
        };        
    };
};
