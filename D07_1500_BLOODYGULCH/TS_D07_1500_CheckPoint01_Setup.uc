//=============================================================================
// TS_D07_1500_CheckPoint01_Setup.
//=============================================================================
class TS_D07_1500_CheckPoint01_Setup extends TriggeredScript
	placeable;

var AnimPawn AP_Baker, AP_Doe, AP_Hooper, AP_Jameson, AP_Browning, AP_Leggett,
			AP_Locke, AP_Mac, AP_Wheaton, AP_York;

var Actor MacThompson;
var bool bCheckpointLoaded;
var Actor MyPlayer;
var int AMB_HILL30FIRE;

state default
{
    Begin:

    bCheckpointLoaded = false;

}

state Triggered
{
	Begin:

	MyPlayer = GetFirstActor( 'gbxPlayerStart' );
	AMB_HILL30FIRE = MyPlayer.PlayMusic( "D07_1500_SOUNDS.BATTLE_AMBIENT", 1.0,, true );

/*	sleep( 0.2 );
	ACTION_TriggerEvent( 'Vol_DontBlowUpTree_Ass' );
	sleep( 0.2 );
	ACTION_TriggerEvent( 'Vol_DontBlowUpTree_Base' );
	sleep( 0.2 );
	ACTION_TriggerEvent( 'Vol_DontBlowUpTree' );		//===== Enable falling tree blocker
*/
    bCheckpointLoaded = true;

/*	AP_Leggett = AnimPawn( GetPawn( 'AP_Leggett_Intro' ) );
	AP_Locke = AnimPawn (GetPawn( 'AP_Locke_Intro' ) );
	AP_Browning = AnimPawn( GetPawn( 'AP_Browning' ) );
	AP_Jameson = AnimPawn( GetPawn( 'AP_Jameson' ) );
	AP_Wheaton = AnimPawn( GetPawn( 'AP_Wheaton' ) );
	AP_Hooper = AnimPawn( GetPawn( 'AP_Hooper' ) );
	AP_Mac = AnimPawn( Getpawn( 'AP_Mac_Intro' ));
	AP_York = AnimPawn( GetPawn( 'AP_York' ) );
	AP_Doe = AnimPawn( GetPawn( 'AP_Doe' ) );

	AP_Mac.AttachToBone( MacThompson, 'rifle_hold' );

	ACTION_SetHidden( 'AP_Mac_Intro' , false );
	ACTION_SetHidden( 'AP_Baker_Intro' , false );
	ACTION_SetHidden( 'AP_Leggett_Intro' , false );
	ACTION_SetHidden( 'AP_Locke_Intro' , false );
	ACTION_SetHidden( 'AP_Jameson' , false );
	ACTION_SetHidden( 'AP_Wheaton' , false );
	ACTION_SetHidden( 'AP_Hooper' , false );
	ACTION_SetHidden( 'AP_York' , false );
	ACTION_SetHidden( 'AP_Doe' , false );

	ACTION_ChangeScriptedSequenceDirect( AP_Leggett, 'SS_Leggett_CP1' );
	ACTION_ChangeScriptedSequenceDirect( AP_Mac, 'SS_Mac_CP1' );

	ACTION_TriggerEvent( 'Event_StartIntroAnims' );
	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Squibs' );	//===== Start squibs
	ACTION_TriggerEvent( 'Emitter_TracerHell_L' );		//===== Tracers Left
	ACTION_TriggerEvent( 'Emitter_TracerHell_R' );		//===== Tracers Right
	ACTION_TriggerEvent( 'TS_D07_1500_FakeGermans' );	//===== Mover Germans
	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Dudes' );	//===== Charging Germans
	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Mortars' );	//===== Mortars
	ACTION_TriggerEvent( 'Event_StartJamesonAnims' );	//===== Start Jameson Dead Anim

	ACTION_SetRepelBullets( 'gbxPlayerPawn', true );
	ACTION_SetRepelBullets( 'Pawn_Friar', true );
	ACTION_SetRepelBullets( 'Pawn_Corrion', true );
	ACTION_SetRepelBullets( 'Pawn_Paddock', true );
	ACTION_SetRepelBullets( 'Pawn_Marsh', true );
	ACTION_SetRepelBullets( 'Pawn_Campbell', true );
*/
	// Turn on first Waypoint
	ACTION_TriggerEvent( 'Beacon_Road' );
	ACTION_TriggerEvent( 'Beacon_BeforeRoad' );

	ACTION_AttachUnitToSuperUnit( 'Unit_US_Base', 'Unit_Player' );
	ACTION_AttachUnitToSuperUnit( 'Unit_US_Ass', 'Unit_Player' );

	sleep( 0.2 );

//	ACTION_OrderMove( 'Unit_US_Base', 'PN_MoveBaseHere' );
//	ACTION_OrderMove( 'Unit_US_Ass', 'PN_MoveAssHere' );

	sleep( 2.0 );

//	ACTION_DisplayObjectiveHint( S_Localize("HINT_D" ), 4.0 );

	ACTION_WaitForEvent( 'Event_PlayerAwayFromHill30' );

	MyPlayer.StopMusic( AMB_HILL30FIRE, 5.0 );

	ScriptEnd:
}
