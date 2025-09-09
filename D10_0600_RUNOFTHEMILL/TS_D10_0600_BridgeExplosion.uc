//=============================================================================
// TS_D10_0600_BridgeExplosion.
//=============================================================================
class TS_D10_0600_BridgeExplosion extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	// Explode bridge
	ACTION_TriggerEvent( 'gbxExpTrig_Bridge' );
	ACTION_TriggerEvent( 'Emitter_Bridge' );
	ACTION_PlayLocalSound( "EXPLOSIONS.BRIDGE" );

	// Switch non-existent staticmesh
	ACTION_TriggerEvent( 'TS_C_Bridge' );
	sleep( 2.0 );
	ACTION_TriggerEvent( 'gbxWB_Bridge' );

	// Update objective
	ACTION_SetObjectiveStatus( 0, OI_Failed, 'ObjectiveList' );
	ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 );
	sleep( 5.0 );

	// Display Hint
	ACTION_DisplayObjectiveHint( S_Localize("HINT_A"), 4.0 );

	// Update Beacons

	ACTION_TriggerEvent( 'gbxWB_Doyle' );
	ACTION_TriggerEvent( 'gbxWB_Doyle_Start' );

	ScriptEnd:
}
