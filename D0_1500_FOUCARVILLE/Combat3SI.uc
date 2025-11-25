//=============================================================================
// Combat3SI.
//=============================================================================
class Combat3SI extends TriggeredScript
	placeable;

var int BodyCount, BodyCount2, PlayerPosition, LastPlayerPosition;
var Unit GermanUnit[ 10 ];
var UnitControllerAI GermanUnitController[ 10 ];

var ESuppressionLevel SupLevel_GS3, SupLevel_GS3b, SupLevel_GS3c, SupLevel_GS3d;
var Unit aUnit;

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
{
	Super.PostBeginPlay();

	GermanUnit[ 0 ] = Unit( GetFirstActor( 'GermanSquad03' ));
	GermanUnit[ 1 ] = Unit( GetFirstActor( 'GermanSquad03b' ));
	GermanUnit[ 2 ] = Unit( GetFirstActor( 'GermanSquad03c' ));
	GermanUnit[ 3 ] = Unit( GetFirstActor( 'GermanSquad03d' ));

	PlayerPosition = 100;
	LastPlayerPosition = 100;

	BodyCount = 0;
	BodyCount2 = 0;
}

// These 4 functions get the Supression Levels of thier German Units
function GetSupLevel_GS3()
{
	SupLevel_GS3 = GermanUnit[ 0 ].MyUnitController.GetSuppressionLevel();
	SLog( "Supression Level: " $ SupLevel_GS3 );
}
function GetSupLevel_GS3b()
{
	SupLevel_GS3b = GermanUnit[ 1 ].MyUnitController.GetSuppressionLevel();
	SLog( "Supression Level: " $ SupLevel_GS3b );
}
function GetSupLevel_GS3c()
{
	SupLevel_GS3c = GermanUnit[ 2 ].MyUnitController.GetSuppressionLevel();
	SLog( "Supression Level: " $ SupLevel_GS3c );
}
function GetSupLevel_GS3d()
{
	SupLevel_GS3d = GermanUnit[ 3 ].MyUnitController.GetSuppressionLevel();
	SLog( "Supression Level: " $ SupLevel_GS3d );
}

// These 2 function calculate the number of Germans in the world
function GetBodyCount()
{
	BodyCount = GermanUnit[0].GetNumLivingMembers() + 
		 		GermanUnit[1].GetNumLivingMembers();

	SLog( "BodyCount: " $ BodyCount );
}
function GetBodyCount2()
{
	BodyCount2 = GermanUnit[0].GetNumLivingMembers() + 
		 		GermanUnit[1].GetNumLivingMembers() +
		 		GermanUnit[2].GetNumLivingMembers() +
		 		GermanUnit[3].GetNumLivingMembers() +
		 		GermanUnit[4].GetNumLivingMembers();

	SLog( "BodyCount2: " $ BodyCount2 );
}

function bool ReceiveGBXMessage( gbxMessage msg )
{
	local bool bResult;
    bResult = Super.ReceiveGBXMessage( msg );

	if( msg.UserData > 299
		&& msg.UserData < 400
		&& msg.UserData != PlayerPosition )
	{
		//slog( "Receiving GBXMessage " $ msg );
		slog( "GBXMessage UserData = " $ msg.UserData );

		LastPlayerPosition = PlayerPosition;
		PlayerPosition = msg.UserData;
	}
	return bResult;
}

state Triggered
{
Begin:
/*
	slog( "RUNNING Combat3SI LOOP" );
	// Wait for Germans to Die to Move to Next Combat
	GetBodyCount();
	while(  BodyCount > 0 )
		{
			sleep( 1.5 );
			GetBodyCount();
		If( BodyCount < 1 )
			{
			// End Combat
			ACTION_TriggerEvent( 'Combat3ChurchStart' );
			break;
			}
		}

CombatEnd:
//	ACTION_DisplayObjectiveString( "CHECKPOINT REACHED", 5.0 );
	sleep( 5.0 );
*/
ChurchCombat:
	// Wait for Germans to Die to Move to Next Combat
	GetBodyCount2();
	while(  BodyCount2 > 0 )
		{
			slog( "RUNNING Combat3SI LOOP" );
			switch( PlayerPosition )
			{
				case 301:
					slog( "Gbx_MT_Church_Southwest" );
					slog( "NOTHING" );
					break;
				case 302:
					slog( "Gbx_MT_Church_South" );
					GetSupLevel_GS3();
					if( SupLevel_GS3 == SL_UNSUPPRESSED )
					{
					slog( "GermanSquad03 MOVING to NorthWest Church Entrance" );
					ACTION_OrderMove( 'GermanSquad03', 'ChurchWallsNW' );
					}
					GetSupLevel_GS3b();
					if( SupLevel_GS3b == SL_UNSUPPRESSED )
					{
					slog( "GermanSquad03b MOVING to North graves" );
					ACTION_OrderMove( 'GermanSquad03b', 'PN_Graveyard_North' );
					}
					break;
				case 303:
					slog( "Gbx_MT_Church_SouthEast" );
					GetSupLevel_GS3();
					if( SupLevel_GS3 == SL_UNSUPPRESSED )
					{
					slog( "GermanSquad03 MOVING to NorthWest Church Entrance" );
					ACTION_OrderMove( 'GermanSquad03', 'PN_Graveyard_West' );
					}
					GetSupLevel_GS3c();
					if( SupLevel_GS3c == SL_UNSUPPRESSED )
					{
					slog( "GermanSquad03c MOVING to East GraveYard" );
					ACTION_OrderMove( 'GermanSquad03c', 'PN_Graveyard_East' );
					}
					break;
				case 304:
					slog( "Gbx_MT_Church_East" );
					slog( "NOTHING" );
					break;
				case 305:
					slog( "Gbx_MT_Church_NorthEast" );
					slog( "NOTHING" );
					break;
				case 306:
					slog( "Gbx_MT_Church_North" );
					GetSupLevel_GS3d();
					if ( SupLevel_GS3d == SL_UNSUPPRESSED )
					{
					slog( "GermanSquad03d MOVING to NorthEast Side of Church" );
					ACTION_OrderMove( 'GermanSquad03d', 'PN_NE_Headstones' );
					}
					break;
				case 307:
					slog( "Gbx_MT_Church_NorthWest" );
					GetSupLevel_GS3();
					if( SupLevel_GS3 == SL_UNSUPPRESSED )
					{
					slog( "GermanSquad03 MOVING to NorthWest Church Entrance" );
					ACTION_OrderMove( 'GermanSquad03', 'PN_Peanut' );
					}
					break;
				case 308:
					slog( "Gbx_MT_Church_North_Road" );
					GetSupLevel_GS3d();
					if ( SupLevel_GS3d == SL_UNSUPPRESSED )
					{
					slog( "GermanSquad03d MOVING to NorthEast Side of Church" );
					ACTION_OrderMove( 'GermanSquad03d', 'PN_NE_Headstones' );
					}
					break;
				case 300:
				default:
					break;
			}
			sleep( 2.0 );
			GetBodyCount2();
		If( BodyCount2 < 1 )
			{
			// End Combat
			break;
			}
		}

ScriptEnd:
	//Complete Objective and Turn Off Objective Beacon
	ACTION_TriggerEvent( 'Waypoint_ChurchArea' );
	ACTION_DestroyActor( 'Waypoint_ChurchArea' );
	ACTION_DestroyActor( 'Combat3_FollowBeacon' );
	ACTION_TriggerEvent( 'Waypoint_ChurchRoadBlock' );
	sleep( 3.0 );
	//Start Objective and Turn On Objective Beacon
//	ACTION_DisplayObjectiveString( "HINT: Man the MG42 to defend the church.", 4.0 );
	ACTION_DisplayObjectiveHint(S_Localize("HINT_2", "D0_1500_FOUCARVILLE" ), 3.0 );
	sleep( 3.0 );
	ACTION_TriggerEvent( 'Combat3ScriptSave_trigger' );
}

