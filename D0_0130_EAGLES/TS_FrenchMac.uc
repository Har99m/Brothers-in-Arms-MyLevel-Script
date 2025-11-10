//=============================================================================
// TS_FrenchMac.
// Author: Dorian Gorski
// Triggered by: Trigger_TS_FrenchMac
//=============================================================================
class TS_FrenchMac extends TriggeredScript
	placeable;

var WargamePawn Pawn_Mac;
var Actor A_Cole;
var bool bReady;
var ActorLite Path_Mac_French_Start , MacNode ;

state Triggered
	{
		Begin:
				
				ACTION_TriggerEvent ('MacReroute_Trigger');
				
				slog("--------------MacReroute Trigger should be turned off-------------------------");

			//===== Script triggered when Mac gets near Cole & Leggett
				Pawn_Mac = WargamePawn( GetPawn( 'Mac' ));

				Path_Mac_French_Start = GetNavigationPoint( 'Path_Mac_French_Start' );

				ACTION_Walk( 'Mac' );
				ACTION_MoveToward( Pawn_Mac, Path_Mac_French_Start , FALSE );

				Pawn_Mac.SetWeaponAimedState( WAS_Relaxed );
				ACTION_ChangeController( 'mac', class'ScriptedController');

				sleep (1.0);

			//Pawn_Mac.FlushAnimQueueChannel( 0,,true );
				Pawn_Mac.FlushAnimQueueChannel( 0,,true );

			//===== Set up idle animations
				ACTION_ClearPawnIdleQueue( 'Pawn_Mac' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'standing_idle_relaxed_3' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'standing_idle_relaxed_4' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'standing_idle_relaxed_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Mac', FALSE );


		ScriptEnd:
	}
