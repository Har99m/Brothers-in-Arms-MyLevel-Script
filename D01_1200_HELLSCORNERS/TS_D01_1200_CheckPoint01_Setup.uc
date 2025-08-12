//=============================================================================
// TS_D01_1200_CheckPoint01_Setup.
//=============================================================================
class TS_D01_1200_CheckPoint01_Setup extends TriggeredScript
	placeable;

state Triggered
	{
		Begin:

	ACTION_StartRain( 1.0 );

			//===== Unhide parachute drops 1 , 2 , 3

				ACTION_TriggerEvent( 'TS_D01_1200_SupplyDrop' );

	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 );


		ScriptEnd:
	}
