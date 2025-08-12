//=============================================================================
// NBS_Hill30UberScene.
//=============================================================================
class NBS_Hill30UberScene extends TriggeredScript
	placeable;

var AnimPawn AnimPawn_BlownDownTree;
var AnimPawn AnimPawn_Baker;
var AnimPawn AnimPawn_Doe;
var AnimPawn AnimPawn_Hooper;
var AnimPawn AnimPawn_Jameson;
var AnimPawn AnimPawn_Browning;
var AnimPawn AnimPawn_Leggett;
var AnimPawn AnimPawn_Locke;
var AnimPawn AnimPawn_Mac;
var AnimPawn AnimPawn_Wheaton;
var AnimPawn AnimPawn_York;
var AnimPawn AnimPawn_Mac_end;
var AnimPawn AnimPawn_Leggett_berzerk;

var Tank Tankie;
var Pawn ThePlayerPawn;

var bool bStopChargingDudes;
var bool bIsHill30;
var bool bStopMortars;
var bool bStopSquibs;
var bool bAnimDebug;

var NBS_USGuysTracker Tracker_Ref;
var Mover Mac1Mover, Mac2Mover;
var Actor MacThompson;
var Actor BakerPassedOut;

var int PassedOutSounds;
var float i;
var PhysicsVolume WarSoundVolume;

function PostBeginPlay()
{

	Tracker_Ref = NBS_USGuysTracker( GetFirstActor( 'NBS_USGuysTracker' ) );
	bStopChargingDudes = False;
	bIsHill30 = false;
	bStopMortars = false;
	bStopSquibs = false;
	bAnimDebug = false;

	Mac1Mover = Mover( GetFirstActor( 'MacsCratePants01' ) );
	Mac2Mover = Mover( GetFirstActor( 'MacsCratePants02' ) );

	MacThompson = GetFirstActor( 'Mac_Thompson' );
	BakerPassedOut = GetFirstActor( 'Player' );
}

//=============================================================================
state Triggered
{
	Begin:

	Level.Game.SetGameSpeed( 1.0 );

	//=============================================================================
	bIsHill30 = true;		// Change to true to enable Hill30 only, false for NBS
//	bIsHill30 = false;

//	bAnimDebug = true;		// If true, turns off things that make it hard to debug animpawns
	bAnimDebug = false;
	//=============================================================================

	PassedOutSounds = BakerPassedOut.PlayMusic( "D71400_SOUNDS.CINEMATIC_AMB", 2.0 );

	ACTION_BlockActionKeys( KEY_ACTION_SA_VIEW );
	ACTION_ToggleSAView( false );

	ACTION_SetAnimSet( 'AP_Mac_end', "a_cin_d7_hill30.a_cin_d7_hill30" );
	ACTION_SetAnimSet( 'AP_Leggett_berzerk', "a_cin_d7_hill30.a_cin_d7_hill30" );
	ACTION_SetAnimSet( 'AP_Mac_end', "a_ev_all.a_ev_corrion" );
	ACTION_SetAnimSet( 'AP_Leggett_berzerk', "a_ev_all.a_ev_corrion" );

	AnimPawn_BlownDownTree = AnimPawn( GetPawn( 'ap_blowdown_tree' ) );
	ACTION_PlayAnimDirect( AnimPawn_BlownDownTree, 'idle', 0.1, 0.4, TRUE );

	AnimPawn_Baker = AnimPawn( GetPawn( 'AP_Baker_Hill30' ) );
	AnimPawn_Baker.bNoTurnBody = true;
	ACTION_PlayAnimDirect( AnimPawn_Baker, 'Baker_idle', 0.1, 0.4, TRUE );
	ACTION_SetAnimSet( 'AP_Baker_Hill30', "a_cin_d7_hill30.a_cin_d7_hill30" );

	AnimPawn_Doe = AnimPawn( GetPawn( 'AP_Doe' ) );
	AnimPawn_Doe.bNoTurnBody = true;
	ACTION_AttachStaticMesh( AnimPawn_Doe, StaticMesh's_npc_weapon_us.us_m1', 'rifle_hold' );
	ACTION_SetAnimSet( 'AP_Doe', "a_cin_d7_hill30.a_cin_d7_hill30" );

	AnimPawn_Hooper = AnimPawn( GetPawn( 'AP_Hooper' ) );
	AnimPawn_Hooper.bNoTurnBody = true;
	ACTION_AttachStaticMesh( AnimPawn_Hooper, StaticMesh's_npc_weapon_us.us_thompson', 'rifle_hold' );
	ACTION_SetAnimSet( 'AP_Hooper', "a_cin_d7_hill30.a_cin_d7_hill30" );

	AnimPawn_Jameson = AnimPawn( GetPawn( 'AP_Jameson' ) );
	AnimPawn_Jameson.bNoTurnBody = true;
	ACTION_SetAnimSet( 'AP_Jameson', "a_cin_d7_hill30.a_cin_d7_hill30" );

	AnimPawn_Browning = AnimPawn( GetPawn( 'AP_Browning' ) );
	AnimPawn_Browning.bNoTurnBody = true;
	ACTION_SetAnimSet( 'AP_Browning', "a_cin_d7_hill30.a_cin_d7_hill30" );

	AnimPawn_Leggett = AnimPawn( GetPawn( 'AP_Leggett' ) );
	AnimPawn_Leggett.bNoTurnBody = true;
	ACTION_SetAnimSet( 'AP_Leggett', "a_cin_d7_hill30.a_cin_d7_hill30" );

	AnimPawn_Locke = AnimPawn (GetPawn( 'AP_Locke' ) );
	AnimPawn_Locke.bNoTurnBody = true;
	ACTION_SetAnimSet( 'AP_Locke', "a_cin_d7_hill30.a_cin_d7_hill30" );

	AnimPawn_Mac = AnimPawn( GetPawn( 'AP_Mac' ) );
	AnimPawn_Mac.bNoTurnBody = true;
	ACTION_SetAnimSet( 'AP_Mac', "a_cin_d7_hill30.a_cin_d7_hill30" );

	AnimPawn_Wheaton = AnimPawn( GetPawn( 'AP_Wheaton' ) );
	AnimPawn_Wheaton.bNoTurnBody = true;
	AnimPawn_Wheaton.bBlockActors = false;
	ACTION_AttachStaticMesh( AnimPawn_Wheaton, StaticMesh's_npc_weapon_us.us_m1_carbine', 'rifle_hold' );
	ACTION_SetAnimSet( 'AP_Wheaton', "a_cin_d7_hill30.a_cin_d7_hill30" );

	AnimPawn_York = AnimPawn( GetPawn( 'AP_York' ) );
	AnimPawn_York.bNoTurnBody = true;
	ACTION_AttachStaticMesh( AnimPawn_York, StaticMesh's_npc_weapon_us.us_m1', 'rifle_hold' );
	ACTION_SetAnimSet( 'AP_York', "a_cin_d7_hill30.a_cin_d7_hill30" );

	ACTION_AttachStaticMesh( AnimPawn( GetPawn( 'AP_Leggett_berzerk' )), StaticMesh's_npc_weapon_us.us_colt', 'rifle_hold' );

	ACTION_SetAnimSet( 'AP_Doe', "a_ev_all.a_ev_corrion" );
	ACTION_SetAnimSet( 'AP_Hooper', "a_ev_all.a_ev_corrion" );
	ACTION_SetAnimSet( 'AP_Jameson', "a_ev_all.a_ev_corrion" );
	ACTION_SetAnimSet( 'AP_Leggett', "a_ev_all.a_ev_corrion" );
	ACTION_SetAnimSet( 'AP_Locke', "a_ev_all.a_ev_corrion" );
	ACTION_SetAnimSet( 'AP_Mac', "a_ev_all.a_ev_corrion" );
	ACTION_SetAnimSet( 'AP_Wheaton', "a_ev_all.a_ev_corrion" );
	ACTION_SetAnimSet( 'AP_York', "a_ev_all.a_ev_corrion" );

	Mac1Mover.bBlockActors = false;
	Mac1Mover.bBlockNonZeroExtentTraces = false;
	Mac1Mover.bBlockPlayers = false;
	AnimPawn_Mac.AttachToBone( MacThompson, 'rifle_hold' );
	sleep( 0.2 );
	Mac1Mover.bBlockActors = true;
	Mac1Mover.bBlockNonZeroExtentTraces = true;
	Mac1Mover.bBlockPlayers = true;

	ACTION_SetHidden( 'AP_Locke' , false );
	ACTION_SetHidden( 'AP_Jameson' , false );
	ACTION_SetHidden( 'AP_York' , false );
	ACTION_SetHidden( 'AP_Wheaton' , false );
	ACTION_SetHidden( 'AP_Hooper' , false );
	ACTION_SetHidden( 'AP_Doe' , false );
	ACTION_SetHidden( 'AP_Mac' , false );
	ACTION_SetHidden( 'AP_Leggett' , false );
	ACTION_SetHidden( 'AP_Baker_Hill30' , false );
	ACTION_SetHidden( 'OhSnapFallenTree1', true );
	ACTION_SetHidden( 'OhSnapFallenTree2', false );

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

	ACTION_TriggerEvent( 'DummyMatineeScene' );

	ACTION_PlayAnim( 'AP_Bird1', 'crow_flying_circles_1', 0.1, 1.0,TRUE );
	ACTION_PlayAnim( 'AP_Bird2', 'crow_flying_circles_2', 0.1, 1.0,TRUE );
	ACTION_PlayAnim( 'AP_Bird3', 'crow_flying_circles_3', 0.1, 1.0,TRUE );

	ACTION_ClearPawnIdleQueue( 'AP_Doe' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Doe', 'Doe_combat_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Doe', 'Doe_combat_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Doe', 'Doe_combat_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Doe', 'Doe_combat_4' );

	ACTION_ClearPawnIdleQueue( 'AP_Hooper' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hooper', 'Hooper_combat_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hooper', 'Hooper_combat_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hooper', 'Hooper_combat_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hooper', 'Hooper_combat_4' );

	ACTION_ClearPawnIdleQueue( 'AP_Jameson' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Jameson', 'Jameson_shoot_random_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Jameson', 'Jameson_shoot_random_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Jameson', 'Jameson_shoot_random_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Jameson', 'Jameson_shoot_random_4' );

	ACTION_ClearPawnIdleQueue( 'AP_Browning' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Browning', 'Jameson_shoot_random_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Browning', 'Jameson_shoot_random_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Browning', 'Jameson_shoot_random_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Browning', 'Jameson_shoot_random_4' );

	ACTION_ClearPawnIdleQueue( 'AP_Leggett' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_use_radio_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_use_radio_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_cower_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_cower_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_use_radio_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_cower_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_use_radio_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Leggett', FALSE );

	ACTION_ClearPawnIdleQueue( 'AP_Locke' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Locke', 'Locke_crazy_loop_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Locke', 'Locke_crazy_loop_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Locke', 'Locke_crazy_loop_3' );

	ACTION_ClearPawnIdleQueue( 'AP_Mac' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Mac', 'Mac_combat_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Mac', 'Mac_combat_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Mac', 'Mac_combat_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Mac', 'Mac_combat_4' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Mac', 'Mac_combat_5' );

	ACTION_ClearPawnIdleQueue( 'AP_Wheaton' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Wheaton', 'Wheaton_combat_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Wheaton', 'Wheaton_combat_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Wheaton', 'Wheaton_combat_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Wheaton', 'Wheaton_combat_4' );

	ACTION_ClearPawnIdleQueue( 'AP_York' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_York', 'York_combat_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_York', 'York_combat_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_York', 'York_combat_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_York', 'York_combat_4' );

	ACTION_TriggerEvent( 'BlockCombat2' );

//=============================================================================
// WAKEUP
//=============================================================================

	ACTION_FadeBlurEffect( 0.5, 0.007, 1.0, 255, 255, 255, 1.0 );

	if( !bAnimDebug )
	{
		ACTION_TriggerEvent( 'LeafyBits' );			//===== Leaves falling from trees
		ACTION_TriggerEvent( 'NBS_FakeGermans' );	//===== Mover Germans
		ACTION_TriggerEvent( 'NBS_Hill30Dudes' );	//===== Charging Germans
	}

	i = 3.0;
	ResetAbsoluteTime();
	StartAbsoluteTime();

	// Force unzoom
	ACTION_BlockActionKeys( KEY_ACTION_ZOOM );
	ACTION_ChangePlayerFOV( 0, 0 );

	WaitForAbsoluteTime( i );
		ACTION_CameraInPawnHead( 'AP_Baker_Hill30', 'DummyMatineeScene', TRUE);//----------CAM IN ANIMATION
		ACTION_HideHud( GetLocalPlayerController(), True );
		ACTION_PlayAnimDirect( AnimPawn_Baker, 'Baker_helped_up_idle_2', 0.1, 0.5, true);

	WaitForAbsoluteTime( i += 10.7 );
		ACTION_PlayAnimDirect( AnimPawn_Baker, 'Baker_helped_up', 0.4, 1.0, );

	WarSoundVolume = PhysicsVolume( GetFirstActor( 'Birds' ) );

	BakerPassedOut.StopMusic( PassedOutSounds, 2.0 );
	WarSoundVolume.AmbientSound = None;
//	ACTION_PlaySoundReturnHandle( 'Player', "D71400_SOUNDS.BATTLE_AMBIENT", 1.0, 1.0, 10000 );

	WaitForAbsoluteTime( i += 0.3 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Leggett, 'Legs_revive_baker_idle', 0.1, 1.0 );

	WaitForAbsoluteTime( i += 2.5 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Leggett, 'Legs_revive_baker', 0.1, 1.0 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Mac, 'Mac_hes_fine', 0.1, 1.0 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_A", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "LEGGETT_A" ), 3.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 1.2 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_B", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		ACTION_FadeBlurEffect(  3.0, 0.0, 0.0, 255, 255, 255, 0 );

	WaitForAbsoluteTime( i += 0.5 );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Doe', FALSE );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hooper', FALSE );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Jameson', FALSE );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Browning', FALSE );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Leggett', FALSE );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Locke', FALSE );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Mac', FALSE );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Wheaton', FALSE );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_York', FALSE );

	WaitForAbsoluteTime( i += 1.3 );
		ACTION_PlayLipSyncSound( 'AP_Mac', "D71400.MAC_P", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "MAC_P" ), 3.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 1.2 );
		ACTION_PlayLocalSound( "EXPLOSIONS.artillery_incoming" );

	if( !bAnimDebug )
	{
		ACTION_TriggerEvent( 'NBS_Hill30Squibs' );	//===== Start squibs
		ACTION_TriggerEvent( 'TracerHell' );		//===== Tracers
	}

	WaitForAbsoluteTime( i += 0.3 );
		ACTION_PlayLipSyncSound( 'AP_Hooper', "D71400.HOOPER_A", 1.0, 1.0, 160.0, TRUE, AnimPawn_Hooper.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "HOOPER_A" ), 3.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 1.1 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Doe, 'Doe_small_explosion', 0.1, 1.0 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_York, 'York_small_explosion', 0.1, 1.0 );

	WaitForAbsoluteTime( i += 0.5 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Hooper, 'Hooper_small_explosion', 0.1, 1.0 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Wheaton, 'Wheaton_small_explosion', 0.1, 1.0 );

	WaitForAbsoluteTime( i += 0.2 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Jameson, 'Jameson_small_explosion', 0.1, 1.0);
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Browning, 'Jameson_small_explosion', 0.1, 1.0);

	WaitForAbsoluteTime( i += 0.3 );
	StopAbsoluteTime();

//=============================================================================
// EXPLOSION
//=============================================================================

	i = 0.4;
	ResetAbsoluteTime();
	StartAbsoluteTime();

		ACTION_AttachStaticMesh( AnimPawn_Leggett, StaticMesh's_military_us.us_radio_field_handset', 'phone_bone' );

		ACTION_PlayAnimWithQueueDirect( AnimPawn_Mac, 'Mac_god_damnit', 0.1, 1.0);

		ACTION_SetHidden( 'AP_Baker_Hill30', TRUE);								//----------CAM IN ANIMATION
		ACTION_PlayerToCameraPawn( 'AP_Baker_Hill30' );							//----------CAM IN ANIMATION
		ACTION_CameraInPawnHead( 'AP_Baker_Hill30', 'DummyMatineeScene', FALSE);		//----------CAM IN ANIMATION

		ACTION_LimitPlayerInput( GetLocalPlayerController(), false );
		ACTION_UnBlockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_FIRE );
		ACTION_UnLockPlayerMovement( ThePlayerPawn );
		ACTION_HideHud( GetLocalPlayerController(), False );
		ACTION_UnBlockActionKeys( KEY_ACTION_ZOOM );

	if( !bAnimDebug )
	{
		ACTION_TriggerEvent( 'ForcedViewshake' );
	}

		ACTION_PlayLocalSound( "EXPLOSIONS.FLAK_IMPACT" );

	if( !bAnimDebug )
	{
		ACTION_TriggerEvent( 'Leggett_Dead_Explosion' );
		ACTION_TriggerEvent( 'NBS_MortarScript' );
	}

	ACTION_TriggerEvent( 'BlockCombat2_Leggett' );

	WaitForAbsoluteTime( i );
		ACTION_PlayLipSyncSound( 'AP_Doe', "D_GARNETT.EVERYONEDYING_B", 1.0, 1.0, 160.0, TRUE, AnimPawn_Doe.RootBone );

	WaitForAbsoluteTime( i += 0.5 );
		ACTION_PlayLipSyncSound( 'AP_Mac', "D71400.MAC_Q", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "MAC_Q" ), 2.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 1.5 );

	StopAbsoluteTime();

//=============================================================================
// LEGS ON RADIO
//=============================================================================

	i = 2.2;
	ResetAbsoluteTime();
	StartAbsoluteTime();

		//TANK init
		ACTION_TriggerEvent( 'FinalTankSpawner' );
		Tankie = Tank( GetFirstActor( 'Tankie' ) );
		ACTION_TankEnterScriptedMode( Tankie );
		sleep( 0.1 );

		ACTION_DestroyActor( 'AP_Bird1');
		ACTION_DestroyActor( 'AP_Bird2');
		ACTION_DestroyActor( 'AP_Bird3');

		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_D", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone ); 
		ACTION_DisplaySubtitleMessage2(S_Localize( "LEGGETT_D" ), 7.0, 1, 1, 1 );
	
	WaitForAbsoluteTime( i );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_E", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );

	WaitForAbsoluteTime( i += 2.5 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_F", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		ACTION_PlayAnimWithQueue( 'AP_Leggett', 'Legs_fox2', 0.1, 1.0, , , 2 );

	WaitForAbsoluteTime( i += 5.0 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_G", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone ); 
		ACTION_DisplaySubtitleMessage2(S_Localize( "LEGGETT_G" ), 2.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 1.2 );
		ACTION_PlayLipSyncSound( 'AP_Mac', "D71400.MAC_R", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "MAC_R" ), 2.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 0.8 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Mac, 'mac_yells_at_legs_keep_trying', 0.3, 1.0, , , 2 );

	WaitForAbsoluteTime( i += 1.2 );
		ACTION_PlayLipSyncSound( 'AP_Mac', "D71400.MAC_S", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );

	WaitForAbsoluteTime( i += 2.5 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_H", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "LEGGETT_H" ), 10.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 2.0 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_I", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		Mac1Mover.bBlockActors = false;
		Mac1Mover.bBlockNonZeroExtentTraces = false;
		Mac1Mover.bBlockPlayers = false;
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Mac, 'mac_reloads', 0.3, 1.0, , , 2 );	//===== Mac reloads

	WaitForAbsoluteTime( i += 0.3 );
		AnimPawn_Mac.AttachToBone( MacThompson, 'rifle_hold_lefthand' );

	WaitForAbsoluteTime( i += 0.1 );
		Mac1Mover.bBlockActors = true;
		Mac1Mover.bBlockNonZeroExtentTraces = true;
		Mac1Mover.bBlockPlayers = true;

	WaitForAbsoluteTime( i += 1.5 );
		Mac1Mover.bBlockActors = false;
		Mac1Mover.bBlockNonZeroExtentTraces = false;
		Mac1Mover.bBlockPlayers = false;

	WaitForAbsoluteTime( i += 0.1 );
		AnimPawn_Mac.AttachToBone( MacThompson, 'rifle_hold' );

	WaitForAbsoluteTime( i += 0.1 );
		Mac1Mover.bBlockActors = true;
		Mac1Mover.bBlockNonZeroExtentTraces = true;
		Mac1Mover.bBlockPlayers = true;

		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_J", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );

	WaitForAbsoluteTime( i += 1.1 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_K", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );

	WaitForAbsoluteTime( i += 2.0 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Mac, 'Mac_walk_left', 0.3, 1.0, , , 2 );
		ACTION_TriggerEvent( 'MacsCratePants01' );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_L", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );

	WaitForAbsoluteTime( i += 3.0 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_M", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );

	WaitForAbsoluteTime( i += 0.2 );
	StopAbsoluteTime();

//=============================================================================
// MAC DOWN THE LINE
//=============================================================================

	i = 1.0;	//===== Was 4.0
	ResetAbsoluteTime();
	StartAbsoluteTime();

	WaitForAbsoluteTime( i );
		ACTION_PlayLipSyncSound( 'AP_Mac', "D71400.MAC_T", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "MAC_T" ), 6.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 3.0 );
		ACTION_PlayLipSyncSound( 'AP_Mac', "D71400.MAC_U", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );

	WaitForAbsoluteTime( i += 4.0 );
		ACTION_PlayLipSyncSound( 'AP_Mac', "D71400.MAC_V", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "MAC_V" ), 7.0, 1, 1, 1 );

	StopAbsoluteTime();

//=============================================================================
// YORK DIES
//=============================================================================

	i = 0.2;
	ResetAbsoluteTime();
	StartAbsoluteTime();

	WaitForAbsoluteTime( i );
		ACTION_ClearPawnIdleQueue( 'AP_York' );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_York, 'York_dies', 0.3, 1.0, , , 1 );

	WaitForAbsoluteTime( i += 1.2 );
		ACTION_DropStaticMesh( AnimPawn_York, StaticMesh's_npc_weapon_us.us_m1', 'rifle_hold' );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Jameson, 'Jameson_react_to_York', 0.1, 1.0);
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Browning, 'Jameson_react_to_York', 0.1, 1.0);

	WaitForAbsoluteTime( i += 0.5 );
		ACTION_PlayLipSyncSound( 'AP_Jameson', "D71400.JAMESON_A", 1.0, 1.0, 160.0, TRUE, AnimPawn_Jameson.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "JAMESON_A" ), 6.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 3.5 );
		ACTION_PlayLipSyncSound( 'AP_Jameson', "D71400.WHEATON_A", 1.0, 1.0, 160.0, TRUE, AnimPawn_Wheaton.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "WHEATON_A" ), 3.0, 1, 1, 1 );

	StopAbsoluteTime();

//=============================================================================
// MAC DOWN THE LINE AGAIN
//=============================================================================

	i = 3.5;
	ResetAbsoluteTime();
	StartAbsoluteTime();
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Mac, 'Mac_walk_right', 0.3, 1.0, , , 2 );
		ACTION_TriggerEvent( 'MacsCratePants02' );

		Mac2Mover.bBlockActors = true;
		Mac2Mover.bBlockNonZeroExtentTraces = true;
		Mac2Mover.bBlockPlayers = true;

		Mac1Mover.bBlockActors = false;
		Mac1Mover.bBlockNonZeroExtentTraces = false;
		Mac1Mover.bBlockPlayers = false;

	WaitForAbsoluteTime( i );
		ACTION_PlayLocalSound( "D71400_SOUNDS.TREE_EXPLODE" );
		ACTION_PlayAnimDirect( AnimPawn_BlownDownTree, 'fall', 0.1, 0.35 );

	if( !bAnimDebug )
	{
		ACTION_TriggerEvent( 'p_blowdown_tree' );
		ACTION_TriggerEvent( 'p_dirt_throw' );
	}

	WaitForAbsoluteTime( i += 1.0 );
	StopAbsoluteTime();

//=============================================================================
// DOE DIES
//=============================================================================

	i = 1.0;
	ResetAbsoluteTime();
	StartAbsoluteTime();
		ACTION_ClearPawnIdleQueue( 'AP_Doe' );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Doe, 'Doe_dies', 0.3, 1.0, , , 2 );

	WaitForAbsoluteTime( i );
		ACTION_PlayLocalSound( "D71400_SOUNDS.DEATH_GURGLE" );

	WaitForAbsoluteTime( i += 0.2 );
		ACTION_DropStaticMesh( AnimPawn_Doe, StaticMesh's_npc_weapon_us.us_m1', 'rifle_hold' );

	WaitForAbsoluteTime( i += 0.3 );
		ACTION_ClearPawnIdleQueue( 'AP_Leggett' );
		ACTION_DropStaticMesh( AnimPawn_Leggett, StaticMesh's_military_us.us_radio_field_handset', 'phone_bone' );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Leggett, 'Legs_help_Doe_mount', 0.1, 1.0, , , 1 );

	WaitForAbsoluteTime( i += 0.5 );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_help_Doe_idle' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_help_Doe_helping' );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Leggett', FALSE );

	WaitForAbsoluteTime( i += 2.0 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_N", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "LEGGETT_N" ), 4.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 3.5 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_O", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );

	WaitForAbsoluteTime( i += 2.0 );
		ACTION_PlayLipSyncSound( 'AP_Mac', "D71400.MAC_W", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "MAC_W" ), 2.0, 1, 1, 1 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Mac, 'Mac_yells_weres_that_armor', 0.3, 1.0, , , 2 );

	WaitForAbsoluteTime( i += 1.0 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Leggett, 'Legs_help_Doe_scream', 0.2, 1.0, , , 2 );

	WaitForAbsoluteTime( i += 1.0 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_P", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "LEGGETT_P" ), 2.5, 1, 1, 1 );

	WaitForAbsoluteTime( i += 2.5 );
		ACTION_PlayLipSyncSound( 'AP_Mac', "D71400.MAC_X", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "MAC_X" ), 3.5, 1, 1, 1 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Mac, 'mac_yells_were_all_going_to_die', 0.3, 1.0, , , 2 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Leggett, 'Legs_help_Doe_idle', 0.2, 1.0, , , 1 );

	WaitForAbsoluteTime( i += 1.0 );
		bStopMortars = true;
		bStopChargingDudes = true;
		ACTION_TankMoveTo( Tankie , GetNavigationPoint( 'TankDest' ) );

	WaitForAbsoluteTime( i += 2.0 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_Q", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "LEGGETT_Q" ), 1.5, 1, 1, 1 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Leggett, 'Legs_help_Doe_sad', 0.2, 1.0, , , 1 );

	WaitForAbsoluteTime( i += 1.5 );
		ACTION_ClearPawnIdleQueue( 'AP_Leggett' );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Leggett, 'Legs_help_Doe_dismount', 0.2, 1.0, , , 1 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_R", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );

	WaitForAbsoluteTime( i += 0.5 );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_use_radio_1' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_use_radio_2' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_cower_2' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_cower_1' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_use_radio_2' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_cower_2' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett', 'Legs_use_radio_1' );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Leggett', FALSE );

	WaitForAbsoluteTime( i += 0.5 );
		ACTION_PlayLipSyncSound( 'AP_Leggett', "D71400.LEGGETT_S", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		ACTION_TriggerEvent( 'BlockCombat2_Leggett' );	//===== Turn it off
		ACTION_AttachStaticMesh( AnimPawn_Leggett, StaticMesh's_military_us.us_radio_field_handset', 'phone_bone' );
		ACTION_TriggerEvent( 'BlockCombat2_Leggett' );	//===== Turn it on

	StopAbsoluteTime();

//=============================================================================
// TANKS INCOMING
//=============================================================================

	i = 5.0;
	ResetAbsoluteTime();
	StartAbsoluteTime();

	WaitForAbsoluteTime( i );
		ACTION_PlayLipSyncSound( 'AP_Hooper', "D71400.HOOPER_B", 1.0, 1.0, 160.0, TRUE, AnimPawn_Hooper.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "HOOPER_C" ), 2.5, 1, 1, 1 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Mac, 'mac_reloads', 0.3, 1.0, , , 2 );	//===== Mac reloads

	WaitForAbsoluteTime( i += 0.3 );
		AnimPawn_Mac.AttachToBone( MacThompson, 'rifle_hold_lefthand' );

	WaitForAbsoluteTime( i += 0.1 );
		Mac2Mover.bBlockActors = true;
		Mac2Mover.bBlockNonZeroExtentTraces = true;
		Mac2Mover.bBlockPlayers = true;

	WaitForAbsoluteTime( i += 1.5 );
		Mac2Mover.bBlockActors = false;
		Mac2Mover.bBlockNonZeroExtentTraces = false;
		Mac2Mover.bBlockPlayers = false;

	WaitForAbsoluteTime( i += 0.1 );
		AnimPawn_Mac.AttachToBone( MacThompson, 'rifle_hold' );

	WaitForAbsoluteTime( i += 0.1 );
		Mac2Mover.bBlockActors = true;
		Mac2Mover.bBlockNonZeroExtentTraces = true;
		Mac2Mover.bBlockPlayers = true;

	WaitForAbsoluteTime( i += 0.9 );
		ACTION_PlayLipSyncSound( 'AP_Hooper', "D71400.HOOPER_C", 1.0, 1.0, 160.0, TRUE, AnimPawn_Hooper.RootBone );

	WaitForAbsoluteTime( i += 2.0 );
		ACTION_PlayLipSyncSound( 'AP_Mac', "D71400.MAC_Y", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "MAC_Y" ), 8.0, 1, 1, 1 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Mac, 'Mac_yells_get_down', 0.3, 1.0 );
		ACTION_DestroyActor( 'RND_Explosion' );
		ACTION_TankSetEnemy( Tankie , AnimPawn_Baker , TRUE );
//		ACTION_TriggerEvent( 'tank_rumble' );

	WaitForAbsoluteTime( i += 3.0 );	// was 9.0
		ACTION_PlayLipSyncSound( 'AP_Mac', "D71400.MAC_ZB", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "MAC_ZB" ), 2.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 1.5 );
	StopAbsoluteTime();

//=============================================================================
// BOOM!
//=============================================================================

	i = 0.2;
	ResetAbsoluteTime();
	StartAbsoluteTime();
		ACTION_ClearPawnIdleQueue( 'AP_Leggett_berzerk' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett_berzerk', 'Legs_goes_berzerk_shoots' );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Leggett_berzerk', FALSE );

		ACTION_ClearPawnIdleQueue( 'AP_Jameson' );
		ACTION_ClearPawnIdleQueue( 'AP_Browning' );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Jameson, 'Jameson_big_explosion', 0.1, 1.0 );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Browning, 'Jameson_big_explosion', 0.1, 1.0 );
		ACTION_ClearPawnIdleQueue( 'AP_Wheaton' );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Wheaton, 'Wheaton_big_explosion', 0.1, 1.0 );

	WaitForAbsoluteTime( i );
		ACTION_ClearPawnIdleQueue( 'AP_Hooper' );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Hooper, 'Hooper_big_explosion', 0.1, 1.0 );

		ACTION_ClearPawnIdleQueue( 'AP_Mac' );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Mac, 'Mac_big_explosion', 0.1, 1.0 );

		ACTION_ClearPawnIdleQueue( 'AP_Legs' );
		ACTION_PlayAnimWithQueueDirect( AnimPawn_Leggett, 'Legs_big_explosion', 0.1, 1.0 );

	// Force unzoom
	ACTION_BlockActionKeys( KEY_ACTION_ZOOM );
	ACTION_ChangePlayerFOV( 0, 0 );

	WaitForAbsoluteTime( i += 0.2 );	//Big Explosion, 1.0
		ACTION_FadeBlurEffect(  1.0, 0.007, 1.0, 255, 255, 255, 1.0 );
		ACTION_TankFireCannon( Tankie , TRUE );
		ACTION_PlayLocalSound( "EXPLOSIONS.FLAK_IMPACT" );
//		ACTION_PlayLocalSound( "Player.SHELL_SHOCK" );
		ACTION_PlayAnimDirect( AnimPawn_Baker, 'Baker_big_explosion', 0.1, 1.0 );
		ACTION_HideHud( GetLocalPlayerController(), True );
		ACTION_BlockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_FIRE );
		ACTION_CameraInPawnHead( 'AP_Baker_Hill30', 'DummyMatineeScene', TRUE);//----------CAM IN ANIMATION
		ACTION_SetHiddenDirect( AnimPawn_Baker, FALSE );
		ACTION_SetHiddenDirect( ThePlayerPawn, true );

	WaitForAbsoluteTime( i += 7.8 );
		ACTION_PlayAnimDirect( AnimPawn_Baker, 'Baker_watches_legs_blown_down', 0.1, 1.0 );
		ACTION_SetHidden( 'AP_Mac', TRUE );
		ACTION_SetHidden( 'AP_Leggett', TRUE );

	WaitForAbsoluteTime( i += 1.2 );
		ACTION_SetHidden( 'AP_Leggett_berzerk', FALSE );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Leggett_berzerk', FALSE );
		ACTION_PlayAnimWithQueue( 'AP_Leggett_berzerk', 'Legs_goes_berzerk_mount', 0.1, 1.0 );
		ACTION_FadeBlurEffect(  4.0, 0.0, 0.0, 255, 255, 255, 0 );

	WaitForAbsoluteTime( i += 1.5 );
		ACTION_PlayLipSyncSound( 'AP_Leggett_berzerk', "D71400.LEGGETT_U", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "LEGGETT_U" ), 1.8, 1, 1, 1 );

	WaitForAbsoluteTime( i += 2.0 );
		ACTION_PlayLipSyncSound( 'AP_Leggett_berzerk', "D71400.LEGGETT_W", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "LEGGETT_W" ), 4.5, 1, 1, 1 );

	WaitForAbsoluteTime( i += 1.5 );
		ACTION_PlayAnimWithQueue( 'AP_Leggett_berzerk', 'Legs_goes_berzerk_dies', 0.1, 1.0);
		ACTION_PlayAnimWithQueue( 'AP_Leggett_berzerk', 'baker_helped_up_idle', 0.1, 1.0, true );

	WaitForAbsoluteTime( i += 1.5 );
		ACTION_PlayLipSyncSound( 'AP_Leggett_berzerk', "D71400.LEGGETT_X", 1.0, 1.0, 160.0, TRUE, AnimPawn_Leggett.RootBone );
		ACTION_DisplaySubtitleMessage2(S_Localize( "LEGGETT_X" ), 3.5, 1, 1, 1 );

	WaitForAbsoluteTime( i += 2.5 );
		ACTION_TankSetEnemy( Tankie , AnimPawn_York , TRUE );

	WaitForAbsoluteTime( i += 0.8 );
		ACTION_TriggerEvent( 'Leggett_Dead_Explosion' );
		ACTION_PlayLocalSound( "EXPLOSIONS.FLAK_IMPACT" );

	WaitForAbsoluteTime( i += 3.2 );
		ACTION_SetHidden( 'AP_Leggett_berzerk', TRUE );
		ACTION_SetHidden( 'AP_Leggett_dead', FALSE );
		ACTION_SetHidden( 'Leggett_dead_colt', FALSE );
		ACTION_SetHidden( 'AP_Mac_end', FALSE );

	WaitForAbsoluteTime( i += 4.8 );
		ACTION_FadeBlurEffect(  5.0, 0.007, 1.0, 255, 255, 255, 1.0 );

	WaitForAbsoluteTime( i += 3.0 );
		ACTION_PlayAnimDirect( AnimPawn_Baker, 'baker_passes_out', 0.1, 1.0, , , , 4 );
		ACTION_PlayAnim( 'AP_Mac_end', 'mac_shakes_baker', 0.1, 1.0, TRUE);
		ACTION_PlayLipSyncSound( 'AP_Mac_end', "D71400.MAC_ZC", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );
		ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_ZC" ), 4.0, 1, 1, 1 );

	WaitForAbsoluteTime( i += 2.0 ); 
		ACTION_StopRain();
		ACTION_FadeOverlay( GetLocalPlayerController(), 1, 5.0 );

	WaitForAbsoluteTime( i += 2.0 );
		ACTION_PlayLipSyncSound( 'AP_Mac_end', "D71400.MAC_ZD", 1.0, 1.0, 160.0, TRUE, AnimPawn_Mac.RootBone );
		ACTION_TriggerEvent( 'LeafyBits' );
		ACTION_TriggerEvent( 'TracerHell' );
		bStopSquibs = true;
		ACTION_SetRepelBullets( 'gbxPlayerPawn', false );

		if( bIsHill30 )
		{
			WaitForAbsoluteTime( i += 3.2 );
			ACTION_CameraInPawnHead( 'AP_Baker_Hill30', 'DummyMatineeScene', false );
			ACTION_StopScene( 'DummyMatineeScene', '' );
			ACTION_TankNoEngineSound( Tankie );

			// Turn off war sounds
			ACTION_StopRain();
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

			ACTION_Triggerevent( 'NBS_LoadCredits' );
		}

		else
		{
			WaitForAbsoluteTime( i += 3.2 );
			ThePlayerPawn.controller.bGodmode = false;
			ACTION_TriggerEvent( 'NBS_Hill30Moment_After' );
			ACTION_CameraInPawnHead( 'AP_Baker_Hill30', 'DummyMatineeScene', false );
			ACTION_StopScene( 'DummyMatineeScene', '' );
			ACTION_UnBlockActionKeys( KEY_ACTION_SA_VIEW + KEY_ACTION_ZOOM );
			ACTION_ToggleSAView( true );
		}

	StopAbsoluteTime();

	ACTION_DestroyActor( 'Hill30Squad02Dude01' );
	ACTION_DestroyActor( 'Hill30Squad02Dude02' );
	ACTION_DestroyActor( 'Hill30Squad03Dude01' );
	ACTION_DestroyActor( 'Hill30Squad03Dude02' );
	ACTION_DestroyActor( 'Mac_Thompson' );

	ACTION_SetHidden( 'OhSnapFallenTree2', true );
	ACTION_SetHidden( 'OhSnapFallenTree3', false );
	ACTION_TriggerEvent( 'OhSnapFallenTree_Volume' );

	Mac2Mover.bBlockActors = false;
	Mac2Mover.bBlockNonZeroExtentTraces = false;
	Mac2Mover.bBlockPlayers = false;

	ScriptEnd:
}

