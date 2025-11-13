//=============================================================================
// KM03Script.
//=============================================================================
class KM03Script extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	sleep(2.0);
	ACTION_SetAnimSet( 'KM03', "a_cin_d5_Ripe_Pickings.a_cin_d5_Ripe_Pickings" );

	Idle_Loop:

		// GARNETT CRATE IDLE 1 (L = 7.8)
		ACTION_PlayAnim( 'KM03', 'sitting_on_crate_idle_1', 0.2, 1.0);
		sleep( 7.8 );

		// GARNETT CRATE IDLE 2 (L = 9.7)
		ACTION_PlayAnim( 'KM03', 'sitting_on_crate_idle_2', 0.2, 1.0);
		sleep( 9.7 );

		// GARNETT CRATE IDLE 3 (L = 8.3)
		ACTION_PlayAnim( 'KM03', 'sitting_on_crate_idle_3', 0.2, 1.0);
		sleep( 8.3 );

	Goto( 'Idle_Loop' );

}


