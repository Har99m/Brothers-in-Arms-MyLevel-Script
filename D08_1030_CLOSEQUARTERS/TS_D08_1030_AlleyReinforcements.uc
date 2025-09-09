//=============================================================================
// TS_D08_1030_AlleyReinforcements.
//=============================================================================
class TS_D08_1030_AlleyReinforcements extends TriggeredScript
	placeable;

var Tank AP_OutroTank;
var Actorlite PN_OutroTank_00;


state Triggered
	{
	Begin:

	ACTION_DestroyActor('StochasticTrigger_AlleyMortar');

	}
