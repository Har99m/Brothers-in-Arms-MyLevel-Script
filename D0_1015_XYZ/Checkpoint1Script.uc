//=============================================================================
// Checkpoint1Script.
//=============================================================================
class Checkpoint1Script extends TriggeredScript
	placeable;


state Triggered
	{
	Begin:

	ACTION_SaveMemoryReport("XYZ_Checkpoint_1");
	ACTION_CheckPointSave( 2 );

	ScriptEnd:
	}
