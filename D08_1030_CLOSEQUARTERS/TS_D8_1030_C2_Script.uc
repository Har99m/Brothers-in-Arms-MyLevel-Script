//=============================================================================
// TS_D8_1030_C2_Script.
//=============================================================================
class TS_D8_1030_C2_Script extends TriggeredScript
	placeable;

var pawn DE_C202_1, DE_C202_2;

state Triggered
	{
	Begin:

	ACTION_TriggerEvent('CSG_UNIT_DE_C201');
	ACTION_TriggerEvent('CSG_UNIT_DE_C202');

	ACTION_OrderMove( 'UNIT_DE_C201', 'PN_UNIT_DE_C201_1' );
	ACTION_OrderMove( 'UNIT_DE_C202', 'PN_UNIT_DE_C202_1' );

	ACTION_DestroyActor('StochasticTrigger_MortarMainStreet');
	ACTION_UnblockNavPoints( 'PN_Checkpoint2Alley' );
	ACTION_UnblockNavPoints('PN_BLOCK_C2');
	}
