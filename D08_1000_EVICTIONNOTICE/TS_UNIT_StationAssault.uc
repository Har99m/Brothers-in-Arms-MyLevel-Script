//=============================================================================
// TS_UNIT_StationAssault.
//=============================================================================
class TS_UNIT_StationAssault extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_DestroyActor('Cleanup_C1_1');
	ACTION_DestroyActor('Cleanup_C1_2');
	ACTION_DestroyActor('Cleanup_C1_3');
	ACTION_DestroyActor('Cleanup_C1_4');
	ACTION_DestroyActor('Cleanup_C1_5');

	ACTION_OrderAssault('UNIT_C202','Unit_Player');
	ACTION_OrderAssault('UNIT_C203','Unit_Player');
	ACTION_OrderAssault('UNIT_C204','Unit_Player');
	ACTION_OrderAssault('UNIT_DE_C201','Unit_Player');

	}
