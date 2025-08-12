//=============================================================================
// TS_D00_0600_Crow01Script.
//=============================================================================
class TS_D00_0600_Crow01Script extends TriggeredScript
	placeable;

state Default
{
	Begin:

	ACTION_SetAnimSet( 'Crow_01', "k_animal.crow_b_anim" );

	Crow_Loop:

	ACTION_PlayAnim( 'Crow_01', 'b_idle', 0.1, 1.0);
	sleep( 2.0 );		

	Goto('Crow_Loop');
}

state Triggered
{
	Begin:

	ACTION_DestroyActor( 'Crow3Script_trigger' );
	ACTION_PlayAnim( 'Crow_01', 'b_takeoff_long', 0.1, 1.0);
	ACTION_PlayLocalSound("D08_1030_SOUNDS.BIRDS_TAKEOFF");
		sleep(19);

	ACTION_DestroyActor( 'Crow_01' );
	ACTION_DestroyActor( 'GBXTrig_Crow01' );

}
