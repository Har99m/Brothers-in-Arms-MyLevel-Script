//=============================================================================
// TS_D10_0800_C1_Tankb.
//=============================================================================
class TS_D10_0800_C1_Tankb extends TriggeredScript
	placeable;

var Tank Tank_C1;
var actorLite PN_Tank_C1_1;
var actorLite PN_Tank_C1_2;

var actor LT_Tank_C1_1;
var actor LT_Tank_C1_2;
var actor LT_Tank_C1_3;
var actor LT_Tank_C1_4;

state Triggered
	{
	Begin:

	ACTION_DestroyActor('GBXTrigger_TS_D10_0800_C1_TankC');
	ACTION_DestroyActor('GBXTrigger_TS_D10_0800_C1_Tank');

	ACTION_OrderTarget('UNIT_DE_S1_MG42_MAINROAD_A','Unit_Player');

		sleep(0.5);
	ACTION_TriggerEvent('SpawnTank_DE_Combat1');
	//ACTION_TriggerEvent('TS_D10_0800_DE_4_Flank');
		sleep(1.0);

	Tank_C1 = Tank(GetPawn('Tank_DE_Combat1'));
	PN_Tank_C1_1 = GetNavigationPoint( 'PN_UNIT_DE_Tank_1' );
	PN_Tank_C1_2 = GetNavigationPoint( 'PN_UNIT_DE_Tank_2' );

	TankMoveLoop:

	ACTION_OrderMove('UNIT_DE_Tank_Combat1','PN_UNIT_DE_Tank_2');


		sleep(2.0);
	ACTION_DisplayObjectiveHint(S_Localize("HINT_A"), 5.0 );
	ACTION_TriggerEvent('gbxWaypointBeacon_Panzerfaust_Crate01');

}
