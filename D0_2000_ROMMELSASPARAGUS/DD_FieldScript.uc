//=============================================================================
// DD_FieldScript.
//=============================================================================
class DD_FieldScript extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	ACTION_TriggerEvent( 'DD_IGS01_02' );

	// Spawn Germans
	ACTION_TriggerEvent( 'SpawnGermanSquad01' );

	ACTION_EnableMG42Recruiting( 'MG42_Field1_2', TRUE );
	ACTION_EnableFlakvierlingRecruiting( 'Flakvierling_01', TRUE );

	sleep( 1.0 );
	ACTION_TriggerEvent( 'SpawnGermanSquad05' );

	sleep( 1.0 );
	ACTION_TriggerEvent( 'SpawnGermanSquad04' );

	sleep( 1.0 );
	ACTION_TriggerEvent( 'SpawnGermanSquad03' );

	// Start SI
	ACTION_TriggerEvent( 'DD_CombatSI' );

	ScriptEnd:
}
