//=============================================================================
// TS_D10_0800_CP1_Misc.
//=============================================================================
class TS_D10_0800_CP1_Misc extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:


				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_END')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_TANKS')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('Beacon_Doyle')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_88')).bEnabled = TRUE;

	}
