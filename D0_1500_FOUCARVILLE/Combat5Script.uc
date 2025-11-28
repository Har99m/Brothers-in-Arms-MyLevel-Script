//=============================================================================
// Combat5Script.
//=============================================================================
class Combat5Script extends TriggeredScript
	placeable;

var int BodyCount, iRand, iRand2;

var Actor Mortar2, LookTarget;
var float fDistance;
var bool bMortarStatus;
var WeapDEMortar Mortar2Actor;
var Actorlite LeggettEndNode;

var Unit GermanUnit[3], HartsockUnit;

var Pawn Hartsock, Garnett, Allen, Player, Leggett;

var vector MoveToLocation;  // the location in front of the player where Leggett runs to
var Vector NewVect;			// The New Vector For Leggett to Run too
var Rotator tempRot;		// The Rotation For Leggett

function PostBeginPlay()
{
	Super.PostBeginPlay();
	GermanUnit[1] = Unit( GetFirstActor( 'GermanSquad05_Mortar' ));
	GermanUnit[2] = Unit( GetFirstActor( 'GermanSquad05_Mortar2' ));
	HartsockUnit = Unit( GetFirstActor( 'USAFireTeam2' ));
	BodyCount = 0;

	fDistance = VSize( Mortar2.Location - Player.Location );
}

// This function calculates the number of germans in the world
function GetBodyCount()
{
	BodyCount = GermanUnit[1].GetNumLivingMembers() +
				GermanUnit[2].GetNumLivingMembers();
	SLog( "BodyCount: " $ BodyCount );
}

state Triggered
{
Begin:

	ACTION_EnableMortarRecruiting( 'GermanMortar', true );
	ACTION_EnableMortarRecruiting( 'GermanMortar2', true );

	Player = GetLocalPlayerPawn();
	Hartsock = GetPawn( 'Hartsock' );
	Garnett = GetPawn( 'Garnett');
	Allen = GetPawn( 'Allen' );
	LookTarget = GetFirstActor( 'Waypoint_Outro' );

	//Start Objective and Turn On Objective Beacon
//	ACTION_DisplayObjectiveString( "HINT: Kill the German mortar teams.", 4.0 );
	ACTION_DisplayObjectiveHint(S_Localize("HINT_3", "D0_1500_FOUCARVILLE" ), 3.0 );
	ACTION_TriggerEvent( 'Waypoint_MortarTeam' );

	ACTION_TriggerEvent( 'SpawnGermanSquad05_Mortar' );
	Mortar2 = GetFirstActor( 'GermanMortar2' );
	Mortar2Actor = WeapDEMortar( GetFirstActor( 'GermanMortar2' ));

//	WeapDEMortar ( GetFirstActor ( 'GermanMortar2' ) ).bFireRateIndependent = true;
	ACTION_WaitForEvent( 'Mortar2Mount' );
//	ACTION_SetMortarTargetByName( 'GermanMortar2', 'Mortar2Target1', MortarFire_Marching, 4, 2.0, 6000.0 );
	ACTION_SetMortarTargetByName( 'GermanMortar2', 'MortarTarget3', MortarFire_Marching, 1, 2.0, 0 );
	ACTION_SetMortarTargetByName( 'GermanMortar', 'MortarTarget', MortarFire_Effect, 4, 2.0, 2500.0 );
	ACTION_WaitForEvent( 'Mortar2StopFiring' );
	ACTION_SetMortarTargetByName( 'GermanMortar2', 'Mortar2Target_Tele', MortarFire_Marching, 1, 2.0, 0 );
	ACTION_WaitForEvent( 'Mortar2StopFiring' );
	ACTION_SetMortarTargetByName( 'GermanMortar2', 'Mortar2Target2', MortarFire_Marching, 1, 2.0, 0 );
	ACTION_WaitForEvent( 'Mortar2StopFiring' );
	ACTION_SetMortarTargetByName( 'GermanMortar2', 'Mortar2Target1', MortarFire_Marching, 1, 2.0, 0 );
	sleep( 2.0 );
	ACTION_TriggerEvent( 'TeleWireScript' );
	ACTION_TriggerEvent( 'TeleWoodEmitter' );
	ACTION_DestroyActor( 'fencewhole' );
	ACTION_SetHidden( 'fencedestroyed' , false );
	ACTION_TriggerEvent( 'C4FenceVolumes' );

//	sleep( 7.10 );


	// IMPORTED KARMA STATE FOR POLE
/*	sleep( 10.0 );

auto state Start
{
Begin:

	ACTION_WakeKarmaActor( 'cow' );
	ACTION_SetHidden( 'cow' , true );
	GotoState( 'Default' );
}

state Triggered
{
Begin:

	SLog ( "Pushing Cow" );
	ACTION_DestroyActor( 'static_cow' );
	ACTION_SetHidden( 'cow' , false );
	ACTION_PushKarmaActor( 'Cow' , 6000.0 , 'cow_target' );

	GotoState( 'Default' );
}
*/
//	ACTION_WaitForEvent( 'Mortar2StopFiring' );
	sleep( 5.0 );

	slog( "RUNNING BodyCount LOOP" );
	// Wait for Germans to Die to Move to Next Combat
	bMortarStatus = true;
	GetBodyCount();
	while( BodyCount > 0 )
		{
		fDistance = VSize( Mortar2.Location - Player.Location );
	SLog( "fDistance: " $ fDistance );
	SLog( "Mortar2.Location: " $ Mortar2.Location );
	SLog( "Player.Location: " $ Player.Location );
		if( fDistance > 5600.0 )
			{
			if( bMortarStatus == false )
			{
			Mortar2Actor.bFireRateIndependent = true;
			bMortarStatus = true;
			}
			if( HartsockUnit.GetNumLivingMembers() > 0 )
				{
				iRand = Rand( 3 );
				If( iRand != 0 )
					{
					ACTION_SetMortarTargetPlayer( 'GermanMortar2', MortarFire_Marching, 6,  2.0, 4500.0 );
					}
				else if( iRand == 0 )
					{
					if( Hartsock.health > 0 )
						{
						ACTION_SetMortarTargetByName( 'GermanMortar2', 'Hartsock',  MortarFire_Marching, 6, 2.0, 4500.0 );
						}
					else if( Garnett.health > 0 )
						{
						ACTION_SetMortarTargetByName( 'GermanMortar2', 'Garnett',  MortarFire_Marching, 6, 2.0, 4500.0 );
						}
					else if( Allen.health > 0 )
						{
						ACTION_SetMortarTargetByName( 'GermanMortar2', 'Allen',  MortarFire_Marching, 6, 2.0, 4500.0 );
						}
					}
				}
			else if( HartsockUnit.GetNumLivingMembers() == 0 )
				{
				ACTION_SetMortarTargetPlayer( 'GermanMortar2', MortarFire_Marching, 6, 2.0,  4500.0 );
				}
			}
		else if( fDistance < 5600.0 )
			{
			if( bMortarStatus == true )
			{
			Mortar2Actor.bFireRateIndependent = false;
			bMortarStatus = false;
			}
			iRand2 = Rand( 2500 );
			ACTION_SetMortarTargetByName( 'GermanMortar2', 'MortarTarget3', MortarFire_Effect, 6, 1.75, iRand2 );
			}
		iRand2 = Rand( 2500 );
		ACTION_SetMortarTargetByName( 'GermanMortar', 'MortarTarget', MortarFire_Effect, 6, 2.5, iRand2 );
		sleep( 15.0 );
		GetBodyCount();
		If( BodyCount < 1 )
			{
			// End Combat
			break;
			}
		}

CombatEnd:
	ACTION_TriggerEvent( 'Waypoint_MortarTeam' );
	ACTION_DestroyActor( 'Waypoint_MortarTeam' );
	ACTION_TriggerEvent( 'Waypoint_Outro' );
	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList_FV' );
	ACTION_DisplayObjective( 0, 'ObjectiveList_FV', 5.0 );
	sleep( 3.0 );
//	ACTION_DisplayObjectiveString( "HINT: Meet with Mac to end your mission", 4.0 );
	ACTION_DisplayObjectiveHint(S_Localize("HINT_4", "D0_1500_FOUCARVILLE" ), 3.0 );
	ACTION_TriggerEvent( 'OutroScript' );

	ACTION_WaitForEvent( 'Outro_LeggettWalk' );
	sleep( 1.0 );
	Leggett = GetPawn( 'Leggett' );
//	ACTION_ChangeController( 'Leggett', class'ScriptedController' );
	LeggettEndNode = GetNavigationPoint('LeggettNode');
	ACTION_MoveToward( Leggett, LeggettEndNode , FALSE );
	While ( !PawnIsAtDestination( Leggett, LeggettEndNode ) )
		{
		ACTION_MoveToward( Leggett, LeggettEndNode , FALSE );
		sleep( 0.5 );
		}
	Leggett.Controller.Focus = LookTarget;
	ACTION_TriggerEvent( 'Trigger_OutroScript' );

ScriptEnd:
}
