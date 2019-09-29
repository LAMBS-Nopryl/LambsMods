// Settings 
// version 1.4
// by nkenny 

// init settings. Z is for flavour. 

// settings 
lambs_danger_CQB_range = 50; 						// Range at which units consider themselves in CQB
lambs_danger_CQB_formations = ["FILE","DIAMOND"]; 	// Special CQB Formations )
lambs_danger_minSuppression_range = 25; 			// Minimum range for suppression
lambs_danger_panic_chance = 15; 					// Chance of panic  1 out of this number.  (i.e., 1 out of 20 is 5%)

// debug 
lambs_danger_debug_FSM = false;						// FSM level debug messages
lambs_danger_debug_functions = false;				// Function level debug messages 
lambs_danger_debug_FSM_civ = false; 				// FSM level debug messages for civilian fsm 

// mod check 
lambs_danger_WP = isClass (configfile >> "CfgPatches" >> "lambs_wp");

// end 
true 
