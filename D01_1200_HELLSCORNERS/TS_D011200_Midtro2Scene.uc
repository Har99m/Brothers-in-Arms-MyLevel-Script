//=============================================================================
// TS_D011200_Midtro2Scene.
//=============================================================================
class TS_D011200_Midtro2Scene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Johnson_3, AP_Paige_3, AP_McConnel_3, AP_Campbell_3;
var pawn Pawn_Campbell_3, Pawn_Johnson_3, Pawn_Paige_3, Pawn_McConnel_3;
var ActorLite MoveCampbell03, MoveJohnson03, MovePaige03, MoveMcConnel03;
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

	ACTION_OrderMove( 'Unit_DE_13', 'PN_GermansRetreat' );
	ACTION_OrderMove( 'Unit_DE_14', 'PN_GermansRetreat' );
	ACTION_OrderMove( 'Unit_DE_15', 'PN_GermansRetreat' );
	ACTION_OrderMove( 'Unit_DE_16', 'PN_GermansRetreat' );
	ACTION_OrderMove( 'Unit_DE_17', 'PN_GermansRetreat' );
	ACTION_OrderMove( 'Unit_DE_18', 'PN_GermansRetreat' );

	//=============================================================================

	ACTION_UnBlockNavPoints('PN_CP4'); //enable pathnodes

	ACTION_TriggerEvent( 'CSU_AmericanMidtro2' );
	ACTION_TriggerEvent( 'CSU_AmericanMidtro2a' );

	AP_Paige_3 = AnimPawn( GetPawn( 'Pawn_Paige_3' ) );
	Pawn_Paige_3 = GetPawn( 'Pawn_Paige_3' );

	AP_McConnel_3 = AnimPawn( GetPawn( 'Pawn_McConnel_3' ) );
	Pawn_McConnel_3 = GetPawn( 'Pawn_McConnel_3' );

	MovePaige03 = GetNavigationPoint( 'PN_MovePaige03' );
	MoveMcConnel03 = GetNavigationPoint( 'PN_MoveMcConnel03' );

	ACTION_OrderMove('MIDTRO2SQUADa', 'PN_MovePaige03', False );
	ACTION_OrderMove('MIDTRO2SQUAD', 'PN_MovePaige03', False );

	ACTION_ClearPawnIdleQueue( 'Pawn_Paige_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Paige_3', 'standing_idle_combat_6' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Paige_3', 'standing_idle_combat_7' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Paige_3', 'standing_idle_combat_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Paige_3', 'standing_idle_combat_3' );

	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Paige_3', FALSE );

	ACTION_ClearPawnIdleQueue( 'Pawn_McConnel_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_McConnel_3', 'standing_idle_combat_7' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_McConnel_3', 'standing_idle_combat_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_McConnel_3', 'standing_idle_combat_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_McConnel_3', FALSE );

	//ACTION_MoveToward( AP_Paige_3, MovePaige03 );
	//ACTION_MoveToward( AP_McConnel_3, MoveMcConnel03 );

	Do {
		sleep( 1.0 );
	} Until ( bPlayerThere == True );	

	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

	AP_Johnson_3 = AnimPawn( GetPawn( 'Pawn_Johnson_3' ) );
	AP_Campbell_3 = AnimPawn( GetPawn( 'Pawn_Campbell_3' ) );
	Pawn_Campbell_3 = GetPawn( 'Pawn_Campbell_3' );
	Pawn_Johnson_3 = GetPawn( 'Pawn_Johnson_3' );

	MoveCampbell03 = GetNavigationPoint( 'PN_MoveCampbell03' );
	MoveJohnson03 = GetNavigationPoint( 'PN_MoveJohnson03' );

	ACTION_ClearPawnIdleQueue( 'Pawn_Campbell_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Campbell_3', 'standing_idle_combat_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Campbell_3', 'standing_idle_combat_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Campbell_3', 'standing_idle_combat_7' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Campbell_3', FALSE ); 

	ACTION_ClearPawnIdleQueue( 'Pawn_Johnson_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Johnson_3', 'standing_idle_combat_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Johnson_3', 'standing_idle_combat_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Johnson_3', FALSE );

	ACTION_MoveToward( AP_Campbell_3, MoveCampbell03 );
	ACTION_MoveToward( AP_Johnson_3, MoveJohnson03 );

	s = 0 ;
	While( !PawnIsAtDestination( Pawn_Johnson_3 , MoveJohnson03 ) && s < 50 )
		{
			sleep( 0.2 );
			s ++ ;
		}

	Pawn_Johnson_3.Controller.Focus = GetLocalPlayerPawn();
	i = 1.0;

	ResetAbsoluteTime();
	StartAbsoluteTime();
	WaitForAbsoluteTime( i );

	ACTION_PlayLipSyncSound( 'Pawn_Johnson_3', "D01_1200.JOHNSON_B", 1.0, 1.0, 1.0, ,'bottom_lip' );
	ACTION_DisplaySubTitleMessage2( S_Localize( "JOHNSON_B1" ), 4.0, 1, 1, 1, TRUE, TRUE );
		//-----/-----	JOHNSON_G="Johnson: There's a hell of a lot of Germans coming down this road."
	WaitForAbsoluteTime( i += 5.5 );

	ACTION_DisplaySubTitleMessage2( S_Localize( "JOHNSON_B2" ), 3.5, 1, 1, 1, TRUE, TRUE );
		//-----/-----	JOHNSON_H="Johnson: I think our best bet is to bluff our way out of this."

/*

	ACTION_MoveTowardTag( 'Pawn_Paige_3', 'PN_MIDTRO2_Leave', False );
	WaitForAbsoluteTime( i += 1.0 );
	ACTION_MoveTowardTag( 'Pawn_McConnel_3', 'PN_MIDTRO2_Leave', False );
	WaitForAbsoluteTime( i += 1.0 );
	ACTION_MoveTowardTag( 'Pawn_Campbell_3', 'PN_MIDTRO2_Leave', False );
	WaitForAbsoluteTime( i += 1.0 );
*/
	StopAbsoluteTime();

	ACTION_TriggerEVent('CSG_Squad_19');
	ACTION_OrderMove( 'Unit_DE_19', 'PN_GermanMovement_19' );

	ACTION_TriggerEvent('TSCheckpointSave_04');

	ACTION_ChangeController('Pawn_Paige_3', class'Mind');
	ACTION_ChangeController('Pawn_Mcconnel_3', class'Mind');
	ACTION_ChangeController('Pawn_Campbell_3', class'Mind');
	ACTION_ChangeController('Pawn_Johnson_3', class'Mind');

	ACTION_SetObjectiveStatus( 2, OI_Complete, 'ObjectiveList' );
	ACTION_SetObjectiveStatus( 3, OI_ACTIVE, 'ObjectiveList' );
	sleep( 4.0 );
	ACTION_DisplayObjective( 3, 'ObjectiveList', 4.0 );


	ACTION_OrderMove('MIDTRO2SQUADa','PN_StayAndFight',False);
	ACTION_OrderMove('MIDTRO2SQUAD','PN_StayAndFight',False);

	ACTION_TriggerEvent( 'WB_MG42' );
	ACTION_TriggerEvent( 'WB_Outro' );
	ACTION_UnBlockNavPoints('PN_ContinueOn'); //enable pathnodes
	ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_TriggerEVent('Trigger_Combat4_01');

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

	ACTION_OrderAssault( 'Unit_DE_13', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_14', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_15', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_16', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_17', 'Unit_Player' );
	ACTION_OrderAssault( 'Unit_DE_18', 'Unit_Player' );

	//=============================================================================

	//ACTION_MoveTowardTag( 'Pawn_Johnson_3', 'PN_MIDTRO2_Leave', False );
}

state NullState
{
	function OnTrigger() { GotoState( 'NullState' ); }
	Begin:
}
