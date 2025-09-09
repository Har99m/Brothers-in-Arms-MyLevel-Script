//=============================================================================
// TS_D10_0600_Midtro1Scene.
//=============================================================================
class TS_D10_0600_Midtro1Scene extends TriggeredScript
	placeable;


var float i;
var AnimPawn AP_Doyle, AP_Paddock, AP_Paige, AP_McConnel, AP_Campbell, AP_Friar;
var Tank AP_Tank1;
var AnimPawn AP_Blake;
var ActorLite MoveTank1_Midtro1_1, MoveTank2_Midtro1_1, MoveTank1_Midtro1_2, MoveTank2_Midtro1_2, MovePaddock_Midtro1_1, MoveMcConnel_Midtro1_1, MoveMcConnel_Midtro1_2, MoveMcConnel_Midtro1_3, MovePaige_Midtro1_1, MovePaige_Midtro1_2, MoveDoyle_Midtro1_1, MoveDoyle_Midtro1_2, MoveDoyle_Midtro1_3, MoveDoyle_Midtro1_4, MoveDoyle_Midtro1_5;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	// Clear hint from bridge
	ACTION_DisplayObjectiveHint( "", 0.0 );

	ACTION_TriggerEvent( 'CSU_Midtro1' );
	ACTION_TriggerEvent( 'TankSpawner_US_midtro1' );

	// Define Characters as AnimPawn Actors
	AP_Doyle = AnimPawn( GetPawn( 'Doyle_Midtro1' ));
	AP_Paige = AnimPawn( GetPawn( 'Paige_Midtro1' ));
	AP_McConnel = AnimPawn( GetPawn( 'McConnel_Midtro1' ));

	AP_Tank1 = Tank( GetFirstActor( 'Tank1Midtro' ));
	AP_Blake = AnimPawn( GetPawn( 'AP_Blake_Tag' ));

	// Place tanks in scripted mode
	ACTION_TankEnterScriptedMode( AP_Tank1 );
	AP_Tank1.MaxThrust = 80;
	AP_Tank1.bExcludeFromOracleCam = TRUE;

	// Set everyone to demigod and repel bullets and make Germans run away from midtro
	// Midtro Characters, Player, and Squad
	AP_Doyle.Controller.bDemiGod = TRUE;
	AP_Paige.Controller.bDemiGod = TRUE;
	AP_McConnel.Controller.bDemiGod = TRUE;
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Doyle), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Paige), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_McConnel), TRUE );

	GetLocalPlayerController().bGodMode = TRUE;
	ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn(), TRUE );

	GetPawn('Paddock').Controller.bDemiGod = TRUE;
	GetPawn('Friar').Controller.bDemiGod = TRUE;
	GetPawn('Campbell').Controller.bDemiGod = TRUE;
	ACTION_SetRepelBulletsDirect( gbxPawn(GetPawn('Paddock')), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(GetPawn('Friar')), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(GetPawn('Campbell')), TRUE );

	ACTION_OrderMove( 'Unit_DE_11', 'PN_C1_U7Retreat' );
	ACTION_OrderMove( 'Unit_DE_10', 'PN_C1_U7Retreat' );
	ACTION_OrderMove( 'Unit_DE_09', 'PN_C1_U7Retreat' );
	ACTION_OrderMove( 'Unit_DE_08', 'PN_C1_U7Retreat' );
	ACTION_OrderMove( 'Unit_DE_07', 'PN_C1_U7Retreat' );
	ACTION_OrderMove( 'Unit_DE_06', 'PN_C1_U7Retreat' );
	ACTION_OrderMove( 'Unit_DE_05', 'PN_C1_U7Retreat' );
	ACTION_OrderMove( 'Unit_DE_03', 'PN_C1_U7Retreat' );
	ACTION_OrderMove( 'Unit_DE_02', 'PN_C1_U7Retreat' );
	ACTION_OrderMove( 'Unit_DE_01', 'PN_C1_U7Retreat' );

	// Define Destination actors
	MoveMcConnel_Midtro1_1 = GetNavigationPoint( 'PN_MoveMcConnel_Midtro1_1' );
	MoveMcConnel_Midtro1_2 = GetNavigationPoint( 'PN_MoveMcConnel_Midtro1_2' );
	MoveMcConnel_Midtro1_3 = GetNavigationPoint( 'PN_MoveMcConnel_Midtro1_2' );
	MovePaige_Midtro1_1 = GetNavigationPoint( 'PN_MovePaige_Midtro1_1' );
	MovePaige_Midtro1_2 = GetNavigationPoint( 'PN_MovePaige_Midtro1_2' );
	MoveDoyle_Midtro1_1 = GetNavigationPoint( 'PN_MoveDoyle_Midtro1_1' );
	MoveDoyle_Midtro1_2 = GetNavigationPoint( 'PN_MoveDoyle_Midtro1_2' );
	MoveDoyle_Midtro1_3 = GetNavigationPoint( 'PN_MoveDoyle_Midtro1_3' );

	MoveTank1_Midtro1_1 = GetNavigationPoint( 'PN_MIDTRO1_TANK01' );
	MoveTank1_Midtro1_2 = GetNavigationPoint( 'PN_MIDTRO1_TANK01' );


	// Define Animpawns AnimSets
	ACTION_SetAnimSetDirect( AP_Doyle, "a_cin_d10_Run_of_the_mill.a_cin_d10_Runofthemill" );
	ACTION_SetAnimSetDirect( AP_BLAKE, "a_cin_d10_Run_of_the_mill.a_cin_d10_Runofthemill" );

	// Start Dialogue
	ACTION_TankMoveTo( AP_Tank1, MoveTank1_Midtro1_1 );
	sleep( 1.0 );


	ACTION_TriggerEvent( 'gbxWB_Doyle' );

	i = 1.0;
	ResetAbsoluteTime();
	StartAbsoluteTime();

	AP_Tank1.AttachToBone( GetFirstActor( 'PFX_BLAST88' ) , 'base' );
	GetFirstActor( 'PFX_BLAST88' ).SetRelativeRotation( rot(0.0, 0.0, 0.0) );
	GetFirstActor( 'PFX_BLAST88' ).SetRelativeLocation( vect(0, 0.0, -0.0) );  // +forward/back, +down/up, +right/left
	
	ACTION_MoveTowardTag( 'Paige_Midtro1', 'PN_Midtro_Doyle_unit2', False );
	ACTION_MoveTowardTag( 'McConnel_Midtro1', 'PN_Midtro_Doyle_unit1', False );

	ACTION_MoveToward( AP_Doyle , MoveDoyle_Midtro1_1 , FALSE, GetLocalPlayerPawn() );
	WaitForAbsoluteTime( i += 2.5 );

	AP_Doyle.Controller.Focus = GetLocalPlayerPAWN();
	ACTION_ClearPawnIdleQueue( 'Doyle_Midtro1' );
	ACTION_AddAnimToPawnIdleQueue( 'Doyle_Midtro1', 'standing_chatting_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Doyle_Midtro1', FALSE );

	ACTION_PlayLipSyncSound( 'Doyle_Midtro1', "D10_0500.DOYLE_C", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_C"), 2.5, 1, 1, 1, TRUE, TRUE );  // "Doyle: Okay new plan Red!  You are going to-"

	ACTION_TriggerEvent( 'Emitter_Distant88' );
    WaitForAbsoluteTime( i += 0.45 );

	ACTION_PlayLipSyncSound( 'Paige_Midtro1', "BD_PAIGE.L_SEE88_A", 1.0, 1.0, 1.0 );
    WaitForAbsoluteTime( i += 0.25 );

	AP_Paige.Controller.Focus = getFirstActor('LT_PAKSOUND');
	AP_Paige.Controller.Focus = AP_Tank1;
    WaitForAbsoluteTime( i += 0.25 );

	AP_McConnel.Controller.Focus = getFirstActor('LT_PAKSOUND');
	ACTION_SetLookAtTarget( 'McConnel_Midtro1', AP_Tank1, True );
    WaitForAbsoluteTime( i += 0.25 );

	ACTION_SetLookAtTarget( 'Paige_Midtro1', AP_Tank1, True );
	AP_Doyle.Controller.Focus = getFirstActor('LT_PAKSOUND');

	ACTION_TriggerEvent('LAMETRIGGER');
	ACTION_PlaySound( 'PFX_BLAST88', "EXPLOSIONS.TANKEXPLODE", 1.0, 1.0, 1.0 );
	AP_Tank1.TakeDamage( 500, None, AP_Tank1.Location, vect(0,0,0), class'DamageGammonBomb' );
	AP_Paige.Controller.Focus = AP_Tank1;
	AP_McConnel.Controller.Focus = AP_Tank1;
	ACTION_PlayAnimWithQueue( 'McConnel_Midtro1', 'standing_down_to_cower', 0.2, 1.0, False,,);
	ACTION_CrouchDirect( AP_Paige );
	ACTION_CrouchDirect( AP_McConnel );
	ACTION_PlayAnimWithQueue( 'Doyle_Midtro1', 'standing_react_to_bullets_5', 0.5, 1.0,FALSE,,);
	ACTION_TriggerEvent('PFX_BLAST88');
	WaitForAbsoluteTime( i += 1.0 );

	ACTION_PlayAnimWithQueue( 'Doyle_Midtro1', 'standing_idle_relaxed_3', 0.8, 1.0,FALSE,,);
	ACTION_ClearPawnIdleQueue( 'Doyle_Midtro1' );
	ACTION_AddAnimToPawnIdleQueue( 'Doyle_Midtro1', 'standing_idle_relaxed_3' );

	ACTION_DestroyActor('TRIG_MIDTRO1_LOCK');

	ACTION_UnBlockNavPoints('PN_MIDTRO1_BLOCKED');
	ACTION_TriggerEvent( 'TRIG_MIDTRO1_LOCK' );
	ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE );

	ACTION_TriggerEvent( 'gbxWB_88mm' );
	ACTION_TriggerEvent( 'gbxWB_88mm_Start' );

	ACTION_TriggerEvent( 'TS_D10_0600_88Distant' );

	ResetAbsoluteTime();
	i = 0.0;

	ACTION_ClearPawnIdleQueue( 'Doyle_Midtro1' );
	ACTION_AddAnimToPawnIdleQueue( 'Doyle_Midtro1', 'doyle_crouched_yells_at_88_idle' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Doyle_Midtro1', FALSE );

	//AP_Doyle.Controller.focus = getFirstActor('LT_MIDTRO1_DOYLE01');
				
	ACTION_PlayAnimWithQueue( 'Doyle_Midtro1', 'doyle_crouched_yells_at_88_mount', 0.1, 1.0,FALSE,,1);
	
	WaitForAbsoluteTime( i += 2.5 );

	ACTION_PlayAnimWithQueue( 'Doyle_Midtro1', 'doyle_crouched_yells_at_88_and_dismount', 0.4, 1.0,FALSE,,2);

	ACTION_PlayLipSyncSound( 'Doyle_Midtro1', "D10_0500.DOYLE_D", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_D1"), 4.0, 1, 1, 1, TRUE, TRUE );  // "Doyle: This is all clogged up to shit and back!"

	MoveTank1_Midtro1_2 = GetNavigationPoint( 'PN_MIDTRO1_TANK03' );

	WaitForAbsoluteTime( i += 4.5 );


	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_D2"), 4.0, 1, 1, 1, TRUE, TRUE );  // "Doyle: You son of a bitch I'm coming for you!"

	WaitForAbsoluteTime( i += 4.5 );

	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_D3"), 5.0, 1, 1, 1, TRUE, TRUE );  // "Doyle: Make your piece with God!"

	ACTION_TriggerEvent('TSCombat2_01');

	WaitForAbsoluteTime( i += 3.5 );

	ACTION_ClearPawnIdleQueue( 'Doyle_Midtro1' );
	ACTION_AddAnimToPawnIdleQueue( 'Doyle_Midtro1', 'standing_idle_relaxed_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Doyle_Midtro1', FALSE );

	ACTION_PlayAnimDirect( AP_Doyle, 'Standing_idle_relaxed_1', 0.2, 1.0,FALSE,,);
	ACTION_PlayAnimDirect( AP_Paige, 'Standing_idle_relaxed_1', 1.0, 1.0,FALSE,,);
	ACTION_PlayAnimDirect( AP_McConnel, 'Standing_idle_relaxed_1', 1.0, 1.0,FALSE,,);
	WaitForAbsoluteTime( i += 1.0 );

	// CHANGE TO MIND CONTROLLER
	ACTION_ChangeController( 'Paige_midtro1', class'Mind' );
	ACTION_ChangeController( 'Marsh_midtro1', class'Mind' );
	ACTION_ChangeController( 'McConnel_midtro1', class'Mind' );
	ACTION_ChangeController( 'Doyle_midtro1', class'Mind' );

	ACTION_OrderMove( 'Unit_US_Doyle', 'PN_Midtro_Doyle_unit' );

	ACTION_TriggerEvent( 'TS_D10_0600_DemiDoyle' );
	ACTION_TriggerEvent( 'TSCheckpointSave_02' );

	sleep( 4.0 );
	ACTION_SetObjectiveStatus( 1, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 1, 'ObjectiveList', 4.0 );

	sleep(3.0);
	ACTION_TriggerEvent('TS_D10_0600_Midtro1Scene_UnBlock');

	// Set everyone to back to human and not repel bullets, make every German assault the player
	// Midtro Characters, Player, and Squad
	AP_McConnel.Controller.bDemiGod = FALSE;
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_McConnel), FALSE );

	GetLocalPlayerController().bGodMode = FALSE;
	ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn(), FALSE );

	GetPawn('Paddock').Controller.bDemiGod = FALSE;
	GetPawn('Friar').Controller.bDemiGod = FALSE;
	GetPawn('Campbell').Controller.bDemiGod = FALSE;
	ACTION_SetRepelBulletsDirect( gbxPawn(GetPawn('Paddock')), FALSE );
	ACTION_SetRepelBulletsDirect( gbxPawn(GetPawn('Friar')), FALSE );
	ACTION_SetRepelBulletsDirect( gbxPawn(GetPawn('Campbell')), FALSE );

	ACTION_OrderAssault( 'Unit_DE_11', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_10', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_09', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_08', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_07', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_06', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_05', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_03', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_02', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_01', 'Unit_Player' );

	ScriptEnd:
}

