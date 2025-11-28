//=============================================================================
// OutroScript.
//=============================================================================
class OutroScript extends TriggeredScript
	placeable;

var Pawn Baker, Mac, Leggett, Player;
var Actor LookTarget;
var Actorlite MacEndNode;
var vector MoveToLocation;  // the location in front of the player where Mac runs to
var Vector NewVect;			// The New Vector For Mac to Run too
var Rotator tempRot;		// The Rotation For Mac

state Triggered
{
Begin:

	ACTION_TriggerEvent( 'SpawnOutroChar' );
	sleep( 0.2 );

	Player = GetLocalPlayerPawn();	
	Mac = GetPawn( 'Mac' );
	Leggett = GetPawn( 'Leggett' );
	LookTarget = GetFirstActor( 'Waypoint_Outro' );
	sleep( 0.2 );

	ACTION_ClearPawnIdleQueue( 'Leggett' );
	ACTION_AddAnimToPawnIdleQueue( 'Leggett', 'standing_idle_relaxed_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Leggett', 'standing_idle_relaxed_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Leggett', 'standing_idle_relaxed_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Leggett', 'standing_idle_relaxed_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Leggett', 'standing_idle_relaxed_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Leggett', FALSE );

	sleep( 0.2 );

	ACTION_ClearPawnIdleQueue( 'Mac' );
	ACTION_AddAnimToPawnIdleQueue( 'Mac', 'standing_idle_relaxed_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Mac', 'standing_idle_relaxed_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Mac', 'standing_idle_relaxed_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Mac', 'standing_idle_relaxed_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Mac', 'standing_idle_relaxed_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Mac', FALSE );

	sleep( 0.2 );

	//===== Attach radio to Leggett
	ACTION_AttachStaticMesh( Leggett , StaticMesh's_military_us.equipment.us_radio_field_pack' , 'radio_bone' );

	// Prepare Mac for movement
//	Mac.SetMovementPhysics();
//	Mac.Controller.bRotateToDesired = true;
//	Mac.SetWalking( true );
	sleep( 0.2 );

//	ACTION_OrderMove( 'MacUnit', 'MacNode' );

	sleep( 0.5 );
//	ACTION_ChangeController( 'Mac', class'ScriptedController' );
	MacEndNode = GetNavigationPoint('MacNode');
	ACTION_MoveToward( Mac, MacEndNode , FALSE );
	ACTION_TriggerEvent( 'Outro_LeggettWalk' );
	While ( !PawnIsAtDestination( Mac, MacEndNode ) )
		{
		ACTION_MoveToward( Mac, MacEndNode , FALSE );
		sleep( 0.5 );
		}
	slog( "mac at spot" );
	Mac.Controller.Focus = LookTarget;
	ACTION_WaitForEvent( 'PlayerAtMac' );
	Mac.Controller.Focus = Player;
	Leggett.controller.focus = GetLocalPlayerPawn();
	//	lock player movement
	ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );



					//ACTION_OrderFallOut( 'USAFireTeam2' );
					//sleep(0.1);
					//ACTION_OrderMove( 'USAFireTeam2', 'Squad_Outro', false );




//	ACTION_DisplayObjectiveString( "MAC: We got here as soon as we could.", 3.0 );
	ACTION_PlayAnimWithQueue( 'Mac', 'standing_chatting_3', 0.2, 1.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("MAC_LINE_A", "D0_1500_FOUCARVILLE" ), 3.5, 1 , 1 , 1 , , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'Mac', "D01500.Mac_a", 1.0, 1.0, 120.0, true ) + 1.4 );
/*
//	ACTION_DisplayObjectiveString( "Leggett: These bodies everywhere, what the hell happened here?", 3.0 );
	ACTION_PlayAnimWithQueue( 'Leggett', 'UNARMED_chatting_5', 0.2, 1.0 );
	ACTION_DisplayObjectiveString(S_Localize("LEGGETT_LINE_A", "D0_1500_FOUCARVILLE" ), 5.0 );
	sleep( ACTION_PlayLipSyncSound( 'Leggett', "D01500.Leggett_b", 1.0, 1.0, 120.0, true ) + 0.5 );
*/
//	ACTION_DisplayObjectiveString( "MAC: Baker, I pegged you wrong.", 3.0 );
	ACTION_PlayAnimWithQueue( 'Mac', 'standing_chatting_4', 0.2, 1.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("MAC_LINE_B", "D0_1500_FOUCARVILLE" ), 3.5, 1 , 1 , 1 , , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'Mac', "D01500.Mac_b", 1.0, 1.0, 120.0, true ) + 0.25 );

//	ACTION_DisplayObjectiveString( "MAC: First I thought you were a shy, poetic, young man.", 3.0 );
	ACTION_PlayAnimWithQueue( 'Mac', 'standing_chatting_1', 0.2, 1.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("MAC_LINE_C", "D0_1500_FOUCARVILLE" ), 3.5, 1 , 1 , 1 , , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'Mac', "D01500.Mac_c", 1.0, 1.0, 120.0, true ) + 0.25 );

//	ACTION_DisplayObjectiveString( "MAC: Turns out you're a shy, poetic, young man, who kills everyone who gets in his way.", 3.0 );
	ACTION_PlayAnimWithQueue( 'Mac', 'standing_chatting_3', 0.2, 1.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("MAC_LINE_D", "D0_1500_FOUCARVILLE" ), 3.5, 1 , 1 , 1 , , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'Mac', "D01500.Mac_d", 1.0, 1.0, 120.0, true ) + 0.25 );

//	ACTION_DisplayObjectiveString( "MAC: That's a downright admirable quality.", 3.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("MAC_LINE_E", "D0_1500_FOUCARVILLE" ), 3.5, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSound( 'Mac', "D01500.Mac_e", 1.0, 1.0, 120.0, true );

	sleep( 3.0 );
	ACTION_SaveMemoryReport( "foucarville_end" );
	ACTION_DisplayMapStats();
}
