//=============================================================================
// TS_CrowA.
//=============================================================================
class TS_CrowA extends TriggeredScript
	placeable;

state Default
	{
	Begin:

	ACTION_SetAnimSet( 'CrowA', "k_animal.crow_b_anim" );

	Crow_Loop:

	ACTION_PlayAnim( 'CrowA', 'b_idle', 0.1, 1.0);
	sleep( 2.0 );		

	Goto('Crow_Loop');
	}

state Triggered
	{
	Begin:

	ACTION_DestroyActor( 'gbxTrigger_CrowAFly' );
	ACTION_PlayAnim( 'CrowA', 'b_takeoff_long', 0.1, 1.0);
	ACTION_PlayLocalSound("D08_1030_SOUNDS.BIRDS_TAKEOFF");
		sleep(19);

	ACTION_DestroyActor( 'CrowA' );

	}
