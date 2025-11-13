//=============================================================================
// Chair02Script.
//=============================================================================
class Chair02Script extends TriggeredScript
	placeable;

state Triggered
{
Begin:


	ACTION_SetAnimSet( 'Chair02', "k_prop.chair_anims" );



		ACTION_PlayAnim( 'Chair02', 'Idle', 0.2, 1.0,true,,,);



}

state Awake
{
Begin:
			sleep(0.1);
		ACTION_PlayAnim( 'Chair02', 'tip_2', 0.2, 1.0,,,,1);
			sleep(1.2);
		ACTION_PlayAnim( 'Chair02', 'end_idle',0.2, 1.0,true,,,);

}
