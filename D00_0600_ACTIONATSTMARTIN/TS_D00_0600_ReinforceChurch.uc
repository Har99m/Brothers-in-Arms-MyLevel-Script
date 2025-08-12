//=============================================================================
// TS_D00_0600_ReinforceChurch.
//=============================================================================
class TS_D00_0600_ReinforceChurch extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	if( Unit( GetFirstActor( 'Unit_DE_S7_02' )).GetNumLivingMembers() == 0 )
	{

		ACTION_TriggerEvent( 'CSG_ReinforceChurch' );
		sleep( 0.2 );
		ACTION_OrderMove( 'Unit_DE_ReinforceChurch', 'PN_S7_07' );

	}
}