//=============================================================================
// TS_Allen.
//=============================================================================
class TS_Allen extends TriggeredScript
	placeable;

var AnimPawn AP_Allen;
var int BellRing;
var Actor ChurchTower;

state Triggered
{
Begin:

	AP_Allen = AnimPawn ( GetPawn( 'Allen' ) );

	ACTION_SetAnimSetDirect( AP_Allen, "a_cin_d0_Foucarville.a_cin_d0_Foucarville" );

	ACTION_ClearPawnIdleQueue( 'Allen' );
	ACTION_AddAnimToPawnIdleQueue( 'Allen', 'Soldier_1_sad_loop' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Allen', FALSE );

ACTION_WaitForEvent( 'AllenIn' );

//	ACTION_DisplayObjectiveString( "ALLEN: Wasn't old age, I know that.", 2.0 );
//	ACTION_PlayAnimWithQueue( 'Allen', 'standing_chatting_3', 0.2, 1.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("ALLEN_LINE_A", "D0_1500_FOUCARVILLE" ), 3.0, 1 , 1 , 1 , , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'Allen', "D01500.Allen_a", 1.0, 1.0, 120.0 ) + 0.6 );
	ACTION_TriggerEvent( 'AllenOut' );

	ACTION_WaitForEvent( 'AllenIn' );
//	ACTION_DisplayObjectiveString( "ALLEN: Red, you're ruining my good mood.", 2.0 );
//	ACTION_PlayAnimWithQueue( 'Allen', 'standing_chatting_1', 0.2, 1.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("ALLEN_LINE_B", "D0_1500_FOUCARVILLE" ), 3.0, 1 , 1 , 1 , , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'Allen', "D01500.Allen_b", 1.0, 1.0, 120.0 ) + 0.5 );
	ACTION_TriggerEvent( 'AllenOut' );

	ACTION_WaitForEvent( 'AllenIn' );
	ACTION_PlayAnimDirect( AP_Allen, 'Soldier_1_sad_dismount', 0.4, 1.0,,,,1 );
	ACTION_WaitForAnimEnd( AP_Allen, 0 );
	ACTION_UnsetAnimSetDirect( AP_Allen, "a_cin_d0_Foucarville.a_cin_d0_Foucarville" );
	ACTION_ChangeController( 'Allen', class'Mind' );

	sleep( 5.0 );
	//	ChurchBell
	ChurchTower = GetFirstActor('ChurchTower');
	BellRing = ChurchTower.PlaySound(Sound'D01500_SOUNDS.CHURCHBELL_ST',,80,,12000);
	sleep( 7.5 );
	//	Fade Out Church Bell
	ChurchTower.StopSound(BellRing, 1.5);  // stop sound by fading out over 1.5 seconds;

}
