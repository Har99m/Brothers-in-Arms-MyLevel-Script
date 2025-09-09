//=============================================================================
// TS_DemiGodToggle.
//=============================================================================
class TS_DemiGodToggle extends TriggeredScript
	placeable;

var(Events) name nmPawnTag;

var Pawn Pawn_Ref;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	ACTION_TriggerEvent( Event );

	// Wait for controller to update
	sleep( 1.0 );

	Pawn_Ref = Pawn( GetFirstActor(nmPawnTag) );

	if ( Pawn_Ref != None )
		GoToState( 'Toggle' );
	else
		SLog( "**** Error " $ nmPawnTag $ " not found. ****" );
}

state Toggle
{
	function OnTrigger()
	{
		GoToState( 'Toggle' );
	}

	Begin:

	Pawn_Ref.Controller.bDemiGod = !Pawn_Ref.Controller.bDemiGod;
	SLog( "**** Successfull toggled DemiGod on " $ Pawn_Ref $ " ****" );

	ScriptEnd:
}
