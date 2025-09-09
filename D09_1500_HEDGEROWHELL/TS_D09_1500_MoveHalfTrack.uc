//=============================================================================
// TS_D09_1500_MoveHalfTrack.
//=============================================================================
class TS_D09_1500_MoveHalfTrack extends TriggeredScript
	placeable;

var (Events) name nmHalfTrackPawnTag;
var (Events) export editinline Array<name> nmPath;
var (Events) edfindable Unit Unit_DE;

var gbxSVehicle gbxSV_HT;

state Triggered
{
	function OnTrigger()
	{
		// Busy
	}

	Begin:

	SLog( "**** Triggered ****" );

	gbxSV_HT = gbxSVehicle(GetFirstActor(nmHalfTrackPawnTag));

	if ( gbxSV_HT != None && Unit_DE != None && Unit_DE.GetNumLivingMembers() > 0 )
		GoToState( 'FollowPath' );
	else
	{
		SLog( "**** Did not find " $ nmHalfTrackPawnTag $ ", gbxSV_HT " $ gbxSV_HT $ " ****" );
	}
}

state FollowPath
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	gbxSV_HT.SetPhysics(PHYS_Karma);
	
	ACTION_VehicleFollowPath( gbxSV_HT, nmPath );

	while ( !VehicleIsAtDestination(gbxSV_HT) )
		sleep(0.1);

	ACTION_TriggerEvent( Event );

	SLog( "**** Complete ****" );

	ScriptEnd:
}
