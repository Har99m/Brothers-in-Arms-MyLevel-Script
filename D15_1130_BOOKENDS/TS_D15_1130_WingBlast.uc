//=============================================================================
// TS_D15_1130_WingBlast.
//=============================================================================
class TS_D15_1130_WingBlast extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	ACTION_TriggerEvent('Flak_WingBlast');

	ACTION_PlayLocalSound( "EXPLOSIONS.FLAK_IMPACT_A" );
	
	ACTION_DestroyActor('HorizonTracers01');
	ACTION_DestroyActor('HorizonTracers02');
	ACTION_DestroyActor('HorizonTracers03');
	ACTION_DestroyActor('HorizonTracers04');

	ACTION_TriggerEvent( 'Event_ZanovichFall' );

	sleep(0.2);
	ACTION_PlayLocalSound( "Player.PHYSIO_STAGE_A" );
	ACTION_PlaySound( 'BigBlast_Squib1_SM', "IMPACTS.bullet_glass", 1.0, 1.0, 160.0 );
	ACTION_TriggerEvent('BigBlast_Glass2');
	ACTION_PlayLocalSound( "EXPLOSIONS.PLANE_HIT_LARGE_A" );			

	sleep(0.2);
	ACTION_TriggerEvent('FlakAbovePlane01');
	ACTION_PlaySound('BigBlast_Squib1_SM' , "EXPLOSIONS.PLANE_HIT_SMALL_A", 1.0, 1.0, 160.0 );
	ACTION_TriggerEvent('BigBlast_Squib5');
	ACTION_TriggerEvent('engine_fire_right');

	sleep(0.15);
	ACTION_PlaySound('BigBlast_Squib2_SM' , "IMPACTS.bullet_metal", 1.0, 1.0, 160.0 );
	ACTION_TriggerEvent('BigBlast_Squib6');
	ACTION_TriggerEvent('FlakAbovePlane02');

	sleep(0.2);
	ACTION_PlaySound('BigBlast_Squib3_SM' , "IMPACTS.bullet_metal", 1.0, 1.0, 160.0 );
	ACTION_TriggerEvent('BigBlast_Squib7');
	ACTION_TriggerEvent('FlakAbovePlane03');
	ACTION_PlaySound( 'BigBlast_Squib1_SM', "IMPACTS.bullet_glass", 1.0, 1.0, 160.0 );

	sleep(0.2);
	ACTION_PlaySound('BigBlast_Squib4_SM' , "IMPACTS.bullet_metal", 1.0, 1.0, 160.0 );

	sleep(0.15);
	ACTION_PlaySound('BigBlast_Squib1_SM' , "IMPACTS.bullet_metal", 1.0, 1.0, 160.0 );
	ACTION_TriggerEvent('BigBlast_Squib8');

	sleep(0.2);
	ACTION_PlaySound('BigBlast_Squib3_SM' , "IMPACTS.bullet_metal", 1.0, 1.0, 160.0 );

	sleep(0.3);
	ACTION_PlaySound('BigBlast_Squib2_SM' , "IMPACTS.bullet_metal", 1.0, 1.0, 160.0 );
	ACTION_TriggerEvent('BigBlast_Squib9');

	sleep(0.2);
	ACTION_PlaySound('BigBlast_Squib4_SM' , "IMPACTS.bullet_metal", 1.0, 1.0, 160.0 );
}


