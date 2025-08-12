//=============================================================================
// NBS_FakeGermans.
//=============================================================================
class NBS_FakeGermans extends TriggeredScript
	placeable;

var int i;
var NBS_Hill30UberScene Hill30Uber_Ref;

state Triggered
{
	Begin:

	Hill30Uber_Ref = NBS_Hill30UberScene( GetFirstActor( 'NBS_Hill30UberScene' ) );

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

	} Until( Hill30Uber_Ref.bStopChargingDudes )

	ACTION_SetHidden( 'GermanMover01', true );
	ACTION_SetHidden( 'GermanMover02', true );
	ACTION_SetHidden( 'GermanMover03', true );
	ACTION_SetHidden( 'GermanMover04', true );
	ACTION_SetHidden( 'GermanMover05', true );
	ACTION_SetHidden( 'GermanMover06', true );
	ACTION_SetHidden( 'GermanMover07', true );
	sleep( 0.5 );

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
