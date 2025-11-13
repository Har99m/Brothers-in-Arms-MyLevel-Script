//=============================================================================
// Combat4SI.
//=============================================================================
class Combat4SI extends TriggeredScript
	placeable;


var ESuppressionLevel SupLevel; 
var Unit aUnit; 

var enum ScriptState
{
	Position_Default,
	Position_CourtLeft,
	Position_CourtCenter,
	Position_CourtRight,


} PlayerPosition, LastPlayerPosition;

var int BodyCount, iPlayerSpot;
var Unit GermanUnit[2];
var UnitControllerAI GermanUnitController[ 2 ];


function PostBeginPlay()
{
	Super.PostBeginPlay();

	GermanUnit[ 0 ] = Unit( GetFirstActor( 'GermanSquad12a' ));
	GermanUnit[ 1 ] = Unit( GetFirstActor( 'GermanSquad13' ));

	PlayerPosition = Position_Default;
	LastPlayerPosition = Position_Default;

	BodyCount = 0;
}

// This function calculates the number of germans in the world
function GetBodyCount()
{
	BodyCount = GermanUnit[0].GetNumLivingMembers() + 
		 		GermanUnit[1].GetNumLivingMembers();

	SLog( "BodyCount: " $ BodyCount );
}

// Process incoming messages from the volumes.
function bool ReceiveGBXMessage( gbxMessage msg )
{
	local bool bResult;
    bResult = Super.ReceiveGBXMessage( msg );

	SLog( "Receiving GBXMessage " $ msg );
	SLog( "UserData=" $ msg.UserData );

	if( msg.UserData == 41 )
	{
		LastPlayerPosition = PlayerPosition;
		PlayerPosition = Position_CourtLeft;
		slog( "PlayerPosition = Position_CourtLeft" );
	}
	else if( msg.UserData == 42 )
	{
		LastPlayerPosition = PlayerPosition;
		PlayerPosition = Position_CourtCenter;
		slog( "PlayerPosition = Position_CourtCenter" );
	}
	else if( msg.UserData == 43 )
	{
		LastPlayerPosition = PlayerPosition;
		PlayerPosition = Position_CourtRight;
		slog( "PlayerPosition = Position_CourtRight" );
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
			sleep( 1.5 );
			GetBodyCount();

		if ( PlayerPosition == Position_CourtLeft )
			{
				ACTION_OrderMove( 'GermanSquad11', 'GermanChase03_left' );
				ACTION_OrderMove( 'GermanSquad11b', 'GermanChase03_left' );

				SupLevel = GermanUnit[0].MyUnitController.GetSuppressionLevel();
				if ( SupLevel == SL_UNSUPPRESSED )
				{
					ACTION_OrderMove( 'GermanSquad12a','GermanSquad12a_Path01' );
				}
				SupLevel = GermanUnit[1].MyUnitController.GetSuppressionLevel();
				if ( SupLevel == SL_UNSUPPRESSED )
				{
					ACTION_OrderMove( 'GermanSquad13', 'GermanSquad13_Path01' );
				}
			}
		else if ( PlayerPosition == Position_CourtCenter  )
			{
				SupLevel = GermanUnit[0].MyUnitController.GetSuppressionLevel();
				if ( SupLevel == SL_UNSUPPRESSED )
				{
					ACTION_OrderMove( 'GermanSquad12a', 'GermanSquad12a_Path01' );
				}
				SupLevel = GermanUnit[1].MyUnitController.GetSuppressionLevel();
				if ( SupLevel == SL_UNSUPPRESSED )
				{
					ACTION_OrderMove( 'GermanSquad13', 'GermanSquad13_Path01' );
				}

			}
		else if ( PlayerPosition == Position_CourtRight  )
			{

				ACTION_OrderMove( 'GermanSquad11', 'GermanChase03_right' );
				ACTION_OrderMove( 'GermanSquad11b', 'GermanChase03_right' );
				SupLevel = GermanUnit[0].MyUnitController.GetSuppressionLevel();
				if ( SupLevel == SL_UNSUPPRESSED )
				{
					ACTION_OrderMove( 'GermanSquad12a', 'GermanSquad12a_Path02' );
				}
				SupLevel = GermanUnit[1].MyUnitController.GetSuppressionLevel();
				if ( SupLevel == SL_UNSUPPRESSED )
				{
					ACTION_OrderMove( 'GermanSquad13', 'GermanSquad13_Path01' );
				}

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
