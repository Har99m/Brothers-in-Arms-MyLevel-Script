//=============================================================================
// DD_IntroScript.
//=============================================================================
class DD_IntroScript extends TriggeredScript
	placeable;

var Pawn Pawn_Mac, Pawn_Leggett, Pawn_Allen, Pawn_Garnett;
var AnimPawn Pawn_Hartsock;
var float i;

var int Music, Monologue;
var Actor A_Player;

state Triggered
{
	Begin:

	ACTION_SaveMemoryReport( "vierville_start" );

	ACTION_DisableBattleDialogue();
	ACTION_HideHUD( GetLocalPlayerController(), TRUE );
	ACTION_BlockActionKeys( -1 );
	ACTION_UnblockActionKeys( KEY_ACTION_SHOW_MENU );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

	// Initialize Stuff
	i = 2.0;

	ACTION_TriggerEvent( 'CSU_Intro' );	// Spawn US Squad
	ACTION_TriggerEvent( 'CSU_ML' );		// Spawn Mac and Leggett
	sleep( 0.1 );

	ACTION_BlockNavPoints( 'PathNode_Toggle' ); // Turn off pathnodes in garage

	Pawn_Mac = GetPawn( 'Pawn_Mac' );
	Pawn_Leggett = GetPawn( 'Pawn_Leggett' );
	Pawn_Allen = GetPawn( 'Pawn_Allen' );
	Pawn_Garnett = GetPawn( 'Pawn_Garnett' );
	Pawn_Hartsock = AnimPawn( GetPawn('Pawn_Hartsock') );

	ACTION_AttachStaticMesh( Pawn_Leggett, StaticMesh's_military_us.equipment.us_radio_field_pack', 'radio_bone' );

	ACTION_SetAnimSetDirect( Pawn_Hartsock, "a_cin_d1_Vierville.a_cin_d1_Vierville" );

	ACTION_ClearPawnIdleQueue( 'Pawn_Leggett' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Leggett', 'standing_chatting_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Leggett', 'standing_chatting_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Leggett', 'standing_chatting_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Leggett', TRUE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Mac' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'standing_chatting_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'standing_chatting_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'standing_chatting_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Mac', TRUE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Allen' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Allen', 'standing_chatting_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Allen', 'standing_chatting_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Allen', 'standing_chatting_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Allen', TRUE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Garnett' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Garnett', 'standing_chatting_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Garnett', 'standing_chatting_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Garnett', 'standing_chatting_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Garnett', TRUE );

	ACTION_DisableAutoFacialExpression( 'Pawn_Hartsock', TRUE );

	ACTION_SetLookAtTarget( 'Pawn_Allen', Pawn_Leggett, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Leggett, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Hartsock', Pawn_Leggett, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', Pawn_Garnett, TRUE );

	// ACTION_EnablePlayerBreak();

	// Map name, date, time
	ACTION_MapIntroTextPos( GetLocalPlayerController(), 50, 350 );
	ACTION_MapIntroText( GetLocalPlayerController(), 1, 2.0 );

	A_Player = GetFirstActor( 'gbxPlayerStart' );
	Music = A_Player.PlayMusic( "MUSIC.D10900_VO", 0.0, FALSE );
	sleep( 2.3 );
	Monologue = A_Player.PlayMusic( "D10900.VOICEOVER_A", 0.0, FALSE );

	ACTION_DisplaySubTitleMessage2( S_Localize("VOICEOVER_A_1"), 4.0, 1, 1 , 1, TRUE, TRUE );
	sleep( 4.5 );

	ACTION_DisplaySubtitleMessage2( S_Localize("VOICEOVER_A_2"), 3.0, 1, 1 , 1, TRUE, TRUE );
	sleep( 3.5 );

	ACTION_DisplaySubtitleMessage2( S_Localize("VOICEOVER_A_3"), 2.6, 1, 1 , 1, TRUE, TRUE );
	sleep( 3.0 );

	ACTION_DisplaySubtitleMessage2( S_Localize("VOICEOVER_A_4"), 5.0, 1, 1 , 1, TRUE, TRUE );
	sleep( 5.5 );

	ACTION_DisplaySubtitleMessage2( S_Localize("VOICEOVER_A_5"), 4.0, 1, 1 , 1, TRUE, TRUE );
	sleep( 4.5 );

	ACTION_DisplaySubtitleMessage2( S_Localize("VOICEOVER_A_6"), 5.5, 1, 1 , 1, TRUE, TRUE );
	sleep( 5.5 );

	// ACTION_DisablePlayerBreak();

	AfterPlayerBreak:

	// Stop Monologue
	// ACTION_StopSound( 'gbxPlayerStart', Monologue, 1.5);  // stop sound by fading out over 2.5 seconds;
	A_Player.StopMusic( Monologue, 1.5 );
	A_Player.StopMusic( Music, 1.5 );

	// Fade out text and fade into game
	ACTION_MapIntroText( GetLocalPlayerController(), 2, 2.0 );
	sleep( 2.0 );
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
	sleep( 0.5 );
	ACTION_UnblockActionKeys( -1 );
	sleep( 0.5 );
	// Action_PlaySoundReturnHandle( 'gbxPlayerStart', "D10900_SOUNDS.AMB_WIND_LIGHTBATTLE", 1.0, 1.0, 10000 );

	ACTION_PawnSetHeadTurnMult( 'Pawn_Garnett', 0.5 );
	ACTION_PawnSetHeadTurnMult( 'Pawn_Allen', 0.5 );
	ACTION_PawnSetHeadTurnMult( 'Pawn_Hartsock', 0.5 );
	ACTION_PawnSetHeadTurnMult( 'Pawn_Mac', 0.5 );

	ResetAbsoluteTime();
	StartAbsoluteTime();

	// ==========================================================================================
	// Leggett: Well, most of the time I was relaying radio messages to higher headquarters
	// for Mac.
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Leggett', "D10900.LEGGETT_B", 1.0, 1.0, 160.0 ) + 0.5;
	ACTION_DisplaySubtitleMessage2( S_Localize("LEGGETT_B"), 4.2, 1, 1, 1, TRUE, TRUE );

	// Head Movement
	ACTION_SetLookAtTarget( 'Pawn_Allen', Pawn_Leggett, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', Pawn_Allen, TRUE );

	sleep( 1.0 );
	ACTION_SetLookAtTarget( 'Pawn_Mac', GetFirstActor('MacLookTree01'), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Leggett, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', GetLocalPlayerPawn(), TRUE );

	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', GetFirstActor('LookTarget_Idle01'), TRUE );

	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Hartsock', GetFirstActor('LookTarget_Idle01'), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Allen', Pawn_Garnett, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', GetLocalPlayerPawn(), TRUE );

	sleep( 1.0 );
	ACTION_PlayAnimWithQueueDirect( Pawn_Hartsock, 'Soldier_inspects_gun', 0.1, 0.6, FALSE );

	ACTION_SetLookAtTarget( 'Pawn_Mac', GetFirstActor('MacLookTree02'), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', Pawn_Allen, TRUE );
	// End Head

	// ==========================================================================================
	// Leggett: I only saw Krauts there at the end.
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Leggett', "D10900.LEGGETT_C", 1.0, 1.0, 160.0 ) + 0.5;
	ACTION_DisplaySubtitleMessage2( S_Localize("LEGGETT_C"), 2.0, 1, 1 , 1, TRUE, TRUE );

	// Head Movement
	ACTION_SetLookAtTarget( 'Pawn_Garnett', GetFirstActor('LookTarget_Idle01'), TRUE );

	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Mac', GetFirstActor('MacLookTree01'), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Allen', GetFirstActor('LookTarget_Idle01'), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Leggett, TRUE );

	sleep( 0.5 );
	ACTION_PawnSetFacialExpression( 'Pawn_Hartsock', 'emotion_SMIRK', 30.0, 2.0 );
	ACTION_SetLookAtTarget( 'Pawn_Allen', Pawn_Leggett, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', Pawn_Hartsock, TRUE );
	// End Head

	// ==========================================================================================
	// MAC walks over from where he is standing by the fence to the group of guys.
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += 3.0;

	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Mac, TRUE );

	ACTION_WaitForPawnRotateToward( Pawn_Mac );
	ACTION_SetLookAtTarget( 'Pawn_Mac', GetLocalPlayerPawn(), TRUE );

	ACTION_Walk( 'Pawn_Mac' );
	ACTION_MoveToward( Pawn_Mac, GetNavigationPoint('Mac_IntroPath'), FALSE );

	sleep( 1.5 );
	ACTION_SetLookAtTarget( 'Pawn_Allen', Pawn_Mac, TRUE );

	// ==========================================================================================
	// Mac: You guys look like you had a rough morning.
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Mac', "D10900.MAC_A", 1.0, 1.0, 160.0 ) + 1.2;
	ACTION_DisplaySubtitleMessage2( S_Localize("MAC_A"), 2.2, 1, 1, 1, TRUE, TRUE );

	// Head Movement
	ACTION_SetLookAtTarget( 'Pawn_Garnett', GetFirstActor('LookTarget_Idle02'), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', Pawn_Mac, TRUE );
	ACTION_PawnSetFacialExpression( 'Pawn_Hartsock', 'emotion_SCOWL', 30.0, 2.0 );
	ACTION_PawnSetFacialExpression( 'Pawn_Garnett', 'emotion_SCOWL', 30.0, 2.0 );

	sleep( 1.5 );
	ACTION_SetLookAtTarget( 'Pawn_Mac', Pawn_Garnett, TRUE );

	sleep( 0.2 );
	ACTION_SetLookAtTarget( 'Pawn_Allen', GetLocalPlayerPawn(), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Mac, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', GetFirstActor('LookTarget_Idle01'), TRUE );

	ACTION_PawnSetHeadTurnMult( 'Pawn_Allen', 0.2 );

	sleep( 0.3 );
	ACTION_SetLookAtTarget( 'Pawn_Mac', Pawn_Hartsock, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Allen', GetFirstActor('LookTarget_Idle02'), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', Pawn_Mac, TRUE );

	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Mac', GetLocalPlayerPawn(), TRUE );
	// End Head

	// ==========================================================================================
	// Mac talks
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	sleep( ACTION_PlayLipSyncSound( 'Pawn_Mac', "D10900.MAC_B", 1.0, 1.0, 160.0 ) + 0.2 );
	i += ACTION_PlayLipSyncSound( 'Pawn_Mac', "D10900.MAC_C", 1.0, 1.0, 160.0 ) + 1.0;
	ACTION_DisplaySubtitleMessage2( S_Localize("MAC_B_C"), 4.0, 1, 1, 1, TRUE, TRUE );

	// Head Movement
	ACTION_PawnSetHeadTurnMult( 'Pawn_Allen', 0.5 );

	ACTION_SetLookAtTarget( 'Pawn_Allen', GetFirstActor('LookTarget_Idle01'), TRUE );

	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Mac, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', Pawn_Mac, TRUE );

	sleep( 1.5 );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', GetFirstActor('LookTarget_Idle01'), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Allen', Pawn_Mac, TRUE );

	// End Head

	// ==========================================================================================
	// Mac talks
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Mac', "D10900.MAC_D", 1.0, 1.0, 160.0 ) + 0.5;
	ACTION_DisplaySubtitleMessage2( S_Localize("MAC_D"), 2.0, 1, 1, 1, TRUE, TRUE );

	// Head Movement
	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', GetFirstActor('LookTarget_Idle01'), TRUE );
	// End Head

	// ==========================================================================================
	// Mac talks
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Mac', "D10900.MAC_E", 1.0, 1.0, 160.0 ) + 0.5;
	ACTION_DisplaySubtitleMessage2( S_Localize("MAC_E"), 3.3, 1, 1, 1, TRUE, TRUE );

	// ==========================================================================================
	// Mac talks
	// ==========================================================================================
	WaitForAbsoluteTime( i );
	i += ACTION_PlayLipSyncSound( 'Pawn_Mac', "D10900.MAC_G", 1.0, 1.0, 160.0 ) + 0.5;
	ACTION_DisplaySubtitleMessage2( S_Localize("MAC_G"), 1.0, 1, 1, 1, TRUE, TRUE );

	// Head Movement
	sleep( 0.5 );
	ACTION_SetLookAtTarget( 'Pawn_Hartsock', Pawn_Mac, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Mac', Pawn_Leggett, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', GetLocalPlayerPawn(), TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Allen', GetLocalPlayerPawn(), TRUE );
	// End Head

	// ==========================================================================================
	// MAC and LEGGETT head off down the road.
	// ==========================================================================================
	WaitForAbsoluteTime( i );

	ACTION_SetLookAtTarget( 'Pawn_Hartsock', Pawn_Mac, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Allen', Pawn_Mac, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Garnett', Pawn_Mac, TRUE );
	ACTION_SetLookAtTarget( 'Pawn_Leggett', Pawn_Mac, TRUE );

	ACTION_ClearLookAtTarget( 'Pawn_Mac' );

	Pawn_Mac = None;
	Pawn_Leggett = None;

	ACTION_Run( 'Pawn_Mac' );
	ACTION_Run( 'Pawn_Leggett' );
	ACTION_TriggerEvent( 'DD_PawnMoveMac' );

	i += 0.5;
	WaitForAbsoluteTime( i );
	ACTION_TriggerEvent( 'DD_PawnMoveLeggett' );

	i += 0.5;
	WaitForAbsoluteTime( i );
	ACTION_ClearLookAtTarget( 'Pawn_Leggett' );

	i += 1.0;
	WaitForAbsoluteTime( i );

	StopAbsoluteTime();

	ACTION_DisableAutoFacialExpression( 'Pawn_Hartsock', FALSE );
	ACTION_ClearLookAtTarget( 'Pawn_Hartsock' );

	// Return control to mind AI continued
	ACTION_ChangeController( 'Pawn_Hartsock', class'Mind' );
	ACTION_ChangeController( 'Pawn_Allen', class'Mind' );
	ACTION_ChangeController( 'Pawn_Garnett', class'Mind' );

	ACTION_ClearLookAtTarget( 'Pawn_Allen' );
	ACTION_ClearLookAtTarget( 'Pawn_Hartsock' );
	ACTION_ClearLookAtTarget( 'Pawn_Garnett' );

	ACTION_TriggerEvent( 'DD_UberSIScript' );

	ACTION_SaveMemoryReport( "vierville_checkpoint_intro_pre" );
	ACTION_CheckPointSave( 1 );
	ACTION_SaveMemoryReport( "vierville_checkpoint_intro_post" );

	sleep( 1.0 );
	ACTION_HideHUD( GetLocalPlayerController(), FALSE );
	ACTION_TriggerEvent( 'Waypoint_Sector1' );
	ACTION_EnableBattleDialogue();
	ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE );
	sleep( 1.0 );

	// Display Objective
	ACTION_DisplayObjective( 0, 'ObjectiveList01', 4.0 );
	sleep( 4.0 );

	// Hints
	ACTION_DisplayObjectiveHint( S_Localize("HINT_1"), 4.0 );
	sleep( 4.0 );

	ACTION_SetLookAtTarget( 'Pawn_Hartsock', Pawn_Garnett, TRUE );

	ACTION_DisplayObjectiveHint( S_Localize("HINT_7"), 4.0 );
	sleep( 4.0 );

	ScriptEnd:
}

state PlayerBreak
{
	Begin:

	ACTION_DisablePlayerBreak();
	GotoState( 'Triggered', 'AfterPlayerBreak' );
}
