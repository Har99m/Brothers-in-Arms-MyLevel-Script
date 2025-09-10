//=============================================================================
// TS_D10_0800_MidtroScene.
//=============================================================================
class TS_D10_0800_MidtroScene extends TriggeredScript
	placeable;

var float i;
var float duration;
var AnimPawn AP_Doyle_Alive , AP_Doyle_Explode , AP_Paige , AP_Char_Paige , AP_Hartsock ;
var Tank AP_Tank1;
var ActorLite MoveTank1_Outro_1 , PN_Midtro_Doyle , PN_Midtro_Paige ;
var Tank Panzer ;
var INT ShellShock_Loop , ShellShock_Exit ;
var Actor DragAttach;
var int DragSound, DragSound_End;


function ACTION_SetMotionBlurEffectMe( bool fDoClear, byte bBlurR, byte bBlurG, byte bBlurB, float BlurAlpha )
{
	local WargamePlayerController PC;
    local int playerindex;
    
	local color BlurColor;
	
	BlurColor.R = bBlurR;
	BlurColor.G = bBlurG;
	BlurColor.B = bBlurB;
	BlurColor.A = 255;
	
	PC = GetLocalPlayerController();
    playerindex = PC.Player.SplitIndex;
    
	Level.CameraEffectManager[playerindex].SetCameraEffect( CAM_MotionBlur );
	/// Flash the camera with white
	Level.CameraEffectManager[playerindex].CamMotionBlurEffect.bDoClear = fDoClear;
	Level.CameraEffectManager[playerindex].CamMotionBlurEffect.RenderColor = BlurColor;
	Level.CameraEffectManager[playerindex].CamMotionBlurEffect.BlurAlpha = BlurAlpha;
	Level.CameraEffectManager[playerindex].CamMotionBlurEffect.bFade = true;
}


state Triggered
	{
			function OnTrigger()
				{
					GotoState( 'Dialogue' );
				}
		Begin:

		Slog( "----------*****----------Midtro triggered----------*****----------" );


			//===== Spawn Doyle and Paige
				ACTION_TriggerEvent( 'CSU_Midtro_Spawners' );

				ACTION_DisableBattleDialogueForCharacter( 'AP_Campbell' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Friar' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Marsh' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_McConnel' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Paddock' );

					sleep( 0.2 );

			

			//===== Define Characters
				AP_Doyle_Alive = AnimPawn( GetPawn( 'AP_Char_Doyle' ));
				AP_Doyle_Explode = AnimPawn( GetPawn( 'AP_Midtro_Doyle_Explode' ));
				AP_Char_Paige = AnimPawn( GetPawn( 'AP_Char_Paige' ));
				AP_Paige = AnimPawn( GetPawn( 'AP_Midtro_Paige' ));
				AP_Hartsock = Animpawn( GetPawn( 'AP_MidtroHartsock_KnockDown' ));

				PN_Midtro_Doyle = GetNavigationPoint( 'PN_Midtro_Doyle' );
				PN_Midtro_Paige = GetNavigationPoint( 'PN_Midtro_Paige' );

				AP_Doyle_Explode.controller.bDemiGod = True;
				AP_Paige.controller.bDemiGod = True;
				AP_Hartsock.controller.bDemiGod = True;


				GetPawn('AP_Mcconnel').Controller.bDemiGod = True;
				GetPawn('AP_Friar').Controller.bDemiGod = True;
				GetPawn('AP_Campbell').Controller.bDemiGod = True;
				GetPawn('AP_Marsh').Controller.bDemiGod = True;
				GetPawn('AP_Paddock').Controller.bDemiGod = True;

				ACTION_SetAnimSetDirect( AP_Doyle_Alive, "a_cin_d10_The_All_Americans.a_cin_d10_The_All_Americans" );

				ACTION_ClearPawnIdleQueue( 'AP_Char_Doyle' );
				ACTION_AddAnimToPawnIdleQueue( 'AP_Char_Doyle', 'standing_idle_combat_4' );
				ACTION_AddAnimToPawnIdleQueue( 'AP_Char_Doyle', 'standing_idle_combat_2' );
				ACTION_PlayAnimFromPawnIdleQueue( 'AP_Char_Doyle', TRUE );

			//===== Call scriptedsequences to set up animations and unhide actors
				ACTION_TriggerEvent( 'Event_SS_Midtro_Setup' );

				ACTION_BlockNavPoint( 'PN_Midtro_Paige' );
				ACTION_BlockNavPoint( 'PN_Midtro_Doyle' );

			//====== Trigger script to control tank functions
				ACTION_TriggerEvent( 'TS_D10_0800_Midtro_Tank' );

					sleep( 0.4 );

			//===== Attach emitters to Explode-y Doyle parts
/*
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_01' ) , 'arm_left' );
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_02' ) , 'arm_right' );
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_03' ) , 'canteen' );

				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_05' ) , 'foot_left' );
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_06' ) , 'gas_mask' );
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_07' ) , 'head' );
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_08' ) , 'leg_right' );
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_09' ) , 'shovel' );
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_10' ) , 'stomach' );
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_11' ) , 'thigh_left' );
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_12' ) , 'torso_left' );
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_13' ) , 'waist_left' );
				AP_Doyle_Explode.AttachToBone( GetFirstActor( 'pfx_Doyle_Gibs_14' ) , 'waist_right' );
*/
				
		Slog( "----------*****----------Midtro waiting on second trigger----------*****----------" );
	}


//=============================================================================

state Dialogue
	{
			function OnTrigger()
				{
					// 
				}

		Begin:

				sleep(0.2);

				ACTION_LimitPlayerInput( GetLocalPlayerController(), true ); 
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );



			//===== Move up Doyle + Paige
				ACTION_MoveToward( AP_Char_Paige , PN_Midtro_Paige , FALSE , GetFirstActor( 'LT_Midtro_Paige_Run' ));
				ACTION_MoveToward( AP_Doyle_Alive , PN_Midtro_Doyle , FALSE , GetFirstActor( 'LT_Midtro_Doyle_Run' ));
				ACTION_SetDesiredSpeed( 'AP_Char_Paige' , 0.9 );

			//===== Start Dialogue
				i = 0.0;
				ACTION_TriggerEvent( 'Event_Midtro_Tank_Enter' );  
				ResetAbsoluteTime();
				StartAbsoluteTime();

				WaitForAbsoluteTime( i );

				ACTION_DestroyActor( 'GBXTrig_StartMidtro' );

			//===== Trigger event to move tank in
			//	ACTION_TriggerEvent( 'Event_Midtro_Tank_Enter' );  
			//	ACTION_TriggerEvent('Emitter_TankBlastThrough');

				ACTION_TriggerEvent( 'Event_SS_Midtro_Chat' );

			//-----/-----	When HARTSOCK reaches the orange flare, DOYLE signals to him from some nearby cover.
			//-----/-----	PAIGE is with DOYLE but at different cover.

				WaitForAbsoluteTime( i+=1);

			//-----/ 2.17 /-----DOYLE_B="Doyle: We really gotta stop meeting like this Red."


				ACTION_TriggerEvent('Emitter_TankBlastThrough');

				ACTION_PlayLipSyncSoundDirect( AP_Doyle_Alive , "D10_0800.DOYLE_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_B" ), 2.0 , 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 1.6 );


					//WaitForAbsoluteTime(i+=1);

				AP_Paige.AttachToBone( GetFirstActor( 'LT_Paige_Speak' ) , 'bottom_lip' );

			//-----/ 1.76 /-----PAIGE_A="Paige: I really don't think we should stay here!"
				ACTION_PlayLipSyncSoundDirect( AP_Char_Paige , "D10_0800.PAIGE_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("PAIGE_A" ), 1.7 , 1 , 1 , 1 , , TRUE );
				ACTION_PlayAnimDirect( AP_Doyle_Alive, 'Doyle_Reacts_to_tank', 0.2, 1.0, False );
					WaitForAbsoluteTime( i+= 1.4 );



			//-----/ 2.47 /-----DOYLE_C="Doyle: (screaming) Alright!  Well whose going left this time?"
				ACTION_PlayLipSyncSoundDirect( AP_Doyle_Alive , "D10_0800.DOYLE_C", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_C" ), 2.5 , 1 , 1 , 1 , , TRUE );
				ACTION_PlayAnimDirect( AP_Doyle_Alive, 'Doyle_Reacts_to_tank', 0.4, 0.7, False );
					WaitForAbsoluteTime( i+= 1.4 );
				//ACTION_PlayAnimDirect( AP_Doyle_Alive, 'Standing_react_to_bullets_2', 0.4, 1.0, False );
				ACTION_PlayAnimDirect( AP_Paige, 'Standing_react_to_bullets_3', 0.1, 1.0, False );
					WaitForAbsoluteTime( i+= 0.3 );
				GetLocalPlayerController().bGodMode = TRUE ;
				ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn() , TRUE );
				ACTION_TriggerEvent( 'Event_Midtro_Tank_Shoot_Doyle' );
				TS_D10_0800_Midtro_Tank(getFirstActor('TS_D10_0800_Midtro_Tank')).bTankFire = True;
				ShellShock_Loop = AP_Hartsock.PlayMusic( "Player.shellshock_loop" , 19.5 );
				ACTION_WaitForEvent( 'Event_Tank_Has_Shot' );

					WaitForAbsoluteTime( i+= 0.7 );

//=============================================================================

			//-----/-----		Three Panzers roll over the hill behind DOYLE and fire at him.  
			//-----/-----			DOYLE is blown apart immediatly.  
			//-----/-----			PAIGE is knocked back but alive, screaming after he gets back up.

		//========== START HEADRIDE

				ACTION_DestroyActor( 'AP_Char_Paige' );
				ACTION_DestroyActor( 'AP_Char_Doyle' );
				ACTION_TriggerEvent( 'Event_SS_Midtro_Paige_Fall' );
				AP_Hartsock.bHidden = FALSE ;
				AP_Paige.bHidden = FALSE ;
				ACTION_TriggerEvent('CSG_UNIT_DE_C4_02');
				ACTION_TriggerEvent( 'TS_D10_0800_Midtro_Ride' );
				ACTION_TriggerEvent( 'TS_D10_0800_Midtro_Random_Dialogue' );

				ACTION_UnBlockNavPoint( 'PN_Midtro_Paige' );
				ACTION_UnBlockNavPoint( 'PN_Midtro_Doyle' );
				ACTION_UnBlockNavpoints( 'PN_Midtro_Blocker' );




//

				ACTION_TriggerEvent( 'PFX_MIDTRO_WEP' );
				ACTION_TriggerEvent( 'pfx_Doyle_Explode' );
				ACTION_TriggerEvent( 'Emitter_DoyleFlash' );
				ACTION_TriggerEvent( 'PFX_POSTGIB' );
				ACTION_TriggerEvent( 'TS_ProjectorBlood');
//=============================================================================

				ACTION_TriggerEvent('TS_D10_0800_Midtro_PaigeBleed');

				ACTION_OrderMove( 'UNIT_DE_C4_02','PN_UNIT_DE_C4_02_01a');

				ACTION_OrderMove( 'Unit_US_Base' , 'PN_Midtro_Cover_Fire_Base' );
				ACTION_OrderMove( 'Unit_US_Ass' , 'PN_Midtro_Cover_Fire_Ass' );

				ACTION_OrderTarget( 'UNIT_US_Base' , 'UNIT_DE_C4_02' );
				ACTION_OrderTarget( 'UNIT_US_Ass' , 'UNIT_DE_C4_02' );

					WaitForAbsoluteTime( i+= 0.1 );

				ACTION_TriggerEvent( 'Scene_SlomoExplode');
				//ACTION_SetMotionBlurEffect( true, 0xb9, 0xb5, 0xb3, 120.0 );

					WaitForAbsoluteTime( i+= 1.3 );
							//-----/ 3.63 /-----PAIGE_B="Paige: Shit!  Shit!"
				ACTION_PlayLipSyncSoundDirect( AP_Paige , "D10_0800.PAIGE_B", 1.0, 1.0, 1.0,, AP_Paige.Rootbone );
				ACTION_DisplaySubtitleMessage2(S_Localize("PAIGE_B" ), 3.4 , 1 , 1 , 1 , , TRUE );


//ACTION_FadeOverlay( GetLocalPlayerController(), 1, 1.5 );
					WaitForAbsoluteTime( i+= 1.5 );
		//ACTION_RemoveCameraEffect( TRUE );
//ACTION_FadeOverlay( GetLocalPlayerController(), 2, 1.5 );

				


ACTION_TriggerEvent('PFX_MIDTRO_MOOD');
					WaitForAbsoluteTime( i+= 2.5 );
					WaitForAbsoluteTime( i+= 0.5 );
				AP_Hartsock.StopMusic( ShellShock_Loop , 0.1 );
				ACTION_PlaySoundDirect( AP_Hartsock , "Player.shellshock_exit" , 1.0 , 1.0 , 8192.0 );

					WaitForAbsoluteTime( i+= 1.0 );

				ACTION_TriggerEvent( 'PFX_MIDTRO_TRACER_HELL' );

					WaitForAbsoluteTime( i+= 8.0 );
//dragging sound stuff

				DragAttach = GetFirstActor( 'LT_Midtro_Hartsock_Drag' );
				AP_Hartsock.AttachToBone( DragAttach, 'Bip01 Head' );
				DragSound = DragAttach.PlayMusic("D10_0800_SOUNDS.DRAGGING_LOOP", 0.0, duration , true);
				//ACTION_PlaySoundDirect( DragAttach, "D10_0800_SOUNDS.DRAGGING_LOOP", 1.0, 1.0, 8192.0 );

					WaitForAbsoluteTime( i+= 4.5 );


				ACTION_TriggerEvent('PFX_MIDTRO_MOOD2');
					WaitForAbsoluteTime( i+= 18.0 );

				DragAttach.StopMusic( DragSound, 0.1 );
				ACTION_PlaySoundDirect( DragAttach, "D10_0800_SOUNDS.DRAGGING_LOOP_END", 1.0, 1.0, 8192.0 );
				
					WaitForAbsoluteTime( i+= 4.5 );



					WaitForAbsoluteTime( i+= 10.0 );

			//-----/ 2.25 /-----PAIGE_C1="Paige: I'm pretty fucked up here sarge."
				ACTION_PlayLipSyncSoundDirect( AP_Paige , "D10_0800.PAIGE_C", 1.0, 1.0, 1.0,, AP_Paige.Rootbone );
				ACTION_DisplaySubtitleMessage2(S_Localize("PAIGE_C1" ), 2.3 , 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 0.5 );
	ACTION_TriggerEvent( 'PFX_PAIGE_Mouth' );
	ACTION_TriggerEvent( 'PFX_POOL' );
					WaitForAbsoluteTime( i+= 1.9 );

				ACTION_TriggerEvent('Emitter_Flare');

			//-----/ 4.09 /-----PAIGE_C2="Paige: Used everything I had to get us here..."
				ACTION_DisplaySubtitleMessage2(S_Localize("PAIGE_C2" ), 4.1 , 1 , 1 , 1 , , TRUE );

			//==== Move up the player's squads
				ACTION_OrderMove( 'Unit_US_Base' , 'PN_Midtro_Base_Rally' );
				ACTION_OrderMove( 'Unit_US_Ass' , 'PN_Midtro_Ass_Rally' );
					WaitForAbsoluteTime( i+= 6.1 );

					StopAbsoluteTime();

				GetFirstActor( 'SM_Doyle_Patch' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Doyle_Cloth' ).bHidden = FALSE ;
				ACTION_WaitForEvent( 'Event_Explosion_Ride_Complete' );

				GetLocalPlayerPawn().bHidden = False;
				ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn() , FALSE );
				GetLocalPlayerController().bGodMode = FALSE ;
				


//=============================================================================

			//===== SAVE CHECKPOINT 03
			sleep( 1.0 );
			ACTION_TriggerEvent( 'TS_CheckPointSave_03' );

				GbxWaypointBeacon(GetFirstActor('Beacon_Doyle')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_END')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_88')).bEnabled = FALSE;
				
				ACTION_EnableBattleDialogueForCharacter( 'AP_Campbell' );
				ACTION_EnableBattleDialogueForCharacter( 'AP_Friar' );
				ACTION_EnableBattleDialogueForCharacter( 'AP_Marsh' );
				ACTION_EnableBattleDialogueForCharacter( 'AP_McConnel' );
				ACTION_EnableBattleDialogueForCharacter( 'AP_Paddock' );
				ACTION_EnableBattleDialogue();

					sleep( 0.5 );

				ACTION_TriggerEvent( 'D10_0800_EndCombat' );
				//GetLocalPlayerController().PrevWeapon();
					sleep( 3.0 );

			//===== Start final combat
				ACTION_TriggerEvent( 'Event_Tank_Ready_For_Combat' );


				//ACTION_TriggerEvent( 'D10_0800_EndCombat' );
				ACTION_TriggerEvent( 'TS_D10_0800_dCombat3Script' );
				ACTION_AttachUnitToSuperUnit('UNIT_US_ASS', 'Unit_Player');
				ACTION_AttachUnitToSuperUnit('UNIT_US_BASE', 'Unit_Player');

			//===== Set up new objective

				//GbxWaypointBeacon(GetFirstActor('Beacon_Doyle')).bEnabled = FALSE;
				//GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_END')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_TANKS')).bEnabled = TRUE;
		
				/*
				ACTION_SetObjectiveStatus( 1 , OI_Complete , 'ObjectiveList' );
 				ACTION_SetObjectiveStatus( 2 , OI_Active , 'ObjectiveList' );
				ACTION_DisplayObjective( 2 , 'ObjectiveList' , 3.0 );
				*/
				ACTION_TriggerEvent( 'TS_D10_0800_NewBombs' );

				ACTION_DisplayObjectiveHint(S_Localize("HINT_C"), 4.0 );
					sleep(4.0);
				ACTION_DisplayObjectiveHint( S_Localize("HINT_A"), 4 );
				ACTION_TriggerEvent('TS_D10_0800_PanzerfaustHint');
				ACTION_TriggerEvent('gbxWaypointBeacon_Panzerfaust_Stash');
				ACTION_EnableBattleDialogue();

				GetPawn('AP_Mcconnel').Controller.bDemiGod = False;
				GetPawn('AP_Friar').Controller.bDemiGod = False;
				GetPawn('AP_Campbell').Controller.bDemiGod = False;
				GetPawn('AP_Marsh').Controller.bDemiGod = False;
				GetPawn('AP_Paddock').Controller.bDemiGod = False;

	}
