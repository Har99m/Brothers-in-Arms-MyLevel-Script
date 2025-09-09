//=============================================================================
// TS_D07_1500_CP3UnBlockNodes.
//=============================================================================
class TS_D07_1500_CP3UnBlockNodes extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	ACTION_UnBlockNavPoints( 'PN_CP3_BlockedPaths' );

}
