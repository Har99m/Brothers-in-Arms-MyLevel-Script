//=============================================================================
// TS_D00_1630_SetupHT_CP.
//=============================================================================
class TS_D00_1630_SetupHT_CP extends TriggeredScript
	placeable;

var bool bCheckpointLoaded;

state default
{
	Begin:

	bCheckpointLoaded = false;

}

state Triggered
{
	Begin:

	bCheckpointLoaded = true;

	ACTION_TriggerEvent( 'TS_D00_1630_BossHalfTrack' );

}
