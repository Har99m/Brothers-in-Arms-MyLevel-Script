//=============================================================================
// EndGame.
//=============================================================================
class EndGame extends TriggeredScript
	placeable;

state triggered
	{

		Begin:
				sleep( 1.0 );
			ACTION_PlayLocalSound( "D00130_SOUNDS.C47_CRASH" );
				sleep( 8.1 );

			ACTION_TriggerEvent( 'PlaneCrashGroundEmitter1' );

				sleep( 5.0 );
			ACTION_TriggerEvent('PlaneCrashFire');
			//GetFirstActor( 'StaticMeshActor_C47Crash' ).bHidden = FALSE;

		ScriptEnd:
	}
