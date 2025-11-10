//=============================================================================
// AllenandGarnettOrderScript.
//=============================================================================
class AllenandGarnettOrderScript extends TriggeredScript
	placeable;

var animpawn allen;
var animpawn garnett;
var pawn Player;

state Triggered
{
Begin:

	SLog( "AllenandGarnettOrderScript initiated..." );
	ACTION_SetAnimSet( 'Garnett', "a_cin_d0_exit4.a_cin_d0_exit4" );

	//locks the players movement
	ACTION_DisableBattleDialogue();
	ACTION_LockPlayerMovement ( GetLocalPlayerPawn() );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
	ACTION_HideHUD( GetLocalPlayerController(), true );

	//Stash Hartsock away
	ACTION_OrderFallOut( 'USAFireTeam1' );
	ACTION_OrderMove( 'USAFireTeam1' , 'PN_HartsockHidesFromGarnett' );

	//Cleaning up dead bodies from map
	ACTION_DestroyActor( 'G01' );
	ACTION_DestroyActor( 'G02' );
	ACTION_DestroyActor( 'G03' );
	ACTION_DestroyActor( 'G04' );
	ACTION_DestroyActor( 'G05' );
	ACTION_DestroyActor( 'G06' );
	ACTION_DestroyActor( 'G07' );
	ACTION_DestroyActor( 'G08' );
	ACTION_DestroyActor( 'G09' );
	ACTION_DestroyActor( 'G10' );

	//init allen and garnett
	allen = AnimPawn( GetPawn( 'allen' ) );
	Garnett = AnimPawn( GetPawn( 'garnett' ) );
	Player = GetPawn( 'LocalPlayerPawn' );
	Allen.bDoHeadTurn = true;
	Garnett.bDoHeadTurn = true;

	//Turn the dynamic duo to face the player
	allen.Controller.Focus = GetLocalPlayerPawn(); 
	allen.bRotateToDesired = TRUE; 
	garnett.Controller.Focus = GetLocalPlayerPawn(); 
	garnett.bRotateToDesired = TRUE; 
	sleep( 0.1 ); 
	ACTION_WaitForPawnRotateToward( allen );
	ACTION_WaitForPawnRotateToward( garnett );

	ACTION_SetLookAtTarget( 'Allen', GetLocalPlayerPawn(), TRUE );
	ACTION_SetLookAtTarget( 'Garnett', GetLocalPlayerPawn(), TRUE );
	allen.health = 10000;
	allen.Controller.bgodmode = true;
	garnett.health = 10000;
	garnett.Controller.bgodmode = true;


	ACTION_SetLookAtTarget( 'allen', Garnett, TRUE );
	ACTION_SetLookAtTarget( 'Garnett', GetLocalPlayerPawn(), TRUE );

//	"Garnett: Wasnt sure if we were gonna see any of you guys."
	ACTION_DisplaySubTitleMessage2(S_Localize( "GARNETT_LINE_A", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'garnett', "D00600.GARNETT_A", 255.0, 1.0, 1.0 ) );

//	ACTION_ClearLookAtTarget( 'Allen' );

//	"Allen: Been shooting at Germans coming off that beach all morning."
	ACTION_SetLookAtTarget( 'Garnett', Allen, TRUE );
	ACTION_DisplaySubTitleMessage2(S_Localize( "ALLEN_LINE_A", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'allen', "D00600.ALLEN_A", 255.0, 1.0, 1.0 ) );

//	"Garnett: One poor bastard was trying to take a crap while Allen plugged him."
	ACTION_SetLookAtTarget( 'Garnett', GetLocalPlayerPawn(), TRUE );
	ACTION_SetLookAtTarget( 'Allen', Garnett, TRUE );
	ACTION_DisplaySubTitleMessage2(S_Localize( "GARNETT_LINE_C", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'garnett', "D00600.GARNETT_C", 255.0, 1.0, 1.0 ) );

//	ACTION_ClearLookAtTarget( 'Garnett' );

//	"Allen: I swear he was going for his gun."
	ACTION_SetLookAtTarget( 'Allen', GetLocalPlayerPawn(), TRUE );
	ACTION_DisplaySubTitleMessage2(S_Localize( "ALLEN_LINE_B", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'allen', "D00600.ALLEN_B", 255.0, 1.0, 1.0 ) );

	sleep(1.0);
	ACTION_SetLookAtTarget( 'Allen', Garnett, TRUE );
	sleep(1.0);
	ACTION_SetLookAtTarget( 'Garnett', GetLocalPlayerPawn(), TRUE );

//	"Garnett: We got this as well.  The poor bastards that had it put up a hell of a fight before a potato masher got the best of them."
	ACTION_PlayAnimWithQueue( 'Garnett', 'Garnett_gestures', 0.3, 1.0);

	ACTION_SetLookAtTarget( 'Garnett', GetLocalPlayerPawn(), TRUE );
	ACTION_SetLookAtTarget( 'Allen', Garnett, TRUE );

	ACTION_DisplaySubTitleMessage2(S_Localize( "GARNETT_LINE_E", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'garnett', "D00600.GARNETT_E", 255.0, 1.0, 1.0 ) );

	ACTION_SetLookAtTarget( 'Allen', GetLocalPlayerPawn(), TRUE );

//	"Garnett: Browning .30 cal.  Watch out for the blood on the trigger."
	ACTION_SetLookAtTarget( 'Allen', Garnett, TRUE );

	ACTION_DisplaySubTitleMessage2(S_Localize( "GARNETT_LINE_F", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'garnett', "D00600.GARNETT_F", 255.0, 1.0, 1.0 ) );

	ACTION_SetLookAtTarget( 'Garnett', Allen, TRUE );

	sleep(0.5);

	ACTION_SetLookAtTarget( 'Allen', GetLocalPlayerPawn(), TRUE );
	ACTION_SetLookAtTarget( 'Garnett', GetLocalPlayerPawn(), TRUE );

	//changes allen and garnett back to normal AI Mind
	ACTION_ChangeController ( 'Allen', Class 'gbxAI.Mind');
	ACTION_ChangeController ( 'Garnett', Class 'gbxAI.Mind');

	//gives the player back movement
	ACTION_HideHUD( GetLocalPlayerController(), false );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), false );
	ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_EnableBattleDialogue();

	ACTION_SaveMemoryReport( "Exit4_Checkpoint2" );
	ACTION_CheckpointSave (3);
	ACTION_SaveMemoryReport( "Exit4_Checkpoint2_After" );

	ACTION_TriggerEvent( 'Checkpoint3Script' );

}
