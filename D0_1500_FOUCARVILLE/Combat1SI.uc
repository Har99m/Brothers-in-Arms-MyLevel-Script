//=============================================================================
// Combat1SI.
//=============================================================================
class Combat1SI extends TriggeredScript
	placeable;

var Pawn Baker;
var int BodyCount, iPlayerSpot, PlayerPosition, LastPlayerPosition;
var Unit GermanUnit[4];
var UnitControllerAI GermanUnitController[ 4 ];
var ESuppressionLevel SupLevel, SupLevel2;

var enum ScriptState
{
	Default,
	RunningState,
	EndState
} Combat1SIState;

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
{
	Super.PostBeginPlay();

	GermanUnit[ 0 ] = Unit( GetFirstActor( 'GermanSquad01' ));
	GermanUnit[ 1 ] = Unit( GetFirstActor( 'GermanSquad01b' ));
	GermanUnit[ 2 ] = Unit( GetFirstActor( 'GermanSquad01c' ));
	GermanUnit[ 3 ] = Unit( GetFirstActor( 'GermanSquad01d' ));

	PlayerPosition = 100;
	LastPlayerPosition = 100;

	BodyCount = 0;
}

// This function calculates the number of germans in the world
function GetBodyCount()
{
	BodyCount = GermanUnit[0].GetNumLivingMembers() + 
		 		GermanUnit[1].GetNumLivingMembers() +
		 		GermanUnit[2].GetNumLivingMembers() +
		 		GermanUnit[3].GetNumLivingMembers();

	SLog( "BodyCount: " $ BodyCount );
}

function bool ReceiveGBXMessage( gbxMessage msg )
{
	local bool bResult;
    bResult = Super.ReceiveGBXMessage( msg );

	if( msg.UserData > 99
		&& msg.UserData < 200
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

	Combat1SIState = RunningState;
	slog( "RUNNING Combat1SI LOOP" );
	// Wait for Germans to Die to Move to Next Combat
	GetBodyCount();
	while(  BodyCount > 0 )
		{
			switch( PlayerPosition )
			{
				case 101:
					slog( "NOTHING" );
					break;
				case 102:
					SupLevel = GermanUnit[2].MyUnitController.GetSuppressionLevel();
					if ( SupLevel == SL_UNSUPPRESSED )
					{
					slog( "GermanSquad201 MOVING to GermanSquad201_Path02" );
					ACTION_OrderMove( 'GermanSquad01c', 'C1_BarrelBlockadeRear' );
					}
					SupLevel2 = GermanUnit[3].MyUnitController.GetSuppressionLevel();
					if ( SupLevel2 == SL_UNSUPPRESSED )
					{
					slog( "GermanSquad201 MOVING to GermanSquad201_Path02" );
					ACTION_OrderMove( 'GermanSquad01d', 'C1_BarrelBlockadeFront' );
					}
					break;
				case 103:
					SupLevel = GermanUnit[2].MyUnitController.GetSuppressionLevel();
					if ( SupLevel == SL_UNSUPPRESSED )
					{
					slog( "GermanSquad201 MOVING to GermanSquad201_Path02" );
					ACTION_OrderMove( 'GermanSquad01c', 'C1_Blockade' );
					}
					SupLevel2 = GermanUnit[3].MyUnitController.GetSuppressionLevel();
					if ( SupLevel2 == SL_UNSUPPRESSED )
					{
					slog( "GermanSquad201 MOVING to GermanSquad201_Path02" );
					ACTION_OrderMove( 'GermanSquad01d', 'C1_BarrelBlockadeRear' );
					}
					break;
				case 104:
					slog( "NOTHING" );
					break;
				case 100:
				default:
					break;
			}
			sleep( 1.5 );
			GetBodyCount();
		If( BodyCount < 1 )
			{
			// End Combat
			Combat1SIState = EndState;
			break;
			}
		}

ScriptEnd:

	ACTION_TriggerEvent( 'Checkpoint1Script' );
	sleep( 3.0 );
	Combat1SIState = default;
	Gotostate( 'default' );
}
