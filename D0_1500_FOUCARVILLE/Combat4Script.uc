//=============================================================================
// Combat4Script.
//=============================================================================
class Combat4Script extends TriggeredScript
	placeable;

var int BodyCount;

var Unit GermanUnit[ 10 ];
var UnitControllerAI GermanUnitController[ 10 ];

function PostBeginPlay()
{
	Super.PostBeginPlay();

	GermanUnit[ 0 ] = Unit( GetFirstActor( 'GermanSquad04' ));
	GermanUnit[ 1 ] = Unit( GetFirstActor( 'GermanSquad04b' ));
	GermanUnit[ 2 ] = Unit( GetFirstActor( 'GermanSquad04c' ));
	GermanUnit[ 3 ] = Unit( GetFirstActor( 'GermanSquad04d' ));
	GermanUnit[ 4 ] = Unit( GetFirstActor( 'GermanSquad04e' ));
	GermanUnit[ 5 ] = Unit( GetFirstActor( 'GermanSquad04f' ));

	BodyCount = 0;
}

// This function calculates the number of germans in the world
function GetBodyCount()
{
	BodyCount = GermanUnit[0].GetNumLivingMembers() + 
		 		GermanUnit[1].GetNumLivingMembers() +
		 		GermanUnit[2].GetNumLivingMembers() +
		 		GermanUnit[3].GetNumLivingMembers() +
		 		GermanUnit[4].GetNumLivingMembers() +
		 		GermanUnit[5].GetNumLivingMembers();

	SLog( "BodyCount: " $ BodyCount );
}

state Triggered
{
Begin:

	ACTION_TriggerEvent( 'SpawnGermanSquad04' );
	ACTION_TriggerEvent( 'SpawnGermanSquad04c' );
	sleep( 1.0 );

	SLog( "****GermanSquad04c_1: " $ GetPawn('GermanSquad04c_1') );
	SLog( "****GermanSquad04c_1b: " $ GetPawn('GermanSquad04c_1b') );

	ACTION_OrderMove( 'GermanSquad04', 'GermanSquad305_Path12b' );
	ACTION_OrderMove( 'GermanSquad04c', 'GermanSquad305_Path12b' );
	sleep( 0.2 );

	slog( "RUNNING BodyCount LOOP" );
	// Wait for Germans to Die to Move to Next Combat
	GetBodyCount();
	while(  BodyCount > 0 )
		{
			sleep( 1.5 );
			GetBodyCount();
		If( BodyCount == 3 )
			{
			// Make Sure guys aren't stuck
			ACTION_OrderMove( 'GermanSquad04', 'GermanSquad305_Path12b' );
			ACTION_OrderMove( 'GermanSquad04c', 'GermanSquad305_Path12b' );
			}
		If( BodyCount < 1 )
			{
			// End Combat
			break;
			}
		}

CombatWave2:

	ACTION_TriggerEvent( 'SpawnGermanSquad04d' );
	ACTION_TriggerEvent( 'SpawnGermanSquad04b' );
	ACTION_TriggerEvent( 'SpawnGermanSquad04c' );
	sleep( 1.0 );
	ACTION_OrderMove( 'GermanSquad04d', 'GermanSquad305_Path12b' );
	sleep( 0.2 );
	ACTION_OrderMove( 'GermanSquad04b', 'GermanSquad305_Path12a' );
	ACTION_OrderMove( 'GermanSquad04b', 'GermanSquad305_Path12b', true );
	sleep( 0.2 );
	ACTION_OrderMove( 'GermanSquad04c', 'GermanSquad305_Path12a' );
	ACTION_OrderMove( 'GermanSquad04c', 'GermanSquad305_Path12b', true );
	slog( "RUNNING BodyCount LOOP" );
	// Wait for Germans to Die to Move to Next Combat
	GetBodyCount();
	while(  BodyCount > 1 )
		{
			sleep( 1.5 );
			GetBodyCount();
		If( BodyCount < 2 )
			{
			// End Combat
			break;
			}
		}

CombatWave3:

	ACTION_TriggerEvent( 'SpawnGermanSquad04d' );
	ACTION_TriggerEvent( 'SpawnGermanSquad04e' );
	sleep( 1.0 );
	ACTION_OrderMove( 'GermanSquad04d', 'GermanSquad305_Path12b' );
	ACTION_OrderMove( 'GermanSquad04e', 'GermanSquad305_Path12b' );
	sleep( 0.2 );
	slog( "RUNNING BodyCount LOOP" );
	// Wait for Germans to Die to Move to Next Combat
	GetBodyCount();
	while(  BodyCount > 3 )
		{
			sleep( 1.5 );
			GetBodyCount();
		If( BodyCount < 4 )
			{
			// End Combat
			break;
			}
		}
	ACTION_TriggerEvent( 'SpawnGermanSquad04f' );
	ACTION_TriggerEvent( 'SpawnGermanSquad04d' );
	sleep( 1.0 );
	ACTION_OrderMove( 'GermanSquad04f', 'C4_GS4f_Path1' );
	ACTION_OrderMove( 'GermanSquad04f', 'GermanSquad306_Path12b', true );
	sleep( 0.75 );
	ACTION_OrderMove( 'GermanSquad04d', 'GermanSquad305_Path12b' );
	sleep( 0.75 );

	slog( "RUNNING BodyCount LOOP" );
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

CombatEnd:

	ACTION_TriggerEvent( 'Waypoint_ChurchRoadBlock' );
	ACTION_DestroyActor( 'Waypoint_ChurchRoadBlock' );
	sleep( 0.2 );
	ACTION_TriggerEvent( 'Combat5Script' );
	ACTION_UnBlockNavPoints( 'PN_Fence_Road' );
	ACTION_UnBlockNavPoints( 'PN_Fence_Field' );
ScriptEnd:
}
