//=============================================================================
// Combat1Script.
//=============================================================================
class Combat1Script extends TriggeredScript
	placeable;

var pawn Hartsock;
var pawn MyPawn;

state Triggered
{
Begin:

	SLog( "Combat1Script running..." );	

	ACTION_DestroyActor( 'Leggett' );
	ACTION_DestroyActor( 'Mac' );
	ACTION_DestroyActor( 'MacLeggs' );
	ACTION_DestroyActor( 'SpawnMac' );
	ACTION_destroyActor( 'SpawnLeggett' );

	//spawns first german squad
	ACTION_TriggerEvent( 'SpawnGermanSquad01' );
		sleep(0.2);

	//moves squad to their first position
	ACTION_OrderMove( 'GermanSquad01', 'GermanSquad01_Path01' );
	Mind(GetPawn('G01').Controller).NavigationController.ManeuverToActor(GetNavigationPoint('PN_G01'),false);
	Mind(GetPawn('G02').Controller).NavigationController.ManeuverToActor(GetNavigationPoint('PN_G02'),false);
	slog("MOTHERFUCKING BITCH ASSES SHOULD BE MOVING ALL UP ONZ RIGHT NOW");
		sleep(0.2);	

//	HINT_1 "Order Hartsock to fire on the German unit while you flank around the barn."
	ACTION_DisplayObjectiveHint(S_Localize("HINT_1", "D0_0700_EXIT4" ), 6.0  );
		sleep(4.0);

	//begins series of random explosions around the map
	ACTION_TriggerEvent( 'MortarTrigger' );
		sleep(0.2);

	SLog( "Combat1Script ended..." );

	ScriptEnd:

}
