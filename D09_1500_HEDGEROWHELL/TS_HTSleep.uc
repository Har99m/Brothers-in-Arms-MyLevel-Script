//=============================================================================
// TS_HTSleep.
//=============================================================================
class TS_HTSleep extends TriggeredScript
	placeable;

var(Events) name nmHalfTrackPawnTag;
var(Events) bool bStartOn;

var Actor A_HalfTrack;

state Default
{
	Begin:

	if ( bStartOn )
		GoToState( 'Triggered' );
}

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	ACTION_TriggerEvent( Event );

	A_HalfTrack = GetFirstActor( nmHalfTrackPawnTag );

	if ( A_HalfTrack != None )
	{
		A_HalfTrack.SetPhysics(PHYS_None);
	}

	ScriptEnd:
}
