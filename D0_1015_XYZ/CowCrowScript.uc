//=============================================================================
// CowCrowScript.
//=============================================================================
class CowCrowScript extends TriggeredScript
	placeable;

state Default
	{
	Begin:

	ACTION_SetAnimSet( 'Crow1', "k_animal.crow_a_anim" );

	Crow_Loop:

	ACTION_PlayAnim( 'Crow1', 'a_idle', 0.1, 1.0);
	sleep( 4.0 );		

	Goto('Crow_Loop');
	}

state Triggered
	{
	Begin:

	ACTION_DestroyActor( 'Crow1Script_trigger' );
	ACTION_DestroyActor( 'Crow1Script_othertrigger' );
	ACTION_PlayAnim( 'Crow1', 'a_takeoff', 0.1, 1.0);
		sleep(0.8);
	//ACTION_PawnFireAtTarget( 'Garnett', 'CreekTarget' );
	sleep( ACTION_PlayLipSyncSound( 'Garnett', "D_GARNETT.PAIN_F", 1.0, 1.0, 80.0 ) - 0.5 );
	GetFirstActor( 'HartsockIntroScript' ).goToState( 'GarnettLook' );
	GetFirstActor( 'MacIntroScript' ).goToState( 'GarnettLook' );

		sleep(0.5);
	ACTION_DestroyActor( 'Crow1' );
		sleep(1);


	ACTION_ClearLookAtTarget('Hartsock');
	ACTION_ClearLookAtTarget('Mac');
	ACTION_ClearLookAtTarget('Allen');
	ACTION_ClearLookAtTarget('Leggett01');

	ACTION_SetLookAtTarget( 'Allen', GetFirstActor( 'LookTarget4'), true );
	ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor( 'LookTarget2'), true );
		sleep(1.0);
	ACTION_TriggerEvent( 'GarnettOut' );
	ACTION_ClearLookAtTarget( 'Garnett' );

		

	sleep( 6.6 );

	ACTION_DestroyActor( 'Crow1' );

	}
