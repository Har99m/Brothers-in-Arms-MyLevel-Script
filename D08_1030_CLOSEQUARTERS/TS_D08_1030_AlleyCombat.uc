//=============================================================================
// TS_D08_1030_AlleyCombat.
//=============================================================================
class TS_D08_1030_AlleyCombat extends TriggeredScript
	placeable;

state Triggered
	{
    function OnTrigger()
    {
		GotoState( 'AbortFlank' );
    }
	Begin:

	ACTION_UnblockNavPoints('PN_BLOCK_C3');
	ACTION_TriggerEvent( 'BVT_C3_Rushing_Germans' );

	ACTION_TriggerEvent('StochasticTrigger_AlleyMortar');

	ACTION_EnableMG42Recruiting( 'C1_MG42_1', FALSE );

	ACTION_AssignToUnit('C3_MG42_1a','UNIT_DE_C302');
		sleep(0.2);
	ACTION_OrderMove('UNIT_DE_C301','PN_UNIT_DE_C301_01');
		sleep(0.2);
	ACTION_OrderMove('UNIT_DE_C302','PN_UNIT_DE_C302_01');

	sleep(10);

	ACTION_OrderMove('UNIT_DE_C301','PN_UNIT_DE_C301_02');
	ACTION_OrderMove('UNIT_DE_C302','PN_UNIT_DE_C301_01');

	goToState('NULL');

	StateEnd:
	}

state AbortFlank
	{
	Begin:

	//ACTION_TriggerEvent('TV_GBXMsgSI_CA_02');
	SLog("NULL");

	ScriptEnd:
	}

state NULL
	{
	Begin:

	}
