//=============================================================================
// TS_D01_1200_Drop01Scene.
//=============================================================================
class TS_D01_1200_Drop01Scene extends TriggeredScript
	placeable;


State Triggered
{
Begin:
//the first drop
	ACTION_TriggerEvent('SCENE_DROP1');
	sleep(3.0);
	ACTION_PlayLocalSound("V_PLANE.C47_PASSBY");
	sleep(5.0);
	GetPawn('AP_Chute1').bHidden = False;
	ACTION_TriggerEvent( 'Event_SS_Chute_Setup_01' );
	sleep(2.0);	
	If ( GetPawn('PAWN_Garnett').Health > 0 )
	{
		ACTION_PlayLipSyncSound( 'PAWN_GARNETT', "D01_1200.GARNETT_DD", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_DD" ), 1.0, 1, 1, 1, TRUE, TRUE );
	}
	sleep(4.0);
	ACTION_TriggerEvent('TS_D01_1200_Drop02Scene');
	If ( GetPawn('PAWN_Friar').Health > 0 )
	{
		ACTION_PlayLipSyncSound( 'PAWN_FRIAR', "D01_1200.FRIAR_BB", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "FRIAR_BB" ), 1.0, 1, 1, 1, TRUE, TRUE );
	}
	ACTION_TriggerEvent('gbxTrig_Flare_01');
	gbxContextUseTrigger( GetFirstActor('gbxTrig_Flare_01') ).bDisabled = False;
	ACTION_SetHidden('SM_C47_Drop1', True );
	sleep(10.4);
	ACTION_PlaySound( 'SM_Chute_01', "IMPACTS.BODY_GROUND", 1.0, 1.0, 1.0 );
	ACTION_PlaySound( 'SM_Chute_01', "V_PLANE.PARACHUTE_LAND", 1.0, 1.0, 1.0 );
	ACTION_SetHidden('SM_C47_Drop', False );

}
