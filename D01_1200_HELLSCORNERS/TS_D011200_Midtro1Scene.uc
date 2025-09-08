//=============================================================================
// TS_D011200_Midtro1Scene.
//=============================================================================
class TS_D011200_Midtro1Scene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Johnson_2, AP_Paige_2, AP_McConnel_2, AP_Campbell_2;
var pawn Pawn_Campbell_2, Pawn_Johnson_2, Pawn_Paige_2, Pawn_McConnel_2;
var ActorLite MoveCampbell02, MoveJohnson02, MovePaige02, MoveMcConnel02;
var bool bPlayerThere;
var int s ;

// This is so that Germans wont attack during the midtro
var AnimPawn AP_Desola, AP_Paddock, AP_Marsh, AP_Garnett, AP_Friar;

state Triggered
{
	function OnTrigger()
	{
		bPlayerThere = True;
	}

	Begin:

	ACTION_TriggerEvent( 'CSU_AmericanMidtro1' );

	//=============================================================================
	// This is so that Germans wont attack during the midtro
	//=============================================================================
	AP_Desola = AnimPawn( GetPawn( 'Pawn_Desola' ) );
	AP_Paddock = AnimPawn( GetPawn( 'Pawn_Paddock' ) );
	AP_Marsh = AnimPawn( GetPawn( 'Pawn_Marsh' ) );
	AP_Garnett = AnimPawn( GetPawn( 'Pawn_Garnett' ) );
	AP_Friar = AnimPawn( GetPawn( 'Pawn_Friar' ) );

	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Desola), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Paddock), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Marsh), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Garnett), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Friar), TRUE );

	GetPawn('Pawn_Paddock').Controller.bDemiGod = TRUE;
	GetPawn('Pawn_Desola').Controller.bDemiGod = TRUE;
	GetPawn('Pawn_Marsh').Controller.bDemiGod = TRUE;
	GetPawn('Pawn_Garnett').Controller.bDemiGod = TRUE;
	GetPawn('Pawn_Friar').Controller.bDemiGod = TRUE;

	GetLocalPlayerController().bGodMode = TRUE;
	ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn(), TRUE );

	ACTION_OrderMove( 'Unit_DE_House01', 'PN_GermanMovement_11a' );
	ACTION_OrderMove( 'Unit_DE_12', 'PN_GermanMovement_11a' );
	ACTION_OrderMove( 'Unit_DE_11', 'PN_GermanMovement_11a' );
	ACTION_OrderMove( 'Unit_DE_09', 'PN_GermanMovement_11a' );
	ACTION_OrderMove( 'Unit_DE_10', 'PN_GermanMovement_11a' );

	//=============================================================================

	AP_Johnson_2 = AnimPawn( GetPawn( 'Pawn_Johnson_2' ) );
	AP_Paige_2 = AnimPawn( GetPawn( 'Pawn_Paige_2' ) );
	AP_McConnel_2 = AnimPawn( GetPawn( 'Pawn_McConnel_2' ) );
	AP_Campbell_2 = AnimPawn( GetPawn( 'Pawn_Campbell_2' ) );

	Pawn_Campbell_2 = GetPawn( 'Pawn_Campbell_2' );
	Pawn_Paige_2 = GetPawn( 'Pawn_Paige_2' );
	Pawn_McConnel_2 = GetPawn( 'Pawn_McConnel_2' );
	Pawn_Johnson_2 = GetPawn( 'Pawn_Johnson_2' );

	MoveCampbell02 = GetNavigationPoint( 'PN_MoveCampbell02' );
	MoveJohnson02 = GetNavigationPoint( 'PN_MoveJohnson02' );
	MovePaige02 = GetNavigationPoint( 'PN_MovePaige02' );
	MoveMcConnel02 = GetNavigationPoint( 'PN_MoveMcConnel02' );

	ACTION_SetAnimSetDirect( AP_Johnson_2, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );

	ACTION_ClearPawnIdleQueue( 'Pawn_Campbell_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Campbell_2', 'standing_idle_relaxed_4' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Campbell_2', FALSE ); 

	ACTION_ClearPawnIdleQueue( 'Pawn_Johnson_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Johnson_2', 'Johnson_intro_idle' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Johnson_2', FALSE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Paige_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Paige_2', 'standing_idle_aimed_sighted_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Paige_2', FALSE );

	ACTION_ClearPawnIdleQueue( 'Pawn_McConnel_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_McConnel_2', 'standing_idle_relaxed_5' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_McConnel_2', FALSE );

	Pawn_Johnson_2.Controller.Focus = getFirstActor('LT_Johnson_01');
	Pawn_Paige_2.Controller.Focus = getFirstActor('LT_Paige_01');
	Pawn_Paige_2.Controller.bRotateToDesired = False;

	ACTION_TriggerEvent('CSG_Squad_Midtro1');

	ACTION_SetPawnWeaponAmmo( getPawn('MidtroG1'), class'gbxInventory.WeapDEK98_', 0 );
	ACTION_SetPawnWeaponAmmo( getPawn('MidtroG2'), class'gbxInventory.WeapDEK98_', 0 );
	GetPawn('MidtroG1').Health = 1;
	GetPawn('MidtroG2').Health = 1;
	ACTION_MoveTowardTag( 'MidtroG1', 'PN_GermanMovement_12c', False );
	ACTION_MoveTowardTag( 'MidtroG2', 'PN_GermanMovement_12c', False );
	sleep(0.2);


	ACTION_PlayAnimDirect( Pawn_Paige_2, 'standing_wall_lean_left_fire_mount', 0.0, 1.0,FALSE,,,4);
	
	sleep(1.0);
	ACTION_PawnFireAtTarget( 'Pawn_Paige_2', 'LT_ShootGer_01' );	
	sleep(0.2);
	ACTION_PlayLipSyncSound( 'Pawn_Johnson_2', "W_M1GARAND.Fire", 1.0, 1.0, 1.0, ,'bottom_lip' );
	ACTION_KillPawn('MidtroG1');
	sleep(0.5);
	ACTION_PawnFireAtTarget( 'Pawn_Paige_2', 'LT_ShootGer_01' );	
	sleep(0.2);
	ACTION_PlayLipSyncSound( 'Pawn_Johnson_2', "W_M1GARAND.Fire", 1.0, 1.0, 1.0, ,'bottom_lip' );
	ACTION_KillPawn('MidtroG2');


	ACTION_MoveToward( AP_Paige_2, MoveCampbell02  );

	sleep(1.0);

	ACTION_MoveToward( AP_Johnson_2, MoveJohnson02 );

	ACTION_MoveToward( AP_Campbell_2, MoveMcConnel02 );
	sleep(0.5);
	ACTION_MoveToward( AP_McConnel_2, MovePaige02 );
	
	ACTION_ClearPawnFireAtTarget( 'PAWN_Paige_2' );

	ACTION_PlayAnimDirect( Pawn_Paige_2, 'standing_idle_combat_2', 0.4, 1.0,True,,,);
	
	ACTION_ClearPawnIdleQueue( 'Pawn_McConnel_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Paige_2', 'standing_idle_combat_4' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Paige_2', 'standing_idle_combat_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Paige_2', FALSE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Campbell_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Paige_2', 'standing_idle_combat_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Paige_2', 'standing_idle_combat_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Paige_2', FALSE );
	ACTION_AssignToUnit( 'Pawn_Paige_2', 'MIDTROSQUAD' );

	Do {
		sleep(0.2);
	} Until ( bPlayerThere == True );	
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
	
	s = 0 ;
	While( !PawnIsAtDestination( Pawn_Johnson_2, MoveJohnson02 ) && s < 50 )
		{
			sleep( 0.2 );
			s ++ ;
		}

	Pawn_Johnson_2.Controller.Focus = GetLocalPlayerPawn();

	i = 0.0;

	ResetAbsoluteTime();
	StartAbsoluteTime();

//JOHNSON_A1=Johnson: Been on the horn all day trying to get some fucking reinforcements and they send me a Corporal?
//JOHNSON_A2=Johnson: Ballard can kiss my ass.  We were down to our last clips...
//JOHNSON_A3=Johnson: Paige, McConnel go get that ammo.
//JOHNSON_A4=Johnson: Corporal, move your ass up that riverbank and secure a defensive position at the road junction.
//JOHNSON_A5=Johnson: Go.  Get out of here.
	ACTION_PlayAnimWithQueue( 'Pawn_Johnson_2', 'Johnson_intro_dialogue', 0.2, 1.0,FALSE,,);
	ACTION_PlayLipSyncSound( 'Pawn_Johnson_2', "D01_1200.JOHNSON_A", 1.0, 1.0, 1.0, ,'bottom_lip' );
	ACTION_DisplaySubTitleMessage2( S_Localize( "JOHNSON_A1" ), 4.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 4.5 );
	ACTION_DisplaySubTitleMessage2( S_Localize( "JOHNSON_A2" ), 3.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 4.5 );
	ACTION_DisplaySubTitleMessage2( S_Localize( "JOHNSON_A3" ), 3.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 1.0 );

	Pawn_Paige_2.Controller.bRotateToDesired = True;

	Pawn_Paige_2.Controller.Focus = Pawn_Johnson_2;

	ACTION_SetLookAtTarget( 'PAWN_PAIGE_2', PAWN_JOHNSON_2, TRUE );

	WaitForAbsoluteTime( i += 0.5 );
	Pawn_McConnel_2.Controller.Focus = Pawn_Johnson_2;
	WaitForAbsoluteTime( i += 2.5 );

	ACTION_SetDesiredSpeed( 'PAWN_PAIGE_2', 0.3 );
	ACTION_SetDesiredSpeed( 'PAWN_MCCONNEL_2', 0.3 );

	ACTION_MoveTowardTag( 'Pawn_Paige_2', 'PN_SetupCheckpoint2_02', False );

	WaitForAbsoluteTime( i += 0.5 );
	ACTION_MoveTowardTag( 'Pawn_Mcconnel_2', 'PN_MoveCampbell02', True );
	WaitForAbsoluteTime( i += 1.5 );
	ACTION_MoveTowardTag( 'Pawn_McConnel_2', 'PN_SetupCheckpoint2_02', True );


	ACTION_DisplaySubTitleMessage2( S_Localize( "JOHNSON_A4" ), 4.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 2.5 );
	Pawn_Johnson_2.Controller.bRotateToDesired = True;
	//PAWN_JOHNSON_2.Controller.Focus = getfirstActor('LT_Johnson_04');
	WaitForAbsoluteTime( i += 2.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize( "JOHNSON_A5" ), 2.0, 1, 1, 1, TRUE, TRUE );



	ACTION_SetDesiredSpeed( 'PAWN_PAIGE_2', 1.0 );
	ACTION_SetDesiredSpeed( 'PAWN_MCCONNEL_2', 1.0 );

	ACTION_UnBlockNavPoints('PN_CP3'); //enable pathnodes
	ACTION_TriggerEvent('Trigger_Checkpoint_03');
	ACTION_UnLockPlayerMovement( GetLocalPlayerPawn() );
	Pawn_Paige_2.Controller.Focus = None;
	Pawn_McConnel_2.Controller.Focus = None;
	Pawn_Johnson_2.Controller.Focus = None;

	ACTION_SetObjectiveStatus( 1, OI_Complete, 'ObjectiveList' );
	ACTION_SetObjectiveStatus( 2, OI_ACTIVE, 'ObjectiveList' );
	sleep( 4.0 );
	ACTION_DisplayObjective( 2, 'ObjectiveList', 4.0 );

	ACTION_TriggerEvent( 'WB_MortarTeam' );
	ACTION_TriggerEvent( 'WB_MG42' );

	StopAbsoluteTime();

	ACTION_WaitForEvent('EVENT_Midtro1END');

	ACTION_SetDesiredSpeed( 'PAWN_JOHNSON_2', 0.3 );

	ACTION_SetDesiredSpeed( 'PAWN_CAMPBELL_2', 0.3 );

	ACTION_MoveTowardTag( 'Pawn_Johnson_2', 'PN_MIDTRO1_Truck01', False );
	sleep(0.5);
	ACTION_MoveTowardTag( 'Pawn_Campbell_2', 'PN_MIDTRO1_Truck02', False );
	sleep(2.0);
	PAWN_JOHNSON_2.Controller.Focus = getfirstActor('LT_Johnson_02');
	PAWN_CAMPBELL_2.Controller.Focus = getfirstActor('LT_Johnson_03');	

	MoveJohnson02 = GetNavigationPoint( 'PN_MIDTRO1_Truck01' );

	While( !PawnIsAtDestination( Pawn_Johnson_2, MoveJohnson02 ) && s < 75 )
		{
			sleep( 0.2 );
		}

	ACTION_PlayAnimDirect( PAWN_JOHNSON_2, 'crouched_wall_lean_right_mount_from_standing', 0.3, 1.0, False, , , 2 );
	ACTION_WaitForAnimEnd( PAWN_JOHNSON_2, 0 );
	ACTION_PlayAnimDirect( PAWN_CAMPBELL_2, 'standing_to_crouched', 0.3, 1.0, False );
	ACTION_PlayAnimDirect( PAWN_JOHNSON_2, 'crouched_wall_lean_right_idle', 0.0, 1.0, True,,,2 );
	ACTION_WaitForAnimEnd( PAWN_CAMPBELL_2, 0 );
	ACTION_PlayAnimDirect( PAWN_CAMPBELL_2, 'crouched_idle_relaxed_1', 0.4, 1.0, True );

	//=============================================================================
	// Make Germans resume attacking after midtro
	//=============================================================================
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Desola), False );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Paddock), False );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Marsh), False );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Garnett), False );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Friar), False );

	GetPawn('Pawn_Paddock').Controller.bDemiGod = False;
	GetPawn('Pawn_Desola').Controller.bDemiGod = False;
	GetPawn('Pawn_Marsh').Controller.bDemiGod = False;
	GetPawn('Pawn_Garnett').Controller.bDemiGod = False;
	GetPawn('Pawn_Friar').Controller.bDemiGod = False;

	GetLocalPlayerController().bGodMode = False;
	ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn(), False );

	ACTION_OrderAssault( 'Unit_DE_House01', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_12', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_11', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_09', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_10', 'Unit_Player' );

	//=============================================================================
}

state NullState
{
	function OnTrigger() { GotoState( 'NullState' ); }
	Begin:
}


