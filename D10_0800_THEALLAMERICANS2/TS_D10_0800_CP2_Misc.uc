//=============================================================================
// TS_D10_0800_CP2_Misc.
//=============================================================================
class TS_D10_0800_CP2_Misc extends TriggeredScript
	placeable;

state Triggered
	{
		Begin:

				sleep( 1.0 );

			//===== Set Flak 88's as destroyed
				ACTION_SetTurretDestroyed( 'Flak_88_A' );
				ACTION_SetTurretDestroyed( 'Flak_88_B' );

				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_END')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_TANKS')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_88')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('Beacon_Doyle')).bEnabled = TRUE;

			//===== Move up MG team
				ACTION_OrderMove( 'Unit_DE_S6_01' , 'PN_S6_MG_Gunner' );

				ACTION_TriggerEvent( 'TS_D10_0800_MidtroScene' );
				ACTION_TriggerEvent( 'PFX_FLAREMIDTRO' );

				
		ScriptEnd:
	}
