//=============================================================================
// TS_D07_1500_IntroScene.
//=============================================================================
class TS_D07_1500_IntroScene extends TriggeredScript
	placeable;

var AnimPawn AP_Baker, AP_Doe, AP_Hooper, AP_Jameson, AP_Browning, AP_Leggett,
			AP_Locke, AP_Mac, AP_Wheaton, AP_York, AP_Leggett_berzerk;
var Actor MyPlayer;
var Pawn ThePlayerPawn;
var bool bNoIntroPlayed;
var Actor MacThompson, BakerPassedOut;

var int AMB_HILL30FIRE;
var float i;
var PhysicsVolume WarSoundVolume;

function PostBeginPlay()
{
	bNoIntroPlayed = True;

	MacThompson = GetFirstActor( 'Mac_Thompson' );
	BakerPassedOut = GetFirstActor( 'Player' );
}

state Triggered
{
	function OnTrigger()
	{
		GotoState( 'Cinematic' );
	}

	Begin:

	ACTION_BlockNavPoints( 'PN_Outro' );
	ACTION_TriggerEvent( 'CSU_IntroGuys' );

	sleep( 0.2 );
	ACTION_TriggerEvent( 'Vol_DontBlowUpTree_Ass' );
	sleep( 0.2 );
	ACTION_TriggerEvent( 'Vol_DontBlowUpTree_Base' );
	sleep( 0.2 );
	ACTION_TriggerEvent( 'Vol_DontBlowUpTree' );		//===== Enable falling tree blocker

	AP_Leggett = AnimPawn( GetPawn( 'AP_Leggett_Intro' ) );
	AP_Locke = AnimPawn (GetPawn( 'AP_Locke_Intro' ) );
	AP_Browning = AnimPawn( GetPawn( 'AP_Browning' ) );
	AP_Jameson = AnimPawn( GetPawn( 'AP_Jameson' ) );
	AP_Wheaton = AnimPawn( GetPawn( 'AP_Wheaton' ) );
	AP_Hooper = AnimPawn( GetPawn( 'AP_Hooper' ) );
	AP_Mac = AnimPawn( Getpawn( 'AP_Mac_Intro' ));
	AP_York = AnimPawn( GetPawn( 'AP_York' ) );
	AP_Doe = AnimPawn( GetPawn( 'AP_Doe' ) );

	AP_Mac.AttachToBone( MacThompson, 'rifle_hold' );

	ACTION_SetHidden( 'AP_Baker_Intro' , false );
	ACTION_SetHiddenDirect( AP_Mac, false );
	ACTION_SetHiddenDirect( AP_Leggett, false );
	ACTION_SetHiddenDirect( AP_Locke, false );
	ACTION_SetHiddenDirect( AP_Jameson, false );
	ACTION_SetHiddenDirect( AP_Wheaton, false );
	ACTION_SetHiddenDirect( AP_Hooper, false );
	ACTION_SetHiddenDirect( AP_York, false );
	ACTION_SetHiddenDirect( AP_Doe, false );

	ThePlayerPawn = GetLocalPlayerPawn();

	if( ThePlayerPawn != None && ThePlayerPawn.Controller != None )
	{
 	    ThePlayerPawn.Controller.bGodmode = true;
	}
	else
	{
		slog( "*****Player doesn't have God mode on!*****" );
	}

	ACTION_SetRepelBullets( 'gbxPlayerPawn', true );
	ACTION_SetRepelBullets( 'Pawn_Friar', true );
	ACTION_SetRepelBullets( 'Pawn_Corrion', true );
	ACTION_SetRepelBullets( 'Pawn_Paddock', true );
	ACTION_SetRepelBullets( 'Pawn_Marsh', true );
	ACTION_SetRepelBullets( 'Pawn_Campbell', true );

	ACTION_TriggerEvent( 'Event_StartIntroAnims' );
	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Squibs' );	//===== Start squibs
	ACTION_TriggerEvent( 'Emitter_TracerHell_L' );		//===== Tracers Left
	ACTION_TriggerEvent( 'Emitter_TracerHell_R' );		//===== Tracers Right
	ACTION_TriggerEvent( 'TS_D07_1500_FakeGermans' );	//===== Mover Germans
	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Dudes' );	//===== Charging Germans
	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Mortars' );	//===== Mortars
	ACTION_TriggerEvent( 'Event_StartJamesonAnims' );	//===== Start Jameson Dead Anim

	ACTION_DisableBattleDialogue();

	ACTION_TriggerEvent( 'Emitter_MG42Smoke' );

	GetLocalPlayerPawn().StartGoingToCrouch( TRUE );
	ACTION_BlockActionKeys( KEY_ACTION_CROUCH  ); 

}

state Cinematic
{
	function OnTrigger()
	{
		GotoState( 'NullState' );
	}

	Begin:

	MyPlayer = GetFirstActor( 'gbxPlayerStart' );

	AMB_HILL30FIRE = MyPlayer.PlayMusic( "D07_1500_SOUNDS.BATTLE_AMBIENT", 1.0,, true );

		ResetAbsoluteTime();
		StartAbsoluteTime();
		i = 3.0;


		WaitForAbsoluteTime( i );

		ACTION_TriggerEvent( 'Event_LeggettIntroTalk' );
		ACTION_PlayLipSyncSoundDirect( AP_Leggett, "D07_1500.LEGGETT_A", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubtitleMessage2(S_Localize("LEGGETT_A" ), 3.0, 1 , 1 , 1 , , TRUE );
		WaitForAbsoluteTime( i+= 3.5 );

		ACTION_TriggerEvent( 'Event_MacIntroTalk' );
		ACTION_PlayLipSyncSoundDirect( AP_Mac, "D07_1500.MAC_A", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubtitleMessage2(S_Localize("MAC_A1" ), 6.0, 1 , 1 , 1 , , TRUE );
		WaitForAbsoluteTime( i+= 6.3 );

		ACTION_DisplaySubtitleMessage2(S_Localize("MAC_A2" ), 4.0, 1 , 1 , 1 , , TRUE );
		WaitForAbsoluteTime( i+= 4.3 );

		ACTION_PlayLipSyncSoundDirect( AP_Leggett, "D07_1500.LEGGETT_B", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubtitleMessage2(S_Localize("LEGGETT_B" ), 3.0, 1 , 1 , 1 , , TRUE );
		WaitForAbsoluteTime( i+= 2.8 );

		ACTION_PlayLipSyncSoundDirect( AP_Mac, "D07_1500.MAC_B", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubtitleMessage2(S_Localize("MAC_B" ), 3.0, 1 , 1 , 1 , , TRUE );
		WaitForAbsoluteTime( i+= 3.5 );

	// End Scene, start map
	ACTION_TriggerEvent( 'TriggeredScriptIntro' );

	ACTION_UnBlockActionKeys( KEY_ACTION_CROUCH  );
	GetLocalPlayerPawn().ForceUnCrouch(); 

	// Turn on first Waypoint
	ACTION_TriggerEvent( 'Beacon_Road' );
	ACTION_TriggerEvent( 'Beacon_BeforeRoad' );

	ThePlayerPawn.Controller.bGodmode = false;
	bNoIntroPlayed = False;

	ACTION_AttachUnitToSuperUnit( 'Unit_US_Base', 'Unit_Player' );
	ACTION_AttachUnitToSuperUnit( 'Unit_US_Ass', 'Unit_Player' );

	sleep( 0.2 );

	ACTION_OrderMove( 'Unit_US_Base', 'PN_MoveBaseHere' );
	ACTION_OrderMove( 'Unit_US_Ass', 'PN_MoveAssHere' );

	sleep( 2.0 );

	ACTION_DisplayObjectiveHint( S_Localize("HINT_D" ), 4.0 );

	ACTION_WaitForEvent( 'Event_PlayerAwayFromHill30' );

	MyPlayer.StopMusic( AMB_HILL30FIRE, 5.0 );

}

state NullState
{
	function OnTrigger()
	{
		GotoState( 'NullState' );
	}
	Begin:
}
