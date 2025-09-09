//=============================================================================
// TS_D081000_CounterAttack.
//=============================================================================
class TS_D081000_CounterAttack extends TriggeredScript
	placeable;

State Triggered
{
Begin:
	//counter attack!!

	ACTION_TriggerEvent('DistantArtillery_1');

	ACTION_KillPawn('M1Right');
	ACTION_KillPawn('M1Left');
	ACTION_KillPawn('M1Cent');
	sleep(1.0);
	ACTION_TriggerEvent('CSG_C204');
	ACTION_OrderMove('UNIT_C204', 'PN_C204', False );
	sleep(0.2);
	ACTION_TriggerEvent('CSG_C203');
	sleep(0.2);
	ACTION_TriggerEvent('CSG_C202');
	sleep(0.2);
	ACTION_TriggerEvent('CSG_Unit_DE_C2_01');
	sleep(0.2);
	ACTION_OrderMove('UNIT_DE_C2_01', 'PN_C2_01' );
	ACTION_OrderMove('UNIT_C203', 'PN_C207', False );
	ACTION_OrderMove('UNIT_C202', 'PN_C205', False );

	sleep(10.0);
	ACTION_OrderMove('UNIT_C203', 'PN_C208', False );
	sleep(5.0);
	ACTION_OrderMove('UNIT_C202', 'PN_C206', False );
	sleep(4.0);
	ACTION_OrderMove('UNIT_C204', 'PN_C201', False );
	ACTION_OrderMove('UNIT_C203', 'PN_C209', False );
	sleep(3.0);
	ACTION_OrderMove('UNIT_C203', 'PN_C210', False );
	Sleep(10.0);
	ACTION_OrderMove('UNIT_C202', 'PN_C203', False );	
}
