//=============================================================================
// TS_Garnett.
//=============================================================================
class TS_Garnett extends TriggeredScript
	placeable;

var AnimPawn AP_Garnett;

state Triggered
{
Begin:

	ACTION_SetAnimSet( 'Garnett', "a_cin_d0_Foucarville.a_cin_d0_Foucarville" );

	AP_Garnett = AnimPawn ( GetPawn('Garnett') );

	ACTION_PlayAnimDirect( AP_Garnett, 'Soldier_1_sad_loop', 0.2, 1.0, true );

	ACTION_WaitForEvent( 'GarnettIn' );

//	ACTION_DisplayObjectiveString( "GARNETT: What do you suppose killed him.", 3.0 );
	ACTION_PlayAnimDirect( AP_Garnett, 'Soldier_2_sad_mount', 0.2, 1.0 );
	sleep( 3.0 );
	ACTION_TriggerEvent( 'GarnettOut' );
	ACTION_DisplaySubtitleMessage2(S_Localize("GARNETT_LINE_A", "D0_1500_FOUCARVILLE" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSound( 'Garnett', "D01500.Garnett_a", 1.0, 1.0, 120.0 );
	ACTION_WaitForAnimEnd( AP_Garnett, 0 );
	ACTION_TriggerEvent( 'GarnettOut' );
	ACTION_PlayAnimDirect( AP_Garnett, 'Soldier_2_sad_loop', 0.2, 1.0, true );

	ACTION_WaitForEvent( 'GarnettIn' );
//	ACTION_DisplayObjectiveString( "GARNETT: They wouldn't just leave him here, didn't we have this town secure?", 3.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("GARNETT_LINE_B", "D0_1500_FOUCARVILLE" ), 3.0, 1 , 1 , 1 , , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'Garnett', "D01500.Garnett_b", 1.0, 1.0, 120.0 ) + 0.45 );
	ACTION_TriggerEvent( 'GarnettOut' );

	ACTION_WaitForEvent( 'GarnettIn' );
	ACTION_PlayAnimDirect( AP_Garnett, 'Soldier_2_sad_dismount', 0.2, 1.0 );
	ACTION_WaitForAnimEnd( AP_Garnett, 0 );
	ACTION_UnsetAnimSetDirect( AP_Garnett, "a_cin_d0_Foucarville.a_cin_d0_Foucarville" );
	ACTION_ChangeController( 'Garnett', class'Mind' );
}
