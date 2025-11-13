//=============================================================================
// OutroScript_New.
//=============================================================================
class OutroScript_New extends TriggeredScript
	placeable;

var Pawn Baker, Mac;
var Actor TruckTarget;
var Pawn GarnettEnd;
var Pawn AllenEnd;
var Pawn MacEnd;
var WargamePawn LeggettEnd;
var Pawn LocalPlayer;
var Pawn Hartsock;

state Triggered
{
Begin:

	Hartsock = Getpawn('Hartsock');
	ACTION_ChangeController('Hartsock',class'ScriptedController');
	Hartsock.shouldCrouch(false);
		sleep(0.2);
	ACTION_MoveTowardTag( 'Hartsock', 'HartsockSafety', true, 'OutroPlayerPositionTarget' );

	ACTION_SetObjectiveStatus( 0, OI_Inactive, 'ObjectiveList' );

	ACTION_ChangeController('AllenEnd',class'ScriptedController');
	ACTION_ChangeController('GarnettEnd',class'ScriptedController');
	ACTION_ChangeController('MacEnd',class'ScriptedController');
	ACTION_ChangeController('LeggettEnd',class'ScriptedController');
		sleep(1.0);

	ACTION_FlushAnimQueue('LeggettEnd' );

	GarnettEnd = GetPawn( 'GarnettEnd' );
	AllenEnd =GetPawn( 'AllenEnd' );
	MacEnd = GetPawn( 'MacEnd' );
	LeggettEnd = WargamePawn(GetPawn('LeggettEnd'));
	LocalPlayer = GetLocalPlayerPawn();
	Baker = GetLocalPlayerPawn();	
	Mac = GetPawn( 'MacEnd' );
	TruckTarget = GetFirstActor( 'TruckTarget' );
		sleep( 0.2 );

	//ACTION_SetAnimSet( 'LeggettEnd', "a_hold_misc.unarmed" );
	ACTION_SetAnimSet( 'LeggettEnd', "a_hold_rifle.a_hold_rifle" );

	GarnettEnd.shouldCrouch(false);
	AllenEnd.shouldCrouch(false);
	MacEnd.shouldCrouch(false);
	LeggettEnd.shouldCrouch(false);
		sleep(0.1);

	ACTION_MoveTowardTag( 'GarnettEnd', 'GarnettFountain',FALSE, 'PlayerTargetEnd');
		sleep(1.0);
	ACTION_MoveTowardTag( 'AllenEnd', 'AllenFountain',FALSE,'PlayerTargetEnd');
		sleep(0.2);

	ACTION_SetAnimSet( 'LeggettEnd', "a_cin_d0_XYZ.a_cin_d0_XYZ" );

	ACTION_MoveTowardTag( 'MacEnd', 'TruckNode',true, 'PlayerTargetEnd' );
	ACTION_MoveTowardTag( 'LeggettEnd', 'LeggettPoint',true, 'LeggettTruck_Look' );

	LeggettEnd.SetWeaponAimedState( WAS_Relaxed );
	WargamePawn(AllenEnd).SetWeaponAimedState( WAS_Relaxed );
	WargamePawn(GarnettEnd).SetWeaponAimedState( WAS_Relaxed );
	WargamePawn(Hartsock).SetWeaponAimedState( WAS_Relaxed );
		sleep( 0.2 );

	//ACTION_DisplaySubTitleMessage2( "Objective Complete!", 6.0, 255, 255, 0, true, true );
	ACTION_TriggerEvent( 'EndCombatWaypointBeacon' );
		sleep(2.0);
	ACTION_DisplayObjectiveHint(S_Localize("HINT_B", "D0_1015_XYZ" ), 4.0 );


     //																		\\
	//*****************************************************************************\\
   //																		  \\

		WargamePawn(GetPawn('GarnettEnd')).eWeaponAimedState = WAS_RELAXED;
		WargamePawn(GetPawn('AllenEnd')).eWeaponAimedState = WAS_RELAXED;
		WargamePawn( GetPawn('MacEnd')).eWeaponAimedState = WAS_RELAXED;

		Mac.Controller.Focus = Baker;
		GarnettEnd.Controller.Focus = Baker;
		AllenEnd.Controller.Focus = Baker;

	ACTION_WaitForEvent( 'PlayerTriggerEnd' );

	MacEnd.Controller.Focus = GetLocalPlayerPawn();
	ACTION_WaitForPawnRotateToward(MacEnd);

	ACTION_Walk('LeggettEnd' );
	ACTION_PlayAnim( 'LeggettEnd', 'Legs_peeks_Opel', 0.2, 1.0,,,, );

	//ACTION_MoveTowardTag( 'LeggettEnd', 'LeggettPoint', true , 'TruckTargetOFF' );
	ACTION_DisableBattleDialogue();	

	//Hartsock = Getpawn('Hartsock');

	//ACTION_ChangeController('Hartsock',class'ScriptedController');
	Hartsock.shouldCrouch(false);
		sleep(0.2);

	ACTION_MoveTowardTag( 'Hartsock', 'HartsockFountain', true, 'OutroPlayerPositionTarget' );

    ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
	ACTION_HideHUD( GetLocalPlayerController(), true );

	AllenEnd.controller.focus = GetLocalPlayerPawn();
	ACTION_WaitForPawnRotateToward(AllenEnd);

	GarnettEnd.controller.focus = GetLocalPlayerPawn();
	ACTION_WaitForPawnRotateToward(GarnettEnd);
	Hartsock.controller.focus = GetLocalPlayerPawn();
	ACTION_WaitForPawnRotateToward(Hartsock);

	ACTION_PlayAnim( 'AllenEnd', 'Standing_idle_relaxed_3', 0.2, 1.0,true,,,2);
	ACTION_PlayAnim( 'GarnettEnd', 'Standing_idle_relaxed_2', 0.2, 1.0,true,,,2);

	ACTION_AssignToUnit( 'Hartsock', 'HartsockTempUnit' );
	ACTION_MoveTowardTag( 'Hartsock', 'HartsockEndNode', true, 'OutroPlayerPositionTarget' );
		sleep(2.5);

	ACTION_DisplaySubTitleMessage2(S_Localize("GARNETT_I", "D0_1015_XYZ" ), 4.0, 1 , 1 , 1 , , TRUE );
		sleep(ACTION_PlayLipSyncSound( 'GarnettEnd', "D01015.GARNETT_I", 1.0, 1.0, 80.0 ) + 0.5 );

	ACTION_ClearPawnIdleQueue( 'LeggettEnd' );
	ACTION_FlushAnimQueue('LeggettEnd' );
	//ACTION_Walk( 'LeggettEnd' );
	//LeggettEnd.SetWalking( true );

	//ACTION_SetForcedFaceActor( getFirstActor('AllenEnd_Look'), 100);
	ACTION_DisplaySubTitleMessage2(S_Localize("ALLEN_J", "D0_1015_XYZ" ), 4.0, 1 , 1 , 1 , , TRUE );
		sleep( ACTION_PlayLipSyncSound( 'AllenEnd', "D01015.ALLEN_J", 1.0, 1.0, 80.0 ) + 0.5 );

	//ACTION_SetForcedFaceActor( getFirstActor('LeggettTruck_Look'), 200);
	ACTION_DisplaySubTitleMessage2(S_Localize("ALLEN_K", "D0_1015_XYZ" ), 4.0 , 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSound( 'AllenEnd', "D01015.ALLEN_K", 1.0, 1.0, 80.0 );

	//ACTION_WaitForAnimEnd( LeggettEnd, 0 );

	LeggettEnd.Controller.Focus = none;
	ACTION_ClearLookAtTarget( 'LeggettEnd' );
	
	/*
		sleep(0.5);
	ACTION_MoveTowardTag( 'LeggettEnd', 'LeggetTruck', FALSE );
	ACTION_PlayAnim( 'LeggettEnd', 'standing_idle_relaxed_1', 0.3, 1.0, True,,,);
	
	ACTION_SetLookAtTarget( 'LeggettEnd', TruckTarget, true );
	*/

	LeggettEnd.Controller.Focus = None;
	//ACTION_SetLookAtTarget( 'LeggettEnd', Mac, true );

		sleep(2.0);

	ACTION_ClearPawnIdleQueue( 'LeggettEnd' );
	ACTION_FlushAnimQueue('LeggettEnd' );
	ACTION_MoveTowardTag( 'LeggettEnd', 'LeggettEndPoint', FALSE );

	//ACTION_DisplayObjectiveString( "Leggett: The Keys are still in it.", 3.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("LEGGETT_D", "D0_1015_XYZ" ), 4.0, 1 , 1 , 1 , , TRUE );
		sleep( ACTION_PlayLipSyncSound( 'LeggettEnd', "D01015.Leggett_CZ", 1.0, 1.0, 120.0, true ) + 0.25 );
	ACTION_SetLookAtTarget( 'MacEnd', LeggettEnd, true );

	MacEnd.Controller.Focus = LeggettEnd;
	ACTION_WaitForPawnRotateToward(MacEnd);

	//ACTION_DisplayObjectiveString( "Leggett: I'd say this Opel Blitz just became offical US property.", 3.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("LEGGETT_E", "D0_1015_XYZ" ), 6.0, 1 , 1 , 1 , , TRUE );
		sleep( ACTION_PlayLipSyncSound( 'LeggettEnd', "D01015.Leggett_DZ", 1.0, 1.0, 120.0, true ) - 1.25 );
	ACTION_SetLookAtTarget( 'MacEnd', Baker, true );

	LeggettEnd.bDoHeadTurn = TRUE;
	LeggettEnd.Controller.Focus = GetLocalPlayerPawn();
	ACTION_WaitForPawnRotateToward(LeggettEnd);

	ACTION_MoveTowardTag( 'LeggettEnd', 'LeggettEndPoint', FALSE, 'MacEnd_Look' );

	ACTION_PlayAnim( 'LeggettEnd', 'standing_idle_relaxed_1', 0.2, 1.0, true,,, );
		sleep(1.5);

	AllenEnd.Controller.Focus = LeggettEnd;
	ACTION_WaitForPawnRotateToward(AllenEnd);

	//ACTION_DisplayObjectiveString( "Leggett: What d' ya think Mac?.", 3.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("LEGGETT_F", "D0_1015_XYZ" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSound( 'LeggettEnd', "D01015.Leggett_EZ", 1.0, 1.0, 120.0, true );
		sleep( 0.5 );
	ACTION_SetLookAtTarget( 'MacEnd', LeggettEnd, true );
		sleep( 0.75 );
	ACTION_SetLookAtTarget( 'LeggettEnd', Baker, true );

	//ACTION_DisplayObjectiveString( "MAC: I think I'm driving.", 3.0 );
	ACTION_PlayAnimWithQueue( 'MacEnd', 'standing_chatting_3', 0.2, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("MAC_I", "D0_1015_XYZ" ), 3.0, 1 , 1 , 1 , , TRUE );
		sleep( ACTION_PlayLipSyncSound( 'MacEnd', "D01015.Mac_FZ", 1.0, 1.0, 120.0, true ) + 0.25 );
	ACTION_SetLookAtTarget( 'MacEnd', Baker, true );
		sleep( 0.2 );
	ACTION_SaveMemoryReport( "XYZ_End" );
	ACTION_DisplayMapStats();
}

