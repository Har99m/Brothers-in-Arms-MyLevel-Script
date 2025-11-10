//=============================================================================
// Checkpoint3Script.
//=============================================================================
class Checkpoint3Script extends TriggeredScript
	placeable;


state Triggered
{
begin:
	ACTION_TriggerEvent( 'BeachBombs' );

	ACTION_DestroyActor( 'MT03' );
	ACTION_DestroyActor( 'MortarAGunner' );
	ACTION_DestroyActor( 'MortarALeft' );

	//Order allen and garnett in to position
	ACTION_UnBlockNavPoints( 'PN_BlockHartsock2' );
	ACTION_OrderMove( 'Allenandgarnett', 'PN_AllenandGarnett' );
	ACTION_OrderMove( 'USAFireTeam1' , 'PN_Hartsock' );

	//sets allen and garnett to not fire on germans until ordered to do so.
	getPawn('allen').sightradius=4500;
	getPawn('garnett').sightradius=4500;

	sleep(3.5);
//	HINT_5 "Take the MG Position"
	ACTION_DisplayObjectiveHint(S_Localize("HINT_6", "D0_0700_EXIT4" ), 6.0 );


}





