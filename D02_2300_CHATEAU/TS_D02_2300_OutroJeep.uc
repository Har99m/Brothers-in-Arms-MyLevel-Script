//=============================================================================
// 	TS_D02_2300_OutroJeep.
//	This is for pat
//=============================================================================
class TS_D02_2300_OutroJeep extends TriggeredScript
	placeable;

var animpawn AP_Jeepdriver, AP_Jeeppass, AP_Jeep;

state Triggered
{
Begin:

			AP_Jeepdriver = AnimPawn(GetPawn('AP_Baker'));
			AP_Jeepdriver.bNoTurnBody = true;

			AP_JeepPass = AnimPawn(GetPawn('AP_Mac'));
			AP_JeepPass.bNoTurnBody = true;

	ACTION_SetAnimSetDirect( AP_JeepPass, "a_cin_d15_Prologue.a_cin_d15_Prologue" );
	ACTION_SetAnimSetDirect( AP_Jeepdriver, "a_cin_d02_Chateau.a_cin_d02_Chateau" );
	ACTION_SetAnimSet( 'AP_Jeep', "k_vehicle_de.de_opel_blitz_chateau" );

	// Allow pawns to be attached to this pawn

AP_Jeep = AnimPawn( GetPawn( 'AP_Jeep' ) );
	AP_Jeep.bCanBeBaseForPawns = TRUE;


	AP_JeepPass.SetPhysics( PHYS_None );
	AP_JeepDriver.SetPhysics( PHYS_None );

	gbxPawn(AP_Jeeppass).Shadow.Destroy();
	gbxPawn(AP_Jeeppass).Shadow = None; 
	gbxPawn(AP_JeepDriver).Shadow.Destroy();
	gbxPawn(AP_JeepDriver).Shadow = None; 

	AP_Jeep.AttachToBone( AP_Jeeppass, 'chassis' );
	AP_Jeep.AttachToBone( AP_JeepDriver, 'chassis' );

//	AP_Jeep.AttachToBone( GetFirstActor( 'OpelDust01' ), 'tires_front' );


//	AP_Jeeppass.SetRelativeRotation( rot(0.0, 0.0, -16384.0) );
	AP_Jeeppass.SetRelativeLocation( vect(0, 0, -20.0 ) );  // +right/left, +forward/back, +down/up

//	AP_JeepDriver.SetRelativeRotation( rot(0.0, 0.0, -16384.0) );
//	AP_JeepDriver.SetRelativeLocation( vect(106.5, -16.0, 64.0) );  // +forward/back, +down/up, +right/left
	AP_JeepDriver.SetRelativeLocation( vect(0, 0, -20.0) );  // +right/left, +forward/back, +down/up

	ACTION_PlayAnimDirect( AP_Jeep, 'baker_drives_up', 0.2, 1.0 , False);
	ACTION_PlayAnimDirect( AP_Jeepdriver, 'Baker_idles_in_truck', 0.2, 1.0, True);
	ACTION_PlayAnimDirect( AP_JeepPass, 'jeep_scene_passenger', 0.2, 1.0 );

	sleep(4.0);

}
