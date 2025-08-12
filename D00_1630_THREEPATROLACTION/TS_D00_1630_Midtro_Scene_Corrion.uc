//=============================================================================
// TS_D00_1630_Midtro_Scene_Corrion.
//=============================================================================
class TS_D00_1630_Midtro_Scene_Corrion extends TriggeredScript
	placeable;

var float i;
var Actor SM_Corrion_Thompson ;
var AnimPawn AP_Corrion , AP_Allen ;

state Triggered
	{
		Begin:
				//===== Define variables
					AP_Corrion = AnimPawn( GetPawn( 'Midtro_Corrion' ));
					AP_Allen = AnimPawn( GetPawn( 'Allen' ));
					SM_Corrion_Thompson = GetFirstActor( 'SM_Corrion_Thompson' );
					WarGamePawn( GetPawn( 'Midtro_Corrion' )).bHasStartedMountAnim = TRUE ;

					AP_Corrion.PawnTeam = TEAM_None;

				//===== Wait for event
					ACTION_WaitForEvent( 'Event_Midtro_Corrion_Found' );
					ACTION_TriggerEvent( 'Event_Midtro_Corrion_Stand' );
					ACTION_KillPawn( 'Pawn_DE_C3_03_a' );
					ACTION_KillPawn( 'Pawn_DE_C3_03_b' );
					ACTION_StripAllWeapons( AP_Corrion );
						sleep( 7.0 );
	// 5.11 remain
						i = 1.0;

						ResetAbsoluteTime();
						StartAbsoluteTime();

						WaitForAbsoluteTime( i );

				//===== Player has found Corrion, continue dialogue

					ACTION_PlayLipSyncSoundDirect( AP_Corrion , "D00_1630.CORRION_B", 1.0, 1.0, 1.0 , , 'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize( "CORRION_B1" ) , 3.0 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 3.75 /-----CORRION_B1="Corrion: I was checking out the house when a truck pulled up. Shot a couple and ran."
						WaitForAbsoluteTime( i += 2.5 );
					AP_Corrion.AttachToBone( SM_Corrion_Thompson , 'rifle_hold' );
						WaitForAbsoluteTime( i += 1.5 );
					ACTION_DisplaySubTitleMessage2( S_Localize( "CORRION_B2" ) , 3.0 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 2.00 /-----CORRION_B2="Corrion: I just jumped in this shit and covered up."
						WaitForAbsoluteTime( i += 3.5 );
					AP_Corrion.bDoHeadTurn = TRUE ;
					ACTION_SetLookAtTargetDirect( AP_Corrion , GetLocalPlayerPawn() , TRUE );
					ACTION_GivePawnWeapon( 'Midtro_Corrion' , "gbxInventory.WeapUSThompsonMud" );
					ACTION_DisplaySubTitleMessage2( S_Localize( "CORRION_B3" ) , 2.0 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.86 /-----CORRION_B3="Corrion: Thought I was dead for sure."
						WaitForAbsoluteTime( i += 2.3 );

			if( AP_Allen.Health > 0 && vSize( AP_Allen.location - AP_Corrion.location ) < 1024 )
				{
					//===== If Allen is alive and near Corrion
						ACTION_PlayLipSyncSoundDirect( AP_Allen , "D00_1630.ALLEN_G", 1.0, 1.0, 1.0 );
						ACTION_DisplaySubTitleMessage2( S_Localize( "ALLEN_G" ) , 3.0 , 1 , 1 , 1 , TRUE , TRUE );
							//-----/ 1.79 /-----ALLEN_G="Allen: Well, you certainly look like shit."
							WaitForAbsoluteTime( i += 3.5 );
				}

					ACTION_PlayLipSyncSoundDirect( AP_Corrion , "D00_1630.CORRION_C", 1.0, 1.0, 1.0 , , 'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize( "CORRION_C1" ) , 3.0 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 3.00 /-----CORRION_C1="Corrion: I should get back to Baker,  Help you guys push from the other side."
						WaitForAbsoluteTime( i += 3.5 );
					ACTION_DisplaySubTitleMessage2( S_Localize( "CORRION_C2" ) , 1.5 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.00 /-----CORRION_C2="Corrion: Thanks Red."
						WaitForAbsoluteTime( i += 2.0 );

						StopAbsoluteTime();

					ACTION_ClearLookAtTargetDirect( AP_Corrion );
					ACTION_DestroyActor( 'gbxTrig_Midtro_Lock_Corrion' );
					ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
					ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE );

					AP_Corrion.PawnTeam = TEAM_US ;
					AP_Corrion.Controller.bGodMode = TRUE ;
					ACTION_SetRepelBullets( 'Midtro_Corrion' , TRUE );

						sleep( 4.0 );
					ACTION_OrderMove( 'Unit_US_Midtro_A' , 'PN_Midtro_Corrion' );
					ACTION_OrderTarget( 'Unit_US_Midtro_A' , 'Unit_DE_C2_01' );
					ACTION_EnableBattleDialogueForCharacter( 'Midtro_Corrion' );

						sleep( 1.0 );
					WarGamePawn( GetPawn( 'Midtro_Corrion' )).bHasStartedMountAnim = FALSE ;
					ACTION_DestroyActor( SM_Corrion_Thompson.Tag );
						sleep( 3.0 );

					ACTION_OrderMove( 'Unit_US_Midtro_A' , 'PN_Midtro_Corrion' );



		ScriptEnd:
	}
