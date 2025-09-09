//=============================================================================
// TS_CancelMovement.
//=============================================================================
class TS_CancelMovement extends TriggeredScript
	placeable;

var(Events) float fSleep;
var(Events) name nmCancelEvent;

state Triggered
{
	function OnTrigger()
	{
		GoToState( 'DontCancel' );
	}

	Begin:

	sleep(fSleep);
	GoToState( 'TooLate' );
}

state TooLate
{
	function OnTrigger()
	{
		// Do nothing
	}

	Begin:

	SLog( "**** Turning off volume ****" );
	ACTION_TriggerEvent( Event );
	
	ScriptEnd:
}

state DontCancel
{
	function OnTrigger()
	{
		// Do nothing
	}

	Begin:

	ACTION_TriggerEvent( nmCancelEvent );

}
