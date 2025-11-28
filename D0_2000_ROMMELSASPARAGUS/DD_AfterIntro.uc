//=============================================================================
// DD_AfterIntro.
//=============================================================================
class DD_AfterIntro extends TriggeredScript
	placeable;

var Actor A_Ref;

state Triggered
{
	Begin:

	// =============================================================================
	// Lock Player Movement
	ACTION_DisableBattleDialogue();
	ACTION_HideHUD( GetLocalPlayerController(), TRUE );
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

	// =============================================================================
	// Enable beacon trigger for DD_Prepfield
	ACTION_TriggerEvent( 'Trigger_Beacon01' );

	// Enable the first beacon
	ACTION_TriggerEvent( 'gbxWB_Road' );		// On
	ACTION_TriggerEvent( 'Waypoint_Pole01' );	// On

	// Spawn and Initialized US Squad
	ACTION_TriggerEvent( 'CSU_Intro' );
	sleep( 0.1 );

	ACTION_SetLookAtTarget( 'Pawn_Hartsock', GetLocalPlayerPawn(), TRUE );

	// Enable long distance shots
	ACTION_AllowLongDistanceAIShots( TRUE );

	// =============================================================================
	// Turn fence collision on fence between field 1 and 2
	ACTION_BlockNavPoints( 'PathNode_Toggle' );

	ACTION_BlockNavPoint( 'TablePath01' );
	ACTION_BlockNavPoint( 'PathNode_Table_Off' );

	A_Ref = GetFirstActor( 'StaticMesh_Table_Off' );
	A_Ref.SetCollision( !A_Ref.bCollideActors, !A_Ref.bBlockActors, !A_Ref.bBlockPlayers );

	// =============================================================================
	// Destroy all things irrelevant to the map at this point
	
	ACTION_DestroyActor( 'Mesh_Opel_Blitz' );

	ACTION_ChangeController( 'Pawn_Garnett', class'Mind' );
	ACTION_ChangeController( 'Pawn_Hartsock', class'Mind' );
	ACTION_ChangeController( 'Pawn_Allen', class'Mind' );

	ACTION_EnableBattleDialogue();
	ACTION_HideHUD( GetLocalPlayerController(), FALSE );
	ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );

	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 2.0 );
	sleep( 1.0 );

	ACTION_RemoveHorizonTracerTarget( 'HorizonTracers02' );
	// ACTION_PlaySoundReturnHandle( 'gbxPlayerStart_AfterIntro', "D02000_SOUNDS.AMB_WIND_ARTILLERY", 1.0, 1.0, 10000 );
	sleep( 1.0 );

	// Update and display objectives
	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 );

	// Spawn Infinite Germans and move them into position
	ACTION_EnableMG42Recruiting( 'MG42_Field1', TRUE );
	ACTION_TriggerEvent( 'SpawnIGS02_01' );
	ACTION_TriggerEvent( 'SpawnIGS02_02' );
	ACTION_OrderMove( 'InfiniteGermanSquad02', 'MGPath' );

	ScriptEnd:
}
