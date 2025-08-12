//=============================================================================
// NBS_LoadCredits.
//=============================================================================
class NBS_LoadCredits extends TriggeredScript
	placeable;

var Actor MyPlayer;
var int CreditsMusic;
var NBS_Hill30UberScene Hill30Uber_Ref;
var PhysicsVolume WarSoundVolume;

state Triggered
{
	Begin:

	ACTION_StopRain();

	MyPlayer = GetFirstActor( 'Player' );
	Hill30Uber_Ref = NBS_Hill30UberScene( GetFirstActor( 'NBS_Hill30UberScene' ) );

	CreditsMusic = MyPlayer.PlayMusic( "music.credits", 0.0);	

	// Turn off war sounds
	WarSoundVolume = PhysicsVolume( GetFirstActor( 'WarSounds' ) );

	if( WarSoundVolume != None )
	{
		WarSoundVolume.StopCurrentStereoAmbientSound();
		WarSoundVolume.AmbientSound = None;
	}
	else
	{
		slog( "*****Bullet sounds are still playing!*****" );
	}

	WarSoundVolume.AmbientSound = None;

	// Destroy Hill30 stuff
	ACTION_DestroyActor( 'Tankie' );
	ACTION_DestroyActor( 'AP_Mac_End' );
	ACTION_DestroyActor( 'StaticDude01' );
	ACTION_DestroyActor( 'StaticDude02' );
	ACTION_DestroyActor( 'StaticDude03' );
	ACTION_DestroyActor( 'StaticDude04' );
	ACTION_DestroyActor( 'StaticDude05' );
	ACTION_DestroyActor( 'StaticDude06' );
	ACTION_DestroyActor( 'StaticDude07' );

	ACTION_DestroyActor( 'AP_Locke' );
	ACTION_DestroyActor( 'AP_Jameson' );
	ACTION_DestroyActor( 'AP_York' );
	ACTION_DestroyActor( 'AP_Wheaton' );
	ACTION_DestroyActor( 'AP_Hooper' );
	ACTION_DestroyActor( 'AP_Leggett' );
	ACTION_DestroyActor( 'AP_Mac' );
	ACTION_DestroyActor( 'AP_Doe' );
	ACTION_DestroyActor( 'AP_Leggett_berzerk' );
	ACTION_DestroyActor( 'AP_Doe' );

	if( Hill30Uber_Ref.bIsHill30 )
	{

		ACTION_DisableBattleDialogue();
		ACTION_HideHud( GetLocalPlayerController(), TRUE );
		ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );
		ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

		ACTION_SetSaturationEffect( 255 );
		ACTION_ChangePlayerFOV( 76, 76 );	

		ACTION_FadeOverlay( GetLocalPlayerController(), 1, 0.2 );
		ACTION_TriggerEvent( 'titles_final' );

		///Ubisoft Entertainment Presents...

		sleep (1.0);
		ACTION_ChangeMapIntroText (GetLocalPlayerController(), S_Localize("NEWTITLE_A", "0D7_1300_HILL30"), "", "", true);
		ACTION_MapIntroText( GetLocalPlayerController(), 1, 3.0 );
		sleep (3.0);
		ACTION_MapIntroText( GetLocalPlayerController(), 2, 3.0 );
		sleep (3.0);
		sleep (1.0);

		///A Gearbox Software Production of...

		sleep (1.0);
		ACTION_ChangeMapIntroText (GetLocalPlayerController(), S_Localize("NEWTITLE_B", "0D7_1300_HILL30"), "", "", true);
		ACTION_MapIntroText( GetLocalPlayerController(), 1, 3.0 );
		sleep (3.0);
		ACTION_MapIntroText( GetLocalPlayerController(), 2, 3.0 );
		sleep (3.0);
		sleep (1.0);

		///Brothers in Arms

		sleep (1.0);
		ACTION_ChangeMapIntroText (GetLocalPlayerController(), S_Localize("NEWTITLE_C", "0D7_1300_HILL30"), "", "", true);
		ACTION_MapIntroText( GetLocalPlayerController(), 1, 3.0 );
		sleep (3.0);
		ACTION_MapIntroText( GetLocalPlayerController(), 2, 3.0 );
		sleep (3.0);
		sleep (1.0);

		///single Baker and autographed picture

		ACTION_FadeOverlay( GetLocalPlayerController(), 2, 2.0 );
		sleep (2.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_01', , , 2, 1.0, , , 1, -1);
		sleep (4.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_01', , , 1, 1.0, , , 1, -1);
		sleep (1.0);
		sleep (1.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_02', , , 2, 1.0, , , -1, 1);
		sleep (4.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_02', , , 1, 1.0, , , -1, 1);
		sleep (1.0);
		ACTION_FadeOverlay( GetLocalPlayerController(), 1, 1.5 );
		sleep (2.0);

		///jeep

		ACTION_FadeOverlay( GetLocalPlayerController(), 2, 2.0 );
		sleep (2.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_03', , , 2, 1.0, , , -1, 1);
		sleep (3.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_03', , , 1, 1.0, , , -1, 1);
		sleep (1.0);
		ACTION_FadeOverlay( GetLocalPlayerController(), 1, 1.5 );
		sleep (2.0);

		///flight school document

		ACTION_FadeOverlay( GetLocalPlayerController(), 2, 2.0 );
		sleep (2.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_04', , , 2, 1.0, , , -1, -1);
		sleep (4.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_04', , , 1, 1.0, , , -1, -1);
		sleep (1.0);
		ACTION_FadeOverlay( GetLocalPlayerController(), 1, 1.5 );
		sleep (2.0);

		///Mac, Baker, Leggett pose

		ACTION_FadeOverlay( GetLocalPlayerController(), 2, 2.0 );
		sleep (1.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_05', , , 2, 1.0, , , -1, 1);
		sleep (2.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_05', , , 1, 1.0, , , -1, 1);
		sleep (1.0);
		ACTION_FadeOverlay( GetLocalPlayerController(), 1, 1.5 );
		sleep (2.0);	// Was 1.0

		///5 guys and poker shot

		ACTION_FadeOverlay( GetLocalPlayerController(), 2, 2.0 );
		sleep (2.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_06', , , 2, 1.0, , , 1, 1);
		sleep (4.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_06', , , 1, 1.0, , , 1, 1);
		sleep (1.0);	// Was 1.0
		sleep (2.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_07', , , 2, 1.0, , , 1, -1);
		sleep (4.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_07', , , 1, 1.0, , , 1, -1);
		sleep (1.0);
		ACTION_FadeOverlay( GetLocalPlayerController(), 1, 1.5 );
		sleep (2.0);

		///Dwight letter and photo

		ACTION_FadeOverlay( GetLocalPlayerController(), 2, 2.0 );
		sleep (2.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_08', , , 2, 1.0, , , 1, 1);
		sleep (3.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_08', , , 1, 1.0, , , 1, 1);
		sleep (1.0);
		ACTION_FadeOverlay( GetLocalPlayerController(), 1, 1.5 );
		sleep (2.0);

		///France guide and photos

		ACTION_FadeOverlay( GetLocalPlayerController(), 2, 2.0 );
		sleep (2.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_09', , , 2, 1.0, , , -1, 1);
		sleep (4.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_09', , , 1, 1.0, , , -1, 1);
		sleep (1.0);
		ACTION_FadeOverlay( GetLocalPlayerController(), 1, 1.5 );
		sleep (2.0);

		///group shot in front of airplane

		ACTION_FadeOverlay( GetLocalPlayerController(), 2, 2.0 );
		sleep (2.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_10', , , 2, 1.0, , , -1, 1);
		sleep (3.0);
		ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_credits.titles.credits_10', , , 1, 1.0, , , -1, 1);
		sleep (1.0);
		ACTION_FadeOverlay( GetLocalPlayerController(), 1, 3.0 );
		MyPlayer.StopMusic( CreditsMusic, 2.0);
		sleep (3.0);

		ACTION_DisplayMapStats();

	}
}
