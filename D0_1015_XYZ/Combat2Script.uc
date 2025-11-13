//=============================================================================
// Combat2Script.
//=============================================================================
class Combat2Script extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_DisplayObjectiveHint(S_Localize("HINT_A", "D0_1015_XYZ" ), 4.0 );

	ACTION_TriggerEvent( 'Crow3Script');
	ACTION_TriggerEvent( 'SpawnGermanSquad04' );
	ACTION_TriggerEvent( 'SpawnGermanSquad06' );
	ACTION_TriggerEvent( 'SpawnGermanSquad03' );
	ACTION_TriggerEvent( 'SpawnGermanSquad05' );

	ACTION_OrderMove( 'GermanSquad05', 'GermanSquad05_Path01' );
	ACTION_OrderMove( 'GermanSquad03', 'GermanSquad03_Path01' );
	ACTION_OrderMove( 'GermanSquad04', 'GermanSquad04_Path01' );
	ACTION_OrderMove( 'GermanSquad06', 'GermanSquad06_Path01' );

	ScriptEnd:
	}
