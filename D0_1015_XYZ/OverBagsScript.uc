//=============================================================================
// OverBagsScript.
//=============================================================================
class OverBagsScript extends TriggeredScript
	placeable;
 
state Triggered
	{
	Begin:

	ACTION_OrderMove( 'GermanSquad05', 'GermanSquad05_MG' );
		sleep(1.0);
	ACTION_OrderMove( 'GermanSquad05', 'GermanSquad05_MG' );
	ACTION_OrderMove( 'GermanSquad04', 'MG1_Gunner_PathNode01' );

	ScriptEnd:
	}
