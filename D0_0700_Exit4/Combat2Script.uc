//=============================================================================
// Combat2Script.
//=============================================================================
class Combat2Script extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	SLog( "Combat2Script running..." );	
	ACTION_DestroyActor( 'Leggett' );
	ACTION_DestroyActor( 'mac' );
	ACTION_DestroyActor( 'Crow3Script_trigger' );
	ACTION_DestroyActor( 'Crow3Script_othertrigger' );
	ACTION_DestroyActor( 'Crow3Script' );
	ACTION_DestroyActor( 'trigger_Combat1Script' );
	ACTION_DestroyActor( 'Combat1Script' );
	ACTION_DestroyActor( 'MacLeggs' );
	ACTION_DestroyActor( 'SpawnMac' );
	ACTION_DestroyActor( 'SpawnLegget' );

	//Spawns germans in field
	ACTION_TriggerEvent( 'SpawnGermanSquad02' );
	ACTION_OrderMove( 'GermanSquad02', 'GermanSquad02_Path01' );

	//Draws out combat1 germans to final wall vantage point
	ACTION_OrderMove( 'GermanSquad01', 'Combat1FinalStand' );

	//spawns mortar team
	ACTION_TriggerEvent( 'TS_MortarATeam' );

	//explosions in the mortar field
	ACTION_TriggerEvent( 'FieldPattern02' );
		sleep(3.0);
	ACTION_TriggerEvent( 'FieldPattern04' );
		sleep(2.0);

	SLog( "Combat2Script ended..." );

	ScriptEnd:

}
