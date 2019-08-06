
class CfgCloudlets
{
	class default; 
	class Blood;
	class BloodMist: Blood
	{
		particleShape = "\A3\data_f\ParticleEffects\Universal\Universal_02";
		particleFSNtieth = 8;
		particleFSIndex = 4;
		particleFSFrameCount = 1;
		particleFSLoop = 0;
		lifeTime = "0.4";
		size[] = {"(hit/50 + 0.5)","2*(hit/50 + 0.5)"};
		color[] = {{ 1,0,0,0.1 },{ 1,0,0,0.05 }};
		randomDirectionPeriod = 0.3;
		randomDirectionIntensity = 0.3;
		weight = 0.127;
	};
	class BloodHeadshot : Default 
	{
		angleVar = 360; 
		animationName = "";
		animationSpeed[] = {0.1};
		beforeDestroyScript = "";
		blockAIVisibility = 0; 
		circleRadius = 0; 
		circleVelocity[] = {0,0,0};
		color[] = {
			{0.4,0.3,0.3,2},
			{0.4,0.3,0.3,2},
			{0.4,0.3,0.3,1.4},
			{0.4,0.3,0.3,0.8},
			{0.4,0.3,0.3,0.4},
			{0.4,0.3,0.3,0.05},
			{0.4,0.3,0.3,0.001}
		};
		colorVar[] = {0,0,0,0.2};
		destroyOnWaterSurface = 1;
		destroyOnWaterSurfaceOffset = -0.3;
		interval = 1;
		lifeTime = 0.1;
		lifeTimeVar = 0.02;
		moveVelocity[] = {0,0,0};
		MoveVelocityVar[] = {0,0,0};
		onTimerScript = "";
		particleFSFrameCount = 1;
		particleFSIndex = 13;
		particleFSLoop = 0;
		particleFSNtieth = 16;
		particleShape = "\A3\data_f\ParticleEffects\Universal\Universal";
		particleType = "Billboard";
		positionVar[] = {0.01,0.01,0.01};
		randomDirectionIntensity = 0.55;
		randomDirectionIntensityVar = 0.15;
		randomDirectionPeriod = 0.5;
		randomDirectionPeriodVar = 0.3;
		rotationVelocity = 1;
		rotationVelocityVar = 8;
		rubbing = 0.05;
		size[] = {0.5,0.5,0.8};
		sizeVar = 0.6;
		timerPeriod = 1;
		volume = 0.1;
		weight = 0.1275;
	};
};

class ImpactEffectsBlood
{
	class BloodMist
	{
		simulation = "particles";
		type = "BloodMist";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
		MoveVelocityVar[] = {0,0,0};
	};
	class Blood
	{
		simulation = "particles";
		type = "Blood";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.2;
		MoveVelocityVar[] = {2,2,2};	// <-- this is new 
	};
	class Blood1
	{
		simulation = "particles";
		type = "Blood1";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.65;
	};
	class Blood2
	{
		simulation = "particles";
		type = "Blood2";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.4;
	};
	class Blood3
	{
		simulation = "particles";
		type = "Blood3";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.4;
	};
	class BloodUnderwater1
	{
		simulation = "particles";
		type = "BloodUnderwater1";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.4;
	};
};
