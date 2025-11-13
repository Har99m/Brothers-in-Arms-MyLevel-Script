//=============================================================================
// EndCombatDeathScript_RepTwo.
//=============================================================================
class EndCombatDeathScript_RepTwo extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	ACTION_TriggerEvent( 'SpawnGermanFireSquad02_2' );
	ACTION_OrderMove( 'GermanFireSquad02_2', 'GermanFireSquad02_2_Path01' );
		sleep(15.0);
	ACTION_OrderMove( 'GermanFireSauad02_2', 'GermanFireSquad01_Path01' );
		sleep(25.0);
	ACTION_OrderMove( 'GermanFireSquad02_2', 'GermanFireSquad02_Path02' );

}
