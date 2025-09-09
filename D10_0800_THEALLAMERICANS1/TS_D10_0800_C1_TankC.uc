//=============================================================================
// TS_D10_0800_C1_TankC.
//=============================================================================
class TS_D10_0800_C1_TankC extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:


	ACTION_DestroyActor('GBXTrigger_TS_D10_0800_C1_Tank');
	ACTION_DestroyActor('GBXTrigger_TS_D10_0800_C1_TankB');

		sleep(0.5);
	ACTION_TriggerEvent('CSG_S1_04');
	ACTION_TriggerEvent('SpawnTank_DE_Combat1');


	ACTION_OrderMove('UNIT_DE_Tank_Combat1','PN_TankCenterMovement');


		sleep(2.0);
	ACTION_DisplayObjectiveHint(S_Localize("HINT_A"), 5.0 );
	ACTION_TriggerEvent('gbxWaypointBeacon_Panzerfaust_Crate01');

}


