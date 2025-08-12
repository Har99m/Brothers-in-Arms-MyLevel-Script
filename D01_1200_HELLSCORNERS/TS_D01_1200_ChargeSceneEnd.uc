//=============================================================================
// TS_D01_1200_ChargeSceneEnd.
//=============================================================================
class TS_D01_1200_ChargeSceneEnd extends TriggeredScript
	placeable;

var bool bChargeHasEnded;

state Default
{
	Begin:

	bChargeHasEnded = false;

}

state Triggered
{
	Begin:

	bChargeHasEnded = true;

}
