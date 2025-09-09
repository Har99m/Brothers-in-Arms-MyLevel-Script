//=============================================================================
// TS_D08_1030_PanzerfaustHint.
//=============================================================================
class TS_D08_1030_PanzerfaustHint extends TriggeredScript
	placeable;

state Triggered
	{
	function Ontrigger()
	{
	GotoState( 'LureTank' );
	}
Begin:

	ACTION_DisplayObjectiveHint(S_Localize("HINT_C" ), 3.5 );

	Loop:

	ACTION_DisplayObjectiveHint(S_Localize("HINT_D" ), 3.5 );
		sleep(25);

	goTo('Loop');

}


state LureTank
	{
	function Ontrigger()
	{
	GotoState( 'Null' );
	}
Begin:

	sleep(3.0);

	ACTION_TriggerEvent('SCENE_P47_FLYBY_B');
	ACTION_DisplayObjectiveHint(S_Localize("HINT_E" ), 3.5 );

}


state Null
{
	function Ontrigger()
	{
	GotoState( 'Null' );
	}
Begin:

}
