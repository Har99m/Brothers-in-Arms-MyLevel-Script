//=============================================================================
// TS_D10_0800_C1_Tank.
//=============================================================================
class TS_D10_0800_C1_Tank extends TriggeredScript
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


	ACTION_DestroyActor('GBXTrigger_TS_D10_0800_C1_Tankb');
	ACTION_DestroyActor('GBXTrigger_TS_D10_0800_C1_TankC');
	ACTION_DestroyActor('GBXTrigger_TS_D10_0800_C1_MG');


		sleep(0.5);
	ACTION_TriggerEvent('CSG_S1_04');
	ACTION_TriggerEvent('SpawnTank_DE_Combat1');
	ACTION_TriggerEvent('TS_D10_0800_DE_4_Flank');
		sleep(1.0);

	Tank_C1 = Tank(GetPawn('Tank_DE_Combat1'));
	PN_Tank_C1_1 = GetNavigationPoint( 'PN_UNIT_DE_Tank_1' );
	PN_Tank_C1_2 = GetNavigationPoint( 'PN_UNIT_DE_Tank_2' );

	TankMoveLoop:

	ACTION_OrderMove('UNIT_DE_Tank_Combat1','PN_UNIT_DE_Tank_1');


		sleep(2.0);
	ACTION_DisplayObjectiveHint(S_Localize("HINT_A"), 5.0 );
	ACTION_TriggerEvent('gbxWaypointBeacon_Panzerfaust_Crate01');

	/*

	while ( !ACTION_TankIsAtDestination( Tank_C1, PN_Tank_C1_1 ))
		{
			sleep(5.0);
		}

	ACTION_OrderMove('UNIT_DE_Tank_Combat1','PN_UNIT_DE_Tank_2');

	while ( !ACTION_TankIsAtDestination( Tank_C1, PN_Tank_C1_2 ))
		{
			sleep(5.0);
		}

	goTo('TankMoveLoop');

	*/
	/*

	ACTION_TankEnterScriptedMode(Tank_C1);
		sleep(1.0);
	Tank_C1 = Tank(GetPawn('Tank_DE_Combat1'));
	PN_Tank_C1_1 = GetNavigationPoint( 'PN_UNIT_DE_Tank_1' );
	PN_Tank_C1_2 = GetNavigationPoint( 'PN_UNIT_DE_Tank_2' );
	LT_Tank_C1_1 = GetFirstActor('LT_Tank_C1_1');
	LT_Tank_C1_2 = GetFirstActor('LT_Tank_C1_2');
	LT_Tank_C1_3 = GetFirstActor('LT_Tank_C1_3');
	LT_Tank_C1_4 = GetFirstActor('LT_Tank_C1_4');

	ACTION_TankSetEnemy(Tank_C1, GetLocalPlayerPawn(), TRUE );
	ACTION_TankSetSpeed(Tank_C1, 1);

	Idle_Loop:

	ACTION_TankLeaveScriptedMode(Tank_C1);
	ACTION_TankSetEnemy(Tank_C1, GetLocalPlayerPawn(), TRUE );
		sleep(15.0);
	ACTION_TankEnterScriptedMode(Tank_C1);

	ACTION_TankMoveTo(Tank_C1, PN_Tank_C1_1 );
	ACTION_TankCommanderOpenHatch(Tank_C1);
	//ACTION_TankSetEnemy(Tank_C1, LT_Tank_C1_3, TRUE );

	while ( !ACTION_TankIsAtDestination( Tank_C1, PN_Tank_C1_1 ))
		{
			sleep(5.0);
		ACTION_TankMoveTo(Tank_C1, PN_Tank_C1_1 );
		ACTION_TankFireCannon(Tank_C1, FALSE );
		//ACTION_TankSetEnemy(Tank_C1, LT_Tank_C1_4, TRUE );		
		}

	ACTION_TankLeaveScriptedMode(Tank_C1);
	ACTION_TankSetEnemy(Tank_C1, GetLocalPlayerPawn(), TRUE );
		sleep(10.0);
	ACTION_TankEnterScriptedMode(Tank_C1);

	ACTION_TankMoveTo(Tank_C1, PN_Tank_C1_2 );
	ACTION_TankCommanderCloseHatch(Tank_C1);
	//ACTION_TankSetEnemy(Tank_C1, LT_Tank_C1_2, TRUE );

	while ( !ACTION_TankIsAtDestination( Tank_C1, PN_Tank_C1_2 ))
		{
			sleep(5.0);
		ACTION_TankMoveTo(Tank_C1, PN_Tank_C1_2 );
		ACTION_TankFireCannon(Tank_C1, FALSE );
		//ACTION_TankSetEnemy(Tank_C1, LT_Tank_C1_1, TRUE );
		}

	goTo('Idle_Loop');

	*/

	ScriptEnd:
	}
