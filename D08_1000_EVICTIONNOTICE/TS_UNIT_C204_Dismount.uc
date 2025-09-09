//=============================================================================
// TS_UNIT_C204_Dismount.
//=============================================================================
class TS_UNIT_C204_Dismount extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_OrderMove( 'UNIT_C204', 'PN_C210' );

	}
