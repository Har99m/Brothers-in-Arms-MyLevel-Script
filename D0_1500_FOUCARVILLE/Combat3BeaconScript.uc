//=============================================================================
// Combat3BeaconScript.
//=============================================================================
class Combat3BeaconScript extends TriggeredScript
	placeable;

var Unit GermanUnit[4];
var gbxFollowBeacon gbxFB_Ref;

function PostBeginPlay()
{
	Super.PostBeginPlay();

	GermanUnit[0] = GetUnit( 'GermanSquad03c' );
	GermanUnit[1] = GetUnit( 'GermanSquad03d' );
	GermanUnit[2] = GetUnit( 'GermanSquad03b' );
	GermanUnit[3] = GetUnit( 'GermanSquad03' );

	gbxFB_Ref = gbxFollowBeacon( GetFirstActor('Combat3_FollowBeacon') );
}

function bool FindLivingGermans()
{
	local int i;

	while ( i < 4 )
	{
		if ( GermanUnit[i].GetNumLivingMembers() > 0 )
		{
			gbxFB_Ref.m_anOwner = GermanUnit[i].Leader;
			return TRUE;
		}
		else
			i++;
	}

	return FALSE;
}

// Everytime this is triggered it finds the next living German

state Triggered
{
	Begin:

	// The first time you trigger this script turn on the beacon too

	if ( !FindLivingGermans() )
		ACTION_TriggerEvent( 'Combat3_FollowBeacon' );

	ScriptEnd:
}
