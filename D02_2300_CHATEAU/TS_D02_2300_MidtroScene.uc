//=============================================================================
// TS_D02_2300_MidtroScene.
//=============================================================================
class TS_D02_2300_MidtroScene extends TriggeredScript
	placeable;

var Tank Tank_Stuart ;
var ActorLite PN_Tank_01 ;
var gbxWayPointBeacon WP_Objective_00 , WP_Objective_01 ;

State Triggered
	{
		Begin:

			//===== Spawn US tank and have it target German MG team
				ACTION_TriggerEvent('CSU_Tank');
				Tank_Stuart = Tank( GetPawn( 'Tank_Blake' ));
				ACTION_TankCommanderCloseHatch( Tank_Stuart );
					sleep( 4.0 );
				ACTION_TankDisablePlayerUseTrigger( Tank_Stuart );

				ACTION_OrderTarget( 'Unit_US_Base' , 'UNIT_MG2' );
					sleep( 0.5 );

			//===== Define variables
				WP_Objective_00 = GbxWayPointBeacon( GetFirstActor( 'WP_obj0' ));
				WP_Objective_01 = GbxWayPointBeacon( GetFirstActor( 'WP_obj1' ));

				PN_Tank_01 = GetNavigationPoint( 'PN_S4_Tank_01' );

				Tank_Stuart.AttachToBone( GetFirstActor( 'gbxTrig_Tank_Attach' ) , 'chassis' );

				ACTION_UnblockNavPoints( 'PN_S4_Mountain' );
					sleep( 0.5 );

				while ( !ACTION_TankIsAtDestination( Tank_Stuart , PN_Tank_01 ))
					{
						ACTION_TankMoveTo( Tank_Stuart , PN_Tank_01 );
							sleep( 0.2 );
					}

					sleep(1.0 );

				ACTION_OrderTarget( 'Unit_US_Base' , 'UNIT_S4_01' );

			//===== Block paths from where tank came from and move tank in more
				ACTION_BlockNavPoints( 'PN_S4_Mountain' );
				ACTION_OrderMove( 'Unit_US_Base' , 'PN_S4_Tank_02' );

					sleep( 4.0 );

				ACTION_TriggerEvent( 'WP_obj0' );
				ACTION_DestroyActor( 'WP_obj0' );
				ACTION_SetObjectiveBeaconStateDirect( WP_Objective_00 , False , False , False );	// OFF
				ACTION_TriggerEvent( 'WP_Tank' );
				ACTION_DisplayObjectiveHint( S_Localize( "HINT_A" ) , 3.0 );
						//-----/-----HINT_A="Meet with the tank commander."
					sleep( 3.5 );

			//===== Turn on trigger that is attached to tank
				ACTION_TriggerEvent( 'gbxTrig_Tank_Attach' );

		//========== WAIT FOR PLAYER TO REACH BLAKE
				ACTION_WaitForEvent( 'Event_Player_Approach_Tank' );

				If ( Tank_Stuart.CommanderPawn.bScriptedHatchOpenOrClose == False )
				{
					ACTION_TankCommanderOpenHatch( Tank_Stuart );
				}

				ACTION_ForcePlayerDismountTurret();
				
				
				ACTION_DisplayObjectiveHint( "" , 0.0 );
				ACTION_DestroyActor( 'gbxTrig_Tank_Attach' );
				ACTION_DestroyActor( 'GBXTrig_Skip_Midtro' );
				ACTION_TriggerEvent( 'WP_Tank' );
				ACTION_TriggerEvent( 'WP_Tank' );

				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
				sleep(1.0);
				ACTION_TankCommanderLookAt( Tank_Stuart, GetLocalPlayerPawn() );
				ACTION_TankCommanderPlayLipSyncSound( Tank_Stuart, "D02_2300.BLAKE_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize( "BLAKE_A1" ), 2.5 , 1 , 1 , 1 , , TRUE );
					//-----/ 1.50 /-----BLAKE_A1="Blake: You guys were sent here too?"
						sleep( 1.6 );

				ACTION_DisplaySubtitleMessage2(S_Localize( "BLAKE_A2" ), 4.0 , 1 , 1 , 1 , , TRUE );
					//-----/ 3.48 /-----BLAKE_A2="Blake: It's dark as hell out here so I'm gonna need you to be my eyes Corporal!"
						sleep( 3.9 );

			//===== TANK TRAINING
				if ( !ACTION_IsTrainingDisabled() )
						{
							ACTION_TankEnterScriptedMode( Tank_Stuart );

							ACTION_DisplayTrainingMessage( S_Localize("TRAINING_A"), 0.0 );
								//-----/-----TRAINING_A="Sgt. Blake and his Tank %icon_tank% are now part of your squad.  
								//-----/-----The Tank commander will follow your orders much like your Fire Team does.%newline%%newline%%icon_continue% to Continue."
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

							ACTION_DisplayTrainingMessage( S_Localize("TRAINING_B"), 0.0 );
								//-----/-----TRAINING_B="Tanks %icon_tank% are ideal for suppressing and killing enemy units.  
								//-----/-----They are also impervious to machine gun and small arms fire making them useful as mobile cover.%newline%%newline%%icon_continue% to Continue."
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

							ACTION_DisplayTrainingMessage( S_Localize("TRAINING_C"), 0.0 );
								//-----/-----TRAINING_C="Your tank is only vulnerable to enemy tanks, anti-tank guns, or enemy infantry with anti-tank rockets.%newline%%newline%%icon_continue% to Continue."
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

							ACTION_DisplayTrainingMessage( S_Localize("TRAINING_D"), 0.0 );
								//-----/-----TRAINING_D="This tank also features a turret mounted machine gun that you can use!  
								//-----/-----%action_use% %icon_use% at the rear of the tank to mount the machine gun.%newline%%newline%%icon_continue% to Continue."
							ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );
							ACTION_DisplayTrainingMessage( "", 0.1 );
							
							ACTION_TriggerEvent('TS_D02_2300_TankZoom');

							ACTION_TankLeaveScriptedMode( Tank_Stuart );
						}

				ACTION_TankCommanderLookAt( Tank_Stuart, NONE );

			//===== Attach to unit
				ACTION_TankEnablePlayerUseTrigger( Tank_Stuart );
				ACTION_AttachUnitToSuperUnit( 'UNIT_US_Base', 'UNIT_Player' );
				ACTION_OrderFallin('UNIT_US_Base');

		//===== CHECKPOINT SAVE
				ACTION_ForcePlayerDismountTurret();
				ACTION_TriggerEvent('TS_CheckPointSave_02');

					sleep( 3.5 );

			//===== Unlock player
				ACTION_UnLockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_LimitPlayerInput( GetLocalPlayerController(), false );

			//===== Objective update
				ACTION_TriggerEvent( 'WP_Tank' );
				ACTION_TriggerEvent( 'WP_obj1' );
				ACTION_SetObjectiveBeaconStateDirect( WP_Objective_01 , True , TRUE , True );		// ON

			ACTION_TriggerEvent('TS_Combat_02');

			//===== GoTo last state to avoid trouble
				GoToState( 'Tank_Normal' );

					sleep( 2.0 );

		ScriptEnd:
	}

//=============================================================================
//	If the player found his tank as they should, go here to do nothing
//=============================================================================

State Tank_Normal
	{
		Begin:
			sleep( 10.0 );
		ScriptEnd:
	}
