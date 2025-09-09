//=============================================================================
// TS_D07_1500_FakeGermans.
//=============================================================================
class TS_D07_1500_FakeGermans extends TriggeredScript
	placeable;

var int i;
var TS_D07_1500_CrazyMindChange CleanUp_Ref;

state Triggered
{
	Begin:

	CleanUp_Ref = TS_D07_1500_CrazyMindChange( GetFirstActor( 'TS_D07_1500_CrazyMindChange' ) );

	ACTION_SetHidden( 'GermanMover01', false );
	ACTION_SetHidden( 'GermanMover02', false );
	ACTION_SetHidden( 'GermanMover03', false );
	ACTION_SetHidden( 'GermanMover04', false );
	ACTION_SetHidden( 'GermanMover05', false );
	ACTION_SetHidden( 'GermanMover06', false );
	ACTION_SetHidden( 'GermanMover07', false );

	do{

		i = Rand( 5 );

		switch ( i )
		{
			Case 0: //1, 2, 3, 4
				ACTION_TriggerEvent( 'GermanMover01' );
				ACTION_TriggerEvent( 'GermanMover02' );
				ACTION_TriggerEvent( 'GermanMover03' );
				ACTION_TriggerEvent( 'GermanMover04' );
				sleep( 0.5 );
				ACTION_TriggerEvent( 'GermanMover01Fire01' );
				ACTION_TriggerEvent( 'GermanMover02Fire01' );
				ACTION_TriggerEvent( 'GermanMover03Fire01' );
				ACTION_TriggerEvent( 'GermanMover04Fire01' );
				sleep( 0.5 );
				ACTION_TriggerEvent( 'GermanMover01Fire02' );
				ACTION_TriggerEvent( 'GermanMover02Fire02' );
				ACTION_TriggerEvent( 'GermanMover03Fire02' );
				ACTION_TriggerEvent( 'GermanMover04Fire02' );
				sleep( 1.0 );
				ACTION_TriggerEvent( 'GermanMover01Fire01' );
				ACTION_TriggerEvent( 'GermanMover02Fire01' );
				ACTION_TriggerEvent( 'GermanMover03Fire01' );
				ACTION_TriggerEvent( 'GermanMover04Fire01' );
				break;

			Case 1: //1, 3, 5, 7
				ACTION_TriggerEvent( 'GermanMover01' );
				ACTION_TriggerEvent( 'GermanMover03' );
				ACTION_TriggerEvent( 'GermanMover05' );
				ACTION_TriggerEvent( 'GermanMover07' );
				sleep( 0.5 );
				ACTION_TriggerEvent( 'GermanMover01Fire01' );
				ACTION_TriggerEvent( 'GermanMover03Fire01' );
				ACTION_TriggerEvent( 'GermanMover05Fire01' );
				ACTION_TriggerEvent( 'GermanMover07Fire01' );
				sleep( 0.5 );
				ACTION_TriggerEvent( 'GermanMover01Fire02' );
				ACTION_TriggerEvent( 'GermanMover03Fire02' );
				ACTION_TriggerEvent( 'GermanMover05Fire02' );
				ACTION_TriggerEvent( 'GermanMover07Fire02' );
				sleep( 1.0 );
				ACTION_TriggerEvent( 'GermanMover01Fire01' );
				ACTION_TriggerEvent( 'GermanMover03Fire01' );
				ACTION_TriggerEvent( 'GermanMover05Fire01' );
				ACTION_TriggerEvent( 'GermanMover07Fire01' );
				break;

			Case 2: //2, 4, 6, 7
				ACTION_TriggerEvent( 'GermanMover02' );
				ACTION_TriggerEvent( 'GermanMover04' );
				ACTION_TriggerEvent( 'GermanMover06' );
				ACTION_TriggerEvent( 'GermanMover07' );
				sleep( 0.5 );
				ACTION_TriggerEvent( 'GermanMover02Fire01' );
				ACTION_TriggerEvent( 'GermanMover04Fire01' );
				ACTION_TriggerEvent( 'GermanMover06Fire01' );
				ACTION_TriggerEvent( 'GermanMover07Fire01' );
				sleep( 0.5 );
				ACTION_TriggerEvent( 'GermanMover02Fire02' );
				ACTION_TriggerEvent( 'GermanMover04Fire02' );
				ACTION_TriggerEvent( 'GermanMover06Fire02' );
				ACTION_TriggerEvent( 'GermanMover07Fire02' );
				sleep( 1.0 );
				ACTION_TriggerEvent( 'GermanMover02Fire01' );
				ACTION_TriggerEvent( 'GermanMover04Fire01' );
				ACTION_TriggerEvent( 'GermanMover06Fire01' );
				ACTION_TriggerEvent( 'GermanMover07Fire01' );
				break;

			Case 3: //2, 3, 4, 5
				ACTION_TriggerEvent( 'GermanMover02' );
				ACTION_TriggerEvent( 'GermanMover03' );
				ACTION_TriggerEvent( 'GermanMover04' );
				ACTION_TriggerEvent( 'GermanMover05' );
				sleep( 0.5 );
				ACTION_TriggerEvent( 'GermanMover02Fire01' );
				ACTION_TriggerEvent( 'GermanMover03Fire01' );
				ACTION_TriggerEvent( 'GermanMover04Fire01' );
				ACTION_TriggerEvent( 'GermanMover05Fire01' );
				sleep( 0.5 );
				ACTION_TriggerEvent( 'GermanMover02Fire02' );
				ACTION_TriggerEvent( 'GermanMover03Fire02' );
				ACTION_TriggerEvent( 'GermanMover04Fire02' );
				ACTION_TriggerEvent( 'GermanMover05Fire02' );
				sleep( 1.0 );
				ACTION_TriggerEvent( 'GermanMover02Fire01' );
				ACTION_TriggerEvent( 'GermanMover03Fire01' );
				ACTION_TriggerEvent( 'GermanMover04Fire01' );
				ACTION_TriggerEvent( 'GermanMover05Fire01' );
				break;

			Case 4: //3, 4, 5, 7
				ACTION_TriggerEvent( 'GermanMover03' );
				ACTION_TriggerEvent( 'GermanMover04' );
				ACTION_TriggerEvent( 'GermanMover05' );
				ACTION_TriggerEvent( 'GermanMover07' );
				sleep( 0.5 );
				ACTION_TriggerEvent( 'GermanMover03Fire01' );
				ACTION_TriggerEvent( 'GermanMover04Fire01' );
				ACTION_TriggerEvent( 'GermanMover05Fire01' );
				ACTION_TriggerEvent( 'GermanMover07Fire01' );
				sleep( 0.5 );
				ACTION_TriggerEvent( 'GermanMover03Fire02' );
				ACTION_TriggerEvent( 'GermanMover04Fire02' );
				ACTION_TriggerEvent( 'GermanMover05Fire02' );
				ACTION_TriggerEvent( 'GermanMover07Fire02' );
				sleep( 1.0 );
				ACTION_TriggerEvent( 'GermanMover03Fire01' );
				ACTION_TriggerEvent( 'GermanMover04Fire01' );
				ACTION_TriggerEvent( 'GermanMover05Fire01' );
				ACTION_TriggerEvent( 'GermanMover07Fire01' );
				break;

			default:
				SLog( "*****Error: No Germans peeking' yo.*****" );
				break;
		}

		sleep( 2.0 );

	} Until( CleanUp_Ref.bHideStaticGermans )

	ACTION_SetHidden( 'GermanMover01', true );
	ACTION_SetHidden( 'GermanMover02', true );
	ACTION_SetHidden( 'GermanMover03', true );
	ACTION_SetHidden( 'GermanMover04', true );
	ACTION_SetHidden( 'GermanMover05', true );
	ACTION_SetHidden( 'GermanMover06', true );
	ACTION_SetHidden( 'GermanMover07', true );

	ACTION_DestroyActor( 'GermanMover01' );
	ACTION_DestroyActor( 'GermanMover02' );
	ACTION_DestroyActor( 'GermanMover03' );
	ACTION_DestroyActor( 'GermanMover04' );
	ACTION_DestroyActor( 'GermanMover05' );
	ACTION_DestroyActor( 'GermanMover06' );
	ACTION_DestroyActor( 'GermanMover07' );
	sleep( 0.5 );

	ACTION_DestroyActor( 'GermanMover01Fire01' );
	ACTION_DestroyActor( 'GermanMover02Fire01' );
	ACTION_DestroyActor( 'GermanMover03Fire01' );
	ACTION_DestroyActor( 'GermanMover04Fire01' );
	ACTION_DestroyActor( 'GermanMover05Fire01' );
	ACTION_DestroyActor( 'GermanMover06Fire01' );
	ACTION_DestroyActor( 'GermanMover07Fire01' );
	sleep( 0.5 );

	ACTION_DestroyActor( 'GermanMover01Fire02' );
	ACTION_DestroyActor( 'GermanMover02Fire02' );
	ACTION_DestroyActor( 'GermanMover03Fire02' );
	ACTION_DestroyActor( 'GermanMover04Fire02' );
	ACTION_DestroyActor( 'GermanMover05Fire02' );
	ACTION_DestroyActor( 'GermanMover06Fire02' );
	ACTION_DestroyActor( 'GermanMover07Fire02' );

	ScriptEnd:
}
