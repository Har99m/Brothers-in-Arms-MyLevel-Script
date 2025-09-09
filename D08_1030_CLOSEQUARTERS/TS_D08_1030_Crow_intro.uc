//=============================================================================
// TS_D08_1030_Crow_intro.
//=============================================================================
class TS_D08_1030_Crow_intro extends TriggeredScript
	placeable;


state Default
	{
	Begin:

	ACTION_SetAnimSet( 'Crow1', "k_animal.crow_a_anim" );
	ACTION_SetAnimSet( 'Crow2', "k_animal.crow_a_anim" );
	ACTION_SetAnimSet( 'Crow4', "k_animal.crow_a_anim" );

	Crow_Loop:

	ACTION_PlayAnim( 'Crow4', 'b_idle', 0.1, 1.0);
	ACTION_PlayAnim( 'Crow1', 'b_idle', 0.1, 1.0);
	ACTION_PlayAnim( 'Crow2', 'b_idle', 0.1, 1.0);
	sleep( 4.0 );		

	Goto('Crow_Loop');
	}

state Triggered
	{
	Begin:


	ACTION_DestroyActor( 'gbxTrigger_Crow_intro' );
	ACTION_PlayAnim( 'Crow1', 'a_takeoff_long', 0.1, 1.0);
	ACTION_PlayAnim( 'Crow2', 'b_takeoff_long', 0.1, 1.0);
	ACTION_PlayAnim( 'Crow4', 'b_takeoff_long', 0.1, 1.0);
//
	ACTION_PlayLocalSound("D08_1030_SOUNDS.BIRDS_TAKEOFF");
		sleep(19);
	ACTION_DestroyActor( 'Crow1' );
	ACTION_DestroyActor( 'Crow2' );
	ACTION_DestroyActor( 'Crow4' );


	}
