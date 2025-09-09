//=============================================================================
// TS_Truck.
//=============================================================================
class TS_Truck extends TriggeredScript
	placeable;

var TruckOpelBlitz TOB_Ref;
var AnimPawn AP_Player;

state Default
{
	Begin:

	TOB_Ref = TruckOpelBlitz( GetFirstActor('TOB_Truck') );

	if ( TOB_Ref == None )
		TOB_Ref = TruckOpelBlitz( GetFirstActor('TruckOpelBlitzPlayer') );
	
	TOB_Ref.EntryRadius = 0;
	TOB_Ref.VehicleShadow.Destroy();

	ACTION_SetAnimSetDirect( GetLocalPlayerPawn(), "a_hold_misc.opel" );
}

state Triggered
{
	Begin:

	TOB_Ref.EntryRadius = 500;
}
