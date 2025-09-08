//=============================================================================
// TS_OpelDriveIn.
//=============================================================================
class TS_OpelDriveIn extends TriggeredScript
	placeable;

var actor Truck1Pawn;
var actor Truck2Pawn;
var actor TruckLight;
var actor TruckEmitter[2];

state Triggered
	{
		Begin:
			//===== Define 

				SLog("SCRIPT RUNNING >>>>>> DIRP");


				Truck1Pawn = GetFirstActor( 'SM_truck1' );
				Truck2Pawn = GetFirstActor( 'SM_truck3' );

				Truck1Pawn.bHidden=False;
				Truck2Pawn.bHidden=False;

				ACTION_TeleportToActor( 'SM_truck1', 'LT_TELE_truck1' );
				ACTION_TeleportToActor( 'SM_truck3', 'LT_TELE_truck3' );

				ACTION_TriggerEvent( 'Emitter_Headlight_A' );
				ACTION_TriggerEvent( 'Emitter_Headlight_C' );
	}
