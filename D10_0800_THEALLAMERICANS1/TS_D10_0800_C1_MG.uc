//=============================================================================
// TS_D10_0800_C1_MG.
//=============================================================================
class TS_D10_0800_C1_MG extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_TriggerEvent('CSG_S1_MG42_MAINROAD_A');
	ACTION_OrderMove('UNIT_DE_S1_MG42_MAINROAD_A','PN_C1_MG42_Gunner');

	ScriptEnd:
	}
