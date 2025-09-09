//=============================================================================
// TS_D08_1000_MGBridge_Dismount.
//=============================================================================
class TS_D08_1000_MGBridge_Dismount extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_DestroyACtor( 'Trigger_TS_D08_1000_MGBridge_Dismount' );
	ACTION_ForceTurretDismount( 'MG42_Bridge' );
	sleep( 1.0 ) ;
	ACTION_OrderMove( 'UNIT_MG01', 'PN_Bridge_DE_C4_01' );
	ACTION_EnableMG42Recruiting( 'MG42_Bridge', false );

	}
