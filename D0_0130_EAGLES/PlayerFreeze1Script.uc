//=============================================================================
// PlayerFreeze1Script.
//=============================================================================
class PlayerFreeze1Script extends TriggeredScript
	placeable;

var WargamePawn Pawn_Mac;
var Actor A_Cole;
var bool bReady;
var ActorLite Path_Mac_French_Start1 , MacNode ;


State Triggered
	{
		Begin:

slog ("-------------------------MacRerouteTrigger being triggered-------------------------------");


				ACTION_DestroyActor ('Trigger_TS_FrenchMac');
		 		ACTION_HideHUD ( GetLocalPlayerController() , true);
				ACTION_LimitPlayerInput( GetLocalPlayerController(), true ); 
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

				ACTION_BlockNavPoints( 'PN_WallJump' );

				//ACTION_BlockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_LOOK );
				ACTION_TriggerEvent ('EaglesEndScript');

			//===== Script triggered when Mac gets near Cole & Leggett
				Pawn_Mac = WargamePawn( GetPawn( 'Mac' ));

				Path_Mac_French_Start1 = GetNavigationPoint( 'Path_Mac_French_Start1' );

				ACTION_ChangeController( 'mac', class'ScriptedController');
				Pawn_Mac.SetWeaponAimedState( WAS_Relaxed );

				ACTION_Run( 'Mac' );
				ACTION_MoveToward( Pawn_Mac, Path_Mac_French_Start1 , FALSE );

				slog ("-------------------------Mac should be moving to alt spot-------------------------------");
				sleep (1.0);

			//Pawn_Mac.FlushAnimQueueChannel( 0,,true );
				Pawn_Mac.FlushAnimQueueChannel( 0,,true );

			//===== Set up idle animations
				ACTION_ClearPawnIdleQueue( 'Pawn_Mac' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'standing_idle_relaxed_3' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'standing_idle_relaxed_4' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'standing_idle_relaxed_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Mac', FALSE );
	}
