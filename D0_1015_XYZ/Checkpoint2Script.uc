//=============================================================================
// Checkpoint2Script.
//=============================================================================
class Checkpoint2Script extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_SaveMemoryReport("XYZ_Checkpoint_2");
	ACTION_CheckPointSave( 3 );

	ScriptEnd:
	}
