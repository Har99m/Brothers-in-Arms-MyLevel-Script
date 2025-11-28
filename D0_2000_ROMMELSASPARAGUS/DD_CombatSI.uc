//=============================================================================
// DD_CombatSI.
// Author: Dorian Gorski
// Purpose: Situational AI
// Triggered by: DD_FieldScript
// Referenced by: DD_InfiniteGermanScript
//=============================================================================

class DD_CombatSI extends TriggeredScript
	placeable;

var enum ScriptState
{
	Position_Default,
	Position_F1Botm01,
	Position_F1MidEnt,
	Position_F1Mid02,
	Position_F1Mid04,
	Position_F1Top01,
	Position_F1Mid03,
	Position_F1UnitBotm01,
	Position_F1UnitMid04,
	Position_SquadOut,
	Position_F2Ent,
	Position_F2Botm03,
	Position_F2Botm02,
	Position_F2Botm01,
	Position_F2Botm04,
	Position_F2Mid01,
	Position_F2Mid02,
	Position_F2Mid03,
	Position_F2BotmSand,
	Position_F2BotmCrack,
	Position_F2BotmCircle,
	Position_LeaveIGSZone,
	Position_EnterIGSZone,
	Position_PlayerIGSLeave
} PlayerPosition, LastPlayerPosition;

var bool ObjectiveComplete, ObjectiveComplete2;
var bool bGerman1011Spawned;
var Unit GermanUnit[2];

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
{
	Super.PostBeginPlay();

	GermanUnit[0] = Unit( GetFirstActor( 'InfiniteGermanSquad09' ));
	GermanUnit[1] = Unit( GetFirstActor( 'GermanSquad10' ));

	PlayerPosition = Position_Default;
	LastPlayerPosition = Position_Default;

	ObjectiveComplete = false;
	ObjectiveComplete2 = false;
	bGerman1011Spawned = false;
}

// Process incoming messages from the volumes.
function bool ReceiveGBXMessage( gbxMessage msg )
{
	local bool bResult;
	bResult = Super.ReceiveGBXMessage( msg );

	// SLog( "Receiving GBXMessage " $ msg );
	// SLog( "UserData=" $ msg.UserData );

	switch ( msg.UserData )
	{
		case 1:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F1Botm01;
			// SLog( "PlayerPosition = Position_F1Botm01" );
			break;
		case 2:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F1MidEnt;
			// SLog( "PlayerPosition = Position_F1MidEnt" );
			break;
		case 3:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F1Mid02;
			// SLog( "PlayerPosition = Position_F1Mid02" );
			break;
		case 4:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F1Mid04;
			// SLog( "PlayerPosition = Position_F1Mid04" );
			break;
		case 5:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F1Top01;
			// SLog( "PlayerPosition = Position_F1Top01" );
			break;
		case 6:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F1Mid03;
			// SLog( "PlayerPosition = Position_F1Mid03" );
			break;
		case 10:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F2Ent;
			// SLog( "PlayerPosition = Position_F2Ent" );
			break;
		case 11:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F2Botm03;
			// SLog( "PlayerPosition = Position_F2Botm03" );
			break;
		case 12:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F2Botm02;
			// SLog( "PlayerPosition = Position_F2Botm02" );
			break;
		case 13:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F2Botm01;
			// SLog( "PlayerPosition = Position_F2Botm01" );
			break;
		case 14:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F2Botm04;
			// SLog( "PlayerPosition = Position_F2Botm04" );
			break;
		case 15:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F2Mid01;
			// SLog( "PlayerPosition = Position_F2Mid01" );
			break;
		case 16:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F2Mid02;
			// SLog( "PlayerPosition = Position_F2Mid02" );
			break;
		case 17:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F2Mid03;
			// SLog( "PlayerPosition = Position_F2Mid03" );
			break;
		case 18:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F2BotmSand;
			// SLog( "PlayerPosition = Position_F2BotmSand" );
			break;
		case 19:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F2BotmCrack;
			// SLog( "PlayerPosition = Position_F2BotmCrack" );
			break;
		case 20:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_F2BotmCircle;
			// SLog( "PlayerPosition = Position_F2BotmCircle" );
			break;
		case 23:
			LastPlayerPosition = PlayerPosition;
			PlayerPosition = Position_PlayerIGSLeave;
			break; 
		case 101:
			ObjectiveComplete = true;
			// SLog( "ObjectiveComplete 101" );
			break;
		case 102:
			ObjectiveComplete2 = true;
			// SLog( "ObjectiveComplete 102" );
			break;
		default:
			// SLog( "Error DD_CombatSI.ReceiveGBXMessage: Bad msg.UserData Value" );
			break;
	}

	return bResult;
}


//=============================================================================
// States of DD_CombatSI.
//=============================================================================

state Triggered
{
	Begin:

	do
	{
		sleep( 1.0 );

		if ( PlayerPosition != LastPlayerPosition )
		{
			LastPlayerPosition = PlayerPosition;

			switch ( PlayerPosition )
			{
				case Position_F2Botm04:
				case Position_F2BotmCrack:
					// Do nothing
					break;
				case Position_F1Botm01:
				case Position_F1MidEnt:
				case Position_F1Mid02:
					ACTION_OrderMove( 'GermanSquad01', 'PathF1MidEntLogs' );
					break;
				case Position_F1Top01:
				case Position_F1Mid04:
					ACTION_OrderMove( 'GermanSquad01', 'PathCornerHGrow' );
					break;
				// ========================================================================================
				case Position_F2Ent:
					ACTION_OrderMove( 'GermanSquad06', 'DrainWallPath01' );
					break;
				case Position_F2Botm03:
					ACTION_OrderMove( 'GermanSquad06', 'DrainWallPath02' );
					break;
				case Position_F2Botm02:
					ACTION_OrderMove( 'GermanSquad06', 'DrainWallPath03' );
					break;
				case Position_F2Mid01:
					ACTION_OrderMove( 'GermanSquad07', 'RightSandBagPath' );
					break;
				case Position_F2Mid02:
					ACTION_OrderMove( 'GermanSquad07', 'LeftSandBagPath' );
					break;
				case Position_F2Mid03:
					ACTION_OrderMove( 'GermanSquad07', 'F2MidPeanutPath' );
					break;
				case Position_F2BotmSand:
					ACTION_OrderMove( 'InfiniteGermanSquad09', 'F2SandBagBotm' );

					if ( GermanUnit[0].GetNumLivingMembers() == 0 )
					{
						ACTION_ForceTurretDismount( 'FlakvierlingFactory' );
						sleep( 1.0 );

						ACTION_OrderMove( 'GermanSquad10', 'F2BotmPeanutPath' );
					}

					if ( !bGerman1011Spawned )
					{
						ACTION_TriggerEvent( 'SpawnGermanSquads1011' );
						bGerman1011Spawned = TRUE;
					}

					break;
				case Position_F2BotmCircle:
					if ( GermanUnit[1].GetNumLivingMembers() == 0 )
						ACTION_OrderMove( 'InfiniteGermanSquad09', 'F2TopPeanutPath' );
					break;
				default:
					// SLog( "Error DD_CombatSI.Triggered: Bad PlayerPosition" );
					break;
			}
		}
	} until ( ObjectiveComplete2 );

	ScriptEnd:
}
