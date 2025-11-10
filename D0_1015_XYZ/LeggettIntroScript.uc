//=============================================================================
// LeggettIntroScript.
//=============================================================================
class LeggettIntroScript extends TriggeredScript
	placeable;

var pawn Leggett01;
var WargamePawn Leggett;

state TriggeredIdle
	{
	Begin:

	Leggett01 = GetPawn('Leggett01' );
	Leggett = WargamePawn(GetPawn('Leggett01' ));
	GetFirstActor('M1_Intro').bHidden = false;

	Leggett.bDoHeadTurn = TRUE;
	ACTION_DetachWeapon( Pawn( GetFirstActor( 'Leggett01' )), '' );
	ACTION_AttachStaticMesh( Pawn( GetFirstActor( 'Leggett01' )), StaticMesh's_military_us.equipment.us_Radio_field_handset', 'phone_bone' );
	ACTION_SetAnimSet( 'Leggett01', "a_cin_d0_XYZ.a_cin_d0_XYZ" );
		//sleep(0.1);
	ACTION_PlayAnim( 'Leggett01', 'legs_radio_idle', 0.2, 1.0,true,,,1);
	}

state TalkOne
	{
	Begin:

	ACTION_PlayAnim( 'Leggett01', 'legs_sarge_I_cant', 0.2, 1.0,,,,1);
		sleep(2.88);

	GoToState('ListenOne' );

	}

state ListenOne
	{
	Begin:

	Idle_Loop:

	ACTION_PlayAnim( 'Leggett01', 'legs_radio_idle', 0.2, 1.0,true,,,1);
		sleep(1.77);

	goTo('Idle_Loop');

	}

state Triggered
	{
	Begin:
	
	//ACTION_SetLookAtTarget( 'Leggett01', none, true );
	Leggett.bDoHeadTurn = TRUE;
	ACTION_PlayAnim( 'Leggett01', 'legs_radio_dismount', 0.2, 1.0,,,,1);
		sleep(0.3);
	ACTION_DetachStaticMesh( Pawn( GetFirstActor( 'Leggett01' )), StaticMesh's_military_us.equipment.us_Radio_field_handset', 'phone_bone' );
		sleep(0.7);
	GetFirstActor('M1_Intro').bHidden = true;
	ACTION_ReattachWeapon( Pawn( GetFirstActor( 'Leggett01' )), '' );
		sleep(1.62);
	//ACTION_WaitForAnimEnd( Leggett01, 0 );
	ACTION_PlayAnim( 'Leggett01', 'standing_idle_relaxed_1', 0.2, 1.0,true,,,1 );
		sleep(1.0);
	ACTION_SetDesiredSpeed('Leggett01',0.2);
	ACTION_MoveTowardTag( 'Leggett01','USA_FireTeam1_Path01',true, 'LookTarget1' );
	//ACTION_MoveTowardTag( 'Leggett01','USA_FireTeam1_Path01', true, 'LookTarget1' );
	ACTION_PlayAnim( 'Leggett01', 'standing_idle_relaxed_3', 0.5, 1.0,true,,, );

	}

state ExitIntro
	{
	Begin:

	ACTION_ChangeController( 'Leggett01', class'Mind' );
	ACTION_DetachStaticMesh( Pawn( GetFirstActor( 'Leggett01' )), StaticMesh's_npc_item_us.equipment.radio', 'phone_bone' );


	}
