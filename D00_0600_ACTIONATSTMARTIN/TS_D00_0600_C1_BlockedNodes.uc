//=============================================================================
// TS_D00_0600_C1_BlockedNodes.
//=============================================================================
class TS_D00_0600_C1_BlockedNodes extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	ACTION_UnBlockNavPoint( 'PN_C1_BlockedNode' );

}
