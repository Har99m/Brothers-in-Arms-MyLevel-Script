//=============================================================================
// TS_D08_1000_MortarTeam.
//=============================================================================
class TS_D08_1000_MortarTeam extends TriggeredScript
	placeable;

var int BodyCount, iRand, iRand2;

var Actor myMortar, LookTarget;
var float fDistance;
var bool bMortarStatus;
var WeapDEMortar myMortarActor;

var Pawn Player;

var Unit GermanUnit[3];

function PostBeginPlay()
{
	Super.PostBeginPlay();
	GermanUnit[0] = Unit( GetFirstActor( 'Unit_DE_C2_Mortar' ));
	GermanUnit[1] = Unit( GetFirstActor( 'Unit_DE_C2_01' ));
	GermanUnit[2] = Unit( GetFirstActor( 'Unit_DE_C2_02' ));
	BodyCount = 0;
}

// This function calculates the number of germans in the world
function GetBodyCount()
{
	BodyCount = GermanUnit[0].GetNumLivingMembers() +
				GermanUnit[1].GetNumLivingMembers() +
				GermanUnit[2].GetNumLivingMembers();
	SLog( "BodyCount: " $ BodyCount );
}


state Triggered
{
	Begin:

	myMortar = GetFirstActor( 'Mortar01' );
	myMortarActor = WeapDEMortar( GetFirstActor( 'Mortar01' ));
	Player = GetLocalPlayerPawn();

slog( "RUNNING BodyCount LOOP" );
	// Wait for Germans to Die to Move to Next Combat
	bMortarStatus = true;
	GetBodyCount();

	WHILE ( BodyCount > 0 )
	{
		sleep(1.0);
		GetBodyCount();

	}
		

	//ACTION_TriggerEvent('WP_obj0');

	/*
	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
	ACTION_SetObjectiveStatus( 1, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 1, 'ObjectiveList', 4.0 );
	*/
	//ACTION_TriggerEvent('WP_obj1');

}
