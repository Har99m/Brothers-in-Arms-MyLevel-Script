//=============================================================================
// TS_New_PlaneFlyBy.
//=============================================================================
class TS_New_PlaneFlyBy extends TriggeredScript
	placeable;

State Triggered
{
Begin:
	getFirstActor('SM_P47FLYBY_A').bHidden = False;
	ACTION_TriggerEvent('SCENE_PlaneFlyBy');

	sleep(0.2);

	ACTION_PlayLocalSound( "V_PLANE.C47_PASSBY" );

	sleep(2);
	ACTION_TriggerEvent('Emitter_PlaneKickupDustA');
	sleep(2.5);


	sleep(1.3);
	ACTION_TriggerEvent('Emitter_BombOpenEnd');
	ACTION_TriggerEvent('GbxExplosionTrigger_BombOpenEnd');

	Sleep(4.7);

	getFirstActor('SM_P47FLYBY_A').bHidden = True;
}
