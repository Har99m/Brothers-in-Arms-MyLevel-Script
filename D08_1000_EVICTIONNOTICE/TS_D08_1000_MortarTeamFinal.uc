//=============================================================================
// TS_D08_1000_MortarTeamFinal.
//=============================================================================
class TS_D08_1000_MortarTeamFinal extends TriggeredScript
	placeable;

var int BodyCountLarge;

var Unit GermanUnit[5];

function PostBeginPlay()
{
	Super.PostBeginPlay();
	GermanUnit[0] = Unit( GetFirstActor( 'Unit_DE_C05_U01' ));
	GermanUnit[1] = Unit( GetFirstActor( 'Unit_DE_C05_U02' ));
	GermanUnit[2] = Unit( GetFirstActor( 'Unit_DE_C05_U03' ));
	GermanUnit[3] = Unit( GetFirstActor( 'Unit_DE_C05_U04' ));
	GermanUnit[4] = Unit( GetFirstActor( 'Unit_DE_C5_Mortar' ));
	BodyCountLarge = 0;
}

// This function calculates the number of germans in the world
function GetBodyCountLarge()
{
	BodyCountLarge = GermanUnit[0].GetNumLivingMembers() +
				GermanUnit[1].GetNumLivingMembers() +
				GermanUnit[2].GetNumLivingMembers() +
				GermanUnit[3].GetNumLivingMembers() +
				GermanUnit[4].GetNumLivingMembers();
	SLog( "BodyCountLarge: " $ BodyCountLarge );
}

state Triggered
{
	Begin:

	slog( "RUNNING BodyCount LOOP" );
	// Wait for Germans to Die to Move to Next Combat
	GetBodyCountLarge();

	DO
	{
		sleep(1.0);
		GetBodyCountLarge();
	} UNTIL ( BodyCountLarge <= 0 );

	//GetFirstActor(gbxWaypointBeacon('gbxWaypointBeacon_MainObjective')).bEnabled = False;
	ACTION_TriggerEvent('gbxWaypointBeacon_MainObjective');//OFF

	//GetFirstActor(gbxWaypointBeacon('gbxWaypointBeacon_OutroHint')).bEnabled = True;
	ACTION_TriggerEvent('gbxWaypointBeacon_OutroHint');//ON
	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );

	ACTION_TriggerEvent('TS_D08_1000_OutroScene');

	ACTION_DisplayObjectiveHint(S_Localize("HINT_A"), 2.0 );

}


