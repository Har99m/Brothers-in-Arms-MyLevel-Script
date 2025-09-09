//=============================================================================
// TS_D08_1030_CrowEnd.
//=============================================================================
class TS_D08_1030_CrowEnd extends TriggeredScript
	placeable;

state Default
	{
	Begin:

	ACTION_SetAnimSet( 'CrowEnd', "k_animal.crow_b_anim" );

	Crow_Loop:

	ACTION_PlayAnim( 'CrowEnd', 'b_idle', 0.1, 1.0);
	sleep( 2.0 );		

	Goto('Crow_Loop');
	}

state Triggered
	{
	Begin:

	ACTION_DestroyActor( 'Crow3Script_trigger' );
	ACTION_PlayAnim( 'CrowEnd', 'b_takeoff_long', 0.1, 1.0);
	ACTION_PlayLocalSound("D08_1030_SOUNDS.BIRDS_TAKEOFF");
		sleep(19);

	ACTION_DestroyActor( 'CrowEnd' );

	}
