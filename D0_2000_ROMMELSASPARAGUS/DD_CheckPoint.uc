//=============================================================================
// DD_CheckPoint.
// Triggered by: CheckpointManager
//=============================================================================

class DD_CheckPoint extends TriggeredScript
	placeable;

var AnimPawn CrashedGlider, Pawn_Doe;

var Actor PoleRef;

state Triggered
{
	Begin:

	// =============================================================================
	// Hud, Input, Lock Player Movement
	// =============================================================================
	ACTION_DisableBattleDialogue();
	ACTION_HideHUD( GetLocalPlayerController(), TRUE );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

	// Enable long distance shots
	ACTION_AllowLongDistanceAIShots( TRUE );

	ACTION_BlockNavPoint( 'TablePath01' );
	ACTION_BlockNavPoint( 'PathNode_Table_Off' );

	// =============================================================================
	// Destroy all things irrelevant to the map at this point
	// =============================================================================
	// Pawns
	ACTION_DestroyActor( 'Mesh_Opel_Blitz' );

	// Triggers
	ACTION_DestroyActor( 'Trigger_Training' );

	ACTION_DestroyActor( 'Trigger_EnterField' );

	ACTION_DestroyActor( 'Trigger_PoleTrain' );
	ACTION_DestroyActor( 'Trigger_PoleTrain02' );

	ACTION_DestroyActor( 'TNTTrigger01_01' );
	ACTION_DestroyActor( 'TNTTrigger01_02' );
	ACTION_DestroyActor( 'TNTTrigger01_03' );

	ACTION_DestroyActor( 'TNTTrigger02_01' );
	ACTION_DestroyActor( 'TNTTrigger02_02' );
	ACTION_DestroyActor( 'TNTTrigger02_03' );

	ACTION_DestroyActor( 'TNTTrigger03_01' );
	ACTION_DestroyActor( 'TNTTrigger03_02' );
	ACTION_DestroyActor( 'TNTTrigger03_03' );

	// Situational
	ACTION_DestroyActor( 'Trigger_F1MidEnt' );
	ACTION_DestroyActor( 'Trigger_F1Botm01' );
	ACTION_DestroyActor( 'Trigger_F1Mid02' );
	ACTION_DestroyActor( 'Trigger_F1Mid03' );
	ACTION_DestroyActor( 'Trigger_F1Mid04' );
	ACTION_DestroyActor( 'Trigger_F1Top01' );
	ACTION_DestroyActor( 'Trigger_F1UnitBotm01' );
	ACTION_DestroyActor( 'Trigger_SquadOut' );

	// =============================================================================
	// Initialize Waypoints, Setup Fence, Setup Table in second field
	// =============================================================================
	// Waypoints
	ACTION_TriggerEvent( 'Waypoint_Pole04' ); // On

	//Fence
	ACTION_TriggerEvent( 'BVT_Field1' ); // Turn off BVT

	// Turn visuals and collision off
	PoleRef = GetFirstActor( 'StaticMesh_Fence_On' );
	PoleRef.bHidden = TRUE;
	PoleRef.SetCollision( !PoleRef.bCollideActors, !PoleRef.bBlockActors, !PoleRef.bBlockPlayers );

	PoleRef = GetFirstActor( 'StaticMesh_Fence_On_02' );
	PoleRef.bHidden = TRUE;

	// Turn visuals and collision on
	PoleRef = GetFirstActor( 'StaticMesh_Fence_Off' );
	PoleRef.bHidden = FALSE;
	PoleRef.SetCollision( !PoleRef.bCollideActors, !PoleRef.bBlockActors, !PoleRef.bBlockPlayers );

	PoleRef = GetFirstActor( 'StaticMesh_Fence_Off_02' );
	PoleRef.bHidden = FALSE;

	// Table
	PoleRef = GetFirstActor( 'StaticMesh_Table_Off' );
	PoleRef.SetCollision( !PoleRef.bCollideActors, !PoleRef.bBlockActors, !PoleRef.bBlockPlayers );

	// =============================================================================
	// Initialize Gliders, Stop Sky Glider and Script
	// =============================================================================
	// Glider 01
	CrashedGlider = AnimPawn( GetPawn( 'GliderMesh01' ) );
	ACTION_SetAnimSetDirect( CrashedGlider, "k_vehicle_us.glider" );
	CrashedGlider.bCanBeBaseForPawns = TRUE;
	CrashedGlider.bHidden = FALSE;

	ACTION_PlayAnimDirect( CrashedGlider, 'glider_1_lands_idle', 0.0, 1.0, TRUE );

	// Spawn and Initialize the pilot
	ACTION_TriggerEvent( 'SpawnDoe01' );
	Pawn_Doe = AnimPawn( GetPawn('Pawn_Doe01') );

	ACTION_SetAnimSetDirect( Pawn_Doe, "a_cin_d0_Rommels_asparagus.a_cin_d0_Rommels_asparagus" );
	ACTION_ClearPawnIdleQueue( 'Pawn_Doe01' );
	ACTION_PlayAnimDirect( Pawn_Doe, 'pilot_idle_dead', 0.1, 1.0, TRUE );

	Pawn_Doe.SetCollision( FALSE, FALSE, FALSE );
	Pawn_Doe.bCollideWorld = FALSE;

	Pawn_Doe.SetPhysics( PHYS_None );
	Pawn_Doe.bPawnBlinks = FALSE;
	Pawn_Doe.EyeMaxDeltaDown = 0;
	Pawn_Doe.EyeMaxDeltaInside = 0;
	Pawn_Doe.EyeMaxDeltaOutside = 0;
	Pawn_Doe.EyeMaxDeltaUp = 0;
	Pawn_Doe.bDoHeadTurn = FALSE;

	CrashedGlider.AttachToBone( Pawn_Doe, 'Bone02' );

	Pawn_Doe.SetRelativeRotation( rot(16384.0, -16384.0, 32768.0) );	// yaw, roll, pitch
	Pawn_Doe.SetRelativeLocation( vect(118.0, 116.0, 70.0) );			// left/right, down/up, foward/backward

	// =============================================================================
	// Glider 02
	CrashedGlider = AnimPawn( GetPawn( 'GliderMesh02' ) );
	ACTION_SetAnimSetDirect( CrashedGlider, "k_vehicle_us.glider" );
	CrashedGlider.bCanBeBaseForPawns = TRUE;
	CrashedGlider.bHidden = FALSE;

	ACTION_PlayAnimDirect( CrashedGlider, 'glider_2_crash_idle', 0.0, 1.0, TRUE );

	// Spawn and Initialize the pilot
	ACTION_TriggerEvent( 'SpawnDoe02' );
	Pawn_Doe = AnimPawn( GetPawn('Pawn_Doe02') );

	ACTION_SetAnimSetDirect( Pawn_Doe, "a_cin_d0_Rommels_asparagus.a_cin_d0_Rommels_asparagus" );
	ACTION_ClearPawnIdleQueue( 'Pawn_Doe02' );
	ACTION_PlayAnimDirect( Pawn_Doe, 'pilot_idle_dead', 0.0, 1.0, TRUE );

	Pawn_Doe.SetCollision( FALSE, FALSE, FALSE );
	Pawn_Doe.bCollideWorld = FALSE;

	Pawn_Doe.SetPhysics( PHYS_None );
	Pawn_Doe.bPawnBlinks = FALSE;
	Pawn_Doe.EyeMaxDeltaDown = 0;
	Pawn_Doe.EyeMaxDeltaInside = 0;
	Pawn_Doe.EyeMaxDeltaOutside = 0;
	Pawn_Doe.EyeMaxDeltaUp = 0;
	Pawn_Doe.bDoHeadTurn = FALSE;

	CrashedGlider.AttachToBone( Pawn_Doe, 'Bone02' );

	Pawn_Doe.SetRelativeRotation( rot(16384.0, -16384.0, 32768.0) );	// yaw, roll, pitch
	Pawn_Doe.SetRelativeLocation( vect(118.0, 92.0, 62.0) );				// +left/right-, -up/down+, +foward/backward-

	// Spawn and Initialize the dead guy in the plane
	ACTION_TriggerEvent( 'SpawnDoe05' );
	Pawn_Doe = AnimPawn( GetPawn('Pawn_Doe05') );

	ACTION_SetAnimSetDirect( Pawn_Doe, "a_hold_misc.dead_poses" );
	ACTION_ClearPawnIdleQueue( 'Pawn_Doe05' );
	ACTION_PlayAnimDirect( Pawn_Doe, 'dead_american_1', 0.0, 1.0, TRUE );

	Pawn_Doe.SetCollision( FALSE, FALSE, FALSE );
	Pawn_Doe.bCollideWorld = FALSE;
	Pawn_Doe.SetLocation( vect(-2576.507813, -4575.189941, 287.980042) );
	Pawn_Doe.SetPhysics( PHYS_None );

	Pawn_Doe.bPawnBlinks = FALSE;
	Pawn_Doe.EyeMaxDeltaDown = 0;
	Pawn_Doe.EyeMaxDeltaInside = 0;
	Pawn_Doe.EyeMaxDeltaOutside = 0;
	Pawn_Doe.EyeMaxDeltaUp = 0;
	Pawn_Doe.bDoHeadTurn = FALSE;

	// =============================================================================
	// Turn off Sky Glider Emitter
	ACTION_TriggerEvent( 'CircleGlider01' );
	DD_GliderLandingScript( GetFirstActor('DD_GliderLandingScript') ).GoToState( 'Triggered', 'ScriptEnd' );

	// =============================================================================
	// Start and initialize SI
	// =============================================================================
	ACTION_TriggerEvent( 'DD_CombatSI' );
	sleep( 0.1 );

	// Message trigger to end situational in field 1
	ACTION_TriggerEvent( 'Trigger_Objective01' );

	// =============================================================================
	// Setup poles
	// =============================================================================
	// Group 1
	PoleRef = GetFirstActor( 'CPPole01_01' );
	PoleRef.bHidden = FALSE;
	PoleRef.SetCollision( TRUE, TRUE, TRUE );

	GetFirstActor( 'HiddenPole01_01' ).bHidden = FALSE;

	ACTION_DestroyActor( 'NormPole01_01' );
	ACTION_DestroyActor( 'KarmaPole01_01' );


	PoleRef = GetFirstActor( 'CPPole01_02' );
	PoleRef.bHidden = FALSE;
	PoleRef.SetCollision( TRUE, TRUE, TRUE );

	GetFirstActor( 'HiddenPole01_02' ).bHidden = FALSE;

	ACTION_DestroyActor( 'NormPole01_02' );
	ACTION_DestroyActor( 'KarmaPole01_02' );


	PoleRef = GetFirstActor( 'CPPole01_03' );
	PoleRef.bHidden = FALSE;
	PoleRef.SetCollision( TRUE, TRUE, TRUE );

	GetFirstActor( 'HiddenPole01_03' ).bHidden = FALSE;

	ACTION_DestroyActor( 'NormPole01_03' );
	ACTION_DestroyActor( 'KarmaPole01_03' );


	// Group 2
	PoleRef = GetFirstActor( 'CPPole02_01' );
	PoleRef.bHidden = FALSE;
	PoleRef.SetCollision( TRUE, TRUE, TRUE );

	GetFirstActor( 'HiddenPole02_01' ).bHidden = FALSE;

	ACTION_DestroyActor( 'NormPole02_01' );
	ACTION_DestroyActor( 'KarmaPole02_01' );


	PoleRef = GetFirstActor( 'CPPole02_02' );
	PoleRef.bHidden = FALSE;
	PoleRef.SetCollision( TRUE, TRUE, TRUE );

	GetFirstActor( 'HiddenPole02_02' ).bHidden = FALSE;

	ACTION_DestroyActor( 'NormPole02_02' );
	ACTION_DestroyActor( 'KarmaPole02_02' );


	PoleRef = GetFirstActor( 'CPPole02_03' );
	PoleRef.bHidden = FALSE;
	PoleRef.SetCollision( TRUE, TRUE, TRUE );

	GetFirstActor( 'HiddenPole02_03' ).bHidden = FALSE;

	ACTION_DestroyActor( 'NormPole02_03' );
	ACTION_DestroyActor( 'KarmaPole02_03' );


	// Group 3
	PoleRef = GetFirstActor( 'CPPole03_01' );
	PoleRef.bHidden = FALSE;
	PoleRef.SetCollision( TRUE, TRUE, TRUE );

	GetFirstActor( 'HiddenPole03_01' ).bHidden = FALSE;

	ACTION_DestroyActor( 'NormPole03_01' );
	ACTION_DestroyActor( 'KarmaPole03_01' );


	PoleRef = GetFirstActor( 'CPPole03_02' );
	PoleRef.bHidden = FALSE;
	PoleRef.SetCollision( TRUE, TRUE, TRUE );

	GetFirstActor( 'HiddenPole03_02' ).bHidden = FALSE;

	ACTION_DestroyActor( 'NormPole03_02' );
	ACTION_DestroyActor( 'KarmaPole03_02' );


	PoleRef = GetFirstActor( 'CPPole03_03' );
	PoleRef.bHidden = FALSE;
	PoleRef.SetCollision( TRUE, TRUE, TRUE );

	GetFirstActor( 'HiddenPole03_03' ).bHidden = FALSE;

	ACTION_DestroyActor( 'NormPole03_03' );
	ACTION_DestroyActor( 'KarmaPole03_03' );

	// =============================================================================
	// Spawn US Squad
	// =============================================================================
	ACTION_TriggerEvent( 'CSU_CP1' );
	sleep( 0.1 );
	ACTION_OrderMove( 'Unit01', 'PN_Checkpoint01' );

	/*
	// Map name, date, time
	ACTION_MapIntroTextPos( GetLocalPlayerController(), 50, 350 );
	ACTION_MapIntroText( GetLocalPlayerController(), 1, 2.0 );
	sleep (4.0);

	ACTION_EnablePlayerBreak();

	// Sleep until the player hits a button
	sleep( 9999999999.0 );
	ACTION_DisablePlayerBreak();

	AfterPlayerBreak:

	// =============================================================================
	// Fade out text and fade into game
	// =============================================================================
	ACTION_MapIntroText( GetLocalPlayerController(), 2, 2.0 );
	sleep( 2.0 );
	*/

	ACTION_EnableBattleDialogue();
	ACTION_HideHUD( GetLocalPlayerController(), FALSE );
	ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );

	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 2.0 );
	sleep( 0.5 ); 

	ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE );
	sleep( 0.5 );

	ACTION_RemoveHorizonTracerTarget( 'HorizonTracers02' );
	// ACTION_PlaySoundReturnHandle( 'gbxPlayerStart_Mid', "D02000_SOUNDS.AMB_WIND_ARTILLERY", 1.0, 1.0, 10000 );
	sleep( 1.0 );

	// =============================================================================
	// Spawn Field 2 Germans
	// =============================================================================
	ACTION_EnableFlakvierlingRecruiting( 'FlakvierlingFactory', TRUE );

	ACTION_TriggerEvent( 'SpawnGermanSquad06' );
	ACTION_TriggerEvent( 'SpawnGermanSquad07' );
	ACTION_TriggerEvent( 'SpawnGermanSquad08' );
	ACTION_TriggerEvent( 'SpawnGermanSquad09' );
	ACTION_TriggerEvent( 'SpawnGermanSquads10' );

	ACTION_OrderMove( 'GermanSquad08', 'SandBagHillPath' );
	ACTION_OrderMove( 'GermanSquad06', 'CartWPath' );

	// Start Infinite German Script
	ACTION_TriggerEvent( 'DD_IGS02_01' );

	// =============================================================================
	// Update and display objectives
	// =============================================================================
	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
	ACTION_SetObjectiveStatus( 1, OI_Active, 'ObjectiveList' );
	sleep( 0.1 );

	ACTION_DisplayObjective( 1, 'ObjectiveList', 6.0 );

	ScriptEnd:
}

/*
state PlayerBreak
{
	Begin:

	ACTION_DisablePlayerBreak();
	GotoState( 'Triggered', 'AfterPlayerBreak' );
}
*/
