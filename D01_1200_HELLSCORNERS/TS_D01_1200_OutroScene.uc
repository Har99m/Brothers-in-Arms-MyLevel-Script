//=============================================================================
// 	TS_D01_1200_OutroScene.
//	Triggered by:	GBXTrig_Outro
//	Use:			Contains the outro scene for Hell's Corner
//=============================================================================
class TS_D01_1200_OutroScene extends TriggeredScript
	placeable;

var float i;

var AnimPawn AP_Johnson_Outro, AP_Paige_Outro, AP_McConnel_Outro, AP_Campbell_Outro, AP_Hartsock_Outro;
var AnimPawn AP_German1, AP_German2, AP_German3, AP_GermanLeader, AP_GermanKneel1, AP_GermanKneel2, AP_GermanKneel3;

var ActorLite PN_Paige_01 , PN_Paige_02 , PN_Johnson_01 , PN_Campbell_01 , PN_McConnel_01 , PN_Hartsock_01 ;
var ActorLite PN_German_Lead_01 , PN_German_01 , PN_German_02 , PN_German_03 , PN_German_Exit_Lead , PN_German_Exit_01 , PN_German_Exit_02 , PN_German_Exit_03 ;

var Actor K981,K982,K983;

function DestroyAllGrenades()
{
	local gbxGrenade A;

	foreach AllActors( class'gbxGrenade', A )
		A.Destroy();
}

state Triggered
	{
			function OnTrigger()
				{

				}

		Begin:

			ACTION_ForcePlayerDismountTurret();

	ACTION_StopRain();



			ACTION_KILLPAWN('PAWN_HACK');
			//===== Hide HUD and player's weapons
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_LimitPlayerInput( GetLocalPlayerController() , TRUE );
				ACTION_HideHUD( GetLocalPlayerController() , TRUE );

		GetLocalPlayerController().bGodMode = TRUE;
		ACTION_EnablePlayerHeavyTrauma( FALSE );
		DestroyAllGrenades();

			//===== Spawn German and US outro characters
				ACTION_TriggerEvent( 'CSU_AmericanOutro' );
				ACTION_TriggerEvent( 'CSU_GermanOutro' );

					sleep( 0.3 );

			//===== Define
				AP_Johnson_Outro = AnimPawn( GetPawn( 'Johnson_Outro' ) );
				AP_Paige_Outro = AnimPawn( GetPawn( 'Paige_Outro' ) );
				AP_McConnel_Outro = AnimPawn( GetPawn( 'McConnel_Outro' ) );
				AP_Campbell_Outro = AnimPawn( GetPawn( 'Campbell_Outro' ) );
				AP_Hartsock_Outro = AnimPawn( GetPawn( 'Hartsock_Outro' ) );

				AP_Johnson_Outro.bDoHeadTurn = True;
				AP_Paige_Outro.bDoHeadTurn = True;

				AP_McConnel_Outro.bDoHeadTurn = True;

				AP_Campbell_Outro.bDoHeadTurn = True;

				AP_Hartsock_Outro.bDoHeadTurn = True;


				AP_German1 = AnimPawn( GetPawn( 'German_Outro_01' ) );
				AP_German2 = AnimPawn( GetPawn( 'German_Outro_02' ) );
				AP_German3 = AnimPawn( GetPawn( 'German_Outro_03' ) );
				AP_GermanKneel1 = AnimPawn( GetPawn( 'German_Kneeling1' ) );
				AP_GermanKneel2 = AnimPawn( GetPawn( 'German_Kneeling2' ) );
				AP_GermanKneel3 = AnimPawn( GetPawn( 'German_Kneeling3' ) );

				AP_German1.bHidden = False;
				AP_German2.bHidden = False;
				AP_German3.bHidden = False;
				AP_GermanKneel1.bHidden = False;
				AP_GermanKneel2.bHidden = False;
				AP_GermanKneel3.bHidden = False;

				K981 = GetFirstActor('SM_K98_1');
				K982 = GetFirstActor('SM_K98_2');
				K983 = GetFirstActor('SM_K98_3');

				AP_German1.AttachToBone( K981, 'Bip01 L Hand' );
				K981.SetRelativeRotation( rot(-15000.0, 0.0, 0.0) );
				K981.SetRelativeLocation( vect(6.0, -4.0, 0.0) );  // +forward/back, +down/up, +right/left
	

				AP_German2.AttachToBone( K982, 'Bip01 L Hand' );
				K982.SetRelativeRotation( rot(-15000.0, 0.0, 0.0) );
				K982.SetRelativeLocation( vect(6.0, -4.0, 0.0) );  // +forward/back, +down/up, +right/left

				AP_German3.AttachToBone( K983, 'Bip01 L Hand' );
				K983.SetRelativeRotation( rot(-15000.0, 0.0, 0.0) );
				K983.SetRelativeLocation( vect(6.0, -4.0, 0.0) );  // +forward/back, +down/up, +right/left
/*
				ACTION_GivePlayerWeapon( AP_German1 ,"gbxInventory.weapDEK98_" );
				ACTION_GivePlayerWeapon( AP_German2 ,"gbxInventory.weapDEK98_" );
				ACTION_GivePlayerWeapon( AP_German3 ,"gbxInventory.weapDEK98_" );

				ACTION_DetachWeapon( AP_German1, 'Bip01 L Hand' );
				ACTION_ReAttachWeapon( AP_German1, 'Bip01 R Hand' );
				ACTION_ReAttachWeapon( AP_German2, 'Bip01 R Hand' );
				ACTION_ReAttachWeapon( AP_German3, 'Bip01 R Hand' );
*/
		
				PN_Paige_01 = GetNavigationPoint( 'PN_Outro_Paige_01' );
				PN_Paige_02 = GetNavigationPoint( 'PN_Outro_Paige_02' );
				PN_Johnson_01 = GetNavigationPoint( 'PN_Outro_Johnson_01' );
				PN_Campbell_01 = GetNavigationPoint( 'PN_Outro_Campbell_01' );
				PN_McConnel_01 = GetNavigationPoint( 'PN_Outro_McConnel_01' );
				PN_Hartsock_01 = GetNavigationPoint( 'PN_Outro_Hartsock_01' );

				PN_German_Lead_01 = GetNavigationPoint( 'PN_Outro_German_Leader_01' );
				PN_German_01 = GetNavigationPoint( 'PN_Outro_German_01' );
				PN_German_02 = GetNavigationPoint( 'PN_Outro_German_02' );
				PN_German_03 = GetNavigationPoint( 'PN_Outro_German_03' );
				PN_German_Exit_Lead = GetNavigationPoint( 'PN_Outro_Exit_Leader' );
				PN_German_Exit_01 = GetNavigationPoint( 'PN_Outro_Exit_01' );
				PN_German_Exit_02 = GetNavigationPoint( 'PN_Outro_Exit_02' );
				PN_German_Exit_03 = GetNavigationPoint( 'PN_Outro_Exit_03' );

					sleep( 0.2 );

			//===== Animation sets for USA
				ACTION_SetAnimSetDirect( AP_Johnson_Outro, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
				ACTION_SetAnimSetDirect( AP_Paige_Outro, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
				ACTION_SetAnimSetDirect( AP_McConnel_Outro, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
				ACTION_SetAnimSetDirect( AP_Campbell_Outro, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
				ACTION_SetAnimSetDirect( AP_Hartsock_Outro, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );

				ACTION_ClearPawnIdleQueue( 'Campbell_Outro' );
				ACTION_AddAnimToPawnIdleQueue( 'Campbell_Outro', 'standing_idle_relaxed_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Campbell_Outro', FALSE ); 

				ACTION_ClearPawnIdleQueue( 'Johnson_Outro' );
				//ACTION_AddAnimToPawnIdleQueue( 'Johnson_Outro', 'standing_idle_combat_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Johnson_Outro', FALSE );

				ACTION_ClearPawnIdleQueue( 'Paige_Outro' );
				ACTION_AddAnimToPawnIdleQueue( 'Paige_Outro', 'Paige_idles_watching_germans_pass' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Paige_Outro', FALSE );

				ACTION_ClearPawnIdleQueue( 'McConnel_Outro' );
				ACTION_AddAnimToPawnIdleQueue( 'McConnel_Outro', 'standing_idle_aimed_sighted_2' );
				ACTION_AddAnimToPawnIdleQueue( 'McConnel_Outro', 'standing_idle_aimed_sighted_3' );
				ACTION_PlayAnimFromPawnIdleQueue( 'McConnel_Outro', FALSE );

				ACTION_ClearPawnIdleQueue( 'Hartsock_Outro' );
				ACTION_AddAnimToPawnIdleQueue( 'Hartsock_Outro', 'standing_idle_relaxed_3' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Hartsock_Outro', FALSE );

			//===== Animation sets for Germans
				ACTION_SetAnimSetDirect( AP_German1 , "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
				ACTION_SetAnimSetDirect( AP_German2 , "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
				ACTION_SetAnimSetDirect( AP_German3 , "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );

				ACTION_ClearPawnIdleQueue( 'German_Outro_01' );
				ACTION_AddAnimToPawnIdleQueue( 'German_Outro_01', 'german_surrendered_idle_1' );
				ACTION_AddAnimToPawnIdleQueue( 'German_Outro_01', 'german_surrendered_idle_2' );
				ACTION_PlayAnimFromPawnIdleQueue( 'German_Outro_01', FALSE ); 

				ACTION_ClearPawnIdleQueue( 'German_Outro_02' );
				ACTION_AddAnimToPawnIdleQueue( 'German_Outro_02', 'german_surrendered_idle_2' );
				ACTION_AddAnimToPawnIdleQueue( 'German_Outro_02', 'german_surrendered_idle_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'German_Outro_02', FALSE ); 

				ACTION_ClearPawnIdleQueue( 'German_Outro_03' );
				ACTION_AddAnimToPawnIdleQueue( 'German_Outro_03', 'german_surrendered_idle_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'German_Outro_03', FALSE ); 

				ACTION_ClearPawnIdleQueue( 'german_kneeling1' );
				ACTION_AddAnimToPawnIdleQueue( 'german_kneeling1', 'german_prisoner_kneeling' );
				ACTION_PlayAnimFromPawnIdleQueue( 'german_kneeling1', FALSE ); 

				ACTION_ClearPawnIdleQueue( 'german_kneeling2' );
				ACTION_AddAnimToPawnIdleQueue( 'german_kneeling2', 'german_prisoner_kneeling' );
				ACTION_PlayAnimFromPawnIdleQueue( 'german_kneeling2', FALSE ); 

				ACTION_ClearPawnIdleQueue( 'german_kneeling3' );
				ACTION_AddAnimToPawnIdleQueue( 'german_kneeling3', 'german_prisoner_kneeling' );
				ACTION_PlayAnimFromPawnIdleQueue( 'german_kneeling3', FALSE ); 

			//===== Make Germans walk and both teams converge
				ACTION_Walk( 'German_Outro_Leader' );
				ACTION_Walk( 'German_Outro_01' );
				ACTION_Walk( 'German_Outro_02' );
				ACTION_Walk( 'German_Outro_03' );

				ACTION_Walk( 'Johnson_Outro' );
				ACTION_Walk( 'Paige_Outro' );
				ACTION_Walk( 'McConnel_Outro' );
				ACTION_Walk( 'Campbell_Outro' );
				ACTION_Walk( 'Hartsock_Outro' );
	
		ACTION_ReAttachWeapon( AP_German1, 'rifle_hold_lefthand' );
		ACTION_ReAttachWeapon( AP_German2, 'rifle_hold_lefthand' );
		ACTION_ReAttachWeapon( AP_German3, 'rifle_hold_lefthand' );

		ACTION_DisableBattledialogue();

		ACTION_SetLookAtTarget( 'Johnson_Outro', AP_German1, False );

			//===== Start outro scene

ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
				ACTION_TriggerEvent( 'SCENE_OUTRO_A' );

	sleep(0.2);
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 1.5 );

		AP_Paige_Outro.Controller.bRotateToDesired = False;

			//===== INITIALIZE
				i = 0.0;

				ResetAbsoluteTime();
				StartAbsoluteTime();
/*
		ACTION_PlayAnimWithQueue( 'German_Outro_01', 'german_surrendered_walk_2', 0.0, 1.0, False, 0,  );
		
	WaitForAbsolutetime( i += 1.0 );

		ACTION_PlayAnim( 'German_Outro_01', 'german_surrendered_walk_2', 0.0, 0.8, False, 30,  ,2);

	WaitForAbsolutetime( i += 0.516 );
*/

//	WaitForAbsolutetime( i += 1.5 );

		ACTION_PlayAnimWithQueue( 'German_Outro_01', 'german_surrendered_give_gun', 0.3, 1.0, False, 0, 1 );

	WaitForAbsolutetime( i += 0.3 );

		ACTION_SetLookAtTarget( 'Johnson_Outro', getFirstActor('LT_G1_Head'), TRUE );
		
		ACTION_PlayAnimWithQueue( 'Johnson_Outro', 'Johnson_accepts_gun', 0.8, 1.0, False, 0, 1 );	


	WaitforAbsoluteTime( i += 2.2 );

	AP_Johnson_Outro.AttachToBone( K981, 'Bip01 L Hand' );
	K981.SetRelativeRotation( rot(-15000.0, 0.0, 0.0) );
	K981.SetRelativeLocation( vect(6.0, -4.0, 0.0) );  // +forward/back, +down/up, +right/left

	WaitforAbsoluteTime( i += 0.4 );

	WaitForAbsoluteTime( i += 1.0 );

	ACTION_SetHidden( 'SM_K98_1', True );

	WaitForAbsoluteTime( i += 1.0 );

		ACTION_PlayAnimWithQueue( 'Paige_Outro', 'Paige_gets_in_germans_face_1', 0.2, 1.0, False, 0, 2 );

	WaitForAbsoluteTime( i += 1.0 );
	ACTION_TriggerEvent('SCENE_EYEMOVER');
		ACTION_PlayAnimWithQueue( 'German_Outro_01', 'german_surrendered_walk_1', 0.2, 1.0, False, 0, 2 );

		ACTION_PlayLipSyncSound( 'PAIGE_OUTRO', "D01_1200.PAIGE_B", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "PAIGE_A" ), 3.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayAnimWithQueue( 'Johnson_Outro', 'Standing_Idle_Combat_2', 0.8, 1.0, False, 0, 1 );
	WaitForAbsoluteTime( i += 0.4 );
	


		ACTION_PlayAnimWithQueue( 'German_Outro_02', 'german_surrendered_walk_2', 0.2, 1.0, False, 0, 2 );

	WaitForAbsolutetime( i += 0.5 );

		ACTION_TeleportToActor( 'German_Outro_01', 'LT_Outro_Teleport_A' );
		AP_German1.Controller.Focus = GetfirstActor('LT_Outro_Teleport_look');
		

	ACTION_TriggerEvent('SCENE_OUTRO_C');

	ACTION_SetHidden( 'SM_K98_2', True );
	ACTION_SetHidden( 'SM_K98_3', True );

		ACTION_PlayAnimWithQueue( 'German_Outro_01', 'german_surrendered_walk_1', 0.0, 0.7, False, 0, 2 );
		ACTION_PlayAnimDirect( AP_Campbell_Outro, 'Johnson_intro_dialogue', 0.5, 0.8, False, , , );
	WaitForAbsoluteTime( i += 2.0 );
		ACTION_PlayLipSyncSound( 'CAMPBELL_OUTRO', "D01_1200.CAMPBELL_C", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "CAMPBELL_C" ), 3.0, 1, 1, 1, TRUE, TRUE );

	WaitForAbsoluteTime( i += 1.0 );
		
		ACTION_DestroyActor('German_Outro_01');

		ACTION_TeleportToActor( 'German_Outro_02', 'LT_Outro_Teleport_A' );
		AP_German2.Controller.Focus = GetfirstActor('LT_Outro_Teleport_look');

		ACTION_PlayAnimWithQueue( 'German_Outro_02', 'german_surrendered_walk_1', 0.0, 0.75, False, 0, 2 );



		ACTION_PlayLipSyncSound( 'PAIGE_OUTRO', "D01_1200.PAIGE_C", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "PAIGE_B" ), 4.0, 1, 1, 1, TRUE, TRUE );


		ACTION_PlayAnimWithQueue( 'Paige_Outro', 'Paige_gets_in_germans_face_2', 0.4, 1.0, False, 0, 2 );


	WaitForAbsoluteTime( i += 2.0 );
		ACTION_PlayAnimDirect( AP_German3, 'german_surrendered_walk_1', 0.0, 0.5, False, 0, , 2 );

	WaitForAbsoluteTime( i += 0.8 );


	WaitForAbsoluteTime( i += 0.7 );

		ACTION_DestroyActor('German_Outro_02');

		ACTION_TeleportToActor( 'German_Outro_03', 'LT_Outro_Teleport_B' );
		AP_German3.Controller.Focus = GetfirstActor('LT_Outro_Teleport_look');



	waitForAbsoluteTime( i += 0.2 );
		ACTION_PlayLipSyncSound( 'PAIGE_OUTRO', "D01_1200.PAIGE_D", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "PAIGE_C" ), 3.0, 1, 1, 1, TRUE, TRUE );

		ACTION_ClearPawnIdleQueue( 'Paige_Outro' );
		ACTION_AddAnimToPawnIdleQueue( 'Paige_Outro', 'Paige_gets_in_germans_face_idle' );
		ACTION_PlayAnimFromPawnIdleQueue( 'Paige_Outro', FALSE );

		ACTION_PlayAnimDirect( AP_Paige_Outro, 'Paige_gets_in_germans_face_3', 0.5, 1.0, False, 0, ,1 );

		ACTION_SetLookAtTarget( 'Paige_Outro', getFirstActor('LT_G1_Head'), TRUE );
///
		ACTION_SetLookAtTarget( 'German_outro_03', AP_Paige_Outro, True );	



		ACTION_PlayLipSyncSound( 'CAMPBELL_OUTRO', "D01_1200.CAMPBELL_D", 1.0, 1.0, 1.0 );

	WaitForAbsoluteTime( i += 0.5 );
	WaitForAbsoluteTime( i += 0.5 );





				ACTION_DisplaySubTitleMessage2( S_Localize( "CAMPBELL_D" ), 3.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 1.0 );

		ACTION_PlayLipSyncSound( 'PAIGE_OUTRO', "D01_1200.PAIGE_E", 1.0, 1.0, 1.0 );

		//ACTION_PlayAnimWithQueue( 'Campbell_Outro', 'Standing_Walk', 0.4, 1.0, False, 0, 2 );

	ACTION_PlayAnimDirect( AP_Campbell_Outro, 'Standing_Idle_Relaxed_1', 0.7, 1.0, True, , , );

	WaitForAbsoluteTime( i += 0.3 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "PAIGE_D" ), 3.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayAnimDirect( AP_German3, 'german_surrendered_walk_1', 1.0, 0.3, False, 0, , 2 );

	WaitForAbsoluteTime( i += 0.3 );

	ACTION_PlayAnimDirect( AP_German3, 'german_surrendered_walk_1', 0.5, 0.1, False, 0, , 1 );

	ACTION_SetLookAtTarget( 'German_Outro_03', AP_Paige_Outro, True );

	WaitForAbsoluteTime( i += 0.2 );

	ACTION_PlayAnimDirect( AP_German3, 'german_surrendered_idle_1', 0.5, 1.0, True, 0, ,  );

		ACTION_PlayLipSyncSound( 'CAMPBELL_OUTRO', "D01_1200.CAMPBELL_E", 1.0, 1.0, 1.0 );




		ACTION_PlayAnimDirect( AP_Campbell_Outro, 'Campbell_pulls_back_Paige', 0.5, 1.0, False, 0, ,  );
		ACTION_DetachWeapon( GetPawn('Campbell_outro'), 'rifle_hold' );
		ACTION_ReAttachWeapon(  GetPawn('Campbell_outro'), 'rifle_hold_lefthand' );
	WaitForAbsoluteTime( i += 0.6 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "CAMPBELL_E" ), 3.0, 1, 1, 1, TRUE, TRUE );

	WaitForAbsoluteTime( i += 1.3 );



		ACTION_PlayAnimDirect( AP_Paige_Outro, 'Paige_gets_in_germans_face_pulled_back', 0.5, 1.0, False, 0, ,1 );

	WaitForAbsoluteTime( i += 0.4 );

	ACTION_TriggerEvent('CSU_AmericanOutroH');

		ACTION_DestroyActor('McConnel_Outro');

	WaitForAbsolutetime( i += 5.2 );

	ACTION_TriggerEvent('SCENE_OUTRO_B');

	ACTION_PlayAnimWithQueue( 'German_Outro_03', 'german_surrendered_walk_1', 0.0, 0.6, False, 0, 2 );

	ACTION_PlayAnim( 'Johnson_Outro', 'Johnson_intro_dialogue', 0.4, 0.7, False, 26, , 0 );

	WaitforAbsolutetime( i += 1.0 );

		ACTION_PlayLipSyncSound( 'JOHNSON_OUTRO', "D01_1200.JOHNSON_C", 1.0, 1.0, 1.0 );
		ACTION_DisplaySubTitleMessage2( S_Localize( "JOHNSON_C" ), 3.0, 1, 1, 1, TRUE, TRUE );

	WaitForAbsolutetime( i += 2.0 );
	ACTION_SetLookAtTarget( 'Johnson_Outro', AP_Hartsock_outro, TRUE );
	WaitForAbsolutetime( i += 1.0 );
	ACTION_SetLookAtTarget( 'Hartsock_Outro', getFirstActor('LT_G1_Head'), TRUE );
	ACTION_FadeOverlay(getLocalPlayerController(), 1, 2.0);

	WaitForAbsolutetime( i += 2.0 );


				StopAbsoluteTime();

			//===== End map
				ACTION_TriggerEvent('TriggeredScriptMapComplete');

	}

//============================================================

state NullState
	{
		Begin:
			//====== Nothing
		ScriptEnd:
	}
