//=============================================================================
// TS_OrderMove.
//=============================================================================
class TS_OrderMove extends TriggeredScript
	placeable;

var(Events) name nmUnitTag, nmPathNode;
var(Events) float fTryAgain, fSleepTrigger;

state Triggered
{
	Begin:

	ACTION_OrderMove( nmUnitTag, nmPathNode );

	if ( fTryAgain > 0.0 )
	{
		sleep( fTryAgain );
		ACTION_OrderMove( nmUnitTag, nmPathNode );
	}

	sleep( fSleepTrigger );
	ACTION_TriggerEvent( Event );

	ScriptEnd:
}
