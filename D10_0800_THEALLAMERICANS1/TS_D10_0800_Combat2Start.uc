//=============================================================================
// TS_D10_0800_Combat2Start.
//=============================================================================
class TS_D10_0800_Combat2Start extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_TriggerEvent('CSG_UNIT_DE_C201');
	ACTION_TriggerEvent('CSG_UNIT_DE_C202');
		sleep(1.0);
	ACTION_OrderMove( 'UNIT_DE_C201', 'PN_UNIT_DE_C201_01' );
	ACTION_OrderMove( 'UNIT_DE_C202', 'PN_UNIT_DE_C202_01' );

	}
