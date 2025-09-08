//=============================================================================
// TS_D01_1200_DropScenes.
//=============================================================================
class TS_D01_1200_DropScenes extends TriggeredScript
	placeable;

State Triggered
{
Begin:
	GotoState('Drop1');
}

State Drop1
{
	Function OnTrigger()
	{
		GotoState('Drop2');
	}
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
	If ( GetPawn('PAWN_Friar').Health > 0 )
	{
		ACTION_PlayLipSyncSound( 'PAWN_FRIAR', "D01_1200.FRIAR_BB", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "FRIAR_BB" ), 1.0, 1, 1, 1, TRUE, TRUE );
	}
	ACTION_TriggerEvent('gbxTrig_Flare_01');
	gbxContextUseTrigger( GetFirstActor('gbxTrig_Flare_01') ).bDisabled = False;
	ACTION_SetHidden('SM_C47_Drop', True );
	sleep(10.4);
	ACTION_PlaySound( 'SM_Chute_01', "IMPACTS.BODY_GROUND", 1.0, 1.0, 1.0 );
	ACTION_PlaySound( 'SM_Chute_01', "V_PLANE.PARACHUTE_LAND", 1.0, 1.0, 1.0 );
	ACTION_SetHidden('SM_C47_Drop', False );
	ACTION_TriggerEvent('TS_D01_1200_DropScenes');


}

State Drop2
{
	Function OnTrigger()
	{
		GotoState('Drop3');
	}
Begin:
//the second drop
	ACTION_TriggerEvent('SCENE_DROP2');
	sleep(3.0);
	ACTION_PlayLocalSound("V_PLANE.C47_PASSBY");
	sleep(4.0);
	GetPawn('AP_Chute2').bHidden = False;
	ACTION_TriggerEvent( 'Event_SS_Chute_Setup_02' );
	sleep(2.0);	
	If ( GetPawn('PAWN_Garnett').Health > 0 )
	{
		ACTION_PlayLipSyncSound( 'PAWN_GARNETT', "D01_1200.GARNETT_DD", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_DD" ), 1.0, 1, 1, 1, TRUE, TRUE );
	}
	ACTION_TriggerEvent('gbxTrig_Flare_02');
	gbxContextUseTrigger( GetFirstActor('gbxTrig_Flare_02') ).bDisabled = False;
	sleep(4.0);
	ACTION_SetHidden('SM_C47_Drop', True );
	sleep(10.4);
	ACTION_PlaySound( 'SM_Chute_02', "IMPACTS.BODY_GROUND", 1.0, 1.0, 1.0 );
	ACTION_PlaySound( 'SM_Chute_02', "V_PLANE.PARACHUTE_LAND", 1.0, 1.0, 1.0 );
	ACTION_SetHidden('SM_C47_Drop', False );
	ACTION_TriggerEvent('TS_D01_1200_DropScenes');

}


State Drop3
{
	Function OnTrigger()
	{
		//null
	}
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
	ACTION_SetHidden('SM_C47_Drop', True );
	sleep(9.4);
	ACTION_PlaySound( 'SM_Chute_03', "IMPACTS.BODY_GROUND", 1.0, 1.0, 1.0 );
	ACTION_PlaySound( 'SM_Chute_03', "V_PLANE.PARACHUTE_LAND", 1.0, 1.0, 1.0 );

}
