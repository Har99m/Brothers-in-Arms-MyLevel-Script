//=============================================================================
// TS_D10_0600_DE22Respawner.
// Created by : Dorian Gorski
// Purpose: Whenever triggered it will refill a specified unit back to full and
// keep it refilled until triggered again
//=============================================================================
class TS_D10_0600_DE22Respawner extends TriggeredScript
	placeable;

var(Events) edfindable Unit Unit_DE_22;
var(Events) name nmSpawnList[3];

var(Events) float fTimeToCheck;
var(Events) int numSquadSize;

var int i;

function PostBeginPlay()
{
	Super.PostBeginPlay();

	i = 0;
}

state Triggered
{
	function OnTrigger()
	{
		GoToState( 'StopSpawning' );
	}

	Begin:

	SLog( "**** Triggered ****" );

	do
	{
		// Check if group is less than 3, and refill
		while ( Unit_DE_22.GetNumLivingMembers() < numSquadSize && i < numSquadSize )
		{
			SLog( "**** Spawning " $ nmSpawnList[i] $ " ****" ); 
			ACTION_TriggerEvent( nmSpawnList[i++] );
		}

		sleep( 0.5 );
		fTimeToCheck -= 0.5;
	} until ( fTimeToCheck <= 0.0 );

	GoToState( 'StopSpawning' );
}

state StopSpawning
{
	function OnTrigger()
	{
		// Do nothing
	}

	Begin:

	SLog( "**** Stopped ****" );

	ScriptEnd:
}
