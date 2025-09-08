//=============================================================================
// TS_D01_1200_Drop02Scene.
//=============================================================================
class TS_D01_1200_Drop02Scene extends TriggeredScript
	placeable;

State Triggered
{
Begin:
//the second drop
	ACTION_TriggerEvent('SCENE_DROP2');
	sleep(3.0);
	ACTION_PlayLocalSound("V_PLANE.C47_PASSBY");
	sleep(4.0);
	GetPawn('AP_Chute2').bHidden = False;
	ACTION_TriggerEvent( 'Event_SS_Chute_Setup_02' );
	sleep(2.0);	
//	If ( GetPawn('PAWN_Garnett').Health > 0 )
//	{
//		ACTION_PlayLipSyncSound( 'PAWN_GARNETT', "D01_1200.GARNETT_DD", 1.0, 1.0, 1.0 );
//		ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_DD" ), 1.0, 1, 1, 1, TRUE, TRUE );
//	}
	ACTION_TriggerEvent('gbxTrig_Flare_02');
	gbxContextUseTrigger( GetFirstActor('gbxTrig_Flare_02') ).bDisabled = False;
	sleep(4.0);
	ACTION_TriggerEvent('TS_D01_1200_Drop03Scene');
	ACTION_SetHidden('SM_C47_Drop2', True );
	sleep(10.4);
	ACTION_PlaySound( 'SM_Chute_02', "IMPACTS.BODY_GROUND", 1.0, 1.0, 1.0 );
	ACTION_PlaySound( 'SM_Chute_02', "V_PLANE.PARACHUTE_LAND", 1.0, 1.0, 1.0 );
	ACTION_SetHidden('SM_C47_Drop', False );
}
