//=============================================================================
// Combat3Script.
//=============================================================================
class Combat3Script extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	SLog( "Combat3Script running..." );	

	//spawns the germans to attact
	ACTION_TriggerEvent( 'SpawnGermanSquad04' );
	ACTION_TriggerEvent( 'SpawnGermanSquad05' );
	ACTION_OrderMove( 'GermanSquad04', 'GermanSquad04_Path01' );
	ACTION_OrderMove( 'GermanSquad05', 'GermanSquad05_Path01' );

	SLog( "Combat3Script ended..." );

	ScriptEnd:

}
