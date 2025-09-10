//=============================================================================
// TS_D10_0800_NewBombs.
//=============================================================================
class TS_D10_0800_NewBombs extends TriggeredScript
	placeable;

State Triggered
{
	Begin:

	// bombing run 1
	ACTION_TriggerEvent('Emitter_BombingRun_A');
	ACTION_TriggerEvent( 'PFX_BOMBRUN_1' );
	sleep(13.0);

	ACTION_TriggerEvent('StochasticTrigger_SECONDCOMBAT');
}
