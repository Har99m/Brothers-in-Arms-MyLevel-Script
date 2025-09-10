//=============================================================================
// TS_D10_0800_FlakMonitor.
//=============================================================================
class TS_D10_0800_FlakMonitor extends TriggeredScript
	placeable;

var int j ;

state Triggered
	{
	Begin:
		//===== SAVE CHECKPOINT 02
				//ACTION_TriggerEvent( 'TS_CheckPointSave_02' );

					sleep( 1.5 );

			//===== Activate midtro 
				ACTION_TriggerEvent( 'TS_D10_0800_MidtroScene' );
				ACTION_TriggerEvent( 'ET_Flare' );
				ACTION_TriggerEvent('Emitter_Flare');
				ACTION_TriggerEvent( 'gbxTrigger_BombingRun' );
				ACTION_TriggerEvent( 'PFX_FLAREMIDTRO' );

					sleep( 2.0 );

			//===== DISPLAY OBJECTIVE
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_END')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_TANKS')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_88')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('Beacon_Doyle')).bEnabled = TRUE;

				ACTION_DisplayObjectiveHint(S_Localize("HINT_B"), 4.0 );

				/*
 				ACTION_SetObjectiveStatus( 0 , OI_Complete , 'ObjectiveList' );
 				ACTION_SetObjectiveStatus( 1 , OI_Active , 'ObjectiveList' );
				ACTION_DisplayObjective( 1 , 'ObjectiveList' , 3.0 );
				*/

		ScriptEnd:
	}
