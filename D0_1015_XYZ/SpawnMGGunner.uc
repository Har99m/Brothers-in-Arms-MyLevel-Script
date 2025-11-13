//=============================================================================
// SpawnMGGunner.
//=============================================================================
class SpawnMGGunner extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_OrderMove( 'GermanSquad03', 'GermanSquad03_Path02' );
	ACTION_TriggerEvent( 'SpawnGermanSquad05' );
	ACTION_OrderMove( 'GermanSquad05', 'GermanSquad05_Path01' );

	ScriptEnd:
	}
