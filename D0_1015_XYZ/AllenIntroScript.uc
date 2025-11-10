//=============================================================================
// AllenIntroScript.
//=============================================================================
class AllenIntroScript extends TriggeredScript
	placeable;

var Wargamepawn Allen;

state Default
{
Begin:

	Allen = WargamePawn(GetPawn('Allen'));

	sleep( 1.5 );			
	ACTION_SetAnimSet( 'Mac', "a_hold_rifle.a_hold_rifle" );
	Allen.bDoHeadTurn = TRUE;
	//ACTION_PlayAnim( 'Mac', 'standing_idle_relaxed_1', 0.3, 1.0, True,,,);

}

state Triggered
{
Begin:

	ACTION_SetLookAtTarget( 'Allen', none, true );
	ACTION_ChangeController( 'Allen', class'Mind' );
	//ACTION_MoveTowardTag( 'Allen', 'USAFireTeam_Path01', true );
	ACTION_OrderMove( 'USAFireTeam', 'USAFireTeam_Path01' );
}


