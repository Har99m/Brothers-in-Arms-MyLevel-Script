//=============================================================================
// KitchenWaypoint.
//=============================================================================
class KitchenWaypoint extends TriggeredScript
	placeable;

var name myPawn;

state Triggered
{
Begin:


	
	ACTION_TriggerEvent( 'KitchenWaypointBeacon' );
	ACTION_DestroyActor( 'KitchenWaypointBeacon' );

	ACTION_TriggerEvent( 'EndCombatWaypointBeacon' );
	ACTION_TriggerEvent( 'EndCombatWaypoint' );
	ACTION_TriggerEvent( 'SpawnAllenGarnett' );
		sleep(1.0);

	Goto('ScriptEnd');


ScriptEnd:
}
