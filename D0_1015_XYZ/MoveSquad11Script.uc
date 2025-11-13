//=============================================================================
// MoveSquad11Script.
//=============================================================================
class MoveSquad11Script extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	ACTION_OrderMove( 'GermanSquad11b', 'GermanSquad11_Path01' );
	ACTION_OrderMove( 'GermanSquad11', 'GermanSquad11_Path03' );
		sleep(10.0);
	ACTION_OrderMove( 'GermanSquad11', 'GermanSquad11_Path02' );


	/*
	ACTION_DestroyActor( 'PlayerFlank' );
	ACTION_DestroyActor( 'PlayerWallAssault' );
	*/


ScriptEnd:

}
