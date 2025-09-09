//=============================================================================
// TS_D090800_ImpactsIntro.
//=============================================================================
class TS_D090800_ImpactsIntro extends TriggeredScript
	placeable;

State Triggered
{
Begin:
	
	ACTION_PlaySound( 'EXP_Intro_07', "IMPACTS.BULLET_STONE", 1.0, 1.0, 10240.0 );
	ACTION_TriggerEvent('EXP_Intro_07');
	sleep(0.4);
	ACTION_PlaySound( 'EXP_Intro_05', "IMPACTS.BULLET_STONE", 1.0, 1.0, 10240.0 );
	ACTION_TriggerEvent('EXP_Intro_05');
	ACTION_TriggerEvent('PFX_INTRO_SAND01');
	sleep(0.3);
	ACTION_PlaySound( 'EXP_Intro_01', "IMPACTS.BULLET_STONE", 1.0, 1.0, 10240.0 );
	ACTION_TriggerEvent('EXP_Intro_01');
	sleep(0.1);
	ACTION_PlaySound( 'EXP_Intro_06', "IMPACTS.BULLET_STONE", 1.0, 1.0, 10240.0 );
	ACTION_TriggerEvent('EXP_Intro_06');
	

	ACTION_WaitForEvent( 'EVENT_FingerBlast' );


	ACTION_PlaySound( 'EXP_Intro_08', "IMPACTS.BULLET_STONE", 1.0, 1.0, 10240.0 );
	ACTION_TriggerEvent('EXP_Intro_08');
	sleep(0.05);
	ACTION_PlaySound( 'EXP_Intro_02', "IMPACTS.BULLET_DIRT", 1.0, 1.0, 10240.0 );
	ACTION_TriggerEvent('EXP_Intro_02');
	sleep(0.02);
	ACTION_PlaySound( 'EXP_Intro_04', "IMPACTS.BULLET_STONE", 1.0, 1.0, 10240.0 );
	ACTION_TriggerEvent('EXP_Intro_04');
	sleep(0.05);
	ACTION_PlaySound( 'EXP_Intro_SANDBAG', "IMPACTS.BULLET_DIRT", 1.0, 1.0, 10240.0 );
	ACTION_TriggerEvent('EXP_Intro_SANDBAG');
	ACTION_TriggerEvent('PFX_INTRO_SAND02');
	sleep(0.08);
	ACTION_PlaySound( 'EXP_Intro_03', "IMPACTS.BULLET_STONE", 1.0, 1.0, 10240.0 );
	ACTION_TriggerEvent('EXP_Intro_03');
	sleep(0.02);
	ACTION_TriggerEvent('PFX_INTRO_SAND04');
}
