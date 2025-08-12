//=============================================================================
// TS_D00_0600_MidtroScene_A.
//=============================================================================
class TS_D00_0600_MidtroScene_A extends TriggeredScript
	placeable;

var float i ;
var AnimPawn AP_Doyle , AP_Paddock , AP_Friar ;
var ActorLite Dest_01 ;
var Actor SM_Doyle_Garand ;

state triggered
	{
		Begin:
			//===== Destroy Doyle at start of map
				ACTION_DestroyActor( 'Doyle' );

				ACTION_BlockNavPoint( 'PN_Midtro_Doyle' );
				ACTION_BlockNavPoint( 'PN_Church_Entrance' );

				ACTION_DisableBattleDialogueForCharacter( 'Friar' );
				ACTION_DisableBattleDialogueForCharacter( 'Paddock' );

			//===== Spawn Doyle
				ACTION_TriggerEvent( 'CSU_MidtroCharacters' );
				ACTION_DisableBattleDialogueForCharacter( 'Midtro_Doyle' );

			//===== Turn ON blocker at Doyle position
				ACTION_TriggerEvent( 'BVT_Church_Doyle' );

					sleep( 0.2 );

			//===== Define characters
				AP_Doyle = AnimPawn( GetPawn( 'Midtro_Doyle' ));
				AP_Doyle.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'Midtro_Doyle' , TRUE );
				AP_Paddock = AnimPawn( GetPawn( 'Paddock' ));
				AP_Friar = AnimPawn( GetPawn( 'Friar' ));
				SM_Doyle_Garand = GetFirstActor( 'SM_Doyle_Garand' );

				Dest_01 = GetNavigationPoint( 'PN_Midtro_Doyle' );

				if( AP_Friar.Health > 0 && vSize( AP_Friar.location - GetFirstActor( 'LT_Church_Checker' ).location ) > 2048 )
					{
						ACTION_TeleportPawnToActor( AP_Friar , 'LT_Friar_Teleport_Midtro' );
					}

				if( AP_Paddock.Health > 0 && vSize( AP_Paddock.location - GetFirstActor( 'LT_Church_Checker' ).location ) > 2048 )
					{
						ACTION_TeleportPawnToActor( AP_Paddock , 'LT_Paddock_Teleport_Midtro' );
					}

					sleep( 0.5 );

				ACTION_OrderMove( 'Unit_US_Ass' , 'PN_S7_Ass_Setup' );

		//===== DISPLAY OBJECTIVE - 0 - Complete
 				ACTION_SetObjectiveStatus( 0 , OI_Complete , 'ObjectiveList' );
				ACTION_DisplayObjective( 0 , 'ObjectiveList' , 3.0 );

		//====== Move Doyle in to doorway
				ACTION_TriggerEvent( 'Event_SS_Midtro_Doyle_Setup' );

		//===== Attach un-hidden M1 to Doyle and set it's location
				ACTION_StripAllWeapons( AP_Doyle );
				SM_Doyle_Garand.bHidden = FALSE ;
				AP_Doyle.AttachToBone( SM_Doyle_Garand , 'Bip01 Spine2' );
				SM_Doyle_Garand.SetRelativeRotation( rot(0.0, 0.0, 0.0) );
				SM_Doyle_Garand.SetRelativeLocation( vect(-30.5, 6.0, -19.5) );
//	Original	SM_Doyle_Garand.SetRelativeLocation( vect(-23.5, 8.0, -19.5) );

			//===== Initiate

					i = 0.0;

					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i );
					WaitForAbsoluteTime( i += 0.7 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_Distant' , "EXPLOSIONS.artillery_distant" , 1.0 , 1.0 , 40000.0 );
					WaitForAbsoluteTime( i += 0.6 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_Distant' , "EXPLOSIONS.artillery_distant" , 1.0 , 1.0 , 40000.0 );
					WaitForAbsoluteTime( i += 0.9 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_Distant' , "EXPLOSIONS.artillery_distant" , 1.0 , 1.0 , 40000.0 );
					WaitForAbsoluteTime( i += 0.3 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_Distant' , "EXPLOSIONS.artillery_distant" , 1.0 , 1.0 , 40000.0 );
					WaitForAbsoluteTime( i += 0.4 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_Distant' , "EXPLOSIONS.artillery_distant" , 1.0 , 1.0 , 40000.0 );

		//========== START DIALOGUE
				ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0600.DOYLE_F", 1.0, 1.0, 1.0,, AP_Doyle.RootBone );
				ACTION_DisplaySubTitleMessage2( S_Localize( "DOYLE_F" ) , 6.4 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 6.33 /----- DOYLE_LINE_I="Doyle: Those are Navy guns. Our boys must be landing soon. Brace yourself Red, and pray those sailors can aim."

					WaitForAbsoluteTime( i += 6.3 );

			//===== Start Navy explosions
					WaitForAbsoluteTime( i += 0.9 );

				ACTION_TriggerEvent( 'E_Smoke01' );
				ACTION_TriggerEvent( 'E_Smoke02' );

				ACTION_PlaySound( 'LT_Midtro_Explosion_01' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_01_A' );
					WaitForAbsoluteTime( i += 0.4 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_01' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_01_B' );
					WaitForAbsoluteTime( i += 0.3 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_01' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'pfx_Church_Ceiling_01' );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_01_C' );
					WaitForAbsoluteTime( i += 1.0 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_02' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_02_A' );
					WaitForAbsoluteTime( i += 0.4 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_02' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_02_B' );
					WaitForAbsoluteTime( i += 0.2 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_02' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_02_C' );
					WaitForAbsoluteTime( i += 0.7 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_03' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_03_A' );
					WaitForAbsoluteTime( i += 0.3 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_03' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_03_B' );
					WaitForAbsoluteTime( i += 0.5 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_03' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_03_C' );
					WaitForAbsoluteTime( i += 1.2 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_04' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_04_A' );

				ACTION_TriggerEvent( 'BVT_Wire_01' );				//===== Turn off blocking volume togglable
				ACTION_DestroyActor( 'SM_Wire01' );					//===== KIll wire roadblock
				GetFirstActor( 'SM_Wire02' ).bHidden = False;		//===== Unhide wire roadblock
				ACTION_UnBlockNavPoint( 'PN_C3_Wave_01_01_B' );	//===== Unblock
				ACTION_UnBlockNavPoint( 'PN_Blocked' );				//===== Unblock

					WaitForAbsoluteTime( i += 0.6 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_04' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_04_B' );
					WaitForAbsoluteTime( i += 0.7 );
				ACTION_PlaySound( 'LT_Midtro_Explosion_04' , "EXPLOSIONS.artillery_impact" , 1.0 , 1.0 , 20000.0 );
				ACTION_TriggerEvent( 'gbxET_Church_Bomb_04_C' );
					WaitForAbsoluteTime( i += 0.5 );

// Roughly 7.75 of explosion animations

				ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0600.DOYLE_G", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "DOYLE_G" ) , 4.0 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 3.98 /----- DOYLE_LINE_J="Doyle: That shelling is going to push a hell of a lot of Krauts this way. I'll stick with you Corporal."

					WaitForAbsoluteTime( i += 4.7 );

					StopAbsoluteTime();

			//===== Destroy midtro actors
				ACTION_DestroyActor( 'GBXTrig_Midtro_Main' );
				ACTION_GivePawnWeapon( 'Midtro_Doyle' , "gbxInventory.WeapUSM1Carbine" );
				ACTION_UnBlockNavPoint( 'PN_Midtro_Doyle' );
				ACTION_UnBlockNavPoint( 'PN_Church_Entrance' );
				ACTION_TriggerEvent( 'Event_SS_Midtro_Doyle_Exit' );

			//===== Assign Doyle to the player's unit
				AP_Doyle.bDontFrustumCull = FALSE ;
				ACTION_RunDirect( AP_Doyle );
				AP_Doyle.Controller.bGodMode = FALSE ;
				ACTION_SetRepelBullets( 'Midtro_Doyle' , FALSE );

					sleep( 0.4 );
				ACTION_AssignToUnit( 'Midtro_Doyle' , 'Unit_US_Ass' );
				ACTION_AttachUnitToSuperUnit( 'Unit_US_Ass' , 'Unit_Player' );

				ACTION_EnableBattleDialogueForCharacter( 'Friar' );
				ACTION_EnableBattleDialogueForCharacter( 'Paddock' );
				ACTION_EnableBattleDialogueForCharacter( 'Midtro_Doyle' );

		//===== CHECKPOINT 03
				ACTION_OrderFallout( 'Unit_US_Ass' );
				ACTION_TriggerEvent( 'TSCheckPointSave_03' );
					sleep( 2.4 );
				ACTION_TriggerEvent( 'pfx_Church_Ceiling_01' );
				ACTION_DestroyActor( 'pfx_Church_Ceiling_01' );
				ACTION_OrderMove( 'Unit_US_Ass' , 'PN_S7_Ass_Setup' );
				ACTION_OrderMove( 'Unit_US_Ass' , 'PN_S7_Ass_Setup' , TRUE );
					sleep( 1.3 );

		//===== DISPLAY OBJECTIVE - 1 - Active
 				ACTION_SetObjectiveStatus( 1 , OI_Active , 'ObjectiveList' );
				ACTION_DisplayObjective( 1 , 'ObjectiveList' , 3.0 );

		//===== START COMBAT 3
				ACTION_TriggerEvent( 'TSCombat_C3' );
					sleep( 0.6 );
				ACTION_TriggerEvent( 'GBXMTSI_C3_01' );

					sleep( 3.4 );

				ACTION_DisplayObjectiveHint( S_Localize( "HINT_3" ) , 4.0 );
					//-----/-----HINT_3="Use the Church walls to defend against the German counter-attack."

					sleep( 4.0 );

				ACTION_DisplayObjectiveHint( S_Localize( "HINT_5" ) , 4.0 );
					//-----/-----HINT_5="Man the MG42 to defend the church."

		ScriptEnd:
	}
