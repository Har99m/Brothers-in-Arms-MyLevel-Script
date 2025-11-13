//=============================================================================
// Checkpoint3Script.
//=============================================================================
class Checkpoint3Script extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_DestroyActor('G14');
	ACTION_DestroyActor('G15');
	ACTION_DestroyActor('G16');
	ACTION_DestroyActor('G17');

	ACTION_SaveMemoryReport("XYZ_Checkpoint_3");
	ACTION_CheckPointSave( 4 );

	ScriptEnd:
	}


