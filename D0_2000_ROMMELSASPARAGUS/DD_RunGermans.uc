//=============================================================================
// DD_RunGermans.
//=============================================================================
class DD_RunGermans extends TriggeredScript
	placeable;

var() edfindable unit GermanUnit;
var() name PathTag;
var() name TriggerTag;

var int nCount;

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
{
	Super.PostBeginPlay();
	nCount = 0;
}
state Triggered
{
	function OnTrigger()
	{
		++nCount;
		GoToState( 'DestroyGermans' );
	}

	Begin:

	if ( GermanUnit.GetNumLivingMembers() > 0 )
	{
		ACTION_OrderMove( GermanUnit.Tag, PathTag, TRUE );

		// Enable trigger used to wait for Germans
		ACTION_TriggerEvent( TriggerTag );
	}
}

state DestroyGermans
{
	function OnTrigger()
	{
		++nCount;
		GoToState( 'DestroyGermans' );
	}

	Begin:

	// Wait till all Germans are in position
	while ( nCount < GermanUnit.GetNumLivingMembers() )
	{
		sleep( 1.0 );
	}

	// Destroy them all!
	while( GermanUnit.GetNumLivingMembers() > 0 )
	{
		ACTION_DestroyActor( GermanUnit.Leader.Tag );
		sleep( 0.1 );
	}
}
