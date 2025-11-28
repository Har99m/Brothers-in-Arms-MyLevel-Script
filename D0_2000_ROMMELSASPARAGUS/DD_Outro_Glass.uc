//=============================================================================
// DD_Outro_Glass.
//=============================================================================
class DD_Outro_Glass extends DD_EndField2Script
	placeable;

var AnimPawn Pawn_Pass;

// Triggered by SM_Outro
state Triggered
{
	function OnTrigger()
	{
		GoToState( 'GlassStuff' );
	}

	Begin:

	sleep( 4.2 );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );
	ACTION_HideHUD( GetLocalPlayerController(), TRUE );
}

// Triggered by DD_EndField2Script
state GlassStuff
{
	function OnTrigger()
	{
		GoToState( 'MoreGlassStuff' );
	}

	Begin:

	Pawn_Doe = GetPawn( 'Pawn_Doe03' );

	ACTION_WaitForAnimEnd( Pawn_Doe, 0 );
	Pawn_Doe.SetPhysics( PHYS_None );

	ACTION_FlushAnimQueue( 'Pawn_Doe03' );
	ACTION_PlayAnimDirect( Pawn_Doe, 'Glider_soldier_in_pain_talking', 0.1, 1.0, TRUE );
}

// Triggered by DD_EndField2Script
state MoreGlassStuff
{
	Begin:

	ACTION_TriggerEvent( 'SpawnDoe04' );
	Pawn_Pass = AnimPawn( GetPawn('Pawn_Doe04') );

	// Setup passenger
	Pawn_Pass.Controller.bGodMode = TRUE;
	Pawn_Pass.SetCollision( FALSE, FALSE, FALSE );
	Pawn_Pass.bCollideWorld = FALSE;
	Pawn_Pass.SetPhysics( PHYS_NONE );
	Pawn_Pass.SetLocation( vect(-5500.0,-11475.0, 468.0) );
	gbxPawn(Pawn_Pass).Shadow.Destroy();
	gbxPawn(Pawn_Pass).Shadow = None; 
	// gbxPawn(Pawn_Pass).bNoShadow = TRUE;

	ACTION_SetAnimSetDirect( Pawn_Pass, "a_cin_d0_Rommels_asparagus.a_cin_d0_Rommels_asparagus" );

	ACTION_FlushAnimQueue( 'Pawn_Doe04' );
	ACTION_PlayAnimWithQueueDirect( Pawn_Pass, 'glider_passenger_stumbles_to_door', 0.1, 1.0, FALSE );
	ACTION_PlayAnimWithQueueDirect( Pawn_Pass, 'glider_passenger_idle', 0.1, 1.0, TRUE );

	// Setup Glass
	ACTION_FlushAnimQueue( 'Pawn_Doe03' );
	ACTION_PlayAnimDirect( Pawn_Doe, 'Glider_soldier_pulls_out_cig', 0.1, 1.0, FALSE );

	sleep( 2.15 );
	ACTION_AttachStaticMesh( Pawn_Doe, StaticMesh's_npc_item_us.Prop.box_cigarette', 'thompson_clip' );

	sleep( 0.85 );
	ACTION_AttachStaticMesh( Pawn_Doe, StaticMesh's_npc_item_us.Prop.cigarette', 'cig_in_hand' );

	sleep( 1.24 );
	ACTION_DetachStaticMesh( Pawn_Doe, StaticMesh's_npc_item_us.Prop.box_cigarette', 'thompson_clip' );

	sleep( 1.76 );
	ACTION_PlayAnimDirect( Pawn_Doe, 'Glider_soldier_sits_down', 0.1, 1.0, FALSE );
	ACTION_WaitForAnimEnd( Pawn_Doe, 0 );
	ACTION_PlayAnimDirect( Pawn_Doe, 'Glider_soldier_sitting_idle', 0.1, 1.0, TRUE );

	Pawn_Doe.SetPhysics( PHYS_None );

	ScriptEnd:
}
