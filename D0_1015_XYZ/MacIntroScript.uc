//=============================================================================
// MacIntroScript.
//=============================================================================
class MacIntroScript extends TriggeredScript
	placeable;

var WargamePawn Mac;

state Default
	{
	Begin:

	Mac = WargamePawn(GetPawn( 'Mac' ));

	ACTION_SetAnimSet( 'Mac', "a_hold_rifle.a_hold_rifle" );
	ACTION_SetAnimSet( 'Mac', "a_cin_d0_XYZ.a_cin_d0_XYZ" );
	Mac.bDoHeadTurn = TRUE;
	ACTION_PlayAnim( 'Mac', 'standing_idle_relaxed_3', 0.3, 1.0, True,,,1);
	
	goToState( 'BeginIdle' );
	}

state BeginIdle
	{
	Begin:

	ACTION_PlayAnim( 'Mac', 'standing_idle_relaxed_3', 0.3, 1.0, True,,,1);
	Mac.bDoHeadTurn = TRUE;

	ScriptEnd:
	}

state Triggered
	{
	Begin:

	Mac.bDoHeadTurn = TRUE;
	ACTION_SetLookAtTarget( 'Mac', none, true );
	ACTION_ChangeController( 'Mac', class'Mind' );
	}

state GarnettLook
	{
	Begin:

	ACTION_SetAnimSet( 'Mac', "a_cin_d0_XYZ.a_cin_d0_XYZ" );

	Mac.bDoHeadTurn = TRUE;
	ACTION_PlayAnim( 'Mac', 'Mac_standing_idle_relaxed_5', 0.2, 1.0,,,,);
		sleep(3.86);
	ACTION_PlayAnim( 'Mac', 'standing_idle_relaxed_3', 0.3, 1.0, True,,,);

	}
