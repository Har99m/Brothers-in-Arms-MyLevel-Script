//=============================================================================
// Crow4Script.
//=============================================================================
class Crow4Script extends TriggeredScript
	placeable;

state Default
{
Begin:

	ACTION_SetAnimSet( 'Crow4', "k_animal.crow_b_anim" );
	ACTION_PlayAnim( 'Crow4', 'b_idle', 0.1, 1.0, true);

}

state Triggered
{
Begin:

	ACTION_DestroyActor( 'Crow4Script_trigger' );
	ACTION_DestroyActor( 'Crow4Script_othertrigger' );
	ACTION_PlayAnim( 'Crow4', 'b_takeoff_long', 0.1, 1.0);

	sleep( 18.3 );

	ACTION_DestroyActor( 'Crow4' );

}
