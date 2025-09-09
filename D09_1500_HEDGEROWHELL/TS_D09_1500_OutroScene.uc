//=============================================================================
// TS_D09_1500_OutroScene.
//=============================================================================
class TS_D09_1500_OutroScene extends TS_D09_1500_IntroScene
	placeable;

var WargamePlayerController WPC_Ref;

var Actorlite PN_Outro_Cassidy, PN_Outro_CassidyMeet;

var int i;

state Triggered
{
	function OnTrigger()
	{
		GotoState( 'PlayerInPosition' );
	}

	Begin:

	// Initialize Variables
	WP_Player = GetLocalPlayerPawn();
	WPC_Ref = GetLocalPlayerController();

	PN_Outro_Cassidy = GetNavigationPoint('PN_Outro_Cassidy');
	PN_Outro_CassidyMeet = GetNavigationPoint('PN_Outro_Doe');

	// Spawn and move Cassidy
	ACTION_TriggerEvent( 'CSU_OutroScene' );

	AP_Cassidy = AnimPawn( GetPawn('IG_Cassidy') );
	AP_Doe = AnimPawn( GetPawn('IG_J_Doe') );
	AP_York = AnimPawn( GetPawn('IG_J_York') );
	AP_Paddock = AnimPawn( GetPawn('IG_Paddock') );
	AP_Paige = AnimPawn( GetPawn('IG_Paige') );

	AP_Cassidy.Controller.bDemiGod = TRUE;
	AP_Doe.Controller.bDemiGod = TRUE;
	AP_York.Controller.bDemiGod = TRUE;

	gbxPawn(AP_Cassidy).SetRepelBullets( TRUE );
	gbxPawn(AP_Doe).SetRepelBullets( TRUE );
	gbxPawn(AP_York).SetRepelBullets( TRUE );

	ACTION_OrderMove( 'Unit_US_Johnson', 'PN_C4HT1_StartPosition_03' );
	sleep( 4.0 );

	ACTION_TriggerEvent( 'gbxExpTrig_FirstOut' );
	sleep( 1.0 );

	ACTION_OrderMove( 'Unit_US_Johnson', 'PN_C4U3_StepOne', TRUE );
	ACTION_OrderMove( 'Unit_US_Johnson', 'PN_C4HT2_StartPosition_03', TRUE );
	sleep( 8.0 );

	ACTION_TriggerEvent( 'gbxExpTrig_SecondOut' );

	ACTION_BlockNavPoints( 'PN_C4HT2_StartPosition_04' );
	ACTION_BlockNavPoints( 'PN_OutroBlockedPoints' );
	ACTION_UnblockNavPoints( 'PN_OutroUnblockedPoints' );

	ACTION_OrderMove( 'Unit_US_Johnson', 'PN_Outro_Paddock' );

	// Handle Beacon
	ACTION_TriggerEvent( Event );

	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
	ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 );
	sleep( 5.0 );

	ACTION_DisplayObjectiveHint( S_Localize("HINT_B"), 4.0 );

	// Change Cassidy to a scripted controller and move him closer to the player
	ACTION_ChangeControllerDirect( AP_Cassidy, class'ScriptedController' );
	ACTION_ChangeControllerDirect( AP_Doe, class'ScriptedController' );
	ACTION_ChangeControllerDirect( AP_York, class'ScriptedController' );

	WargamePawn(AP_Cassidy).SetWeaponAimedState( WAS_Relaxed );

	ACTION_ChangeScriptedSequenceDirect( AP_Cassidy, 'SS_Cassidy_Outro' );

	ACTION_MoveToward( AP_York, GetNavigationPoint('PN_Outro_York'), TRUE );
	ACTION_MoveToward( AP_Doe, PN_Outro_CassidyMeet, TRUE );

	ACTION_WalkDirect( AP_Cassidy );
	ACTION_MoveToward( AP_Cassidy, PN_Outro_Cassidy, TRUE );
	AP_Cassidy.ShouldCrouch( FALSE );

	i = 0;
	while( !PawnIsAtDestination(AP_Cassidy, PN_Outro_Cassidy) && i < 15 )
	{
		sleep( 1.0 );
		i++;
	}

	ACTION_SetLookAtTargetDirect( AP_Cassidy, WP_Player, TRUE );
	AP_Cassidy.Controller.Focus = WP_Player;
	ACTION_WaitForPawnRotateToward( AP_Cassidy );

	ACTION_TriggerEvent( 'Event_StartOutroAnims' );
	
	// Enable Trigger which starts outro
	ACTION_TriggerEvent( 'Trigger_PlayerOutro' );

	ACTION_DetachUnitFromSuperUnit( 'Unit_US_Base' );
	ACTION_DetachUnitFromSuperUnit( 'Unit_US_Ass' );

	ACTION_OrderMove( 'Unit_US_Base', 'PN_Outro_Base' );
	ACTION_OrderMove( 'Unit_US_Ass', 'PN_Outro_Ass' );

	// Lock player
	ACTION_DisableBattleDialogue();

	sleep( 3.0 );
	AP_Cassidy.Controller.Focus = WP_Player;
	ACTION_WaitForPawnRotateToward( AP_Cassidy );
}

state PlayerInPosition
{
	function OnTrigger()
	{
		GotoState( 'Dialogue' );
	}

	Begin:

	SLog( "**** State PlayerInPosition ****" );

	// Lock player
	ACTION_HideHUD( WPC_Ref, TRUE );
	ACTION_LockPlayerMovement( WP_Player );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), true ); 

	ACTION_TriggerEvent( 'TS_D09_1500_OutroTeleport' );

	SLog( "**** State Dialogue ****" );

	sleep( 0.2 );
	AP_Cassidy.Controller.Focus = WP_Player;
	ACTION_WaitForPawnRotateToward( AP_Cassidy );
	AP_Cassidy.bNoTurnBody = True;

	ResetAbsoluteTime();
	StartAbsoluteTime();
	i = 1.0;

	// Cassidy: Good job not dying boys, but now you gotta do more.
	ACTION_TriggerEvent( 'Event_CassidyOutroSpeech' );
	WaitForAbsoluteTime( i );

	ACTION_PlayLipSyncSoundDirect( AP_Cassidy, "D09_1500.CASSIDY_B", 1, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("CASSIDY_B1"), 3.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i+=3.0 );

	AP_Doe.ShouldCrouch( TRUE );
	ACTION_DisplaySubTitleMessage2( S_Localize("CASSIDY_B2"), 6.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i+=6.5 );

	ACTION_DisplaySubTitleMessage2( S_Localize("CASSIDY_B3"), 2.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i+=3.75 );

	ACTION_MoveToward( AP_Cassidy, GetNavigationPoint('PN_Outro_Cassidy_Part2'), TRUE );


	if( AP_Paige != None && AP_Paige.Health > 0 )
	{
		if ( AP_Paddock != None && AP_Paddock.Health > 0 && 
			 vSize(AP_Paddock.location - AP_Paige.location) < 512 )
		{
			AP_Paige.Controller.Focus = AP_Paddock;
			StopAbsoluteTime();
			ACTION_WaitForPawnRotateToward( AP_Paddock );
			StartAbsoluteTime();

			// Paige: See... Told ya.
			ACTION_SetLookAtTargetDirect( AP_Paige, AP_Paddock, TRUE );

			ACTION_DisplaySubTitleMessage2( S_Localize("PAIGE_C"), 2.5, 1, 1, 1, TRUE, TRUE );
			i += ACTION_PlayLipSyncSoundDirect( AP_Paige, "D09_1500.PAIGE_C", 1, 1.0, 1.0 );

			// WaitForAbsoluteTime( i += 0.5 );

			AP_Paddock.bDoHeadTurn = TRUE;
			ACTION_SetLookAtTargetDirect( AP_Paddock, AP_Paige, TRUE );
			// AP_Paddock.Controller.Focus = AP_Paige;

			// StopAbsoluteTime();
			// ACTION_WaitForPawnRotateToward( AP_Paddock );
			// StartAbsoluteTime();

			WaitForAbsoluteTime( i += 0.5 );

			// Paddock: Yeah yeah.
			ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_D"), 2.5, 1, 1, 1, TRUE, TRUE );
			i += ACTION_PlayLipSyncSoundDirect( AP_Paddock, "D09_1500.PADDOCK_C", 1, 1.0, 1.0 );
			WaitForAbsoluteTime( i );
		}
	}

	ACTION_TriggerEvent( 'TriggeredScriptMapComplete' );
	
	ScriptEnd:
}
