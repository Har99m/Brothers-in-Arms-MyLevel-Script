//=============================================================================
// TS_D090800_Outro.
//=============================================================================
class TS_D090800_Outro extends TriggeredScript
	placeable;

var AnimPawn AP_Hartsock, AP_Doyle, AP_US1, AP_US2;
var actor DoyleThompson, LT_Outro_Hand;
var float i;

var ActorLite PN_Doyle;
var int j;

function DestroyAllGrenades()
{
	local gbxGrenade A;

	foreach AllActors( class'gbxGrenade', A )
		A.Destroy();
}

State Triggered
{
	function OnTrigger()
	{
		// Nothing
	}

	Begin:

/*	ACTION_TriggerEvent( 'TS_Truck' );

	PN_Doyle = GetNavigationPoint('PN_Doyle_Outro');

	ACTION_TriggerEvent('gbxWB_Obj2');
	sleep(1.0);
	ACTION_TriggerEvent('gbxWB_Doyle');

	// So the other pawn does not move
	ACTION_ChangeController( 'AP_us1_Outro', class'ScriptedController' );
	ACTION_DetachUnitFromSuperUnit( 'Unit_US_B' );
	ACTION_DetachUnitFromSuperUnit( 'Unit_US_A' );

	ACTION_OrderMove( 'Unit_US_Outro_Squad', 'PN_Doyle_Outro' );
	ACTION_OrderMove( 'Unit_US_A', 'PN_Outro_Tank' );
	ACTION_OrderMove( 'Unit_US_B', 'PN_Outro_Tank' );
*/
	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );	
	ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 );
	sleep( 5.0 );
/*
	ACTION_DisplayObjectiveHint( S_Localize("HINT_D"), 4.0 );

	GoToState( 'WaitForDoyle' );
}

state WaitForDoyle
{
	function OnTrigger()
	{
		GoToState( 'DoyleReady' );
	}

	Begin:

	ACTION_TriggerEvent( 'Trigger_Doyle_Outro' );

	SLog( "**** Waiting for mind Doyle ****" );
	sleep( 45.0 );
	GoToState( 'DoyleReady' );
}

state DoyleReady
{
	function OnTrigger()
	{
		GoToState( 'PlayerReady' );
	}

	Begin:

	// Switch to scripted and move
	ACTION_ChangeController( 'AP_Doyle_Outro', class'ScriptedController' );

	AP_Doyle = AnimPawn(GetPawn('AP_Doyle_Outro'));

	AP_Doyle.Controller.bGodMode = TRUE;

	ACTION_SetLookAtTargetDirect( AP_Doyle, GetLocalPlayerPawn(), TRUE );
	WargamePawn(AP_Doyle).SetWeaponAimedState( WAS_Relaxed );
	ACTION_MoveToward( AP_Doyle, PN_Doyle, TRUE );

	SLog( "**** Waiting for scripted Doyle ****" );
	j = 0;
	while ( !PawnIsAtDestination( AP_Doyle, PN_Doyle ) && j < 15 )
	{
		sleep( 0.5 );
		ACTION_MoveToward( AP_Doyle, PN_Doyle, TRUE );
		j++;
	}

	AP_Doyle.Controller.Focus = GetLocalPlayerPawn();
	ACTION_WaitForPawnRotateToward( AP_Doyle );

	ACTION_TriggerEvent( 'TrigVol_Player_Outro' );
	SLog( "**** Waiting for Player ****" );

	sleep( 15.0 );
	while ( TRUE )
	{
		ACTION_DisplayObjectiveHint( S_Localize("HINT_D"), 4.0 );
		sleep( 30.0 );
	}
}

state PlayerReady
{
	function OnTrigger()
	{
		// Nothing
	}

	Begin:
*/
	SLog( "**** Begin Scene ****" );

	// Fade to black
	ACTION_FadeOverlay( GetLocalPlayerController(), 1, 2.0 );

	sleep( 1.0 );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
	ACTION_LockPlayerMovement( getLocalPlayerPawn() );
	GetLocalPlayerController().bGodMode = TRUE;
	ACTION_EnablePlayerHeavyTrauma( FALSE );
	DestroyAllGrenades();

	sleep( 2.5 );
	GetLocalPlayerPawn().bHidden = TRUE;

	ACTION_DestroyActor('AP_Paddock');
	ACTION_DestroyActor('AP_Friar');
	ACTION_DestroyActor('AP_Marsh');
	ACTION_DestroyActor('AP_Paddock');
	ACTION_DestroyActor('AP_Doyle_Outro');
	ACTION_DestroyActor('AP_us1_Outro');
	ACTION_DestroyActor('Intro_Tank');
	ACTION_DestroyActor('TP_Outro');
	ACTION_DestroyActor('TG_304_01');
	ACTION_DestroyActor('TruckOpelBlitzPlayer');
	sleep( 0.1 );

	ACTION_TriggerEvent('CSU_Outro_Outro');
	AP_Doyle = AnimPawn(GetPawn('AP_Doyle_Outro_Scene'));
	AP_Hartsock = AnimPawn(GetPawn('AP_Hartsock_Outro'));
	LT_Outro_Hand = GetFirstActor('LT_Outro_Hand');

	// Attach fake gun to back of Doyle
	DoyleThompson = GetFirstActor('SM_DoyleThompson');
	ACTION_DetachWeapon( AP_Doyle, '' );
	DoyleThompson.bHidden = FALSE;
	AP_Doyle.AttachToBone( DoyleThompson, 'Bip01 Spine2' );
	DoyleThompson.SetRelativeRotation( rot(0.0, 0.0, 0.0) );
	DoyleThompson.SetRelativeLocation( vect(-26.0, 17.0, -25.0) );  // +forward/back, +down/up, +right/left

	ACTION_SetAnimSetDirect( AP_Doyle, "a_cin_d09_Baupte.a_cin_d09_Baupte" );	
	ACTION_ClearPawnIdleQueue( 'AP_Doyle_Outro_Scene' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Doyle_Outro_Scene', 'Doyle_outro_dialogue_b' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Doyle_Outro_Scene', FALSE );

	ACTION_TriggerEvent('TSU_Outro_Outro');

	AP_Doyle.bDoHeadTurn = True;
	AP_Hartsock.bDoHeadTurn = True;

	AP_Hartsock.MaxDesiredSpeed = 0.1;
	AP_Doyle.MaxDesiredSpeed = 0.1;
	AP_Hartsock.RotationRate.Yaw = 4000;
	AP_Hartsock.Controller.RotationRate.Yaw = 4000; 
	AP_Doyle.RotationRate.Yaw = 4000;
	AP_Doyle.Controller.RotationRate.Yaw = 4000; 

	ACTION_PawnSetHeadTurnMult( 'AP_Doyle_Outro_Scene', 0.2 );
	ACTION_PawnSetHeadTurnMult( 'AP_Hartsock_Outro', 0.2 );

	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Hartsock, True );
	ACTION_SetLookAtTargetDirect( AP_Hartsock, AP_Doyle, TRUE );	

	ACTION_ClearPawnIdleQueue( 'AP_Hartsock_Outro' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock_Outro', 'standing_idle_relaxed_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hartsock_Outro', FALSE );

	sleep( 0.1 );

	//start camera and fade in
	ACTION_TriggerEvent('D090800_Outro');
	ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 1.5 );

	ACTION_TankEnterScriptedMode( Tank(getPawn('TP_Outro_A')) );
	sleep(0.2);
	ACTION_TankEnterScriptedMode( Tank(getPawn('TP_Outro_B')) );

	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Hartsock, True );
	ACTION_SetLookAtTargetDirect( AP_Hartsock, AP_Doyle, True );

	ACTION_TankMoveTo( tank(getPawn('TP_Outro_A')), GetNavigationPoint('PN_C3_304Church') );
	sleep(0.2);

	ACTION_TankMoveTo( tank(getPawn('TP_Outro_B')), GetNavigationPoint('PN_C3_304Church') );
	sleep(0.2);

	i = 1.0;
	ResetAbsoluteTime();
	StartAbsoluteTime();

	WaitForAbsoluteTime( i );

	ACTION_OrderMove('UNIT_US_Outro_OutroA', 'PN_C3_302Left_Right', False );

	ACTION_PlayAnimWithQueueDirect( AP_Doyle, 'Doyle_outro_dialogue_b', 0.4, 1.0 );

		//DOYLE_B="Doyle: Gotta wonder what the odds are I'd find you again."
	ACTION_PlayLipSyncSoundDirect( AP_Doyle, "D09_0800.DOYLE_B", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_B"), 4.0, 1, 1, 1, TRUE, TRUE );
		WaitForAbsoluteTime( i+=2.8 );

		//HARTSOCK_D="Hartsock: I see you're a Sergeant now."
	ACTION_SetLookAtTargetDirect( AP_Hartsock, GetFirstActor('LT_Outro_Stripes'), TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D09_0800.HARTSOCK_D", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("HARTSOCK_D"), 3.0, 1, 1, 1, TRUE, TRUE );
		WaitForAbsoluteTime( i+=0.8 );
	ACTION_SetLookAtTargetDirect( AP_Hartsock, AP_Doyle, TRUE );
		WaitForAbsoluteTime( i+=1.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Doyle, 'Doyle_outro_dialogue_c', 0.4, 1.0 );

		//DOYLE_C1="Doyle: You too huh? We're moving up fast, it just seems-"
	ACTION_PlayLipSyncSoundDirect( AP_Doyle, "D09_0800.DOYLE_C", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_C1"), 4.0, 1, 1, 1, TRUE, TRUE );
		WaitForAbsoluteTime( i+=2.1 );

	ACTION_OrderMove('UNIT_US_Outro_OutroB', 'PN_C3_302Left_Left', False );
		WaitForAbsoluteTime( i+=0.7 );
	ACTION_SetLookAtTargetDirect( AP_Doyle, LT_Outro_Hand, True );
		WaitForAbsoluteTime( i+=0.3 );

		//DOYLE_C2="Doyle: Jesus Christ Red! What happened to your finger?"
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_C2"), 4.0, 1, 1, 1, TRUE, TRUE );
		WaitForAbsoluteTime( i+=0.5 );
	ACTION_SetLookAtTargetDirect( AP_Hartsock, LT_Outro_Hand, True );
		WaitForAbsoluteTime( i+=1.0 );
	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Hartsock, True );
		WaitForAbsoluteTime( i+=1.3 );

		//DOYLE_C3="Doyle: Shit, you should have that looked at."
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_C3"), 2.0, 1, 1, 1, TRUE, TRUE );
		WaitForAbsoluteTime( i+=1.5 );
	ACTION_SetLookAtTargetDirect( AP_Hartsock, AP_Doyle, TRUE );
		WaitForAbsoluteTime( i+=1.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'standing_chatting_5', 0.3, 1.0 );
	
		//HARTSOCK_E1="Hartsock: You know I'm not entirely sure yet."
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D09_0800.HARTSOCK_E", 1.0, 1.0, 1.0 );
		WaitForAbsoluteTime( i+=1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("HARTSOCK_E1"), 3.0, 1, 1, 1, TRUE, TRUE );
	ACTION_SetLookAtTargetDirect( AP_Hartsock, LT_Outro_Hand, True );

		WaitForAbsoluteTime( i+=1.0 );
	ACTION_SetLookAtTargetDirect( AP_Doyle, LT_Outro_Hand, True );
		WaitForAbsoluteTime( i+=1.4 );
	ACTION_SetLookAtTargetDirect( AP_Doyle, GetFirstActor('LT_Outro_Hand2'), True);
	
		//HARTSOCK_E2="Hartsock: Happened real fast. Lotta gunfire."
	ACTION_DisplaySubTitleMessage2( S_Localize("HARTSOCK_E2"), 3.5, 1, 1, 1, TRUE, TRUE );		
	ACTION_SetLookAtTargetDirect( AP_Hartsock, AP_Doyle, TRUE );
		WaitForAbsoluteTime( i+=1.0 );

	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Hartsock, TRUE );
		WaitForAbsoluteTime( i+=2.0 );
	ACTION_SetLookAtTargetDirect( AP_Hartsock, LT_Outro_Hand, True );
		WaitForAbsoluteTime( i+=0.5 );
	
	ACTION_PlayAnimDirect( AP_Doyle, 'Doyle_outro_dialogue_e', 0.5, 1.0 );
	ACTION_ClearPawnIdleQueue( 'AP_Doyle_Outro_Scene' );
		WaitForAbsoluteTime( i+=0.4 );

		//DOYLE_D="Doyle: I'll buy you a whiskey when we get back to England so you can forget all about it."
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_D"), 5.5, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Doyle, "D09_0800.DOYLE_E", 1.0, 1.0, 1.0 );
		WaitForAbsoluteTime( i+=4.0 );

	ACTION_FadeOverlay( GetLocalPlayerController(), 1, 1.0 );
		WaitForAbsoluteTime( i+=1.0 );
	ACTION_TriggerEvent('TriggeredScriptMapComplete');
}

