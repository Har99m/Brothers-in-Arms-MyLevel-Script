//=============================================================================
// PlayerBackScript.
//=============================================================================
class PlayerBackScript extends TriggeredScript
	placeable;

state triggered
{
Begin:

	ACTION_OrderMove( 'GermanSquad12', 'GermanSquad12_Path02' );
	ACTION_OrderMove( 'GermanSquad10', 'WoodPileSmall' );

	ACTION_OrderMove( 'GermanSquad05', 'C2_GermanChase02' );
	ACTION_OrderMove( 'GermanGunner01', 'C2_GermanChase04' );

	ScriptEnd:
}
