//=============================================================================
// TS_D00_1630_Midtro_Scene_B.
//=============================================================================
class TS_D00_1630_Midtro_Scene_B extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Mac, AP_German_Run_01, AP_German_Run_02;
var AnimPawn AP_Baker, AP_Corrion, AP_Desola;
var WarGamePawn WGP_MG42;
var ActorLite Dest_01, PN_German_Dest_01, PN_German_Dest_02, PN_Mac_MoveHere_01;
var int MG42_FIRE ;

state triggered
	{
		Begin:

			//===== Spawn Mac
				ACTION_TriggerEvent( 'CSU_MidtroCharacters_B' );
					sleep( 0.2 );

			//===== Move Player's squads to cover.
				ACTION_OrderMove( 'Unit_US_Base', 'PN_Baker_Squad_01' );
				ACTION_OrderMove( 'Unit_US_Ass', 'PN_Player_Squad_01' );

			//===== Define Characters
				AP_Baker = Animpawn( GetPawn( 'Midtro_Baker' ));
				AP_Corrion = AnimPawn( GetPawn( 'Midtro_Corrion' ));
				AP_Desola = AnimPawn( GetPawn( 'Midtro_Desola' ));
				AP_Mac = AnimPawn( GetPawn( 'Midtro_Mac' ));

				ACTION_StripAllWeapons( AP_Mac );

				WGP_MG42 = WarGamePawn( GetPawn( 'AP_Macs_MG42' ));

				Dest_01 = GetNavigationPoint( 'PN_S6_Mac' );

				AP_Baker.Controller.bGodMode = TRUE ;
				AP_Corrion.Controller.bGodMode = TRUE ;
				AP_Desola.Controller.bGodMode = TRUE ;
				AP_Mac.controller.bGodMode = TRUE ;

				ACTION_SetRepelBullets( 'Midtro_Baker' , TRUE );
				ACTION_SetRepelBullets( 'Midtro_Corrion' , TRUE );
				ACTION_SetRepelBullets( 'Midtro_Desola' , TRUE );
				ACTION_SetRepelBullets( 'Midtro_Mac' , TRUE );

				ACTION_WaitForEvent( 'Event_SS_Mac_Resume_Firing' );
				ACTION_TriggerEvent( 'Event_SS_Midtro_Mac_Start' );

		//===== INITIALIZE SCENE

				i = 1.0;

				ResetAbsoluteTime();
				StartAbsoluteTime();

				WaitForAbsoluteTime( i );

					WaitForAbsoluteTime( i += 0.3 );
				
				AP_German_Run_01 = AnimPawn( GetPawn( 'AP_German_Run_01' ));				
				AP_German_Run_02 = AnimPawn( GetPawn( 'AP_German_Run_02' ));
				PN_German_Dest_01 = GetNavigationPoint( 'PN_C4_DE03_Move_C' );
				PN_German_Dest_02 = GetNavigationPoint( 'BossPathNode29' );
				PN_Mac_MoveHere_01 = GetNavigationPoint( 'PN_Mac_Squad_01' );

				ACTION_MoveToward( AP_German_Run_01 , PN_German_Dest_01 , FALSE );
				ACTION_MoveToward( AP_German_Run_02 , PN_German_Dest_02 , FALSE );

				ACTION_PlayLipSyncSoundDirect( AP_Mac , "W_MG42A.FIRELOOP" , 1.0, 1.0, 1.0 );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_01' );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_03' );
					WaitForAbsoluteTime( i += 0.1 );
				ACTION_PlayLipSyncSoundDirect( AP_Mac , "W_MG42A.FIRELOOPEND" , 1.0, 1.0, 1.0 );
					WaitForAbsoluteTime( i += 0.4 );
				ACTION_PlayLipSyncSoundDirect( AP_Mac , "W_MG42A.FIRELOOP" , 1.0, 1.0, 1.0 );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_04' );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_03' );
					WaitForAbsoluteTime( i += 0.5 );
				ACTION_PlayLipSyncSoundDirect( AP_Mac , "W_MG42A.FIRELOOPEND" , 1.0, 1.0, 1.0 );
					WaitForAbsoluteTime( i += 0.3 );
				ACTION_PlayLipSyncSoundDirect( AP_Mac , "W_MG42A.FIRELOOP" , 1.0, 1.0, 1.0 );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_06' );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_07' );
					WaitForAbsoluteTime( i += 0.5 );
				ACTION_PlayLipSyncSoundDirect( AP_Mac , "W_MG42A.FIRELOOPEND" , 1.0, 1.0, 1.0 );
					WaitForAbsoluteTime( i += 0.3 );
				ACTION_PlayLipSyncSoundDirect( AP_Mac , "W_MG42A.FIRELOOP" , 1.0, 1.0, 1.0 );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_09' );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_07' );
					WaitForAbsoluteTime( i += 0.4 );

			//===== Start Halftrack
				ACTION_TriggerEvent( 'TS_D00_1630_BossHalfTrack' );

			//===== Kill off Germans who are running away
				ACTION_PlayLipSyncSoundDirect( AP_Mac , "W_MG42A.FIRELOOPEND" , 1.0, 1.0, 1.0 );
					WaitForAbsoluteTime( i += 0.2 );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_10' );
				ACTION_PlayLipSyncSoundDirect( AP_Mac , "W_MG42A.FIRELOOP" , 1.0, 1.0, 1.0 );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_08' );
					WaitForAbsoluteTime( i += 0.1 );
				ACTION_GivePawnWeapon( 'Midtro_Mac' , "gbxInventory.WeapUSThompson" );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_07' );
				ACTION_KillPawn( 'AP_German_Run_02' , vect( 0.001, -0.0025, -0.001 ), 'bip01 head' );
					WaitForAbsoluteTime( i += 0.3 );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_09' );
				ACTION_PlayLipSyncSoundDirect( AP_Mac , "W_MG42A.FIRELOOPEND" , 1.0, 1.0, 1.0 );
				ACTION_TriggerEvent( 'gbxET_Field_Squib_06' );
					WaitForAbsoluteTime( i += 0.5 );
				ACTION_ClearPawnFireAtTargetDirect( WGP_MG42 );

			//===== BEGIN DIALOGUE
				ACTION_SetLookAtTargetDirect( AP_Mac , GetLocalPlayerPawn() , TRUE );
				AP_Mac.bDoHeadTurn = TRUE ;

				StopAbsoluteTime();

				ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn() , TRUE );

					i = 1.0;

					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i );

				ACTION_PlayLipSyncSoundDirect( AP_Mac , "D00_1630.MAC_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_A1" ) , 2.50 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 2.50 /-----MAC_A1="Mac: Looks like everyone in town got flushed out into that field."
					WaitForAbsoluteTime( i += 2.75 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_A2" ) , 1.4 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.28 /-----MAC_A2="Mac: Just keep moving."
					WaitForAbsoluteTime( i += 1.6 );
				ACTION_ClearLookAtTargetDirect( AP_Mac );

					StopAbsoluteTime();

					ACTION_DestroyActor( 'gbxTrig_Midtro_Lock_Mac' );
					ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn() , FALSE );

			//===== Move Mac out
				ACTION_WaitForEvent( 'Event_SS_Midtro_Mac_Exit' );
				AP_Mac.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'Midtro_Mac' , TRUE );
				ACTION_DetachStaticMesh( AP_Mac , StaticMesh's_npc_weapon_us.us_thompson', 'rifle_hold' );

				ACTION_OrderMove( 'Unit_US_Mac_Midtro' , 'PN_Baker_Squad_01' );

				ACTION_DestroyActor( 'gbxET_Field_Squib_01' );
				ACTION_DestroyActor( 'gbxET_Field_Squib_02' );
				ACTION_DestroyActor( 'gbxET_Field_Squib_03' );
				ACTION_DestroyActor( 'gbxET_Field_Squib_04' );
				ACTION_DestroyActor( 'gbxET_Field_Squib_05' );
				ACTION_DestroyActor( 'gbxET_Field_Squib_06' );
				ACTION_DestroyActor( 'gbxET_Field_Squib_07' );
				ACTION_DestroyActor( 'gbxET_Field_Squib_08' );
				ACTION_DestroyActor( 'gbxET_Field_Squib_09' );
				ACTION_DestroyActor( 'gbxET_Field_Squib_10' );

					sleep( 2.0 );
				ACTION_OrderTarget( 'Unit_US_Mac_Midtro' , 'Unit_DE_C4_03' );

			//===== Wait for player to pass mid-field and destroy Mac
				ACTION_WaitForEvent( 'Event_SS_Destroy_Mac' );
				ACTION_DestroyActor( 'Midtro_Mac' );

		ScriptEnd:
	}
