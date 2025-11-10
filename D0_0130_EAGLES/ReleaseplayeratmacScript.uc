//=============================================================================
// ReleaseplayeratmacScript.
//=============================================================================
class ReleaseplayeratmacScript extends TriggeredScript
	placeable;



State Triggered
	{
		Begin:



	sleep( 3.5 );

	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
	ACTION_SetObjectiveStatus( 1, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 1, 'ObjectiveList', 3.0 );
	ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );

			
	}
