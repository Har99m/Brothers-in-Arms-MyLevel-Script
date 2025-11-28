//=============================================================================
// DD_IntroScript.
//=============================================================================
class DD_IntroScript extends TriggeredScript
	placeable;

var Actor MyPlayer;
var AnimPawn OpelBlitz;
var int Monologue, nMusic; 

var Actor A_LT_Idle01, A_LT_Idle02, A_LT_Player, A_Player;

var AnimPawn Pawn_Mac, Pawn_Legs;
var Pawn Pawn_Allen, Pawn_Garnett, Pawn_Hartsock;
var float i;

state Triggered
{
	Begin:

	ACTION_SaveMemoryReport( "rommels_start" );

	// Lock Player Movement
	ACTION_DisableBattleDialogue();
	ACTION_HideHUD( GetLocalPlayerController(), TRUE );
	ACTION_BlockActionKeys( -1 );
	ACTION_UnblockActionKeys( KEY_ACTION_SHOW_MENU );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

	// Enable beacon trigger for DD_Prepfield
	ACTION_TriggerEvent( 'Trigger_Beacon01' );

	// Enable the first beacon
	ACTION_TriggerEvent( 'gbxWB_Road' );		// On
	ACTION_TriggerEvent( 'Waypoint_Pole01' );	// On

	// Spawn US Squad, Mac, Leggett
	ACTION_TriggerEvent( 'CSU_Intro' );
	ACTION_TriggerEvent( 'CSU_MacLeg' );
	sleep( 0.1 );

	// Enable long distance shots
	ACTION_AllowLongDistanceAIShots( TRUE );

	// Turn fence collision on fence between field 1 and 2
	ACTION_BlockNavPoints( 'PathNode_Toggle' );

	ACTION_BlockNavPoint( 'TablePath01' );
	ACTION_BlockNavPoint( 'PathNode_Table_Off' );

	MyPlayer = GetFirstActor( 'StaticMesh_Table_Off' );
	MyPlayer.SetCollision( !MyPlayer.bCollideActors, !MyPlayer.bBlockActors, !MyPlayer.bBlockPlayers );

	// Allow pawns to be attached to this pawn
	OpelBlitz = AnimPawn( GetPawn( 'Mesh_Opel_Blitz' ) );
	OpelBlitz.bCanBeBaseForPawns = TRUE;

	// Intialize Mac & Legget
	Pawn_Mac = AnimPawn( GetFirstActor('Pawn_Mac') );
	Pawn_Legs = AnimPawn( GetFirstActor('Pawn_Leggett') );

	ACTION_ChangeController( 'Pawn_Mac', class'ScriptedController' );
	ACTION_ChangeController( 'Pawn_Leggett', class'ScriptedController' );

	Pawn_Mac.SetPhysics( PHYS_None );
	Pawn_Legs.SetPhysics( PHYS_None );

	gbxPawn(Pawn_Mac).Shadow.Destroy();
	gbxPawn(Pawn_Mac).Shadow = None; 
	gbxPawn(Pawn_Legs).Shadow.Destroy();
	gbxPawn(Pawn_Legs).Shadow = None; 

	OpelBlitz.AttachToBone( Pawn_Mac, 'opel' );
	OpelBlitz.AttachToBone( Pawn_Legs, 'opel' );
	OpelBlitz.AttachToBone( GetFirstActor( 'OpelDust01' ), 'tires_front' );

	GetFirstActor( 'OpelDust01' ).SetRelativeLocation( vect(0.0, 8.0, 72.0) );

	Pawn_Mac.SetRelativeRotation( rot(0.0, 0.0, -16384.0) );
	Pawn_Mac.SetRelativeLocation( vect(106.5, 17.5, -45.7) );  // +forward/back, +down/up, +right/left

	Pawn_Legs.SetRelativeRotation( rot(0.0, 0.0, -16384.0) );
	Pawn_Legs.SetRelativeLocation( vect(106.5, -16.0, 64.0) );  // +forward/back, +down/up, +right/left

	ACTION_SetAnimSet( 'Mesh_Opel_Blitz', "k_vehicle_de.opel_blitz" );

	ACTION_SetAnimSet( 'Pawn_Mac', "a_cin_d0_Rommels_asparagus.a_cin_d0_Rommels_asparagus" );
	ACTION_SetAnimSet( 'Pawn_Leggett', "a_cin_d0_Rommels_asparagus.a_cin_d0_Rommels_asparagus" );
	
	ACTION_ClearPawnIdleQueue( 'Pawn_Mac' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'Mac_chatting_in_Opel_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'Mac_chatting_in_Opel_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'Mac_chatting_in_Opel_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Mac', FALSE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Leggett' );
	ACTION_PlayAnimWithQueue( 'Pawn_Leggett', 'Legs_idle_in_Opel', 0.0, 1.0, TRUE );

	// Intialize Squad
	Pawn_Allen = GetPawn( 'Pawn_Allen' );
	Pawn_Garnett = GetPawn( 'Pawn_Garnett' );
	Pawn_Hartsock = GetPawn( 'Pawn_Hartsock' );

	ACTION_SetLookAtTarget( 'Pawn_Leggett', GetLocalPlayerPawn(), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Hartsock', Pawn_Mac, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Allen', Pawn_Mac, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Allen, TRUE );

	ACTION_DisableAutoFacialExpression( 'Pawn_Mac', TRUE );
	ACTION_DisableAutoFacialExpression( 'Pawn_Garnett', TRUE );
	ACTION_DisableAutoFacialExpression( 'Pawn_Allen', TRUE );
	ACTION_DisableAutoFacialExpression( 'Pawn_Hartsock', TRUE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Hartsock' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Hartsock', 'standing_idle_relaxed_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Hartsock', 'standing_idle_relaxed_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Hartsock', 'standing_idle_relaxed_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Hartsock', TRUE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Allen' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Allen', 'standing_idle_relaxed_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Allen', 'standing_idle_relaxed_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Allen', 'standing_idle_relaxed_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Allen', TRUE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Garnett' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Garnett', 'standing_idle_relaxed_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Garnett', 'standing_idle_relaxed_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Garnett', 'standing_idle_relaxed_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Garnett', TRUE );

	// Initialize Look Target References
	A_LT_Idle01 = GetFirstActor('LookTarget_Idle01');
	A_LT_Idle02 = GetFirstActor('LookTarget_Idle02');
	A_LT_Player = GetFirstActor('LookTarget_Player01');

	// ACTION_EnablePlayerBreak();

	// Map name, date, time
	ACTION_MapIntroTextPos( GetLocalPlayerController(), 50, 350 );
	ACTION_MapIntroText( GetLocalPlayerController(), 1, 2.0 );

	A_Player = GetFirstActor( 'gbxPlayerStart' );
	nMusic = A_Player.PlayMusic( "MUSIC.D02000_VO", 0.0, FALSE );
	sleep( 2.5 );
	Monologue = A_Player.PlayMusic( "D02000.VOICEOVER_A", 0.0, FALSE );

	ACTION_DisplaySubTitleMessage2( S_Localize( "VOICEOVER_A_1" ), 5.0, 1, 1, 1, TRUE, TRUE );
	sleep( 5.2 );
	ACTION_DisplaySubTitleMessage2( S_Localize( "VOICEOVER_A_2" ), 3.0, 1, 1, 1, TRUE, TRUE );
	sleep( 3.2 );
	ACTION_DisplaySubTitleMessage2( S_Localize( "VOICEOVER_A_3" ), 6.5, 1, 1, 1, TRUE, TRUE );
	sleep( 6.7 );
	ACTION_DisplaySubTitleMessage2( S_Localize( "VOICEOVER_A_4" ), 5.5, 1, 1, 1, TRUE, TRUE );
	sleep( 5.7 );
	ACTION_DisplaySubTitleMessage2( S_Localize( "VOICEOVER_A_5" ), 13.0, 1, 1, 1, TRUE, TRUE );
	sleep( 10.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize( "VOICEOVER_A_6" ), 2.0, 1, 1, 1, TRUE, TRUE );
	sleep( 2.0 );

	// ACTION_DisablePlayerBreak();

	// AfterPlayerBreak:

	// Stop Monologue
	A_Player.StopMusic( Monologue, 1.5 );
	A_Player.StopMusic( nMusic, 1.5 );

	// Fade out text and fade into game
	ACTION_MapIntroText( GetLocalPlayerController(), 2, 2.0 );
	sleep( 2.0 );
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
	sleep( 0.5 ); 
	ACTION_UnblockActionKeys( -1 );
	sleep( 0.5 );
	// ACTION_PlaySoundReturnHandle( 'gbxPlayerStart', "D02000_SOUNDS.AMB_WIND_ARTILLERY", 1.0, 1.0, 10000 );
	ACTION_PlayAmbientSound( 'Mesh_Opel_Blitz', "D02000_SOUNDS.TRUCK_IDLE", 1.0, 64.0, 2048.0 );
	// ACTION_PlaySound( 'Mesh_Opel_Blitz', "D02000_SOUNDS.TRUCK_IDLE", 1.0, 1.0, 2048.0 );
	ACTION_RemoveHorizonTracerTarget( 'HorizonTracers02' );

	// Setup Timer
	i = 0.0;
	ResetAbsoluteTime();
	StartAbsoluteTime();		// Not strictly necessary; the clock is started by default.

	// ==========================================================================================
	// Mac talks: We have to link up with the other squads in Vierville.
	// ==========================================================================================
	i += ACTION_PlayLipSyncSound( 'Pawn_Mac', "D02000.MAC_A", 1.0, 1.0, 1024.0, TRUE ) + 1.0;
	ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_A" ), 3.5, 1, 1, 1, TRUE, TRUE );
	// Head Movement
	ACTION_SetLookAtTarget( 'Pawn_Garnett', A_LT_Idle01, TRUE );

	sleep( 1.5 );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', A_LT_Idle02, TRUE );
	// End Head

	// ==========================================================================================
	// Mac talks: Any minute now gliders are going to start landing in that field.
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Mac', "D02000.MAC_B", 1.0, 1.0, 1024.0, TRUE ) + 0.5;
	ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_B" ), 3.5, 1, 1, 1, TRUE, TRUE );

	// ==========================================================================================
	// Mac talks: If a glider hits even one of those poles it's curtains for the boys inside.
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Mac', "D02000.MAC_C", 1.0, 1.0, 1024.0, TRUE ) + 0.5;
	ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_C" ), 4.0, 1, 1, 1, TRUE, TRUE );

	// Head Movement
	ACTION_PawnSetFacialExpression( 'Pawn_Mac', 'emotion_SCOWL', 1.5, 2.0, 2.0 );

	ACTION_SetLookAtTarget( 'Pawn_Leggett', GetLocalPlayerPawn(), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Mac, TRUE );

	sleep( 1.0 );
	ACTION_SetLookAtTarget( 'Pawn_Hartsock', A_LT_Idle01, TRUE );
	// End Head

	// ==========================================================================================
	// Mac talks: Clear out as many of those damn things as you can.
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Mac', "D02000.MAC_D", 1.0, 1.0, 1024.0, TRUE ) + 2.0;
	ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_D" ), 2.5, 1, 1, 1, TRUE, TRUE );

	// Head Movement
	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Hartsock', Pawn_Mac, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Allen', GetLocalPlayerPawn(), TRUE );

	sleep( 1.5 );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', Pawn_Mac, TRUE );
	ACTION_ClearPawnIdleQueue( 'Pawn_Mac' );
	ACTION_PlayAnimDirect( Pawn_Mac, 'Mac_driving_Opel', 0.5, 1.0 );

	sleep( 1.0 );
	ACTION_PawnSetHeadTurnMult( 'Pawn_Mac', 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Mac', A_LT_Idle02, TRUE );

	ACTION_SetLookAtTarget( 'Pawn_Hartsock', A_LT_Idle01, TRUE );
	ACTION_ClearLookAtTarget( 'Pawn_Mac' );
	// End Head

	// ==========================================================================================
	// MAC drives away in the truck. - Time: 8.0s
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += 4.0;

	ACTION_PlayAnimDirect( OpelBlitz, 'opel_drives_off', 0.0, 1.0 );
	ACTION_TriggerEvent( 'OpelDust01' );

	// ACTION_StopSound( 'Mesh_Opel_Blitz', nTruck, 0.5 );
	ACTION_PlayAmbientSound( 'Mesh_Opel_Blitz', "D02000_SOUNDS.TRUCK_DRIVEOFF", 1.0, 64.0, 1600.0 );
	// ACTION_PlaySound( 'Mesh_Opel_Blitz', "D02000_SOUNDS.TRUCK_DRIVEOFF", 1.0, 1.0, 1600.0 );

	// Head Movement
	ACTION_DisableAutoFacialExpression( 'Pawn_Mac', FALSE );
	ACTION_ClearLookAtTarget( 'Pawn_Leggett' );

	ACTION_PawnSetHeadTurnMult( 'Pawn_Mac', 1.0 );

	ACTION_SetLookAtTarget( 'Pawn_Allen', Pawn_Mac, TRUE );
	
	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Hartsock', Pawn_Legs, TRUE );
	
	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Mac, TRUE );
	
	sleep( 1.0 );
	ACTION_SetLookAtTarget( 'Pawn_Hartsock', A_LT_Idle01, TRUE );
	// End Head

	// ==========================================================================================
	// Garnett talks: You know, he has a nasty habit of making this shit sound easy.
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Garnett', "D02000.GARNETT_A", 1.0, 1.0, 1024.0, TRUE ) + 1.0;
	ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_A" ), 3.5, 1, 1, 1, TRUE, TRUE );

	// Head Movement
	ACTION_PawnSetFacialExpression( 'Pawn_Garnett', 'emotion_SCOWL', 4.0, 2.0, 2.0 );

	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Allen, TRUE );

	sleep( 1.0 );
	ACTION_SetLookAtTarget( 'Pawn_Hartsock', Pawn_Garnett, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Allen', Pawn_Garnett, TRUE );
	// End Head

	// ==========================================================================================
	// Hartsock talks: Ok Baker, lead the way.
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Hartsock', "D02000.HARTSOCK_ZZA", 1.0, 1.0, 1024.0, TRUE ) + 1.5;
	ACTION_DisplaySubTitleMessage2( S_Localize( "HARTSOCK_A_1" ), 1.8, 1, 1, 1, TRUE, TRUE );

	// Head Movement
	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Hartsock', GetLocalPlayerPawn(), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Allen', Pawn_Hartsock, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Hartsock, TRUE );

	ACTION_PawnSetFacialExpression( 'Pawn_Allen', 'emotion_blink', 1.0, 2.0, 2.0 );

	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', GetLocalPlayerPawn(), TRUE );
	// End Head

	// ==========================================================================================
	// Clean-up Mac & Leggett - Time: 32.5s
	// ==========================================================================================

	WaitForAbsoluteTime( i );
	StopAbsoluteTime();

	ACTION_DisableAutoFacialExpression( 'Pawn_Allen', FALSE );
	ACTION_DisableAutoFacialExpression( 'Pawn_Garnett', FALSE );
	ACTION_DisableAutoFacialExpression( 'Pawn_Hartsock', FALSE );

	ACTION_ChangeController( 'Pawn_Garnett', class'Mind' );
	ACTION_ChangeController( 'Pawn_Hartsock', class'Mind' );
	ACTION_ChangeController( 'Pawn_Allen', class'Mind' );

	// Turn off head movement
	ACTION_ClearLookAtTarget( 'Pawn_Allen' );
	ACTION_ClearLookAtTarget( 'Pawn_Garnett' );

	ACTION_EnableBattleDialogue();

	// Spawn Infinite Germans and move them into position
	ACTION_EnableMG42Recruiting( 'MG42_Field1', TRUE );
	ACTION_TriggerEvent( 'SpawnIGS02_01' );
	ACTION_TriggerEvent( 'SpawnIGS02_02' );
	ACTION_OrderMove( 'InfiniteGermanSquad02', 'MGPath' );

	ACTION_SaveMemoryReport( "rommels_checkpoint1_pre" );
	ACTION_CheckPointSave( 1 );
	ACTION_SaveMemoryReport( "rommels_checkpoint1_post" );

	sleep( 2.0 );
	ACTION_HideHUD( GetLocalPlayerController(), FALSE );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE );
	ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );

	ACTION_ClearLookAtTarget( 'Pawn_Hartsock' );

	sleep( 2.0 );

	// Update and display objectives
	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 );

	ACTION_UnSetAnimSet( 'Mesh_Opel_Blitz', "k_vehicle_de.opel_blitz" );
	ACTION_TriggerEvent( 'OpelDust01' ); // Turn off Dust
	ACTION_DestroyActor( 'Mesh_Opel_Blitz' );
	ACTION_DestroyActor( 'Pawn_Mac' );
	ACTION_DestroyActor( 'Pawn_Leggett' );

	ScriptEnd:
}

state PlayerBreak
{
	Begin:

	ACTION_DisablePlayerBreak();
	GotoState( 'Triggered', 'AfterPlayerBreak' );
} 
