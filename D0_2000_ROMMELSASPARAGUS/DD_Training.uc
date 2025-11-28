//=============================================================================
// DD_Training.
//=============================================================================
class DD_Training extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	// Display Training
	if ( !ACTION_IsTrainingDisabled() )
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_A"), 5.0 );

	ScriptEnd:
}
