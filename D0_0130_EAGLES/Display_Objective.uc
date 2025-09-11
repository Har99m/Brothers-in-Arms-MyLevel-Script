//=============================================================================
// Display_Objective.
//=============================================================================
class Display_Objective extends TriggeredScript
	placeable;

state Triggered
	{
		Begin:
				sleep (3.0);

			ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
			ACTION_DisplayObjective( 0, 'ObjectiveList', 3.0 );

		ScriptEnd:
	}
