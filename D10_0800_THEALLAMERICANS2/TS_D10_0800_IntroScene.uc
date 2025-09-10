//=============================================================================
// TS_D10_0800_IntroScene.
//=============================================================================
class TS_D10_0800_IntroScene extends TriggeredScript
	placeable;



state Triggered
{
	function OnTrigger()
	{
		GoToState( 'Finish' );
	}

	Begin:




	GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_END')).bEnabled = FALSE;
	GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_TANKS')).bEnabled = FALSE;
	GbxWaypointBeacon(GetFirstActor('Beacon_Doyle')).bEnabled = FALSE;
	GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_88')).bEnabled = TRUE;
	ACTION_TriggerEvent('CSU_CP0_Characters');
	ACTION_TriggerEvent('Emitter_IntroSmoke');
	ACTION_TriggerEvent( 'BVT_Paige' );

}

state Finish
{
	function OnTrigger()
	{
	}

	Begin:

	sleep( 2.0 );
	ACTION_TriggerEvent( Event );
	GetLocalPlayerPawn().SwitchToLastWeapon();

	ScriptEnd:
}

