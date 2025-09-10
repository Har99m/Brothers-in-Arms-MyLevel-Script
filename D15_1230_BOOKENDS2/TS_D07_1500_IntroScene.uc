//=============================================================================
// TS_D07_1500_IntroScene.
//=============================================================================
class TS_D07_1500_IntroScene extends TriggeredScript
	placeable;

var AnimPawn AP_Baker, AP_Doe, AP_Hooper, AP_Jameson, AP_Browning, AP_Leggett,
			AP_Locke, AP_Mac, AP_Wheaton, AP_York, AP_Leggett_berzerk;

var Pawn ThePlayerPawn;

var bool bStopChargingDudes, bStopSquibs, bHideStaticGermans, bNoIntroPlayed;
var bool bPlayIntro;

var Actor MacThompson, BakerPassedOut;

var int PassedOutSounds;
var float i;
var PhysicsVolume WarSoundVolume;

function PostBeginPlay()
{

	bHideStaticGermans = False;
	bStopChargingDudes = False;
	bStopSquibs = false;
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

	//----- Debug: Turns intro scene on and off
	bPlayIntro = True;

	ACTION_BlockNavPoints( 'PN_Outro' );
	ACTION_TriggerEvent( 'CSU_IntroGuys' );

	AP_Leggett = AnimPawn( GetPawn( 'AP_Leggett_Intro' ) );
	AP_Locke = AnimPawn (GetPawn( 'AP_Locke_Intro' ) );
	AP_Browning = AnimPawn( GetPawn( 'AP_Browning' ) );
	AP_Jameson = AnimPawn( GetPawn( 'AP_Jameson' ) );
	AP_Wheaton = AnimPawn( GetPawn( 'AP_Wheaton' ) );
	AP_Hooper = AnimPawn( GetPawn( 'AP_Hooper' ) );
	AP_Mac = AnimPawn( Getpawn( 'AP_Mac_Intro' ));
	AP_York = AnimPawn( GetPawn( 'AP_York' ) );
	AP_Doe = AnimPawn( GetPawn( 'AP_Doe' ) );

//	ACTION_TriggerEvent( 'TS_NewIntro' );

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

	ACTION_TriggerEvent( 'Event_StartIntroAnims' );
	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Squibs' );	//===== Start squibs
	ACTION_TriggerEvent( 'Emitter_TracerHell' );		//===== Tracers
	ACTION_TriggerEvent( 'TS_D07_1500_FakeGermans' );	//===== Mover Germans
	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Dudes' );	//===== Charging Germans

	ACTION_DisableBattleDialogue();

}

state Cinematic
{
	function OnTrigger()
	{
		GotoState( 'IntroCleanup' );
	}
	Begin:

//	if ( bPlayIntro )
//	{

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

//	}

	// End Scene, start map
	ACTION_TriggerEvent( 'TriggeredScriptIntro' );

	// Turn on first Waypoint
	ACTION_TriggerEvent( 'Beacon_Road' );

	ThePlayerPawn.Controller.bGodmode = false;
	ACTION_SetRepelBullets( 'gbxPlayerPawn', false );
	bNoIntroPlayed = False;

}


state IntroCleanup
{
	function OnTrigger()
	{
		GotoState( 'FinishIntroCleanup' );
	}
Begin:

//	bHideStaticGermans = True;
	bStopChargingDudes = True;
	bStopSquibs = True;
	
	ACTION_KillPawn( 'Hill30Squad01Dude01',,, 'Pawn_Corrion' );
	ACTION_KillPawn( 'Hill30Squad01Dude02',,, 'Pawn_Corrion' );
	ACTION_KillPawn( 'Hill30Squad02Dude01',,, 'Pawn_Corrion' );
	ACTION_KillPawn( 'Hill30Squad02Dude02',,, 'Pawn_Corrion' );

	ACTION_TriggerEvent( 'BV_IntroPath' );		//---Prevent Player From Back Tracking

}

state FinishIntroCleanup
{
	function OnTrigger()
	{
		GotoState( 'NullState' );
	}
Begin:

	bHideStaticGermans = True;
	ACTION_TriggerEvent( 'Emitter_TracerHell' );
	ACTION_TriggerEvent( 'Event_StopIntroAnims' );
	ACTION_SetHidden( 'AP_Mac_Intro' , true );
	ACTION_SetHidden( 'AP_Baker_Intro' , true );
	ACTION_SetHidden( 'AP_Leggett_Intro' , true );
	ACTION_SetHidden( 'AP_Jameson' , true );
	ACTION_SetHidden( 'AP_Browning' , true );
	ACTION_SetHidden( 'AP_Wheaton' , true );
	ACTION_SetHidden( 'AP_Hooper' , true );
	ACTION_SetHidden( 'AP_Locke' , true );
	ACTION_SetHidden( 'AP_York' , true );
	ACTION_SetHidden( 'AP_Doe' , true );
	ACTION_DestroyActor( 'AP_Leggett_berzerk' );
	ACTION_DestroyActor( 'SS_Leggett_berzerk' );
	ACTION_DestroyActor( 'AP_Leggett_Intro' );
	ACTION_DestroyActor( 'SS_Leggett_Intro' );
	ACTION_DestroyActor( 'AP_Baker_Intro' );
	ACTION_DestroyActor( 'SS_Baker_Intro' );
	ACTION_DestroyActor( 'AP_Locke_Intro' );
	ACTION_DestroyActor( 'SS_Locke_Intro' );
	ACTION_TriggerEvent( 'TSCheckpointSave_02' );
}

state NullState
{
	function OnTrigger()
	{
		GotoState( 'NullState' );
	}
	Begin:
}
