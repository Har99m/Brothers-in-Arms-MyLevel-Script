//=============================================================================
// Crow1Script.
//=============================================================================
class Crow1Script extends TriggeredScript
	placeable;

state Default
{
Begin:

	ACTION_SetAnimSet( 'Crow1', "k_animal.crow_b_anim" );
	ACTION_PlayAnim( 'Crow1', 'b_idle', 0.1, 1.0, true);

}

state Triggered
{
Begin:

	ACTION_DestroyActor( 'Crow1Script_trigger' );
	ACTION_DestroyActor( 'Crow1Script_othertrigger' );
	ACTION_PlayAnim( 'Crow1', 'b_takeoff_long', 0.1, 1.0);

	sleep( 18.3 );

	ACTION_DestroyActor( 'Crow1' );

}
