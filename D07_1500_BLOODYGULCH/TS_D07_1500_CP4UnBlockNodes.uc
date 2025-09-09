//=============================================================================
// TS_D07_1500_CP4UnBlockNodes.
//=============================================================================
class TS_D07_1500_CP4UnBlockNodes extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	ACTION_UnBlockNavPoints( 'PN_CP4_BlockedPaths' );

}
