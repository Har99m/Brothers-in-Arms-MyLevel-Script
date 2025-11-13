//=============================================================================
// PlayerFlank.
//=============================================================================
class PlayerFlank extends TriggeredScript
	placeable;

state Triggered
{
Begin:

ACTION_DestroyActor( 'MoveSquad11Script' );
ACTION_DestroyActor( 'PlayerWallAssault' );

ScriptEnd:

}