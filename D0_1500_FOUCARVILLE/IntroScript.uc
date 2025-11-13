//=============================================================================
// IntroScript.
//=============================================================================
class IntroScript extends TriggeredScript
	placeable;

var Pawn Baker, Hartsock, Garnett, Allen;
var Actor MyPlayer, DeadTrooper;
var int Monologue, MonologueMusic;

state Triggered
{
Begin:

	ACTION_SaveMemoryReport( "foucarville_start" );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_BlockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_LOOK );

//	ACTION_EnablePlayerBreak();

	ACTION_BlockNavPoints( 'PN_Fence_Road' );
	ACTION_BlockNavPoints( 'PN_Fence_Field' );

	//Spawn Squad and start their idles
	ACTION_TriggerEvent( 'SpawnUSSquad' );
	ACTION_TriggerEvent( 'TS_Hartsock' );
	ACTION_TriggerEvent( 'TS_Garnett' );
	ACTION_TriggerEvent( 'TS_Allen' );

	//	Map name, date, time
	ACTION_MapIntroTextPos( GetLocalPlayerController(), 50, 350 );
	ACTION_MapIntroText( GetLocalPlayerController(), 1, 2.0 );

	//	Monologue
	MyPlayer = GetFirstActor('Player');
//	Monologue = Action_PlaySoundReturnHandle('Player', "D01500.VOICEOVER_A", 1.0, 1.0, 10000);
	MonologueMusic = MyPlayer.PlayMusic( "Music.D01500_VO", 0.0 );
	sleep(2.8);
	Monologue = MyPlayer.PlayMusic( "D01500.VOICEOVER_A", 0.0, false );
//	sleep(2.5);

	ACTION_DisplaySubtitleMessage2(S_Localize("VOICEOVER_A", "D0_1500_FOUCARVILLE" ), 7.5, 1 , 1 , 1 , , TRUE );
	sleep(8.0);
	ACTION_DisplaySubtitleMessage2(S_Localize("VOICEOVER_B", "D0_1500_FOUCARVILLE" ), 4.5, 1 , 1 , 1 , , TRUE );
	sleep(3.5);
	ACTION_DisplaySubtitleMessage2(S_Localize("VOICEOVER_C", "D0_1500_FOUCARVILLE" ), 4.5, 1 , 1 , 1 , , TRUE );
	sleep(4.25);
	ACTION_DisplaySubtitleMessage2(S_Localize("VOICEOVER_D", "D0_1500_FOUCARVILLE" ), 4.0, 1 , 1 , 1 , , TRUE );
	sleep(4.25);
	ACTION_DisplaySubtitleMessage2(S_Localize("VOICEOVER_E", "D0_1500_FOUCARVILLE" ), 3.5, 1 , 1 , 1 , , TRUE );
	sleep(4.0);

	// Disable player break
//	ACTION_DisablePlayerBreak();

Startup:
	//	Stop Monologue
	MyPlayer.StopMusic(Monologue, 1.5);  // stop sound by fading out over 1.5 seconds;
	MyPlayer.StopMusic(MonologueMusic, 1.5);  // stop sound by fading out over 1.5 seconds;
//	Action_StopSound ('Player', Monologue, 1.5);

	//	Fade out text and fade into game
	ACTION_MapIntroText( GetLocalPlayerController(), 2, 2.0 );
	sleep( 2.0 );
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
	ACTION_HideHUD( GetLocalPlayerController(), true );
	ACTION_UnblockActionKeys( -1 );
//	ACTION_PlaySoundReturnHandle( 'Player', "D01500_SOUNDS.WIND_DISTANTBATTLE", 1.0, 1.0, 10000);

//=============================================================================
//	FOUCARVILLE INTRO SCENE
//=============================================================================
	ACTION_SetHidden( 'fencedestroyed' , true );

	Baker = GetLocalPlayerPawn();
	Hartsock = GetPawn( 'Hartsock' );
	Allen = GetPawn( 'Allen' );
	Garnett = GetPawn( 'Garnett' );
	DeadTrooper = GetFirstActor( 'DeadTrooper' );

	sleep( 0.2 );
	ACTION_SetLookAtTarget( 'Hartsock', DeadTrooper, true );
	sleep( 0.2 );
	ACTION_SetLookAtTarget( 'Allen', DeadTrooper, true );
	sleep( 0.2 );
	ACTION_SetLookAtTarget( 'Garnett', DeadTrooper, true );
	sleep( 1.0 );

HaGSCene:

//---GARNETT: What do you suppose killed him.
	ACTION_TriggerEvent( 'GarnettIn' );
	ACTION_WaitForEvent( 'GarnettOut' );
	sleep( 0.4 );
	ACTION_SetLookAtTarget( 'Hartsock', Garnett, true );

	ACTION_TriggerEvent( 'CrowScript' );
//---ALLEN: Wasn't old age, I know that.
	ACTION_WaitForEvent( 'GarnettOut' );
	ACTION_TriggerEvent( 'AllenIn' );
	ACTION_SetLookAtTarget( 'Allen', Garnett, true );
	sleep( 0.2 );
	ACTION_SetLookAtTarget( 'Hartsock', Allen, true );
	sleep( 0.2 );
	ACTION_SetLookAtTarget( 'Garnett', Allen, true );

//---GARNETT: They wouldn't just leave him here,
	ACTION_WaitForEvent( 'AllenOut' );
	ACTION_TriggerEvent( 'GarnettIn' );
	ACTION_SetLookAtTarget( 'Garnett', Hartsock, true );
	sleep( 0.75 );
	ACTION_SetLookAtTarget( 'Allen', Hartsock, true );
	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Hartsock', Garnett, true );
	sleep( 1.25 );
	ACTION_SetLookAtTarget( 'Garnett', DeadTrooper, true );

//---HARTSOCK: I think we have to assume for the time being
	ACTION_WaitForEvent( 'GarnettOut' );
	ACTION_TriggerEvent( 'HartsockIn' );
	ACTION_SetLookAtTarget( 'Hartsock', Garnett, true );
	sleep( 1.0 );
	ACTION_SetLookAtTarget( 'Allen', DeadTrooper, true );
	sleep( 1.0 );
	ACTION_SetLookAtTarget( 'Hartsock', Baker, true );

//---ALLEN: Red, you're ruining my good mood.
	ACTION_WaitForEvent( 'HartsockOut' );
	ACTION_TriggerEvent( 'AllenIn' );
	ACTION_SetLookAtTarget( 'Allen', Hartsock, true );
	sleep( 0.4 );
	ACTION_SetLookAtTarget( 'Hartsock', Allen, true );	
	sleep( 0.35 );
	ACTION_SetLookAtTarget( 'Garnett', Hartsock, true );
	sleep( 0.45 );
	ACTION_SetLookAtTarget( 'Allen', Baker, true );

//---HARTSOCK: Whats's the Plan baker?
	ACTION_WaitForEvent( 'AllenOut' );
	ACTION_TriggerEvent( 'HartsockIn' );
	ACTION_SetLookAtTarget( 'Hartsock', Baker, true );
	sleep( 0.65 );
	ACTION_SetLookAtTarget( 'Allen', Baker, false );
	ACTION_SetLookAtTarget( 'Garnett', Hartsock, false );
	ACTION_WaitForEvent( 'HartsockOut' );

AfterIntro:
	ACTION_HideHUD( GetLocalPlayerController(), false );
	sleep( 0.2 );
	ACTION_TriggerEvent( 'HartsockIn' );
	sleep( 0.4 );
	ACTION_TriggerEvent( 'AllenIn' );
	sleep( 0.3 );
	ACTION_TriggerEvent( 'GarnettIn' );
	sleep( 0.2 );

	ACTION_TriggerEvent( 'SpawnGermanSquad01c' );
	sleep( 0.2 );
	ACTION_SaveMemoryReport( "foucarville_intro_before" );
	ACTION_CheckPointSave( 1 );
	ACTION_SaveMemoryReport( "foucarville_intro_after" );

	ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), false );
	sleep( 4.0 );
	// Display Objectives
	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList_FV' );
	ACTION_DisplayObjective( 0, 'ObjectiveList_FV', 4.0 );
	ACTION_SetObjectiveBeaconState( 'Waypoint_ChurchArea', true, false, true );
	ACTION_TriggerEvent( 'Waypoint_ChurchArea' );

ScriptEnd:
}

state PlayerBreak
{
Begin:
	// Disable player break
	ACTION_DisablePlayerBreak();

	// Resume script
	GotoState( 'Triggered', 'Startup' );
}
