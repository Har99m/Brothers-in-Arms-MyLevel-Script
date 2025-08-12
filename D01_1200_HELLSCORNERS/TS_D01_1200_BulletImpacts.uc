//=============================================================================
// TS_D01_1200_BulletImpacts.
//=============================================================================
class TS_D01_1200_BulletImpacts extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Marsh, AP_Garnett, AP_Desola, AP_Friar, AP_Paddock, AP_Campbell;
var pawn Pawn_Campbell;
var ActorLite MoveCampbell;
var bool bPlayIntro;

State Triggered
{
Begin:
	sleep(2.5);
	ACTION_PlaySound( 'EXP_06_Metal', "IMPACTS.bullet_metal", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_06_Metal');
	sleep(3.0);
	ACTION_PlaySound( 'EXP_08_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_08_Dirt');



	ACTION_WaitForEvent('MetalImpacts1');


	ACTION_PlaySound( 'EXP_06_Metal', "IMPACTS.bullet_metal", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_06_Metal');
	sleep(0.05);	
	ACTION_PlaySound( 'EXP_03_Metal', "IMPACTS.bullet_metal", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_03_Metal');
	sleep(0.18);
	ACTION_PlaySound( 'EXP_04_Metal', "IMPACTS.bullet_metal", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_04_Metal');
	sleep(0.2);
	ACTION_PlaySound( 'EXP_06_Metal', "IMPACTS.bullet_metal", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_06_Metal');
	sleep(0.21);
	ACTION_PlaySound( 'EXP_05_Glass', "IMPACTS.bullet_glass", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_05_Glass');
	sleep(0.3);
	ACTION_PlaySound( 'EXP_03_Metal', "IMPACTS.bullet_metal", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_03_Metal');

	sleep(1.5);

	ACTION_PlaySound( 'EXP_06_Metal', "IMPACTS.bullet_metal", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_06_Metal');



	ACTION_WaitForEvent('IMPACT_Water_Ricochet');


	ACTION_PlaySound( 'EXP_12_Metal', "IMPACTS.bullet_metal", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_12_Metal');
	sleep(0.10);
	ACTION_PlaySound( 'EXP_14_Metal', "IMPACTS.bullet_metal", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_14_Metal');
	sleep(0.18);
	ACTION_PlaySound( 'EXP_15_Water', "IMPACTS.bullet_water", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_15_Water');
	sleep(0.21);
	ACTION_PlaySound( 'EXP_13_Water', "IMPACTS.bullet_water", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_13_Water');

	sleep(3.0);	

	ACTION_PlaySound( 'EXP_07_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_07_Dirt');
	sleep(1.0);
	ACTION_PlaySound( 'EXP_08_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_08_Dirt');

	ACTION_WaitForEvent('RunningImpacts');


	ACTION_PlaySound( 'EXP_07_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_07_Dirt');
	sleep(1.2);
	ACTION_PlaySound( 'EXP_08_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_08_Dirt');
	sleep(1.3);
	ACTION_PlaySound( 'EXP_09_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_09_Dirt');
	sleep(0.6);
	ACTION_PlaySound( 'EXP_07_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_07_Dirt');
	sleep(0.4);
	ACTION_PlaySound( 'EXP_08_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_08_Dirt');
	sleep(0.3);
	ACTION_PlaySound( 'EXP_09_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_09_Dirt');
	sleep(0.4);
	ACTION_PlaySound( 'EXP_10_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_10_Dirt');
	sleep(0.2);
	ACTION_PlaySound( 'EXP_11_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_11_Dirt');
	sleep(0.6);
	ACTION_PlaySound( 'EXP_12_Plant', "IMPACTS.bullet_dirt", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_12_Plant');
	sleep(0.7);
	ACTION_PlaySound( 'EXP_02_Wood', "IMPACTS.bullet_wood", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_02_Wood');
	sleep(0.5);
	ACTION_PlaySound( 'EXP_01_Wood', "IMPACTS.bullet_wood", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_01_Wood');


	ACTION_WaitForEvent('MiscEndImpacts');


	ACTION_PlaySound( 'EXP_07_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_07_Dirt');
	sleep(0.2);
	ACTION_PlaySound( 'EXP_08_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_08_Dirt');
	sleep(1.3);
	ACTION_PlaySound( 'EXP_09_Dirt', "IMPACTS.bullet_stone", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_09_Dirt');
	sleep(1.4);
	ACTION_PlaySound( 'EXP_02_Wood', "IMPACTS.bullet_wood", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_02_Wood');
	sleep(0.5);
	ACTION_PlaySound( 'EXP_12_Plant', "IMPACTS.bullet_dirt", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_12_Plant');
	sleep(0.3);
	ACTION_PlaySound( 'EXP_01_Wood', "IMPACTS.bullet_wood", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('EXP_01_Wood');



	

}


