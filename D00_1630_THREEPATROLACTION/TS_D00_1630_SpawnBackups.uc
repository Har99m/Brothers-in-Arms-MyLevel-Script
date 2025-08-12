//=============================================================================
// TS_D00_1630_SpawnBackups.
//=============================================================================
class TS_D00_1630_SpawnBackups extends TriggeredScript
	placeable;

var TS_D00_1630_JustInCaseGuys CheckGermans_Ref;

state Triggered
{
	Begin:

	CheckGermans_Ref = TS_D00_1630_JustInCaseGuys( GetFirstActor( 'TS_D00_1630_JustInCaseGuys' ) );

	if( CheckGermans_Ref.bSquad3HasDied )
	{
		ACTION_TriggerEvent( 'CSG_C2_06' );
		sleep( 0.2 );
		ACTION_OrderMove( 'Unit_DE_C2_06', 'PN_C2_DE03_Move_E' );
	}

}

