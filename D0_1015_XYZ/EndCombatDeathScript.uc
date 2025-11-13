//=============================================================================
// EndCombatDeathScript.
//=============================================================================
class EndCombatDeathScript extends TriggeredScript
	placeable;

var Pawn GarnettEnd;
var Pawn AllenEnd;
var Pawn LocalPlayer;


state Triggered
{
Begin:

	ACTION_TriggerEvent( 'OutroScript_New' );
	ACTION_TriggerEvent( 'EndCombatWaypointBeaconNew' );
	ACTION_TriggerEvent( 'AllenGarnettEndBeacon' );	

ScriptEnd:

}
