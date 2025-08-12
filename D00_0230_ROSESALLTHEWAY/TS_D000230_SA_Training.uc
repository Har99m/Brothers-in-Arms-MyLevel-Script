//=============================================================================
// TS_D000230_SA_Training.
//=============================================================================
class TS_D000230_SA_Training extends TriggeredScript
	placeable;

var WargamePlayerController LPC;
var OracleCamLookTarget LT_SA_01 , LT_SA_02 , LT_SA_03 , LT_SA_04 ;
var Actor SM_SATraining_Contact_DE , SM_SATraining_Contact_US , SM_SATraining_Contact_Kill , SM_SATraining_Flank ;
var Actor SM_Training_Tree , SM_Training_Tree_02 , SM_Training_Tree_03 , SM_Training_Tree_04 , SM_Training_Tree_05 ;
var Actor LT_C1_Cover_Check ;
var Pawn aPlayerPawn ;
Var AnimPawn AP_Paddock , AP_Doyle , German_C1_01 , German_C1_02 ;
var bool bTargetIssued ;
var Unit Unit_US_Assault , UNIT_C101 ;
var Volume Volume_Teleport ;
var int s ;

function Signal( Actor Sender , int command , Actor ActorData , int IntegerData , float FloatData )
	{
  		if ( command == 1 )  			// was target command issued?
   			{
      			bTargetIssued = true;
   			}

	}

state Triggered
	{

		Begin:
				ACTION_MakeEnemyKnown( 'c101_b' );
				AP_Doyle = AnimPawn( GetPawn( 'AP_Doyle' ));
				AP_Paddock = AnimPawn( GetPawn( 'AP_Paddock' ));
				Unit_US_Assault = GetUnit( 'Unit_US_Assault' );
				Volume_Teleport = Volume( GetFirstActor( 'Volume_Teleport' ));

					sleep( 0.2 );

				ForEach Volume_Teleport.TouchingActors( class 'AnimPawn' , AP_Doyle )
					{
						if ( AP_Doyle.Tag == 'AP_Doyle' )
							{
								//===== Found a pawn so teleport
								if ( AP_Doyle != None && AP_Doyle.Health > 0 )
									{
										ACTION_TeleportPawnToActor( AP_Doyle , 'LT_SAV_Training_Teleport_Doyle' );
										ACTION_RunDirect( AP_Doyle );
										ACTION_OrderMove( 'Unit_US_Assault' , 'PN_SAV_Teleport_Move' );
									}
							}

						if ( AP_Doyle.Tag == 'AP_Paddock' )
							{
								//===== Found a pawn so teleport
 								if ( AP_Paddock != None && AP_Paddock.Health > 0 )
									{
										ACTION_TeleportPawnToActor( AP_Paddock, 'LT_SAV_Training_Teleport_Paddock' );
										ACTION_RunDirect( AP_Paddock );
										ACTION_OrderMove( 'Unit_US_Assault' , 'PN_SAV_Teleport_Move' );
									}
							}
					}

						sleep( 0.3 );

					if (!ACTION_IsTrainingDisabled())
						{
							ACTION_ClearInterceptedActionKeys();
							ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_Q" ), 0.0 );
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_SA_VIEW );
								//-----/-----TRAINING_SA_Q="%action_sa_view% %icon_sa_view% to enter Situational Awareness View."

							SM_SATraining_Contact_DE = GetFirstActor( 'SM_SATraining_Contact_DE' );
							SM_SATraining_Contact_US = GetFirstActor( 'SM_SATraining_Contact_US' );
							SM_SATraining_Contact_Kill = GetFirstActor( 'SM_SATraining_Contact_Kill' );
							SM_SATraining_Flank = GetFirstActor( 'SM_SATraining_Flank' );

							LT_C1_Cover_Check = GetFirstActor( 'LT_C1_Cover_Check' );

							UNIT_C101 = GetUnit( 'UNIT_C101' );

							LT_SA_01 = OracleCamLookTarget( GetFirstActor( 'LT_SA_01' ) );
							LT_SA_02 = OracleCamLookTarget( GetFirstActor( 'LT_SA_02' ) );
							LT_SA_03 = OracleCamLookTarget( GetFirstActor( 'LT_SA_03' ) );
							LT_SA_04 = OracleCamLookTarget( GetFirstActor( 'LT_SA_04' ) );

							German_C1_01 = AnimPawn( GetPawn( 'c101_a' ));
							German_C1_02 = AnimPawn( GetPawn( 'c101_b' ));

							aPlayerPawn = GetLocalPlayerPawn() ;

							SM_Training_Tree = GetFirstActor( 'SM_Training_Tree' );
							SM_Training_Tree_02 = GetFirstActor( 'SM_Training_Tree_02' );
							SM_Training_Tree_03 = GetFirstActor( 'SM_Training_Tree_03' );
							SM_Training_Tree_04 = GetFirstActor( 'SM_Training_Tree_04' );
							SM_Training_Tree_05 = GetFirstActor( 'SM_Training_Tree_05' );

							ACTION_BlockActionKeys( KEY_ACTION_JUMP + 
													KEY_ACTION_SA_VIEW + 
													KEY_ACTION_SA_LEFT + 
													KEY_ACTION_SA_RIGHT + 
													KEY_ACTION_FIRE + 
													KEY_ACTION_SA_UP + 
													KEY_ACTION_SA_DOWN + 
													KEY_ACTION_ZOOM + 
													KEY_ACTION_LOOK + 
													KEY_ACTION_MOVE );
				
							LPC = GetLocalPlayerController();
							ACTION_SetAlwaysTick( TRUE );
							LPC.ConsoleCommand( "activateoracle" );
							LPC.CancelOrderIcon();  // make SURE an order isn't in progress
							LPC.OracleCamTargetSelf();

							SM_Training_Tree.bHidden = TRUE ;
							SM_Training_Tree_02.bHidden = TRUE ;
							SM_Training_Tree_03.bHidden = TRUE ;
							SM_Training_Tree_04.bHidden = TRUE ;
							SM_Training_Tree_05.bHidden = TRUE ;

								//-----/-----TRAINING_SA_A="You are now in Situational Awareness view.%newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_A" ), 0.0 );
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

								//-----/-----TRAINING_SA_B="While in this mode, the game is paused allowing you time to examine the battlefield, objectives, 
								//-----/-----and known combat units.%newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_B" ), 0.0 );
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

								//-----/-----TRAINING_SA_C="Right now you are looking at your current position.%newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_C" ), 0.0 );
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

								//-----/-----TRAINING_SA_D="%action_sa_move% %icon_sa_move% to rotate around what you are looking at. %newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_D" ), 0.0 );
							ACTION_UnBlockActionKeys( KEY_ACTION_LOOK + KEY_ACTION_MOVE );	
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

								//-----/-----TRAINING_SA_E="%action_sa_zoom% %icon_sa_zoom% to zoom and unzoom your view.%newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_E" ), 0.0 );
							ACTION_UnBlockActionKeys( KEY_ACTION_ZOOM );	
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
							LPC.OracleCam.bZoom = FALSE ;

								//-----/-----TRAINING_SA_F="In addition to your current position, you can examine other battlefield elements using the markers below.
								//-----/-----%newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_F" ), 0.0 );
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
	
								//-----/-----TRAINING_SA_G="Markers represent objectives, waypoints, enemy units, and allies.%newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_G" ), 0.0 );
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

								//-----/-----TRAINING_SA_H="%action_sa_right% %icon_sa_right% to advance and %action_sa_left% %icon_sa_left% to regress through known battlefield markers.
								//-----/-----%newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_H" ), 0.0 );
							ACTION_UnBlockActionKeys( KEY_ACTION_SA_LEFT + KEY_ACTION_SA_RIGHT ); 
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

								//-----/-----TRAINING_SA_I="Use Situational Awareness View to help you make tactical decisions or locate your objectives. 
								//-----/-----%newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_I" ), 0.0 );
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

//-----------------------FLANKING TRAINING-----------------------//

					if( German_C1_01.Health > 0 && German_C1_02.Health > 0 )
						{
								//-----/-----TRAINING_SA_J="Your squad should prepare to engage the German units directly in front of this position!%newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_J" ), 0.0 );
							ACTION_BlockActionKeys( KEY_ACTION_SA_UP +
													KEY_ACTION_SA_DOWN +
													KEY_ACTION_SA_RIGHT +
													KEY_ACTION_SA_LEFT );
							ACTION_InsertOracleCamTarget( LPC, LT_SA_01 );
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

								//-----/-----TRAINING_SA_K="Because the German units are behind cover, it will be very difficult for your squad to actually kill the enemy from this location. 
								//-----/-----%newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_K" ), 0.0 );
							SM_SATraining_Contact_US.bHidden = FALSE ;
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
							SM_SATraining_Contact_US.bHidden = TRUE ;

								//-----/-----TRAINING_SA_L="Likewise, as long as you are behind cover, it will be very difficult for the enemy to kill you.%newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_L" ), 0.0 );
							SM_SATraining_Contact_DE.bHidden = FALSE ;
							ACTION_InsertOracleCamTarget( LPC, LT_SA_02 );
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
							SM_SATraining_Contact_DE.bHidden = TRUE ;

								//-----/-----TRAINING_SA_M="To defeat this enemy, you should move to a new firing position where the Germans are not protected by any type of cover. 
								//-----/-----This type of maneuver is called flanking. %newline%%newline%%icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_M" ), 0.0 );
							ACTION_InsertOracleCamTarget( LPC, LT_SA_03 );
							SM_SATraining_Flank.bHidden = FALSE ;
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

								//-----/-----TRAINING_SA_N="Once you reach this location, you will have a clear shot at the enemy units,
								//-----/----- allowing you to easily pick them off.%newline%%newline% %icon_continue% to Continue."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_N" ), 0.0 );
							SM_SATraining_Contact_Kill.bHidden = FALSE ;
							ACTION_InsertOracleCamTarget( LPC, LT_SA_04 );
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
							SM_SATraining_Contact_Kill.bHidden = TRUE ;
							SM_SATraining_Flank.bHidden = TRUE ;
						}

								//-----/-----TRAINING_SA_P="%action_sa_view% %icon_sa_view% at anytime to switch to and from Situational awareness view.
								//-----/-----%newline%%newline%%action_sa_view% %icon_sa_view% to return to the game."
							ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_SA_P" ), 0.0 );
							ACTION_UnBlockActionKeys( KEY_ACTION_SA_VIEW );
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_SA_VIEW );
							ACTION_SetAlwaysTick( FALSE );
							ACTION_DisplayTrainingMessage( "", 0.0 );  //CLEAR MESSAGE

							SM_Training_Tree.bHidden = FALSE ;
							SM_Training_Tree_02.bHidden = FALSE ;
							SM_Training_Tree_03.bHidden = FALSE ;
							SM_Training_Tree_04.bHidden = FALSE ;
							SM_Training_Tree_05.bHidden = FALSE ;

							ACTION_UnBlockActionKeys( -1 );
						}

				ACTION_SetAlwaysTick( FALSE );
				ACTION_UnBlockActionKeys( KEY_ACTION_SA_VIEW );

					sleep( 0.2 );

	//========== MORE COMBAT TRAINING
		if (!ACTION_IsTrainingDisabled() && German_C1_01.Health + German_C1_02.Health > 0 )
			{
					ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_COMBAT_A" ), 0.0 );
						//-----/-----TRAINING_COMBAT_A="You are about to enter combat.  Let's review the four F's.%newline%%newline%%icon_continue% to Continue."
					ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

						//-----/-----TRAINING_COMBAT_F="Good job.  You just used the four F's to defeat the enemy.  Try it again in the next fight.%newline%%newline%%icon_continue% to Continue."

				//===== Order move training
					ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_COMBAT_B" ), 0.0 );
						//-----/-----TRAINING_COMBAT_B="Find them!  Locate the enemy unit and order your squad to move to the facing cover position."

					s = 0 ;
					AP_Doyle = AnimPawn( GetPawn( 'AP_Doyle' ));
					AP_Paddock = AnimPawn( GetPawn( 'AP_Paddock' ));
					ACTION_TriggerEvent( 'pfx_Indictator_C1' );
						while( VSize( AP_Doyle.Location - LT_C1_Cover_Check.Location ) > 128 || VSize( AP_Paddock.Location - LT_C1_Cover_Check.Location ) > 128 )
							{
								sleep( 0.5 );
								s ++ ;
								if( s > 120 )
									break ;
							}
					ACTION_DisplayTrainingMessage( "", 0.0 );
					GetLocalPlayerController().bMoveOrderEnabled = FALSE ;
						sleep( 0.5 );
					ACTION_TriggerEvent( 'pfx_Indictator_C1' );

				//===== Target training
					ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_COMBAT_C" ), 0.0 );
						//-----/-----TRAINING_COMBAT_C="Fix them!  Your squad is now at a suitable cover position to fire on the German units.  Order your squad to suppress the enemy."
					Unit_US_Assault.AddNotifyOrderTarget( self );
					while( !bTargetIssued )
						{
							If( UNIT_C101.GetNumLivingMembers() < 1 )
								break;

							sleep( 0.5 );
						}

					GetLocalPlayerController().bMoveOrderEnabled = TRUE ;
					ACTION_BlockActionKeys( KEY_ACTION_JUMP );
					ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_COMBAT_D" ), 0.0 );
						//-----/-----TRAINING_COMBAT_D="Flank them!  Move to a position where you can shoot into their exposed flank.%newline%%newline%%icon_continue% to Continue."
					ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 

					ACTION_DisplayTrainingMessage( "", 0.0 );
					ACTION_UnBlockActionKeys( KEY_ACTION_JUMP );
					ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );

						sleep( 1.0 );

					ACTION_WaitForEvent( 'Event_Player_At_Flank' );

				If( UNIT_C101.GetNumLivingMembers() > 0 )
					{
						ACTION_BlockActionKeys( KEY_ACTION_JUMP );
						ACTION_TriggerEvent( 'pfx_Indictator_C1_Player' );
						ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_COMBAT_E" ), 0.0 );
							//-----/-----TRAINING_COMBAT_E="Finish them!  Use the cover and kill them from safety.  %newline%%newline%%icon_continue% to Continue."
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
						ACTION_DisplayObjectiveHint( "" , 0.0 );

						ACTION_TriggerEvent( 'pfx_Indictator_C1_Player' );

						While( UNIT_C101.GetNumLivingMembers() > 0 )
							{
								sleep( 1.0 );
									If( ( LPC != None) && ( aPlayerPawn.Weapon.ClipAmt < 1 ) )
										{
											ACTION_SetPawnWeaponAmmo( aPlayerPawn , class'gbxInventory.WeapUSM1Carbine' , 75 );
										}
							}

							sleep( 0.5 );

						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_COMBAT_F" ), 0.0 );
							//-----/-----TRAINING_COMBAT_F="Good job.  You just used the four F's to defeat the enemy.  Try it again in the next fight.%newline%%newline%%icon_continue% to Continue."
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
					}

				Else If( UNIT_C101.GetNumLivingMembers() < 1 )
					{
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_COMBAT_G" ), 4.0 );
							//-----/-----TRAINING_COMBAT_G="Finish them!  Good job.  You just used the four F's to defeat the enemy.”
								sleep( 4.0 );
					}
				}

			ACTION_DisplayObjectiveHint( "" , 0.0 );
			ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
			ACTION_UnBlockActionKeys( KEY_ACTION_JUMP );

			GetLocalPlayerController().bGodMode = FALSE ;
			ACTION_SetRepelBullets( 'AP_Doyle' , FALSE );
			ACTION_SetRepelBullets( 'AP_Paddock' , FALSE );
			ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn() , FALSE );

		//===== Un-Block paths
			ACTION_UnBlockNavPoints( 'PN_C1_Flank_Block' );

//=============================================================================

		//===== Trigger events for weapon switch training
			ACTION_TriggerEvent( 'TS_D000230_Training_WeaponSwitch' );
			ACTION_TriggerEvent( 'TS_D000230_Training_Weapon_Check' );

		//===== Wait for player to hit second hint
					ACTION_WaitForEvent( 'Event_Hint_Assault' );

			if ( !ACTION_IsTrainingDisabled() && German_C1_01.Health > 0 && German_C1_02.Health > 0 )
				{
					//-----/----- HINT_B="Suppress the Germans from the left and then assault them from the front."
						ACTION_DisplayObjectiveHint( S_Localize( "HINT_B" ), 3.0 );
							sleep( 3.2 );
						ACTION_DisplayObjectiveHint( "" , 0.0 );
				}
	}




