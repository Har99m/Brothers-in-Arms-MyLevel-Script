//=============================================================================
// GS13_CatchUp.
//=============================================================================
class GS13_CatchUp extends TriggeredScript
	placeable;

state Triggered
{
Begin:



		ACTION_OrderMove( 'GermanSquad13', 'GermanSquad13_Path02' );

				ACTION_OrderMove( 'GermanSquad11', 'GermanChase01' );
				ACTION_OrderMove( 'GermanSquad11b', 'GermanChase01' );



ScriptEnd:
}
