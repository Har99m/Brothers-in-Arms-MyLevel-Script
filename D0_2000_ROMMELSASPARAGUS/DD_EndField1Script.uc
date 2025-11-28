//=============================================================================
// DD_EndField1Script.
//=============================================================================
class DD_EndField1Script extends TriggeredScript
	placeable;

var AnimPawn CrashedGlider;
var Pawn Pawn_Doe;
var DD_GliderLandingScript GliderScriptRef;
var Actor FenceRef;

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
{
	Super.PostBeginPlay();

	GliderScriptRef = DD_GliderLandingScript( GetFirstActor('DD_GliderLandingScript') );

	CrashedGlider = AnimPawn( GetPawn( 'GliderMesh02' ) );
	ACTION_SetAnimSetDirect( CrashedGlider, "k_vehicle_us.glider" );
	CrashedGlider.AttachToBone( GetFirstActor('GliderDust02'), 'Bone08' );
	CrashedGlider.bCanBeBaseForPawns = TRUE;

	FenceRef = GetFirstActor( 'StaticMesh_Fence_On' );
}

state Triggered
{
	Begin:

	// =========================================================================
	// Cleanup Field 1
	ACTION_DestroyActor( 'Trigger_F1MidEnt' );
	ACTION_DestroyActor( 'Trigger_F1Botm01' );
	ACTION_DestroyActor( 'Trigger_F1Mid02' );
	ACTION_DestroyActor( 'Trigger_F1Mid03' );
	ACTION_DestroyActor( 'Trigger_F1Mid04' );
	ACTION_DestroyActor( 'Trigger_F1Top01' );
	ACTION_DestroyActor( 'Trigger_F1UnitBotm01' );
	ACTION_DestroyActor( 'Trigger_SquadOut' );

	ACTION_DestroyActor( 'SpawnIGS02_01' );
	ACTION_DestroyActor( 'SpawnIGS02_02' );

	// =========================================================================
	// Message trigger to end situational in field 1
	ACTION_TriggerEvent( 'Trigger_Objective01' );

	// =========================================================================
	// Make all Germans Retreat in field 1
	ACTION_TriggerEvent( 'DD_RunGermans01' );
	ACTION_TriggerEvent( 'DD_RunGermans02' );
	ACTION_TriggerEvent( 'DD_RunGermans03' );
	ACTION_TriggerEvent( 'DD_RunGermans04' );
	ACTION_TriggerEvent( 'DD_RunGermans05' );

	// =========================================================================
	// Crash Sequence

	// Wait for glider to land then crash
	if ( GliderScriptRef != None && GliderScriptRef.bIsLanding )
		sleep( 7.0 );

	CrashedGlider.bHidden = FALSE;
	ACTION_PlayAnimDirect( CrashedGlider, 'glider_2_crash', 0.0, 1.0 );
	ACTION_PlayAnimWithQueueDirect( CrashedGlider, 'glider_2_crash_idle', 0.0, 1.0, TRUE );

	// Spawn and Initialize the pilot
	ACTION_TriggerEvent( 'SpawnDoe02' );
	Pawn_Doe = GetPawn( 'Pawn_Doe02' );

	ACTION_SetAnimSet( 'Pawn_Doe02', "a_cin_d0_Rommels_asparagus.a_cin_d0_Rommels_asparagus" );
	ACTION_ClearPawnIdleQueue( 'Pawn_Doe02' );
	ACTION_PlayAnimDirect( Pawn_Doe, 'pilot_idle', 0.0, 1.0, TRUE );

	Pawn_Doe.SetCollision( FALSE, FALSE, FALSE );
	Pawn_Doe.bCollideWorld = FALSE;

	Pawn_Doe.SetPhysics( PHYS_None );
	AnimPawn(Pawn_Doe).bPawnBlinks = FALSE;
	AnimPawn(Pawn_Doe).EyeMaxDeltaDown = 0;
	AnimPawn(Pawn_Doe).EyeMaxDeltaInside = 0;
	AnimPawn(Pawn_Doe).EyeMaxDeltaOutside = 0;
	AnimPawn(Pawn_Doe).EyeMaxDeltaUp = 0;
	AnimPawn(Pawn_Doe).bDoHeadTurn = FALSE;

	CrashedGlider.AttachToBone( Pawn_Doe, 'Bone02' );

	Pawn_Doe.SetRelativeRotation( rot(16384.0, -16384.0, 32768.0) );	// yaw, roll, pitch
	Pawn_Doe.SetRelativeLocation( vect(118.0, 92.0, 62.0) );				// left/right, down/up, foward/backward

	// Initial Explosion and Attach Dust
	sleep( 4.0 );
	ACTION_PlayAnim( 'Pawn_Doe02', 'pilot_idle_dead', 0.1, 1.0, TRUE );
	ACTION_PlaySound( 'Pawn_Doe02', "D02000_SOUNDS.GLIDERCRASH", 1.0, 64.0, 512 );
	ACTION_TriggerEvent( 'GliderDust02' );
	ACTION_TriggerEvent( 'CrashDirt01' );

	ACTION_TriggerEvent( 'BVT_Field1' );
	ACTION_UnBlockNavPoints( 'PathNode_Toggle' );

	// The glider has reached the first fence
	sleep( 0.3 );
	FenceRef.bHidden = TRUE;
	FenceRef.SetCollision( !FenceRef.bCollideActors, !FenceRef.bBlockActors, !FenceRef.bBlockPlayers );

	FenceRef = GetFirstActor( 'StaticMesh_Fence_Off' );
	FenceRef.bHidden = FALSE;
	FenceRef.SetCollision( !FenceRef.bCollideActors, !FenceRef.bBlockActors, !FenceRef.bBlockPlayers );

	ACTION_PlaySound( 'Pawn_Doe02', "D02000_SOUNDS.GLIDERCRASH", 1.0, 64.0, 512 );
	ACTION_TriggerEvent( 'CrashDirt02' );
	ACTION_TriggerEvent( 'CrashWood02' );

	// The glider has reached the second fence
	sleep( 0.4 );
	FenceRef = GetFirstActor( 'StaticMesh_Fence_On_02' );
	FenceRef.bHidden = TRUE;

	FenceRef = GetFirstActor( 'StaticMesh_Fence_Off_02' );
	FenceRef.bHidden = FALSE;

	ACTION_PlaySound( 'Pawn_Doe02', "D02000_SOUNDS.GLIDERCRASH", 1.0, 64.0, 512 );
	ACTION_TriggerEvent( 'CrashDirt03' );
	ACTION_TriggerEvent( 'CrashWood03' );

	ACTION_WaitForAnimEnd( CrashedGlider, 0 );

	// Spawn and Initialize the dead guy in the plane
	ACTION_TriggerEvent( 'SpawnDoe05' );
	Pawn_Doe = GetPawn('Pawn_Doe05');

	ACTION_SetAnimSetDirect( AnimPawn(Pawn_Doe), "a_hold_misc.dead_poses" );
	ACTION_ClearPawnIdleQueue( 'Pawn_Doe05' );
	ACTION_PlayAnimDirect( Pawn_Doe, 'dead_american_1', 0.0, 1.0, TRUE );

	Pawn_Doe.SetCollision( FALSE, FALSE, FALSE );
	Pawn_Doe.bCollideWorld = FALSE;
	Pawn_Doe.SetLocation( vect(-2576.507813, -4575.189941, 287.980042) );
	Pawn_Doe.SetPhysics( PHYS_None );

	AnimPawn(Pawn_Doe).bPawnBlinks = FALSE;
	AnimPawn(Pawn_Doe).EyeMaxDeltaDown = 0;
	AnimPawn(Pawn_Doe).EyeMaxDeltaInside = 0;
	AnimPawn(Pawn_Doe).EyeMaxDeltaOutside = 0;
	AnimPawn(Pawn_Doe).EyeMaxDeltaUp = 0;
	AnimPawn(Pawn_Doe).bDoHeadTurn = FALSE;

	sleep( 2.0 );

	ACTION_SaveMemoryReport( "rommels_checkpoint2_pre" );
	ACTION_CheckPointSave( 2 );
	ACTION_SaveMemoryReport( "rommels_checkpoint2_post" );

	sleep( 3.5 );

	ACTION_SetObjectiveStatus( 1, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 1, 'ObjectiveList', 6.0 );

	// Turn on new waypoint
	ACTION_TriggerEvent( 'Waypoint_Pole04' );

	// =========================================================================
	// Spawn Field 2 Germans
	ACTION_EnableFlakvierlingRecruiting( 'FlakvierlingFactory', TRUE );

	ACTION_TriggerEvent( 'SpawnGermanSquad06' );
	ACTION_TriggerEvent( 'SpawnGermanSquad07' );
	ACTION_TriggerEvent( 'SpawnGermanSquad08' );
	ACTION_TriggerEvent( 'SpawnGermanSquad09' );
	ACTION_TriggerEvent( 'SpawnGermanSquads10' );
	ACTION_OrderMove( 'GermanSquad08', 'SandBagHillPath' );
	ACTION_OrderMove( 'GermanSquad06', 'CartWPath' );

	ACTION_TriggerEvent( 'DD_IGS02_01' );

	ScriptEnd:
}
