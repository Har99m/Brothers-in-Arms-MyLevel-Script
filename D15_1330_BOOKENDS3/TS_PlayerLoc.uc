//=============================================================================
// TS_PlayerLoc.
//=============================================================================
class TS_PlayerLoc extends TriggeredScript
	placeable;

var Pawn Player;

state Triggered
{

Begin:

	Player = GetLocalPlayerPawn();
	GotoState( 'PlayerLoc' );

}

state PlayerLoc
{
	function ontrigger()
	{ GotoState( 'PlayerLoc' ); }
Begin:

	SLog( "Player.Location: " $ Player.Location );

}
