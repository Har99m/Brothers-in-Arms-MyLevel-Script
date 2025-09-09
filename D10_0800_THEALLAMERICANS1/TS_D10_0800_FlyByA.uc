//=============================================================================
// TS_D10_0800_FlyByA.
//=============================================================================
class TS_D10_0800_FlyByA extends TriggeredScript
	placeable;

State Triggered
{
Begin:
	getFirstActor('SM_P47FLYBY_A').bHidden = False;
	ACTION_TriggerEvent('PlaneFlyBy');

	sleep(0.2);

	ACTION_PlayLocalSound( "V_PLANE.C47_PASSBY" );

	sleep(2);
	ACTION_TriggerEvent('Emitter_PlaneKickupDustA');
	sleep(2.5);

	ACTION_TriggerEvent('TrigVol_End');
	ACTION_TriggerEvent('BVT_END');
	GetFirstActor('RubblePile_END').bHidden = true;
	GetFirstActor('RubblePile_END').setCollision(FALSE,FALSE,FALSE);
	ACTION_TriggerEvent('gbxExplosionTrigger_MortarEnd');
	ACTION_TriggerEvent('Emitter_BVT_END');

	sleep(1.3);
	ACTION_TriggerEvent('Emitter_Bomb_A1');
	ACTION_TriggerEvent('gbxExplosionTrigger_MortarEnd2');

	Sleep(4.7);

	getFirstActor('SM_P47FLYBY_A').bHidden = True;
}
