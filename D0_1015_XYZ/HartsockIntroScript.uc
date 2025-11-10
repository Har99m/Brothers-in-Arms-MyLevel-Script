//=============================================================================
// HartsockIntroScript.
//=============================================================================
class HartsockIntroScript extends TriggeredScript
	placeable;

var WargamePawn Hartsock;

state Default
{
Begin:

	Hartsock = WargamePawn(GetPawn('Hartsock'));
	//ACTION_SetAnimSet( 'Hartsock', "a_hold_rifle.a_hold_rifle" );
	ACTION_SetAnimSet( 'Hartsock', "a_cin_d0_XYZ.a_cin_d0_XYZ" );

	Idle_Loop:

	ACTION_PlayAnim( 'Hartsock', 'standing_idle_relaxed_3', 0.3, 1.0, True,,,);

	sleep(1.0);
	Goto( 'Idle_Loop' );

}

state Triggered
	{
	Begin:
	
	ACTION_ChangeController( 'Hartsock', class'Mind' );
	}


state GarnettLook
	{
	Begin:

	//ACTION_SetAnimSet( 'Hartsock', "a_hold_rifle.a_hold_rifle" );
	Hartsock.bDoHeadTurn = TRUE;
	ACTION_PlayAnim( 'Hartsock', 'mac_standing_idle_relaxed_4', 0.2, 1.0,,,,);
		sleep(3.3);
	ACTION_PlayAnim( 'Hartsock', 'standing_idle_relaxed_3', 0.3, 1.0, True,,,);

	}
