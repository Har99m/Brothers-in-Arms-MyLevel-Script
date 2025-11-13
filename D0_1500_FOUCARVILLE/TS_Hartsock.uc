//=============================================================================
// TS_Hartsock.
//=============================================================================
class TS_Hartsock extends TriggeredScript
	placeable;

var AnimPawn Hartsock;

state Triggered
{
Begin:

//	ACTION_SetAnimSet( 'Hartsock', "a_hold_rifle.a_hold_rifle" );

	ACTION_ClearPawnIdleQueue( 'Hartsock' );
	ACTION_AddAnimToPawnIdleQueue( 'Hartsock', 'standing_idle_relaxed_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Hartsock', 'standing_idle_relaxed_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Hartsock', 'standing_idle_relaxed_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Hartsock', 'standing_idle_relaxed_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Hartsock', FALSE );

	ACTION_WaitForEvent( 'HartsockIn' );

	Hartsock = AnimPawn( GetPawn ( 'Hartsock' ) );

//	ACTION_DisplayObjectiveString( "HARTSOCK: I think we have to assume for the time being that Foucarville isn't under our control.", 3.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_LINE_A", "D0_1500_FOUCARVILLE" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( Hartsock, 'standing_chatting_4', 0.4, 1.0 );
	sleep( ACTION_PlayLipSyncSound( 'Hartsock', "D01500.Hartsock_a", 1.0, 1.0, 120.0 ) + 0.6 );
	ACTION_TriggerEvent( 'HartsockOut' );

	ACTION_WaitForEvent( 'HartsockIn' );
//	ACTION_DisplayObjectiveString( "HARTSOCK: So Whats the plan Baker?", 2.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_LINE_B", "D0_1500_FOUCARVILLE" ), 2.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( Hartsock, 'standing_chatting_3', 0.4, 1.0 );
	sleep( ACTION_PlayLipSyncSound( 'Hartsock', "D01500.Hartsock_zza", 1.0, 1.0, 120.0 ) + 0.75 );
	ACTION_TriggerEvent( 'HartsockOut' );

	ACTION_WaitForEvent( 'HartsockIn' );
	ACTION_ClearPawnIdleQueue( 'Hartsock' );
	ACTION_ChangeController( 'Hartsock', class'Mind' );

}
