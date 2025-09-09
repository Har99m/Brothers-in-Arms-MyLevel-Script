//=============================================================================
// TS_PrepLevelOutro.
//=============================================================================
class TS_PrepLevelOutro extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_TriggerEvent('Emitter_BombingRun_01');
	ACTION_TriggerEvent('Emitter_BombingRun_01');

	ACTION_TriggerEvent('TS_D10_0800_FlyByA');

	sleep(10.0);

	/*
	ACTION_TriggerEvent('TrigVol_End');
	ACTION_TriggerEvent('BVT_END');
	GetFirstActor('RubblePile_END').bHidden = true;
	GetFirstActor('RubblePile_END').setCollision(FALSE,FALSE,FALSE);
	ACTION_TriggerEvent('gbxExplosionTrigger_MortarEnd');
	ACTION_TriggerEvent('Emitter_BVT_END');
	*/

	}
