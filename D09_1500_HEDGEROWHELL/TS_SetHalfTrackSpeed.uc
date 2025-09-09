//=============================================================================
// TS_SetHalfTrackSpeed.
//=============================================================================
class TS_SetHalfTrackSpeed extends TriggeredScript
	placeable;

var (Events) name nmHalfTrackPawnTag;
var (Events) float fSpeed;

var Halftrack gbxHT;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	SLog( "**** Triggered ****" );

	gbxHT = Halftrack(GetFirstActor(nmHalfTrackPawnTag));

	if ( gbxHT != None && fSpeed > 0 )
	{
		gbxHT.MaxThrust = fSpeed;
	}

	ScriptEnd:
}
