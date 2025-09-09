//=============================================================================
// TS_AdjustHalfTrackTurret.
//=============================================================================
class TS_AdjustHalfTrackTurret extends TS_SetHalfTrackSpeed
	placeable;

var(Events) float Zone1OuterRadius;
var(Events) float Zone2OuterRadius;
var(Events) float Zone3OuterRadius;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	gbxHT = Halftrack(GetFirstActor(nmHalfTrackPawnTag));

	if ( gbxHT != None )
	{
		gbxHT.MyMG.Zone1OuterRadius = Zone1OuterRadius;
		gbxHT.MyMG.Zone2OuterRadius = Zone2OuterRadius;
		gbxHT.MyMG.Zone3OuterRadius = Zone3OuterRadius;
	}

	ScriptEnd:
}
