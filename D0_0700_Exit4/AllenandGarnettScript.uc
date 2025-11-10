//=============================================================================
// AllenandGarnettScript.
//=============================================================================
class AllenandGarnettScript extends TriggeredScript
	placeable;

state Triggered
{
Begin:

//	ACTION_OrderMove( 'AllenandGarnett', 'ExplainObjectiveNode' );
	ACTION_MoveTowardTag( 'Allen', 'AllenDest', false, 'AllenandGarnettLookTarget' );
	ACTION_MoveTowardTag( 'Garnett', 'GarnettDest', false, 'AllenandGarnettLookTarget' );


}

