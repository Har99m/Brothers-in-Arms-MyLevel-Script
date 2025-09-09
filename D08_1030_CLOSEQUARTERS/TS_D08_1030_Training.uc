//=============================================================================
// TS_D08_1030_Training.
//
// NO LONGER USED FOR TRAINING
//=============================================================================
class TS_D08_1030_Training extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	ACTION_DestroyActor( 'GBXTrig_TrainStep1' );
	ACTION_SetObjectiveBeaconState( 'gbxWaypointBeacon_MainStreet', true, false, true );
	ACTION_SetObjectiveBeaconState( 'gbxWaypointBeacon_Training', false, false, false );

		//===== Release player


ScriptEnd:
}
