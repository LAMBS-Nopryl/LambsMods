
// init 
params ["_unit","_killer","_crash"];
private _time = time;

// headshot ---------------------------------------------
if (_unit getHit "Head" > 0.95) then {
        //private _blood = (selectRandom lambs_unit_sfx_blood) createVehicleLocal getpos _unit;
        _blood = "#particlesource" createVehicleLocal getpos _unit;
        _blood setParticleClass "BloodHeadshot";
        _blood attachTo [_unit, [0,0,0.1],"head"];
        //_blood setVectorDirAndUp [[random 1,random 1,-1],(vectorDir player) vectorFromTo (vectorDir _unit)];
        sleep (0.15 + random 0.2);
        deleteVehicle _blood; 
    }; 

// body drop --------------------------------------------
if (player distance2d _unit > 50) exitWith {};
/*
// crash 
if (isNull _crash && {!isNull objectParent _killer}) exitWith {
        systemchat "CRASH CRASH CRASH!"; 
        playSound [(selectRandom lambs_crash_sfx),true];
        //(vehicle _killer) say3d (selectRandom lambs_crash_sfx);
    }; 
*/
// surface
private _surfaceType = surfaceType (getPosATL _unit);

// effect 
_obj = "Land_HelipadEmpty_F" createVehicleLocal [0,0,0];
_obj attachTo [_unit,[0,0,1]];
_sound = switch (_surfaceType) do {
    case "#GdtStratisGreenGrass";
    case "#GdtGrassGreen": {selectRandom lambs_unit_sfx_bodyfall_grass};

    case "#GdtStratisThistles";
    case "#GdtStratisDryGrass";
    case "#GdtGrassDry": {selectRandom lambs_unit_sfx_bodyfall_drygrass};

    case "#GdtStratisDirt";
    case "#GdtDirt";
    case "#GdtStratisConcrete";
    case "#GdtConcrete";
    case default {selectRandom lambs_unit_sfx_bodyfall_concrete};
};

// let the body hit the floor 
waitUntil {(ASLToATL(eyePos _unit) select 2) < 0.8 || {time > (_time + 2.5)}};
_obj say _sound;

// let the sound play! 
waitUntil {time > (_time + 4.5)};
deleteVehicle _obj;

// end 
true 