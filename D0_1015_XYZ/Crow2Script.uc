//=============================================================================
// Crow2Script.
//=============================================================================
class Crow2Script extends TriggeredScript
	placeable;

state Default
	{
	Begin:

	ACTION_SetAnimSet( 'Crow2', "k_animal.crow_a_anim" );

	Crow_Loop:

	ACTION_PlayAnim( 'Crow2', 'a_idle', 0.1, 1.0);
	sleep( 4.0 );		

	Goto('Crow_Loop');
	}

state Triggered
	{
	Begin:

	ACTION_DestroyActor( 'Crow2Script_trigger' );
	ACTION_PlayAnim( 'Crow2', 'a_takeoff', 0.1, 1.0);
		sleep(0.8);

	sleep( 10.0 );

	ACTION_DestroyActor( 'Crow2' );

	}
