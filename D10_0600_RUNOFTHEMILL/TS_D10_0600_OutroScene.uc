//=============================================================================
// TS_D10_0600_OutroScene.
//=============================================================================
class TS_D10_0600_OutroScene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Doyle, AP_Paige, AP_McConnel;
var Tank AP_Tank3;

var int j;

var ActorLite MoveTank3_Outro_1, MoveMcConnel_Outro_1, MovePaige_Outro_1, PN_Doyle;

state Triggered
{
	function OnTrigger()
	{
		GoToState( 'DoyleInPosition' );
	}

	Begin:

	if ( gbxBeacons(GetFirstActor('gbxWB_Mill_Start')).bEnabled )
		ACTION_TriggerEvent( 'gbxWB_Mill_Start' );

	ACTION_DestroyActor('gbxWB_Mill_Start');

	ACTION_DestroyActor('gbxMT_C3_U22LeftStepTwo' );
	ACTION_DestroyActor('gbxMT_C3_U22RightStepTwo' );
	ACTION_DestroyActor('Trigger_D10_0600_DE22bRespawner' );
	ACTION_DestroyActor('gbxMT_C3_U22RightStepThree' );
	ACTION_DestroyActor('gbxMT_C3_U22LeftStepThree' );
	ACTION_DestroyActor('Trigger_D10_0600_DE22cRespawner' );

	ACTION_OrderMove('Unit_US_Doyle', 'PN_MoveMarsh_Outro_1', False );
	ACTION_AssignToUnit( 'Doyle_Midtro1' , 'UNIT_OUTRODOYLE' );

	ACTION_SetObjectiveStatus( 1, OI_Complete, 'ObjectiveList' );
	ACTION_DisplayObjective( 1, 'ObjectiveList', 4.0 );
	sleep( 1.0 );
	ACTION_TriggerEvent('gbxWB_Mill');
	sleep( 4.0 );

	ACTION_DisplayObjectiveHint( S_Localize("HINT_C"), 4.0 );
	ACTION_TriggerEvent('gbxWB_Doyle_Outro');

	// Define Characters as AnimPawn Actors
	AP_Doyle = AnimPawn( GetPawn( 'Doyle_Midtro1' ));
	AP_Paige = AnimPawn( GetPawn( 'Paige_Midtro1' ));

	// These two could be dead
	AP_McConnel = AnimPawn( GetPawn('McConnel_Outro') );

	// Define Destination actors
	MoveMcConnel_Outro_1 = GetNavigationPoint( 'PN_MoveMcConnel_Outro_1' );
	MovePaige_Outro_1 = GetNavigationPoint( 'Paige_Outro_Talk' );
	MoveTank3_Outro_1 = GetNavigationPoint( 'PN_MoveTank3_Outro_1' );

	// Define Animpawns AnimSets
	ACTION_SetAnimSetDirect( AP_Doyle, "a_cin_d10_Run_of_the_mill.a_cin_d10_Runofthemill" );

	ACTION_ClearPawnIdleQueue( 'McConnel_Outro' );
	ACTION_AddAnimToPawnIdleQueue( 'McConnel', 'standing_idle_relaxed_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'McConnel', FALSE );

	ACTION_ClearPawnIdleQueue( 'Marsh_Outro' );
	ACTION_AddAnimToPawnIdleQueue( 'Marsh', 'standing_idle_relaxed_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Marsh', FALSE );

	ACTION_DisableBattleDialogue();

	// Remove player controlled units from command
	ACTION_DetachUnitFromSuperUnit( 'UNIT_US_ASS' );
	ACTION_DetachUnitFromSuperUnit( 'Unit_US_Tank' );
	ACTION_OrderMove( 'Unit_US_Tank', 'PN_Outro_Tank' );
	ACTION_OrderMove( 'UNIT_US_ASS', 'PN_Outro_Squad' );

	// Start Dialogue
	ACTION_OrderMove('UNIT_OUTRODOYLE','PN_Outro_01' );
	WargamePawn(AP_Doyle).SetWeaponAimedState( WAS_Relaxed );
	WargamePawn(AP_Paige).SetWeaponAimedState( WAS_Relaxed );

	ACTION_TriggerEvent( 'TrigVol_DoyleInPosition' );

	PN_Doyle = GetNavigationPoint( 'PN_Outro_01' );

	SLog( "**** Waiting for Mind Doyle ****" );
	j = 0;
	while ( j < 44 )
	{
		ACTION_OrderMove('UNIT_OUTRODOYLE','PN_Outro_01' );
		sleep( 0.5 );
		j++;
	}

	SLog( "**** Gave up waiting for Mind Doyle ****" );
	GoToState( 'DoyleInPosition' );

	ScriptEnd:
}

state DoyleInPosition
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	SLog( "**** Mind Doyle in Position ****" );
	ACTION_ChangeController( 'Doyle_Midtro1', class'ScriptedController' );
	ACTION_ChangeController('Paige_Midtro1', class'Scriptedcontroller');

	ACTION_ClearPawnIdleQueue( 'Paige_Outro' );
	ACTION_AddAnimToPawnIdleQueue( 'Paige', 'standing_idle_relaxed_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Paige', FALSE );

	ACTION_MoveToward( AP_Paige , MovePaige_Outro_1 , TRUE );
	ACTION_MoveToward( AP_McConnel , MoveMcConnel_Outro_1 , TRUE );
	ACTION_MoveToward( AP_Doyle, PN_Doyle, TRUE );

	SLog( "**** Waiting for Doyle ****" );
	j = 0;
	while ( !PawnIsAtDestination( AP_Doyle, PN_Doyle ) && j < 16 )
	{
		sleep( 0.5 );
		ACTION_MoveToward( AP_Doyle, PN_Doyle, TRUE );
		j++;
	}

	sleep( 1.0 );
	AP_Doyle.Controller.Focus = GetLocalPlayerPawn();
	ACTION_SetLookAtTarget( 'Doyle_Midtro1', GetLocalPlayerPawn(), TRUE );

	GoToState( 'WaitForPlayer' );
}

state WaitForPlayer
{
	function OnTrigger()
	{
		GoToState( 'PlayerInPosition' );
	}

	Begin:

	ACTION_TriggerEvent('Trig_Outro');

	ACTION_MoveToward( AP_Paige , MovePaige_Outro_1 , TRUE );
	ACTION_MoveToward( AP_McConnel , MoveMcConnel_Outro_1 , TRUE );

	SLog( "**** Waiting for Player ****" );
}

state PlayerInPosition
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	ACTION_TriggerEvent( 'gbxWB_Doyle_Outro' );

	AP_Doyle.bDoHeadTurn = TRUE;
	ACTION_WaitForPawnRotateToward( AP_Doyle );

	i = 0.0;
	ResetAbsolutetime();
	StartAbsoluteTime();

	ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

	ACTION_PlayLipSyncSound( 'Doyle_Midtro1', "D10_0500.DOYLE_F", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_F"), 2.5, 1, 1, 1, TRUE, TRUE );  // "Doyle: I got one last favor Red."

	ACTION_MoveToward( AP_Paige , MovePaige_Outro_1 , FALSE );
	ACTION_MoveToward( AP_McConnel , MoveMcConnel_Outro_1 , FALSE );
	WaitForAbsoluteTime( i += 1.0 );

	AP_Paige.Controller.Focus = AP_Doyle;
	WaitForAbsoluteTime( i += 2.0 );

	ACTION_PlayLipSyncSound( 'PAIGE_Midtro1', "D10_0500.PAIGE_B", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Paige_B"), 4.0, 1, 1, 1, TRUE, TRUE );  // "Paige: You boys are starting to run a bit short on favors."

	ACTION_SetLookAtTarget( 'Paige_Midtro1', GetLocalPlayerPawn(), TRUE );
	ACTION_SetLookAtTarget( 'Doyle_Midtro1', AP_Paige, TRUE );

	WaitForAbsoluteTime( i += 2.0 );
	ACTION_SetLookAtTarget( 'Paige_Midtro1', AP_Doyle, TRUE );
	WaitForAbsoluteTime( i += 2.5 );

	ACTION_SetLookAtTarget( 'Doyle_Midtro1', GetLocalPlayerPawn(), TRUE );

	ACTION_PlayLipSyncSound( 'Doyle_Midtro1', "D10_0500.DOYLE_G", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_G"), 2.0, 1, 1, 1, TRUE, TRUE );  // "Doyle: We need you."

	WaitForAbsoluteTime( i += 2.0 );
	ACTION_PlayAnimDirect( AP_Paige, 'standing_chatting_1', 0.5, 1.0, True );

	WaitForAbsoluteTime( i += 0.5 );
	ACTION_TankMoveTo( AP_Tank3, MoveTank3_Outro_1 );
	ACTION_PlayLipSyncSound( 'PAIGE_Midtro1', "D10_0500.PAIGE_C", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Paige_C"), 6.0, 1, 1, 1, TRUE, TRUE );  // "Paige: Well of course we're in.  101st boys never turn down the opportunity to save the 82nd's ass."

	ACTION_SetLookAtTarget( 'Doyle_Midtro1', AP_Paige, TRUE );
	WaitForAbsoluteTime( i += 7.0 );

	//===== End map
	ACTION_TriggerEvent( Event );

	ScriptEnd:
}

