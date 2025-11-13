//=============================================================================
// Combat2Toggle.
//=============================================================================
//Originally named because this script was responsible for turning on and off the toggleable
//volume blocking area two.  This toggle was however moved to the BurtSpeak02Script since it is
//necessary for Burt to deliver his lines before the player moves on.
class Combat2Toggle extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	SLog( "Combat2Toggle running..." );	

	//Ordering Burt(Hartsock) to his speaking destination.
	ACTION_OrderMove( 'Burt', 'Burt_EndCombat2Dialogue' );

	//Turned off.
	ACTION_TriggerEvent( 'Combat1WaypointBeacon' );

	//Turned on.
	ACTION_TriggerEvent( 'Combat2WaypointBeacon' );

	//The player has cleared the area of Germans.
	sleep(3.0);

	/*
	//Area one is clear.
	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );

	//Area two now needs to be cleared.
	ACTION_SetObjectiveStatus( 1, OI_Active, 'ObjectiveList' );
	*/

ScriptEnd:

}






