//=============================================================================
// TS_D10_0800_Hint_B.
//=============================================================================
class TS_D10_0800_Hint_B extends TriggeredScript
	placeable;

	state Triggered
		{
		Begin:

		ACTION_DisplayObjectiveHint("", 0 );
		GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_Panzerfaust_Crate01')).bEnabled = False;
		ACTION_TriggerEvent('gbxWaypointBeacon_Panzerfaust_Crate02');
		ACTION_DisplayObjectiveHint(S_Localize("HINT_B"), 5.0 );
		ACTION_TriggerEvent('TS_D08_1000_BombingRun_One');

		sleep(5.0);

		ACTION_DisplayObjectiveHint(S_Localize("HINT_D"), 5.0 );

		}
