//=============================================================================
// Combat2SI.
//=============================================================================
class Combat2SI extends TriggeredScript
	placeable;

var int PlayerPosition, LastPlayerPosition, BodyCount;

var Unit GermanUnit[ 6 ];
var UnitControllerAI GermanUnitController[ 6 ];

function PostBeginPlay()
{
	Super.PostBeginPlay();

	GermanUnit[ 0 ] = Unit( GetFirstActor( 'GermanSquad02' ));
	GermanUnit[ 1 ] = Unit( GetFirstActor( 'GermanSquad02b' ));
	GermanUnit[ 2 ] = Unit( GetFirstActor( 'GermanSquad02c' ));
	GermanUnit[ 3 ] = Unit( GetFirstActor( 'GermanSquad02d' ));
	GermanUnit[ 4 ] = Unit( GetFirstActor( 'GermanSquad02e' ));

	PlayerPosition = 200;
	LastPlayerPosition = 200;

	BodyCount = 0;
}

// This function calculates the number of germans in the world
function GetBodyCount()
{
	BodyCount = GermanUnit[0].GetNumLivingMembers() + 
		 		GermanUnit[1].GetNumLivingMembers() +
		 		GermanUnit[2].GetNumLivingMembers() +
		 		GermanUnit[3].GetNumLivingMembers() +
		 		GermanUnit[4].GetNumLivingMembers();

	SLog( "BodyCount: " $ BodyCount );
}

state Triggered
{
Begin:

	slog( "RUNNING Combat2SI LOOP" );
	// Wait for Germans to Die to Move to Next Combat
	GetBodyCount();
	while(  BodyCount > 0 )
		{
			sleep( 1.5 );
			GetBodyCount();
		If( BodyCount < 1 )
			{
			// End Combat
			break;
			}
		}

ScriptEnd:

	//Complete Objective and Turn Off Objective Beacon
	ACTION_TriggerEvent( 'Waypoint_MG42_RB2' );
	ACTION_DestroyActor( 'Waypoint_MG42_RB2' );
	sleep( 3.0 );
	//Start Objective and Turn On Objective Beacon
//	ACTION_DisplayObjective( 0, 'ObjectiveList_FV', 5.0 );
	ACTION_DisplayObjectiveHint( "", 3.0 );
	ACTION_SetObjectiveBeaconState( 'Waypoint_ChurchArea', true, true, true );
	ACTION_TriggerEvent( 'Waypoint_ChurchArea' );
}
