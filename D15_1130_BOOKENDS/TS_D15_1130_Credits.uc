//=============================================================================
// TS_D15_1130_Credits.
//=============================================================================
class TS_D15_1130_Credits extends TriggeredScript
	placeable;

var int C47_FLAK_HEAVY , C47_MUZZA , BARN_AMB, LT_Garnett, C47_DAMAGED;
var Actor MyPlayer;
var int CreditsMusic;
var PhysicsVolume WarSoundVolume;

state Triggered
{
	Begin:

	ACTION_StopRain();

	ACTION_DisableBattleDialogue();
	ACTION_HideHud( GetLocalPlayerController(), TRUE );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

	MyPlayer = GetFirstActor( 'gbxPlayerStart' );
	CreditsMusic =  MyPlayer.PlayMusic( "D15_1130_SOUNDS.INTRO_MUSIC", 2.0,, false );


	///Ubisoft Entertainment Presents...

	sleep( 4.5 );
	ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_eib_credits.full.cred_01_ubi', , , 2, 2.0, 640, 480 );
	sleep( 7.0 );
	ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_eib_credits.full.cred_01_ubi', , , 1, 2.0, 640, 480 );
	sleep( 3.0 );

	///A Gearbox Software Production of...
	sleep( 2.0 );
	ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_eib_credits.full.cred_02_gbx', , , 2, 2.0, 640, 480 );
	sleep( 7.0 );
	ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_eib_credits.full.cred_02_gbx', , , 1, 2.0, 640, 480 );
	sleep( 3.0 );

	///Brothers In Arms
	sleep( 2.0 );
	ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_eib_credits.full.cred_03_bia', , , 2, 2.0, 640, 480 );
	sleep( 7.0 );
	ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_eib_credits.full.cred_03_bia', , , 1, 2.0, 640, 480 );
	sleep( 3.0 );

	ACTION_TriggerEvent( 'Scene_IntroBarn' );

	///Earned In Blood
	sleep( 2.0 );
	ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_eib_credits.full.cred_04_eib', , , 2, 2.0, 640, 480 );
	sleep( 9.0 );
	ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_eib_credits.full.cred_04_eib', , , 1, 2.0, 640, 480 );
	sleep( 7.0 );
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
	sleep( 1.0 );
//	ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE );
//	ACTION_UNLockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_TriggerEvent( 'TS_D15_1130_IntroScene' );
}

