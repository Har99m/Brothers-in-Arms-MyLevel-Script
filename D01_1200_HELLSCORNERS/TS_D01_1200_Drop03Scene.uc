//=============================================================================
// TS_D01_1200_Drop03Scene.
//=============================================================================
class TS_D01_1200_Drop03Scene extends TriggeredScript
	placeable;

State Triggered
{
Begin:
//the third drop
	ACTION_TriggerEvent('SCENE_DROP3');
	sleep(3.0);
	ACTION_PlayLocalSound("V_PLANE.C47_PASSBY");
	sleep(4.5);
	GetPawn('AP_Chute3').bHidden = False;
	ACTION_TriggerEvent( 'Event_SS_Chute_Setup_03' );
	sleep(2.0);	
	If ( GetPawn('PAWN_Garnett').Health > 0 )
	{
		ACTION_PlayLipSyncSound( 'PAWN_GARNETT', "D01_1200.GARNETT_DD", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_DD" ), 1.0, 1, 1, 1, TRUE, TRUE );
	}
	ACTION_TriggerEvent('gbxTrig_Flare_03');
	gbxContextUseTrigger( GetFirstActor('gbxTrig_Flare_03') ).bDisabled = False;
	sleep(4.0);
	ACTION_SetHidden('SM_C47_Drop3', True );
	sleep(9.4);
	ACTION_PlaySound( 'SM_Chute_03', "IMPACTS.BODY_GROUND", 1.0, 1.0, 1.0 );
	ACTION_PlaySound( 'SM_Chute_03', "V_PLANE.PARACHUTE_LAND", 1.0, 1.0, 1.0 );

}
