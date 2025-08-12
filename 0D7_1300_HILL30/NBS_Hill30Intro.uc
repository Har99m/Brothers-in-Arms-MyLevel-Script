//=============================================================================
// NBS_Hill30Intro.
//=============================================================================
class NBS_Hill30Intro extends TriggeredScript
	placeable;

var int Monologue;
var Pawn Baker;
var Actor BakerHill30VO;
var PhysicsVolume WarSoundVolume;

state Triggered
{
	Begin:

	ACTION_SaveMemoryReport( "Hill30_Start" );

	ACTION_StartRain( 1.0 );

	Baker = GetLocalPlayerPawn();
	BakerHill30VO = GetFirstActor( 'Player' );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), true );

	// Map name, date, time
	ACTION_MapIntroTextPos( GetLocalPlayerController(), 50, 350 );
	ACTION_MapIntroText( GetLocalPlayerController(), 1, 2.0 );

	// Monologue
	sleep( 1.0 );
	Monologue = BakerHill30VO.PlayMusic( "D71400.VOICEOVER_A", 0.0, false );

	// Subtitles == This equals the duration of the monologue sound file
	ACTION_DisplaySubtitleMessage2( S_Localize("BAKER_A"), 4.0, 1, 1, 1 );
	sleep( 3.0 );
	ACTION_DisplaySubtitleMessage2( S_Localize("BAKER_B"), 6.0, 1, 1, 1 );
	sleep( 6.0 );
	ACTION_DisplaySubtitleMessage2( S_Localize("BAKER_C"), 3.0, 1, 1, 1 );
	sleep( 3.0 );
	ACTION_DisplaySubtitleMessage2( S_Localize("BAKER_D"), 4.0, 1, 1, 1 );
	sleep( 4.0 );
	ACTION_DisplaySubtitleMessage2( S_Localize("BAKER_E"), 4.0, 1, 1, 1 );
	sleep( 4.0 );
	ACTION_DisplaySubtitleMessage2( S_Localize("BAKER_F"), 4.0, 1, 1, 1 );
	sleep( 6.0 );

	// Stop Monologue
	BakerHill30VO.StopMusic( Monologue, 0.0 );

	// Fade out text and fade into game
	ACTION_MapIntroText( GetLocalPlayerController(), 2, 2.0 );

	ACTION_TriggerEvent( 'NBS_HIll30UberScene' );
	sleep( 3.0 );  //time of full blackout -2
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
	sleep( 1.0 );

	ACTION_SetHidden( 'AP_Locke' , false );
	ACTION_SetHidden( 'AP_Jameson' , false );
	ACTION_SetHidden( 'AP_York' , false );
	ACTION_SetHidden( 'AP_Wheaton' , false );
	ACTION_SetHidden( 'AP_Hooper' , false );
	ACTION_SetHidden( 'AP_Doe' , false );
	ACTION_SetHidden( 'AP_Mac' , false );
	ACTION_SetHidden( 'AP_Leggett' , false );
	ACTION_SetHidden( 'AP_Baker_Hill30' , false );

	ScriptEnd:
}

state PlayerBreak
{
	Begin:

	ACTION_DisablePlayerBreak();
	GotoState( 'Triggered', 'AfterPlayerBreak' );

	ScriptEnd:
}
