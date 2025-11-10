//=============================================================================
// Crow3Script.
//=============================================================================
class Crow3Script extends TriggeredScript
	placeable;

state Default
{
Begin:

	ACTION_SetAnimSet( 'Crow3', "k_animal.crow_a_anim" );
	ACTION_PlayAnim( 'Crow3', 'a_idle', 0.1, 1.0, true);

}

state Triggered
{
Begin:

	ACTION_DestroyActor( 'Crow3Script_trigger' );
	ACTION_DestroyActor( 'Crow3Script_othertrigger' );
	ACTION_PlayAnim( 'Crow3', 'a_takeoff', 0.1, 1.0);

	sleep( 6.6 );

	ACTION_DestroyActor( 'Crow3' );

}
