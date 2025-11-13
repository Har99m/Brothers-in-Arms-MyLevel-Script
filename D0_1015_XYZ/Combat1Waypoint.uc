//=============================================================================
// Combat1Waypoint.
//=============================================================================
class Combat1Waypoint extends TriggeredScript
	placeable;

var name myPawn;

state Triggered
{
Begin:

Do
{

	sleep(0.5);

} Until ( Unit( GetFirstActor( 'GermanSquad03' )).GetNumLivingMembers() +  
	Unit( GetFirstActor( 'GermanSquad04' )).GetNumLivingMembers() + 
	Unit( GetFirstActor( 'GermanSquad05' )).GetNumLivingMembers() +
	Unit( GetFirstActor( 'GermanGunner01' )).GetNumLivingMembers() +
	Unit( GetFirstActor( 'GermanSquad06' )).GetNumLivingMembers() == 1 )

	If ( GetPawn('G04').Health > 0 )
	{
		myPawn = 'G04';
	}
	Else If ( GetPawn('G05').Health > 0 )
	{
		myPawn = 'G05';
	}
	Else If ( GetPawn('G06').Health > 0 )
	{
		myPawn = 'G06';
	}
	Else If ( GetPawn('G07').Health > 0 )
	{
		myPawn = 'G07';
	}
	Else If ( GetPawn('G08').Health > 0 )
	{
		myPawn = 'G08';
	}
	Else If ( GetPawn('MGGunner01').Health > 0 )
	{
		myPawn = 'MGGunner01';
	}
	Else If ( GetPawn('EG01').Health > 0 )
	{
		myPawn = 'EG01';
	}

	gbxFollowBeacon(getFirstActor('Combat1WaypointBeacon')).m_anOwner=GetPawn( myPawn );

	Do
	{
		sleep( 0.5 );

} Until ( Unit( GetFirstActor( 'GermanSquad03' )).GetNumLivingMembers() +  
	Unit( GetFirstActor( 'GermanSquad04' )).GetNumLivingMembers() + 
	Unit( GetFirstActor( 'GermanSquad05' )).GetNumLivingMembers() +
	Unit( GetFirstActor( 'GermanGunner01' )).GetNumLivingMembers() +
	Unit( GetFirstActor( 'GermanSquad06' )).GetNumLivingMembers() == 0 )

	ACTION_DestroyActor( 'trigger_Combat2WaypointSkip' );
	ACTION_DestroyActor( 'Combat2WaypointSkip' );

	Goto('ScriptEnd');


ScriptEnd:
}
