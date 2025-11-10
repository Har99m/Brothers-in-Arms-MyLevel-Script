//=============================================================================
// Crow2Script.
//=============================================================================
class Crow2Script extends TriggeredScript
	placeable;

state Default
{
Begin:

	ACTION_SetAnimSet( 'Crow2', "k_animal.crow_b_anim" );
	ACTION_PlayAnim( 'Crow2', 'b_idle', 0.1, 1.0, true);

}

state Triggered
{
Begin:

	ACTION_DestroyActor( 'Crow2Script_trigger' );
	ACTION_DestroyActor( 'Crow2Script_othertrigger' );
	ACTION_PlayAnim( 'Crow2', 'b_takeoff_long', 0.1, 1.0);

	sleep( 18.3 );

	ACTION_DestroyActor( 'Crow2' );

}
