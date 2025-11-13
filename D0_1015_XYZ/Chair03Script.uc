//=============================================================================
// Chair03Script.
//=============================================================================
class Chair03Script extends TriggeredScript
	placeable;

state Triggered
{
Begin:


	ACTION_SetAnimSet( 'Chair03', "k_prop.chair_anims" );


		ACTION_PlayAnim( 'Chair03', 'Idle', 0.2, 1.0,true,,,);


}

state Awake
{
Begin:

		ACTION_PlayAnim( 'Chair03', 'tip_1', 0.2, 1.0,,,,1);
			sleep(1.2);
		ACTION_PlayAnim( 'Chair03', 'end_idle',0.2, 1.0,true,,,);

}
