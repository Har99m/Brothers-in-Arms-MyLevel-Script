//=============================================================================
// NBS_Hill30Moment_Before.
//=============================================================================
class NBS_Hill30Moment_Before extends TriggeredScript
	placeable;

var bool bScriptStarted;
var float i;
var Pawn Baker;
var AnimPawn AP_Baker_Pre, AP_Mac_Pre, AP_Hooper_Pre;
var WargamePlayerController BakerController;
var PhysicsVolume WarSoundVolume;

function PostBeginPlay()
{
	
	bScriptStarted = False;

	AP_Baker_Pre = AnimPawn( GetPawn( 'AP_Baker1' ) );
	AP_Mac_Pre = AnimPawn( GetPawn( 'AP_Mac1' ) );
	AP_Hooper_Pre = AnimPawn( GetPawn( 'AP_Hooper1' ) );

}

//=============================================================================
state Triggered
{
	Begin:

	ACTION_SetAnimSet( 'AP_Mac1', "a_cin_d7_No_Better_Spot.a_cin_d7_No_better_spot_to_die" );
	ACTION_SetAnimSet( 'AP_Mac1', "a_cin_d7_hill30.a_cin_d7_hill30" );
	ACTION_SetAnimSet( 'AP_Baker1', "a_cin_d7_hill30.a_cin_d7_hill30" );

	bScriptStarted = True;
	Baker = GetLocalPlayerPawn();
	BakerController = GetLocalPlayerController();

	// Set waypoints and enable blockers
	ACTION_TriggerEvent( 'WayPoint01' );
	ACTION_DestroyActor( 'WayPoint01' );
	ACTION_TriggerEvent( 'BlockCombat1' );

	// Force unzoom
	ACTION_ChangePlayerFOV( 0, 0 );

	// Start pre-Hill30
	ACTION_LockPlayerMovement( Baker );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
	ACTION_HideHud( GetLocalPlayerController() , TRUE );

	ACTION_TriggerEvent( 'MacFunnelVolumes' );	//===== Turn off collision on these blocking volumes

	// Initialize time
	i = 1.0;
	StartAbsoluteTime();
	ResetAbsoluteTime();

	//=============================================================================
	// Dialogue

	// Mac_C ---------- Baker! Listen! It's just starting to heat up over here.
		WaitForAbsoluteTime( i );
		i += ACTION_PlayLipSyncSound( 'AP_Mac1', "D71400.MAC_C", 1.0, 1.0, 255.0 ) + 0.5;
		ACTION_DisplaySubtitleMessage2( S_Localize("MAC_B"), 4.0, 1, 1, 1 );

		ACTION_PlayAnimWithQueueDirect( AP_Mac_Pre, 'Mac_says_party_is_here', 0.3, 1.0, false, 1, 1 );

	// Mac_D ---------- We've seen some forces moving into position on the ridge there.
		WaitForAbsoluteTime( i );
		i += ACTION_PlayLipSyncSound( 'AP_Mac1', "D71400.MAC_D", 1.0, 1.0, 255.0 ) + 0.5;
		ACTION_DisplaySubtitleMessage2( S_Localize("MAC_C"), 4.0, 1, 1, 1 );

	// Mac_E ---------- This definitly where the party is going to happen.
		WaitForAbsoluteTime( i );
		i += ACTION_PlayLipSyncSound( 'AP_Mac1', "D71400.MAC_E", 1.0, 1.0, 255.0 ) + 0.5;
		ACTION_DisplaySubtitleMessage2( S_Localize("MAC_D"), 4.0, 1, 1, 1 );

	// Mac_M ---------- We're between a rock ond the whole goddamn German army.
		WaitForAbsoluteTime( i );
		i += ACTION_PlayLipSyncSound( 'AP_Mac1', "D71400.MAC_M", 1.0, 1.0, 255.0 ) + 0.5;
		ACTION_DisplaySubtitleMessage2( S_Localize("MAC_E"), 3.5, 1, 1, 1 );

	ACTION_TriggerEvent( 'Splode01' );

	// Hooper_A ---------- Incoming!
		WaitForAbsoluteTime( i );
		ACTION_PlayLipSyncSound( 'AP_Hooper1', "D71400.HOOPER_A", 1.0, 1.0, 255.0 );
		ACTION_DisplaySubtitleMessage2( S_Localize("HOOPER_A"), 2.0, 1, 1, 1 );

	ACTION_TriggerEvent( 'Splode02' );

	// Dialogue Ends
	//=============================================================================

	// Stop time
	StopAbsoluteTime();

	// Incoming mortars
	sleep( 0.3 );
	ACTION_TriggerEvent( 'Splode03' );
	sleep( 0.7 );
	ACTION_TriggerEvent( 'Splode04' );

	// Knock out Baker
	ACTION_FadeBlurEffect( 5.0, 0.007, 1.0, 255, 255, 255, 1.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Mac_Pre, 'baker_big_explosion', 0.1, 1.0, , , 2 );
	BakerController.DoHeavyTrauma();
	ACTION_BlockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_FIRE );
	sleep( 2.0 );

	// Fade to black
	ACTION_FadeOverlay( GetLocalPlayerController(), 1, 4.0 );
	sleep( 4.0 );

	// Destroy Combat 1 stuff here
	ACTION_DestroyActor( 'MG42FactoryAtTheBeginning' );
	ACTION_DestroyActor( 'KillMeshes' );
	ACTION_DestroyActor( 'AP_PreHill30Dude_A' );
	ACTION_DestroyActor( 'AP_PreHill30Dude_B' );
	ACTION_DestroyActor( 'AP_PreHill30Dude_C' );

	// Trigger the Main Hill30 scene
	ACTION_UnBlockActionKeys( KEY_ACTION_LOOK );

	ACTION_DestroyActor( 'AP_Baker1' );
	ACTION_DestroyActor( 'AP_Hooper1' );

	ACTION_TriggerEvent( 'NBS_Hill30UberScene' );
	ACTION_HideHud( GetLocalPlayerController(), True );
	sleep( 3.0 );  //time of full blackout -2
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 4.0 );

	// Turn the Base and Fire Units into Tank units
	ACTION_OrderFallOut( 'Fire' );
	ACTION_OrderFallOut( 'Base' );
	ACTION_DetachUnitFromSuperUnit( 'Fire' );
	ACTION_DetachUnitFromSuperUnit( 'Base' );
	ACTION_DestroyActor( 'Fire' );
	ACTION_DestroyActor( 'Base' );

	// Destroy US squad
	ACTION_DestroyActor( 'hartsockfgt' );
	ACTION_DestroyActor( 'corrion' );
	ACTION_DestroyActor( 'Courtland' );
	ACTION_DestroyActor( 'zanovich' );
	ACTION_DestroyActor( 'McCreary' );

	ACTION_DestroyActor( 'AP_Mac1' );

	// Destroy Germans
	ACTION_DestroyActor( 'FirstMGMountGuy' );
	ACTION_DestroyActor( 'KillMe' );

	if( WarSoundVolume != None )
	{
		WarSoundVolume.StopCurrentStereoAmbientSound();
		WarSoundVolume.AmbientSound = None;
	}
	else
	{
		slog( "*****Bullet sounds are still playing!*****" );
	}

	ACTION_EnableBattleDialogue();
	ACTION_UnLockPlayerMovement( Baker );

	ScriptEnd:
}
