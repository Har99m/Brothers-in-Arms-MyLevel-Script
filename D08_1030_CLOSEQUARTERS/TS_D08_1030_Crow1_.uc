//=============================================================================
// TS_D08_1030_Crow1_.
//=============================================================================
class TS_D08_1030_Crow1_ extends TriggeredScript
	placeable;


state Default
	{
	Begin:

	ACTION_SetAnimSet( 'Crow3', "k_animal.crow_a_anim" );

	Crow_Loop:

	ACTION_PlayAnim( 'Crow3', 'a_idle', 0.1, 1.0);
	sleep( 4.0 );		

	Goto('Crow_Loop');
	}

state Triggered
	{
	Begin:

	ACTION_DestroyActor( 'Crow3Script_trigger' );
	ACTION_PlayAnim( 'Crow3', 'a_takeoff', 0.1, 1.0);
		sleep(0.8);

	sleep( 5.2 );

	ACTION_DestroyActor( 'Crow3' );

	}
