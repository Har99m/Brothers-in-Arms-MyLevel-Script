//=============================================================================
// TS_D000230_Training.
//=============================================================================
class TS_D000230_Training extends TriggeredScript
	placeable;

var int s;
var vector MoveToLocation;
var AnimPawn AP_Hartsock, AP_Doyle , AP_Training_Scarecrow ;
var AnimPawn AP_German_02 , AP_German_03 , AP_German_04 ;
var ActorLite PN_Gate_Entrance , PN_Training_Ammo ;
var Actor LT_Training_Fence , SM_Training_Command_Fence , LT_Doyle_Training_Cover ;
var bool bDoyleDone , bTargetIssued , bAssaultIssued , bFallInIssued ;
var WarGamePawn WGP_Doyle ;
var int Doyle_Random_Dialogue ;
var float i , DoyleDistance ;
var Unit Unit_US_Assault , Unit_Player , Unit_Scarecrow ;
var Unit GermanUnit[2];
var PlayerController LPC;
var WargamePlayerController WPC;
var ESuppressionLevel SupLevel; 
var TS_Objectives OBJ_Ref ;

function Signal( Actor Sender , int command , Actor ActorData , int IntegerData , float FloatData )
	{
  		if ( command == 1 )  			// was target command issued?
   			{
      			bTargetIssued = true;
   			}

   		else if ( command == 2 )  		// was assault command issued?
   			{
      			bAssaultIssued = true;
  			}

   		else if ( command == 3 )		// was fall-in command issued?
   			{
      			bFallInIssued = true;
   			}
	}

state Triggered
	{

		Begin:

			if ( !ACTION_IsTrainingDisabled() )
				{
					ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				}

				ACTION_BlockNavPoint( 'PN_Training_Doyle_Cover' );
				ACTION_BlockNavPoints( 'PN_Training_Block_Entrance' );
				ACTION_BlockActionKeys( KEY_ACTION_SA_VIEW );
				ACTION_UnblockActionKeys( KEY_ACTION_RELOAD + KEY_ACTION_USE );

					sleep( 0.2 );

				AP_Doyle =  AnimPawn( Getpawn( 'AP_Doyle' ));
				AP_Training_Scarecrow = AnimPawn( GetPawn( 'AP_Training_Scarecrow' ));

				PN_Gate_Entrance = GetNavigationPoint( 'PN_Gate_Entrance' );
				PN_Training_Ammo = GetNavigationPoint( 'PN_Training_Ammo' );

				LT_Doyle_Training_Cover = GetFirstActor( 'LT_Doyle_Training_Cover' );

				OBJ_Ref = TS_Objectives( GetFirstActor( 'TS_Objectives' ));

				LT_Training_Fence = GetFirstActor( 'LT_Training_Fence' );
				SM_Training_Command_Fence = GetFirstActor( 'SM_Training_Command_Fence' );

				AP_Doyle.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'AP_Doyle' , TRUE );
				WGP_Doyle = WarGamePawn( GetPawn( 'AP_Doyle' ));

				AP_Doyle.SightRadius = 1024.0 ;

			//===== Starts up the TS_Objectives script.
				ACTION_TriggerEvent( 'TS_Objectives' );
					sleep( 0.8 );

			//===== Turn on jump / crouch triggers
				ACTION_TriggerEvent( 'GBXTrig_Hint_Hide_Jump' );
				ACTION_TriggerEvent( 'GBXTrig_Hint_Hide_Crouch' );

				ACTION_OrderFallIn( 'Unit_US_Assault' );

				if ( !ACTION_IsTrainingDisabled() )
					{
								sleep( 2.0 );

							//-----/-----TRAINING_START_A="The arrow %icon_compass_arrow% on your compass directs you toward your next objective."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_START_A" ), 3.5 );

							sleep( 4.0 );

							//-----/-----TRAINING_START_A2="The circle around your compass will enclose as you approach your objective."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_START_A2" ), 3.5 );

							sleep( 4.0 );
					}

				ACTION_UnLockPlayerMovement( GetLocalPlayerPawn() );

			//===== Waits for the trigger located before the fence.
				ACTION_WaitForEvent('JumpHint');

				if ( !ACTION_IsTrainingDisabled() )
					{
							//-----/-----TRAINING_START_B="You can jump over the broken fence ahead by %action_jump% %icon_jump%."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_START_B" ), 0.0 );
					}

			//===== Spawn in Parachutes
				ACTION_TriggerEvent( 'Emitter_Chutes_Targets' );		

							ACTION_WaitForEvent( 'JumpDone' );
						ACTION_DisplayTrainingMessage( "", 0.0 );

							sleep( 0.2 );

			//===== Waits for the trigger located before the fallen tree.
				ACTION_WaitForEvent('CrouchHint');
					sleep( 0.1 );
				ACTION_TriggerEvent( 'TS_D000230_Doyle_Crouch_Tree' );

			//===== Trigger script for fake Germans firing at parachutes
				ACTION_TriggerEvent( 'TS_D000230_German_Runners_Two' );

				if ( !ACTION_IsTrainingDisabled() )
					{
						//-----/----- TRAINING_START_C="%action_crouch% %icon_crouch% to crouch under the fallen tree, %action_crouch% %icon_crouch% again to stand."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_START_C" ), 0.0 );
					}

								ACTION_WaitForEvent( 'CrouchDone' );
							ACTION_DisplayTrainingMessage( "" , 0.0 );

							sleep( 0.2 );

				ACTION_TriggerEvent( 'TS_D000230_Doyle_Crouch_Tree' );

			//===== Trigger German run script
				ACTION_TriggerEvent( 'TS_D000230_German_Runners' );

			//===== Waits for the event caused by Doyle getting near the fence
				ACTION_WaitForEvent( 'Event_Weapon_Found' );
				ACTION_UnblockActionKeys( KEY_ACTION_RELOAD + KEY_ACTION_USE );

			//===== If DOYLE didn't make it over the fence teleport him closer
				if( vSize( AP_Doyle.location - GetLocalPlayerPawn().location ) > 3072 )
					{
						ACTION_TeleportPawnToActor( AP_Doyle , 'LT_Doyle_Teleport_Training' );
					}

				AP_Doyle.bDontFrustumCull = FALSE ;
				ACTION_BlockNavPoints( 'PN_Tree_Crouch_Entrance' );
				ACTION_BlockNavPoints( 'PN_Doyle_Crouch_Pre' );
				getFirstActor( 'TS_D000230_Doyle_Crouch_Tree' ).goToState( 'Exit_Zone' );

			if ( !ACTION_IsTrainingDisabled() )
				{

		//========== CHANGE DOYLE TO SCRIPTED AND MOVE TO GATE
				ACTION_OrderFallout( 'Unit_US_Assault' );
				ACTION_ChangeController( 'AP_Doyle' , class'ScriptedController' );
					sleep( 0.2 );
				ACTION_SetAnimSetDirect( AP_Doyle , "a_hold_rifle.a_hold_rifle" );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle' );
				ACTION_RunDirect( AP_Doyle );
				AP_Doyle.Controller.Focus = None ;
				ACTION_ClearPawnIdleQueue( 'AP_Doyle' );
				WGP_Doyle.eWeaponAimedState = WAS_CombatRelaxed ;

				ACTION_UnBlockNavPoints( 'PN_Training_Block_Entrance' );
				ACTION_UnBlockNavPoint( 'PN_Training_Doyle_Cover' );

			//===== Move Doyle to player and wait
					sleep( 0.2 );
				ACTION_MoveToward( AP_Doyle , PN_Gate_Entrance , FALSE , GetLocalPlayerPawn() );
				While( !PawnIsAtDestination( AP_Doyle , PN_Gate_Entrance ))
					{
						sleep( 1.0 );
					}

			//===== Calculate a location that's 200 units directly in front of the player then move Doyle to the player
				ACTION_WalkDirect( AP_Doyle );
					sleep( 0.6 );
				MoveToLocation = GetLocalPlayerPawn().location - vector( AP_Doyle.Rotation ) * 125.0f;
				ACTION_WaitForPawnMoveTo( AP_Doyle , MoveToLocation );
				AP_Doyle.Controller.Focus = GetLocalPlayerPawn() ;
				ACTION_WaitForPawnRotateToward( AP_Doyle );
					sleep( 0.6 );
				ACTION_RunDirect( AP_Doyle );

		//========== Doyle is at player, rotate and have him talk about ammo

						AP_Doyle.Controller.Focus = GetLocalPlayerPawn();
						ACTION_WaitForPawnRotateToward( AP_Doyle );
						ACTION_PlayAnimDirect( AP_Doyle , 'standing_idle_combat_3' , 0.8 , 1.0 , TRUE , , , );
						ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0230.DOYLE_HH", 1.0, 1.0, 1.0 );
						ACTION_DisplaySubTitleMessage2( S_Localize( "DOYLE_HH" ), 2.3 , 1 , 1 , 1 , TRUE , TRUE );
							//-----/ 2.25 /-----DOYLE_HH="Doyle: Looks like you need a clip. Here, take one of mine."

							sleep( 2.7 );
				
							//-----/----- TRAINING_START_D="Walk up to a soldier and %action_use% %icon_use% to retrieve ammo."
						ACTION_DisplayTrainingMessage( S_Localize("TRAINING_START_D"), 0.0);
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_USE ); 
						ACTION_DisplayTrainingMessage( "" , 0.0 );

						ACTION_DetachWeapon( AP_Doyle , '' );
						ACTION_AttachStaticMesh( AP_Doyle , StaticMesh'S_npc_weapon_us.us_m1_carbine' , 'rifle_hold_lefthand' );
						ACTION_PlayAnimDirect( AP_Doyle, 'give_ammo_combat_2', 0.5 , 1.0 );	
							sleep( 3.2 );
						AP_Doyle.AttachToBone( GetFirstActor( 'SM_M1_Clip' ) , 'Bip01 R Finger12' );
							sleep( 1.2 );
						ACTION_DestroyActor( 'SM_M1_Clip' );
						ACTION_SetPawnWeaponAmmo( GetLocalPlayerPawn() , class'gbxInventory.WeapUSM1Carbine' , 75 );
							ACTION_WaitForAnimEnd( AP_Doyle , 0 );
						ACTION_DetachStaticMesh( AP_Doyle , StaticMesh'S_npc_weapon_us.us_m1_carbine' , 'rifle_hold_lefthand' );
						ACTION_ReattachWeapon( AP_Doyle , 'rifle_hold' );
						ACTION_PlayAnimDirect( AP_Doyle, 'standing_idle_combat_3', 0.4 , 1.0 , TRUE , , , 2 );	
						AP_Doyle.Controller.Focus = NONE ;
						ACTION_ClearPawnIdleQueue( 'AP_Doyle' );
						ACTION_FlushAnimQueue( 'AP_Doyle' );

							sleep( 0.6 );

						ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

						ACTION_UnblockActionKeys( KEY_ACTION_RELOAD + KEY_ACTION_USE );
							//-----/-----TRAINING_START_E="%action_reload% %icon_reload% to reload your weapon."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_START_E" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_RELOAD ); 
						getLocalPlayerPawn().Weapon.ForceReload();

							sleep( 3.0 );

							//-----/-----TRAINING_I="In the field there is a scarecrow dressed in a German uniform.  
							//-----/-----Imagine that the scarecrow is a live enemy and use it as a practice target.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_I" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

						ACTION_UnBlockActionKeys( KEY_ACTION_ZOOM );
							//-----/-----TRAINING_START_F="%action_zoom% %icon_zoom% to toggle looking down the sights of your weapon."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_START_F" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_ZOOM ); 
						ACTION_BlockActionKeys( KEY_ACTION_ZOOM + KEY_ACTION_RELOAD );

						ACTION_UnblockActionKeys( KEY_ACTION_FIRE );
							//-----/-----TRAINING_START_G="%action_fire% %icon_fire% to fire your weapon."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_START_G" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_FIRE ); 
						ACTION_DisplayTrainingMessage( "", 0.0 );
							sleep( 1.0 );

						ACTION_BlockActionKeys( KEY_ACTION_RELOAD );
						GetLocalPlayerController().bDontReloadAfterFire = TRUE ;
						ACTION_UnBlockActionKeys( KEY_ACTION_ZOOM );
							//-----/-----TRAINING_START_H="%action_zoom% %icon_zoom% to exit the sights of your weapon."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_START_H" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_ZOOM ); 						
						GetLocalPlayerController().StopZoom();
						GetLocalPlayerController().ChangeView(0);

						GetLocalPlayerController().bDontReloadAfterFire = FALSE ;
						ACTION_UnBlockActionKeys( KEY_ACTION_RELOAD );

							sleep( 0.5 );

						ACTION_UnBlockActionKeys( KEY_ACTION_RELOAD );
						ACTION_DisplayTrainingMessage( "", 0.0 );

						ACTION_FlushAnimQueue( 'AP_Doyle' );

						ACTION_ChangeController( 'AP_Doyle' , class'Mind' );
						ACTION_EnableBattleDialogueForCharacter( 'AP_Doyle' );
						ACTION_EnableBattleDialogue();

						ACTION_BlockNavPoints( 'PN_Training_Block_Exit' );

						ACTION_HideHUD( WPC, FALSE );
						ACTION_LimitPlayerInput( WPC, FALSE );

					//===== Clear any displayed training message
						ACTION_DisplayTrainingMessage( "" , 0.0 );

						ACTION_BlockActionKeys( -1 );
						ACTION_UnblockActionKeys( KEY_ACTION_LOOK + KEY_ACTION_SHOW_MENU + KEY_ACTION_JUMP + KEY_ACTION_RELOAD + KEY_ACTION_USE + KEY_ACTION_ZOOM );	
							sleep( 0.8 );

						Unit_Scarecrow = GetUnit( 'Unit_Scarecrow' );
						Unit_US_Assault = GetUnit( 'Unit_US_Assault' );
						Unit_Player = GetUnit( 'Unit_Player' );
						AP_Doyle = AnimPawn( GetPawn( 'AP_Doyle' ));
						AP_Training_Scarecrow = AnimPawn( GetPawn( 'AP_Training_Scarecrow' ));

						ACTION_EnableBattleDialogue();
						ACTION_EnableBattleDialogueForCharacter( 'AP_Doyle' );

						AP_Doyle.sightradius=0;
						Unit_Player.AddSubUnit( Unit_US_Assault );
						ACTION_DisplayTrainingMessage( "", 0.0 );
							sleep(0.5);

					//===== Check for blocked action keys
						ACTION_BlockActionKeys( KEY_ACTION_FALL_IN );
						ACTION_BlockActionKeys( KEY_ACTION_TEAMSELECT );
						ACTION_UnblockActionKeys( KEY_ACTION_FIRE + KEY_ACTION_RELOAD );

						Unit_US_Assault.AddNotifyOrderTarget(self);
						Unit_US_Assault.AddNotifyOrderAssault(self);
						Unit_US_Assault.AddNotifyOrderFallIn(self);
	
						GetLocalPlayerController().bTargetOrderEnabled = false;
						GetLocalPlayerController().bAssaultOrderEnabled = false;
						GetLocalPlayerController().bMoveOrderEnabled = false;

						ACTION_SetUnitHiddenOnCompass( 'Unit_US_Assault' , FALSE );

							//-----/-----TRAINING_A="Cpl. Doyle is now part of your squad.  You are the squad leader, so Doyle will obey your commands!	
							//-----/-----He is part of your Fire Team %icon_team_fire%.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_A" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

							//-----/-----TRAINING_B="Fire teams %icon_team_fire% are equipped with rifles, light machineguns, and grenades.  
							//-----/-----This team is ideal for suppressing the enemy.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_B" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

							//-----/-----TRAINING_C="Notice, as you look around that the Fire Team icon %icon_team_fire% on the outer
							//-----/-----ring of your compass adjusts to show Doyle’s position.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_C" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

							//-----/-----TRAINING_D="As squad leader, you can command Doyle to move to a new location, fire on a target, 
							//-----/-----assault (charge) an enemy's position, or follow you around.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_D" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

							//-----/-----TRAINING_E="%+action_order% %icon_order% to bring up the command ring.  Then %action_look% %icon_look% to point 
							//-----/-----the command ring into the nearby field and %-action_order% %icon_order% to issue a 'move' order."
						ACTION_TriggerEvent( 'PFX_Cover' );
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_E" ), 0.0 );
						ACTION_UnblockActionKeys( KEY_ACTION_ORDER );
						ACTION_RunDirect( AP_Doyle );
						GetLocalPlayerController().bMoveOrderEnabled = true; 
						ACTION_WaitForEvent( 'Event_Doyle_At_Cover' );
					//===== Doyle reached cover , remove order ability and disable position particle
						GetLocalPlayerController().bMoveOrderEnabled = false;
							sleep( 2.0 );
						ACTION_TriggerEvent( 'PFX_Cover' );

							//-----/-----TRAINING_F="Doyle will move to the general area where you placed the command ring.
							//-----/-----%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_F" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

							//-----/-----TRAINING_G="Doyle is a trained soldier.  He is smart enough to find nearby cover, 
							//-----/-----especially if there are enemies around.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_G" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
						//HARTSOCK MOVES TO COVER BEHIND CART AND BARREL, AUTOMATICALLY (SCRIPTED)
	
							//-----/-----Clear Training Messages
						ACTION_DisplayTrainingMessage( "", 0.0 );
						ACTION_OrderMove( 'Unit_US_Assault' , 'PN_Training_Doyle_Cover' );
						Mind( AP_Doyle.Controller).NavigationController.ManeuverToActor( GetNavigationPoint( 'PN_Training_Doyle_Cover' ) , false );
						DoyleDistance = VSize( AP_Doyle.Location - GetNavigationPointLocation( 'PN_Training_Doyle_Cover' ));

					while( VSize( AP_Doyle.Location - LT_Doyle_Training_Cover.Location ) > 96 )
						{
								sleep( 0.5 );
						}

							//-----/-----TRAINING_H="You can command soldiers in your squad to intensify their fire on a 
							//-----/-----specific target by using the 'fire' order.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_H" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

							//-----/-----TRAINING_J="To issue a 'fire' order, %+action_order% %icon_order% and aim at the scarecrow.  
							//-----/-----When the command ring changes its shape to a crosshair, %-action_order% %icon_order% to issue the fire order."
						GetLocalPlayerController().bHideSuppressionIcons = FALSE ;
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_J" ), 0.0 );
						Pawn( GetFirstActor( 'AP_Training_Scarecrow' )).PawnTeam = TEAM_German;
						ACTION_UnblockActionKeys( KEY_ACTION_ORDER );
						GetLocalPlayerController().bTargetOrderEnabled = true;
						Unit_US_Assault.AddNotifyOrderTarget( self );
					while( !bTargetIssued )
						{
							sleep( 0.5 );
						}

							//-----/-----TRAINING_K="Until he is given a new order, Doyle will concentrate his fire as intensely as he can to suppress 
							//-----/-----(pin down) the enemy target.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_K" ), 0.0 );
						AP_Doyle.SightRadius = AP_Doyle.default.SightRadius;
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

							if (!ACTION_SuppressionIconsDisabled())
								{

										//-----/-----TRAINING_L="Notice that a flag with the Fire Team icon %icon_fire_team_flag% is now attached to the target’s suppression icon.  
										//-----/-----This flag tells you that the Fire Team has focused fire on that target.%newline%%newline%%icon_continue% to Continue."
									ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_L" ), 0.0 );
									ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

										//-----/-----TRAINING_M="The Suppression indicator over the enemy target is used to show the target's suppression level.  
										//-----/-----Red %icon_suppression_red% means unsuppressed, and gray %icon_suppression_gray% means suppressed.
										//-----/-----%newline%%newline%%icon_continue% to Continue."
									ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_M" ), 0.0 );
									ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

										//-----/-----TRAINING_N="Enemies are either suppressed or unsuppressed.  
										//-----/-----There is no partial suppression or heavy suppression.%newline%%newline%%icon_continue% to Continue."
									ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_N" ), 0.0 );
									ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
								}

							//-----/-----TRAINING_O="When an enemy is suppressed they will spend more time behind cover and less time firing.  
							//-----/-----Their shots will also become less frequent and less accurate.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_O" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

							//-----/-----TRAINING_P="Suppress the enemy by firing at it."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_P" ), 0.0 );
					GermanUnit[ 0 ] = Unit( GetFirstActor( 'Unit_Scarecrow' ));
					SupLevel = GermanUnit[0].MyUnitController.GetSuppressionLevel();
					s = 0 ;
					While( SupLevel == SL_UNSUPPRESSED )
						{
								s ++ ;
								SupLevel = GermanUnit[0].MyUnitController.GetSuppressionLevel();
								sleep( 1.0 );

							if( SupLevel != SL_UNSUPPRESSED )
								break;

							if( s == 4 )
								{
									ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_P" ), 3.5 );
								}

							if( s == 8 )
								{
									if (!ACTION_SuppressionIconsDisabled())
										{
												//-----/-----HINT_D="Remember, the enemy is suppressed when it has a gray suppression icon."
											ACTION_DisplayObjectiveHint( S_Localize( "HINT_D" ), 3.5 );
											s = 0 ;
										}
								}
						}

							ACTION_DisplayTrainingMessage( "" , 0.0 );
							ACTION_DisplayObjectiveHint( "" , 0.0 );

								sleep( 1.0 );

							//-----/-----TRAINING_Q="You can also issue an 'assault' order.  
							//-----/-----An 'assault' order will command your men to charge the target’s position.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_Q" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

							//-----/-----TRAINING_R="To issue an 'assault' order, %+action_order% %icon_order% and aim at a target.  
							//-----/-----When the command ring changes to a crosshair, %action_fire% %icon_fire%."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_R" ), 0.0 );
						ACTION_UnblockActionKeys( KEY_ACTION_FIRE );
						GetLocalPlayerController().bAssaultOrderEnabled = true; 
					while(!bAssaultIssued)
						{
							sleep( 0.5 );
						}

							//-----/-----TRAINING_S="Doyle will now quickly rush the enemy’s position and engage them in close combat.  
							//-----/-----He may also throw grenades as he charges at the target.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_S" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

							//-----/-----TRAINING_T="Assaulting is a risky maneuver. 
							//-----/-----It is only recommended when the enemy is suppressed or very outnumbered.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_T" ), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

					//===== Wait for Hartsock to finish Assaulting and then clear message
						ACTION_DisplayTrainingMessage( "" , 0.0 );
					while ( AP_Training_Scarecrow.Health > 0 )
						{
							sleep( 0.2 );
						}

							//-----/-----TRAINING_U="%+action_team_select% %icon_team_select% or %action_fall_in% %icon_fall_in% to order Doyle to fall in.
							//-----/-----When you order your team to fall in, they will stay close to you.  They will do what you do and go where you go."
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_U" ), 0.0 );
						ACTION_UnblockActionKeys( KEY_ACTION_FALL_IN );
						ACTION_UnblockActionKeys( KEY_ACTION_TEAMSELECT );
	   				 while(!bFallInIssued)
						{
							sleep( 0.5 );
						}

							//-----/-----TRAINING_V="Look at the Fire Team icon %icon_team_fire% in your compass.
							//-----/-----It has moved from the outer ring and is now inside the center of the compass.
							//-----/-----This reminds you that the Fire Team is following you.%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize("TRAINING_V"), 0.0 );
						Pawn( GetFirstActor( 'AP_Training_Scarecrow' )).PawnTeam = TEAM_NONE;
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

							//-----/-----TRAINING_W="To exit command mode without issuing an order, %action_jump% %icon_jump%.
							//-----/-----%newline%%newline%%icon_continue% to Continue."
						ACTION_DisplayTrainingMessage( S_Localize("TRAINING_W"), 0.0 );
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
	
							//-----/-----Clear training message
						ACTION_DisplayTrainingMessage( "", 0.0 );
	
							sleep( 1.2 );

						GetLocalPlayerController().bMoveOrderEnabled = true;
						ACTION_UnblockActionKeys( -1 );
							sleep( 2.0 );
				}


				if ( ACTION_IsTrainingDisabled() )
					{
						if ( OBJ_Ref.bBeaconDisabled == FALSE )
							ACTION_TriggerEvent( 'WP_obj0' );	// OFF

						ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
						ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
						ACTION_SetPawnWeaponAmmo( GetLocalPlayerPawn() , class'gbxInventory.WeapUSM1Carbine' , 75 );
						getLocalPlayerPawn().Weapon.ForceReload();
					}

			//===== Release player
				ACTION_UnBlockActionKeys( -1 );
				ACTION_BlockActionKeys( KEY_ACTION_SA_VIEW );
				ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_UnBlockNavPoints( 'PN_Training_Block_Exit' );
				ACTION_UnBlockNavPoints( 'PN_Training_Block_Entrance' );
				ACTION_UnBlockNavPoint( 'PN_Training_Doyle_Cover' );

				ACTION_TriggerEvent('TS_Objectives');
				ACTION_SetUnitHiddenOnCompass( 'Unit_US_Assault' , FALSE );
				ACTION_DestroyActor( 'GBXTrig_TrainStep1' );
				ACTION_DestroyActor( 'GBXTrig_TrainStep2' );

			//===== Run through other commands if training is disabled
				AP_Doyle.Controller.Focus = NONE ;
				ACTION_ChangeController( 'AP_Doyle' , class'Mind' );
				AP_Doyle.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'AP_Doyle' , TRUE );
				ACTION_EnableBattleDialogue();
				ACTION_EnableBattleDialogueForCharacter( 'AP_Doyle' );
				AP_Doyle.SightRadius = AP_Doyle.default.SightRadius ;

					sleep( 0.5 );

				GetLocalPlayerController().bHideSuppressionIcons = TRUE ;

				GetLocalPlayerController().bTargetOrderEnabled = true;
				GetLocalPlayerController().bAssaultOrderEnabled = true;
				GetLocalPlayerController().bMoveOrderEnabled = true;

				ACTION_UnblockNavPoints( 'PN_TrainingBlock' );
				ACTION_UnBlockNavPoint( 'PN_Gate_Exit' );
				ACTION_UnblockNavPoints( 'PN_PeanutBlock' );
				ACTION_UnblockNavPoints('PN_FlankBlock');

					sleep( 4.0 );

		if( vSize( AP_Doyle.location - GetLocalPlayerPawn().location ) < 1536 )
			{
				ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0230.DOYLE_B", 1.0, 1.0, 1.0, ,'bottom_lip' );
				ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_B"), 4.0, 1, 1, 1, TRUE, TRUE );
					//-----/----- DOYLE_B="Doyle: Corporal, we gotta find whoever we can.  I saw a farmhouse nearby on the way down.  I'll follow you."
			}

			//===== Wait for player to pass trigger for plane crash
				ACTION_WaitForEvent( 'Event_Plane_Crash' );

				ACTION_PlayLocalSound( "D00130_SOUNDS.C47_CRASH" );

					sleep( 8.1 );

				ACTION_TriggerEvent( 'Emitter_PlaneCrash' );

		ScriptEnd:
	}
