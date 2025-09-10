//=============================================================================
// TS_D15_1130_Jeep.
//=============================================================================
class TS_D15_1130_Jeep extends TriggeredScript
	placeable;

var animpawn AP_Jeepdriver, AP_Jeeppass, AP_Jeep;

state Triggered
{
Begin:


			AP_Jeepdriver = AnimPawn(GetPawn('AP_JeepDriver'));
			AP_Jeepdriver.bNoTurnBody = true;

			AP_JeepPass = AnimPawn(GetPawn('AP_JeepPass'));
			AP_JeepPass.bNoTurnBody = true;

	// Allow pawns to be attached to this pawn
	AP_Jeep = AnimPawn( GetPawn( 'AP_Jeep' ) );
	AP_Jeep.bCanBeBaseForPawns = TRUE;

	ACTION_SetAnimSetDirect( AP_JeepPass, "a_cin_d15_Prologue.a_cin_d15_Prologue" );
	ACTION_SetAnimSetDirect( AP_Jeepdriver, "a_cin_d15_Prologue.a_cin_d15_Prologue" );
	ACTION_SetAnimSetDirect( AP_Jeep, "k_vehicle_us.prologue_jeep_anim" );

	AP_JeepPass.SetPhysics( PHYS_None );
	AP_JeepDriver.SetPhysics( PHYS_None );

	gbxPawn(AP_Jeeppass).Shadow.Destroy();
	gbxPawn(AP_Jeeppass).Shadow = None; 
	gbxPawn(AP_JeepDriver).Shadow.Destroy();
	gbxPawn(AP_JeepDriver).Shadow = None; 

	AP_Jeep.AttachToBone( AP_Jeeppass, 'jeep_chassis' );
	AP_Jeep.AttachToBone( AP_JeepDriver, 'jeep_chassis' );
//	AP_Jeep.AttachToBone( GetFirstActor( 'OpelDust01' ), 'tires_front' );


//	AP_Jeeppass.SetRelativeRotation( rot(0.0, 0.0, -16384.0) );
	AP_Jeeppass.SetRelativeLocation( vect(0, 0, -20.0 ) );  // +right/left, +forward/back, +down/up

//	AP_JeepDriver.SetRelativeRotation( rot(0.0, 0.0, -16384.0) );
//	AP_JeepDriver.SetRelativeLocation( vect(106.5, -16.0, 64.0) );  // +forward/back, +down/up, +right/left
	AP_JeepDriver.SetRelativeLocation( vect(0, 0, -20.0) );  // +right/left, +forward/back, +down/up

	ACTION_PlayAnimDirect( AP_Jeep, 'prologue', 0.2, 1.0 );
	ACTION_PlayAnimDirect( AP_Jeepdriver, 'jeep_scene_driver', 0.2, 1.0 );
	ACTION_PlayAnimDirect( AP_JeepPass, 'jeep_scene_passenger', 0.2, 1.0 );
}
