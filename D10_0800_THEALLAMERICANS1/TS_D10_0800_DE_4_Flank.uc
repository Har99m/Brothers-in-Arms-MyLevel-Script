//=============================================================================
// TS_D10_0800_DE_4_Flank.
//=============================================================================
class TS_D10_0800_DE_4_Flank extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	sleep(10.0);
	ACTION_OrderMove('Unit_DE_S1_04','PN_UNIT_DE04_02');

	ScriptEnd:
	}
