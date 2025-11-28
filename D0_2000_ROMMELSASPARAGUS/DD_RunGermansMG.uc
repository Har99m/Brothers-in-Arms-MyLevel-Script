//=============================================================================
// DD_RunGermansMG.
//=============================================================================
class DD_RunGermansMG extends DD_RunGermans
	placeable;

var() name MGTag;

state Triggered
{
	function OnTrigger()
	{
		++nCount;
		Super.GoToState( 'DestroyGermans' );
	}

	Begin:

	if ( GermanUnit.GetNumLivingMembers() > 0 )
	{
		if ( GetFirstActor( MGTag ).IsA( 'MG42Factory' ) )
			ACTION_EnableMG42Recruiting( MGTag, FALSE );

		ACTION_ForceTurretDismount( MGTag );
		sleep( 2.0 );
		ACTION_OrderMove( GermanUnit.Tag, PathTag );

		// Enable trigger used to wait for Germans
		ACTION_TriggerEvent( TriggerTag );
	}
}
