//=============================================================================
// TS_D08_1030_P47_FLYBY.
//=============================================================================
class TS_D08_1030_P47_FLYBY extends TriggeredScript
	placeable;

State Triggered
{
Begin:
	getFirstActor('SM_P47FLYBY_A').bHidden = False;
	ACTION_TriggerEvent('SCENE_P47_FLYBY_A');

	sleep(1.0);

	ACTION_PlayLocalSound( "V_PLANE.C47_PASSBY" );

	sleep(3.5);

	//ACTION_TriggerEvent('PFX_P47FLYBY_DUST');

	Sleep( 18.0 );

	getFirstActor('SM_P47FLYBY_A').bHidden = True;
}
