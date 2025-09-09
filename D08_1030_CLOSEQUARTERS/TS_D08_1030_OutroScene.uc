//=============================================================================
// TS_D08_1030_OutroScene.
//=============================================================================
class TS_D08_1030_OutroScene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Corrion, AP_Baker;
var WargamePlayerController PlayerC;
var WargamePawn PlayerP;
var bool bBakerAtOutro;
var ActorLite PN_US_Baker_Outro, PN_US_Baker_Outro3;

state Triggered
{
	function Ontrigger()
	{
	GotoState( 'BakerDialogue' );
	}
Begin:

	ACTION_TriggerEvent( 'CSG_US_Unit_BakerCorrion' );
	sleep( 0.2 );

//---	INT SET UP

	ACTION_DestroyActor( 'AP_BakerIntro' );
	ACTION_DestroyActor( 'AP_CorrionIntro' );

	PN_US_Baker_Outro = GetNavigationPoint( 'PN_US_Baker_Outro' );
	PN_US_Baker_Outro3 = GetNavigationPoint( 'PN_US_Baker_Outro3' );
	AP_Baker = AnimPawn( GetPawn( 'Baker' ));
	AP_Corrion = AnimPawn( GetPawn( 'Corrion' ));

	AP_Baker.Controller.bGodmode = true;
	AP_Corrion.Controller.bGodmode = true;

	ACTION_SetRepelBullets( 'Baker', true );
	ACTION_SetRepelBullets( 'Corrion', true );

	ACTION_RunDirect( AP_Baker );
	ACTION_RunDirect( AP_Corrion );

//	ACTION_OrderMove( 'Unit_US_BakerCorrion', 'PN_US_Baker_01' );
//		sleep( 2.0 );
	ACTION_MoveToward( AP_Baker, GetNavigationPoint( 'PN_Outro_BakerToPlayer' ));
	ACTION_MoveToward( AP_Corrion, GetNavigationPoint( 'PN_Outro_CorrionToPlayer' ));

		sleep( 3.0 );

	ACTION_TriggerEvent('TS_D08_1030_MeetBakerHint');
	//ACTION_DisplayObjectiveHint(S_Localize("HINT_B" ), 3.5 );

	ACTION_ChangeScriptedSequenceDirect( AP_Baker, 'SS_Baker_Wall' );
	ACTION_ChangeScriptedSequenceDirect( AP_Corrion, 'SS_Corrion_Wall' );

	ACTION_TriggerEvent( 'BV_CorrionOutro' );
	ACTION_TriggerEvent( 'BV_BakerOutro' );

	ACTION_TriggerEvent( 'Event_StartOutroWallAnims' );
	AP_Corrion.EWeaponAimedState = WAS_CombatRelaxed ;
	AP_Baker.EWeaponAimedState = WAS_Relaxed ;

		sleep( 20.0 );
	ACTION_DestroyActor( 'gbxTrigger_TV_TRIG_TS_D08_1030_OutroScene' ); 
	ACTION_TriggerEvent( 'TV_TRIG_TS_D08_1030_OutroScene' );


}

state BakerDialogue
{
	function Ontrigger()
	{
	GotoState( 'BakerRunAway' );
	}
Begin:

	GetFirstActor('TS_D08_1030_MeetBakerHint').goToState('Null');
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );


//	AP_Corrion.Controller.Focus = GetFirstActor( 'PCenter' );
	AP_Corrion.Controller.Focus = GetFirstActor( 'LT_OutroTarget06' );
	slog( "******************* CORRION FOCUS =" $ AP_Corrion.Controller.Focus );
	ACTION_TriggerEvent( 'Event_PlayerAtWall' );

	bBakerAtOutro = False;

        i = 0.0;

        ResetAbsoluteTime();
        StartAbsoluteTime();

//Baker_outro_dialogue
//Baker_outro_flinch
//Corrion_glances_over_shoulder
//Corrion_taps_bakers_shoulder
//Corrion_flinch
	ACTION_SetLookAtTargetDirect( AP_Baker, GetLocalPlayerPawn(), true ); 
	ACTION_SetLookAtTargetDirect( AP_Corrion, GetLocalPlayerPawn(), true ); 


	ACTION_TriggerEvent( 'Event_StartBakerWallAnims' );
	ACTION_PlayLipSyncSoundDirect( AP_Baker, "D08_1030.BAKER_AA", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_AA" ), 5.0 , 1 , 1 , 1 , , TRUE );

	WaitForAbsolutetime( i += 4.8 );
	ACTION_TriggerEvent( 'Event_OutroWallCorrionGlance' );
	WaitForAbsolutetime( i += 0.6 );

	ACTION_PlayLipSyncSoundDirect( AP_Corrion, "D08_1030.CORRION_AA", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("CORRION_AA" ), 3.5 , 1 , 1 , 1 , , TRUE );

	WaitForAbsolutetime( i += 0.5 );

	ACTION_PlayLipSyncSoundDirect( AP_Baker, "D08_1030.BAKER_BB", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_BB" ), 3.5 , 1 , 1 , 1 , , TRUE );

	WaitForAbsolutetime( i += 3.5 );

	ACTION_TriggerEvent( 'Event_OutroWallCorrionWave' );
	ACTION_PlayLipSyncSoundDirect( AP_Corrion, "D08_1030.CORRION_BB", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("CORRION_BB" ), 3.5 , 1 , 1 , 1 , , TRUE );

	WaitForAbsolutetime( i += 1.0 );

	ACTION_PlayLipSyncSoundDirect( AP_Baker, "D08_1030.BAKER_CC", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_CC" ), 2.5 , 1 , 1 , 1 , , TRUE );

}


state BakerRunAway
{
	function Ontrigger()
	{
	GotoState( 'OutroSetUp' );
	}
Begin:

//	ACTION_PlayLipSyncSoundDirect( AP_Corrion, "BD_CORRION.L_SEEENEMYTANK_A", 1.0, 1.0, 1.0 );
//	ACTION_DisplaySubTitleMessage2(S_Localize("CORRION_CC" ), 3.5 , 1 , 1 , 1 , , TRUE );

	ACTION_ClearLookAtTargetDirect( AP_Baker ); 
	ACTION_ClearLookAtTargetDirect( AP_Corrion ); 


	sleep( 0.75 );

	ACTION_UnLockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE );

	ACTION_ChangeScriptedSequenceDirect( AP_Baker, 'SS_Baker_WallFlinch' );
	ACTION_ChangeScriptedSequenceDirect( AP_Corrion, 'SS_Corrion_WallFlinch' );
	ACTION_TriggerEvent( 'Event_OutroWallFlinchAnims' );

	StopAbsoluteTime();

	ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_DD" ), 3.5 , 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Baker, "D08_1030.BAKER_DD", 1.0, 1.0, 1.0 );

	sleep( 0.75 );

	ACTION_MoveToward( AP_Corrion, PN_US_Baker_Outro, FALSE );
	sleep( 0.2 );	
	ACTION_MoveToward( AP_Baker, PN_US_Baker_Outro, FALSE );
	while( !PawnIsAtDestination( AP_Baker, PN_US_Baker_Outro3 ) )
	{
		sleep( 1.0 );
		ACTION_MoveToward( AP_Baker, PN_US_Baker_Outro3, FALSE );
	}
	bBakerAtOutro = True;

}


state OutroSetUp
{
	function Ontrigger()
	{
	GotoState( 'Outro' );
	}
Begin:

	ACTION_TriggerEvent( 'Event_StartOutroAnims' );

	AP_Baker = AnimPawn( GetPawn( 'AP_BakerOutro' ));
	AP_Corrion = AnimPawn( GetPawn( 'AP_CorrionOutro' ));

	ACTION_TriggerEvent( 'gbxWB_Panzer' );
	ACTION_TriggerEvent( 'gbxWaypointBeacon_MainStreet' );
	ACTION_TriggerEvent( 'gbxWB_Baker' );

	AP_Baker.bHidden = false;
	AP_Corrion.bHidden = false;
	ACTION_AttachStaticMesh( AP_Baker, StaticMesh's_npc_item_us.prop.calvados', 'wine_righthand' );

//	DISPLAY HINT
	sleep( 4.0 );
	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
	ACTION_DisplayObjectiveHint(S_Localize("HINT_A" ), 3.5 );
	ACTION_TriggerEvent( 'TV_gbxTrigger_Event_DustOff' );

//wait for player to get close
}

state Outro
{
Begin:
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );

//START DIALOGUE

        i = 0.0;

        ResetAbsoluteTime();
        StartAbsoluteTime();

	ACTION_TriggerEvent( 'Event_OutroStartBakerAnim' );
	ACTION_TriggerEvent( 'Event_OutroStartCorrionAnim' );
	WaitForAbsolutetime( i += 2.0 );

//CORRION_B1="Corrion: That grenade was too close.  I can barely hear anything."
	ACTION_PlayLipSyncSoundDirect( AP_Corrion, "D08_1030.CORRION_DD", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("CORRION_DD1" ), 3.5 , 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i += 4.0 );

//CORRION_B2="Corrion: I swear to God Baker explosions are drawn to you."
	ACTION_DisplaySubTitleMessage2(S_Localize("CORRION_DD2" ), 3.5 , 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i += 5.0);

//CORRION_C="Corrion: This ringing in my ears is going to drive me crazy."
	ACTION_PlayLipSyncSoundDirect( AP_Corrion, "D08_1030.CORRION_EE", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("CORRION_EE" ), 3.5 , 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i += 3.6 );

	ACTION_SetLookAtTargetDirect( AP_Baker, GetLocalPlayerPawn(), True );

//BAKER_C="Baker: I took cover from that grenade under what I think used to be a table...  and I found this."
	ACTION_PlayLipSyncSoundDirect( AP_Baker, "D08_1030.BAKER_EE", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_EE" ), 4.5 , 1 , 1 , 1 , , TRUE );

	WaitForAbsolutetime( i += 4.4 );

//BAKER_D="Baker: Figured you'd like to properly toast your promotion."
		ACTION_PlayLipSyncSoundDirect( AP_Baker, "D08_1030.BAKER_FF", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_FF" ), 4.5 , 1 , 1 , 1 , , TRUE );

        WaitForAbsoluteTime( i += 4.0 );

	ACTION_TriggerEvent( 'TriggeredScriptMapComplete' );
}
