//=============================================================================
// Combat1SI.
//=============================================================================
class Combat1SI extends TriggeredScript
	placeable;

var ESuppressionLevel SupLevel; 
var Unit aUnit; 

var enum ScriptState
{
	Position_Default,
	Position_Left,
	Position_Right,
	Position_Combat1MissionBoundary,
	Position_Combat1MissionBoundaryOff,
	Position_Barn,

} PlayerPosition, LastPlayerPosition;

var int BodyCount, iPlayerSpot;
var Unit GermanUnit[4];
var UnitControllerAI GermanUnitController[ 4 ];


function PostBeginPlay()
{
	Super.PostBeginPlay();

	GermanUnit[ 0 ] = Unit( GetFirstActor( 'GermanSquad01' ));
	GermanUnit[ 1 ] = Unit( GetFirstActor( 'GermanSquad01b' ));
	GermanUnit[ 2 ] = Unit( GetFirstActor( 'GermanSquad02' ));

	PlayerPosition = Position_Default;
	LastPlayerPosition = Position_Default;

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

// Process incoming messages from the volumes.
function bool ReceiveGBXMessage( gbxMessage msg )
{
	local bool bResult;
    bResult = Super.ReceiveGBXMessage( msg );

	SLog( "Receiving GBXMessage " $ msg );
	SLog( "UserData=" $ msg.UserData );

	if( msg.UserData == 1 )
	{
		LastPlayerPosition = PlayerPosition;
		PlayerPosition = Position_Left;
		slog( "PlayerPosition = Position_Left" );
	}
	else if( msg.UserData == 2 )
	{
		LastPlayerPosition = PlayerPosition;
		PlayerPosition = Position_Right;
		slog( "PlayerPosition = Position_Right" );
	}
	else if( msg.UserData == 3 )
	{
		LastPlayerPosition = PlayerPosition;
		PlayerPosition = Position_Combat1MissionBoundary;
		slog( "PlayerPosition = Position_Combat1MissionBoundary" );
	}
	else if( msg.UserData == 4 )
	{
		LastPlayerPosition = PlayerPosition;
		PlayerPosition = Position_Combat1MissionBoundaryOff;
		slog( "PlayerPosition = Position_Combat1MissionBoundaryOff" );
	}
	else if( msg.UserData == 5 )
	{
		LastPlayerPosition = PlayerPosition;
		PlayerPosition = Position_Barn;
		slog( "PlayerPosition = Position_Combat1MissionBoundaryOff" );
	}
	return bResult;

}


///////////////////////////////////////////////////////////////////////////////////////
// STATES /////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

state Triggered
{
Begin:

	sleep( 1.0 );
	slog( "RUNNING SI LOOP..." );

	GetBodyCount();
	while(  BodyCount > 0 )
		{
			sleep( 0.5 );
			GetBodyCount();

		if ( PlayerPosition == Position_Left )
			{
				SupLevel = GermanUnit[2].MyUnitController.GetSuppressionLevel();
				if ( SupLevel == SL_UNSUPPRESSED )
				{

					ACTION_TriggerEvent( 'SpawnGermanSquad01' );
					ACTION_OrderMove( 'GermanSquad01','C1_GermanSquad2_PathRight' );
					ACTION_OrderMove( 'GermanSquad02','C1_GermanSquad2_PathRight' );
					//ACTION_AssignToUnit( 'G01', 'GermanSquad02' );
				}
			}
		else if ( PlayerPosition == Position_Right  )
			{
				ACTION_OrderMove( 'GermanSquad01', 'GermanSquad01_Path03' );		

				SupLevel = GermanUnit[2].MyUnitController.GetSuppressionLevel();
				if ( SupLevel == SL_UNSUPPRESSED )
				{
					//ACTION_OrderMove( 'GermanSquad02', 'USAFireTeamb_Path02' );
				}
				SupLevel = GermanUnit[1].MyUnitController.GetSuppressionLevel();
				if ( SupLevel == SL_UNSUPPRESSED )
				{
				}

			}
			else if ( PlayerPosition == Position_Combat1MissionBoundary  )
				{
				//ACTION_DisplaySubTitleMessage2( "Leaving Current Objective Area.", 0.5, 255, 255, 0, true, true );
				ACTION_triggerEvent( 'ToggleTimer' );
				}
			else if ( PlayerPosition == Position_Combat1MissionBoundaryOff  )
				{
				ACTION_triggerEvent( 'ToggleTimer' );
				}

			else if ( PlayerPosition == Position_Barn  )
				{
				ACTION_TriggerEvent( 'SpawnGermanSquad01' );
				ACTION_OrderMove( 'GermanSquad01', 'GermanSquad01_Path02' );
				}

			
		}
}

state SecondTriggered
{
Begin:

//
//
//

}
