//=============================================================================
// DD_EndField2Script.
//=============================================================================
class DD_EndField2Script extends TriggeredScript
	placeable;

var WarGamePawn WGP_Player;
var Pawn Pawn_Doe, Pawn_Hartsock;
var float i;

function DestroyAllGrenades()
{
	local gbxGrenade A;

	foreach AllActors( class'gbxGrenade', A )
		A.Destroy();
}

state Triggered
{
	function OnTrigger()
	{
		Log( name $ "<" $ GetStateName() $ ">.OnTrigger() called.", 'TriggeredScript' );
		GotoState( 'Outro_Start' );
	}

	Begin:

	WGP_Player = GetLocalPlayerPawn();

	// Triggered from Counter
	// SLog( "Message trigger to end situational" );
	ACTION_TriggerEvent( 'Trigger_Objective02' );

	// ACTION_SetObjectiveStatus( 1, OI_Complete, 'ObjectiveList' );
	// ACTION_DisplayObjective( 1, 'ObjectiveList', 6.0 );

	// Send all Germans alive running
	ACTION_TriggerEvent( 'DD_RunGermans06' );
	ACTION_TriggerEvent( 'DD_RunGermans07' );
	ACTION_TriggerEvent( 'DD_RunGermans08' );
	ACTION_TriggerEvent( 'DD_RunGermans09' );
	ACTION_TriggerEvent( 'DD_RunGermans10' );
	ACTION_TriggerEvent( 'DD_RunGermans11' );

	ScriptEnd:
}


// Triggered by DD_GliderLandingScript02
state Outro_Start
{
	function OnTrigger()
	{
		Log( name $ "<" $ GetStateName() $ ">.OnTrigger() called.", 'TriggeredScript' );
		GotoState( 'Outro' );
	}

	Begin:

	Pawn_Doe = GetPawn( 'Pawn_Doe03' );
	ACTION_SetAnimSet( 'Pawn_Doe03', "a_ev_all.a_ev_corrion" );
	AnimPawn(Pawn_Doe).AddExtendedAttachment( 'googles', 'googles' );

	sleep( 2.5 );
	Mover( GetFirstActor('Mover_Glider02') ).PlayerBumpEvent = 'None';
	// SLog( "**** PLAYER BUMP EVENT OFF ****" );

	ACTION_BlockNavPoints( 'PN_OutroDisable' );

	// Turn on waypoint & trigger for outro
	sleep( 5.5 );
	ACTION_TriggerEvent( 'Waypoint_Outro' );

	ACTION_DisplayObjectiveHint( S_Localize( "DD_ENDFIELD2SCRIPT_A" ), 6.0 );

	ACTION_TriggerEvent( 'Trigger_Outro' );

	ScriptEnd:
}

// Triggered by Trigger_Outro
state Outro
{
	Begin:

	GetLocalPlayerController().bGodMode = TRUE;
	ACTION_EnablePlayerHeavyTrauma( FALSE );
	DestroyAllGrenades();

	// Lock Player Movement
	ACTION_DisableBattleDialogue();
	ACTION_HideHUD( GetLocalPlayerController(), TRUE );
	ACTION_BlockActionKeys( -1 );
	ACTION_UnblockActionKeys( KEY_ACTION_SHOW_MENU + KEY_ACTION_LOOK );
	ACTION_LockPlayerMovement( WGP_Player );

	// Move squad into position
	ACTION_OrderFallOut( 'Unit01' );
	ACTION_OrderMove( 'Unit01', 'PN_SquadOutro' );


	// Start Matinee
	ACTION_TriggerEvent( 'SM_Outro' );

	Pawn_Doe.SetRelativeLocation( vect(124.0, 93.0, 69.0) );

	// Start Glass's Animations
	ACTION_FlushAnimQueue( 'Pawn_Doe03' );
	ACTION_PlayAnimDirect( Pawn_Doe, 'pilot_stumbles_to_door', 0.1, 1.0, FALSE );

	// Teleport player to outro position
	ACTION_TeleportPlayerToActor( 'LookTarget_Teleport' );

	sleep( 5.4 );
	Pawn_Doe.SetRelativeLocation( vect(134.0, 93.0, 73.0) );

	ACTION_WaitForAnimEnd( Pawn_Doe, 0 );
	Pawn_Doe.SetPhysics( PHYS_None );

	ACTION_PlayAnimDirect( Pawn_Doe, 'pilot_stumbles_down_stairs', 0.1, 1.0, FALSE );
	ACTION_TriggerEvent( 'DD_Outro_Glass' );

	sleep( 3.0 );

	// Setup Timer
	i = 0.0;
	ResetAbsoluteTime();
	StartAbsoluteTime();

	// ==========================================================================================
	// Glass talks: Man, I thought I was a goner!
	// ==========================================================================================
	i += ACTION_PlayLipSyncSound( 'Pawn_Doe03', "D02000.GLASS_A", 1.0, 1.0, 160.0, TRUE ) + 0.5;
	ACTION_DisplaySubtitleMessage2( S_Localize( "GLASS_A" ), 2.3, 1, 1, 1, TRUE, TRUE );

	// ==========================================================================================
	// Glass talks: Thanks for taking those things down - I figured I'd get skewered for sure!
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Doe03', "D02000.GLASS_B", 1.0, 1.0, 160.0, TRUE ) + 0.5;
	ACTION_DisplaySubtitleMessage2( S_Localize( "GLASS_B" ), 3.3, 1, 1, 1, TRUE, TRUE );

	// ==========================================================================================
	// Glass animates to pull out a cigarette
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += 4.5;

	ACTION_TriggerEvent( 'DD_Outro_Glass' );

	Pawn_Hartsock = GetPawn( 'Pawn_Hartsock' );

	if ( Pawn_Hartsock != None )
	{
		ACTION_ChangeController( 'Pawn_Hartsock', class'ScriptedController' );
		ACTION_Walk( 'Pawn_Hartsock' );
		ACTION_MoveToward( Pawn_Hartsock, GetNavigationPoint('PN_Hartsock'), TRUE );
		WargamePawn( Pawn_Hartsock ).SetWeaponAimedState( WAS_CombatRelaxed );
	}

	// ==========================================================================================
	// Glass talks: Hey, you're with 502nd, right?
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Doe03', "D02000.GLASS_C", 1.0, 1.0, 160.0, TRUE ) + 1.0;
	ACTION_DisplaySubtitleMessage2( S_Localize( "GLASS_C" ), 2.3, 1, 1, 1, TRUE, TRUE );

	if ( Pawn_Hartsock != None )
	{
		ACTION_HeadLookAt( Pawn_Hartsock, TRUE );
		ACTION_SetLookAtTarget( 'Pawn_Hartsock', GetLocalPlayerPawn(), TRUE );
		Pawn_Hartsock.Controller.Focus = Pawn_Doe;
	}

	// ==========================================================================================
	// Glass talks: I'm supposed to re-supply you guys.
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Doe03', "D02000.GLASS_D", 1.0, 1.0, 160.0, TRUE ) + 0.5;
	ACTION_DisplaySubtitleMessage2( S_Localize( "GLASS_D" ), 2.8, 1, 1, 1, TRUE, TRUE );

	// ==========================================================================================
	// Glass talks: I got plenty of ammo inside - take whatever you need.
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Doe03', "D02000.GLASS_E", 1.0, 1.0, 160.0, TRUE ) + 2.0;
	ACTION_DisplaySubtitleMessage2( S_Localize( "GLASS_E" ), 3.3, 1, 1, 1, TRUE, TRUE );

	if ( Pawn_Hartsock != None )
		ACTION_SetLookAtTarget( 'Pawn_Hartsock', Pawn_Doe, TRUE );

	WaitForAbsoluteTime( i );
	StopAbsoluteTime();

	ACTION_FadeOverlay( GetLocalPlayerController(), 1, 4.0 );

	sleep( 4.0 );
	ACTION_DisplayMapStats();
	ACTION_SaveMemoryReport( "rommels_end" );

	ScriptEnd:
}

state DeadPlayer
{
	Begin:

	// This is a fail safe in case the player dies as the outro begins

	ScriptEnd:
}
