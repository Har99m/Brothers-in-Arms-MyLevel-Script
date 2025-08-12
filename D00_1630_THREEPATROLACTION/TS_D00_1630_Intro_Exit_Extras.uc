//=============================================================================
// TS_D00_1630_Intro_Exit_Extras.

//	Triggered by:	TS_IntroScene
// 	Use:			Extra characters exit intro scene through this script:
//					Baker, Corrion, Desola, Campbell, Paige, McConnel
//=============================================================================
class TS_D00_1630_Intro_Exit_Extras extends TriggeredScript
	placeable;

var AnimPawn AP_Baker, AP_Corrion, AP_Desola, AP_Campbell, AP_Paige, AP_McConnel;
var ActorLite PN_Dest_01 , PN_Dest_02 , PN_Dest_03 , PN_Dest_04 , PN_Dest_05 , PN_Dest_06 ;

state triggered
	{
		Begin:

			//===== Define Pawns
				AP_Baker = Animpawn( GetPawn( 'Baker' ));
				AP_Campbell = Animpawn( GetPawn( 'Campbell' ));
				AP_Corrion = Animpawn( GetPawn( 'Corrion' ));
				AP_Desola = Animpawn( GetPawn( 'Desola' ));
				AP_McConnel = Animpawn( GetPawn( 'McConnel' ));
				AP_Paige = Animpawn( GetPawn( 'Paige' ));

			//===== Define Destination actors
				PN_Dest_01 = GetNavigationPoint( 'PN_Intro_Exit_1' );
				PN_Dest_02 = GetNavigationPoint( 'PN_Intro_Exit_2' );
				PN_Dest_03 = GetNavigationPoint( 'PN_Intro_Exit_3' );
				PN_Dest_04 = GetNavigationPoint( 'PN_Intro_Exit_4' );
				PN_Dest_05 = GetNavigationPoint( 'PN_Intro_Exit_5' );
				PN_Dest_06 = GetNavigationPoint( 'PN_Intro_Exit_6' );

    			ACTION_SetAnimSetDirect( AP_Paige, "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_McConnel, "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Campbell, "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Corrion, "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Desola, "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );

					sleep( 0.3 );

			//===== Clear everything 
				AP_Baker.controller.focus = NONE ;
				AP_Campbell.controller.focus = NONE ;
				AP_Corrion.controller.focus = NONE ;
				AP_Desola.controller.focus = NONE ;
				AP_McConnel.controller.focus = NONE ;
				AP_Paige.controller.focus = NONE ;

				ACTION_ClearLookAtTarget( 'Baker' );
				ACTION_ClearLookAtTarget( 'Campbell' );
				ACTION_ClearLookAtTarget( 'Corrion' );
				ACTION_ClearLookAtTarget( 'Desola' );
				ACTION_ClearLookAtTarget( 'McConnel' );
				ACTION_ClearLookAtTarget( 'Paige' );

					sleep( 0.3 );

		//========== SQUAD STANDS UP
				ACTION_PlayAnimWithQueueDirect( AP_Campbell , 'crouched_idle_a_dismount' , 0.2 , 1.0 );
				ACTION_PlayAnimWithQueueDirect( AP_Corrion , 'crouched_idle_b_dismount' , 0.2 , 1.0 );
				ACTION_PlayAnimWithQueueDirect( AP_Desola , 'crouched_idle_c_dismount' , 0.2 , 1.0 );
				ACTION_PlayAnimWithQueueDirect( AP_McConnel , 'crouched_idle_a_dismount' , 0.2 , 1.0 );
				ACTION_PlayAnimWithQueueDirect( AP_Paige , 'crouched_idle_c_dismount' , 0.2 , 1.0 );

				ACTION_ClearPawnIdleQueue( 'Campbell' );
				ACTION_ClearPawnIdleQueue( 'Corrion' );
				ACTION_ClearPawnIdleQueue( 'Desola' );
				ACTION_ClearPawnIdleQueue( 'McConnel' );
				ACTION_ClearPawnIdleQueue( 'Paige' );

					sleep( 0.65 );

				ACTION_GivePawnWeapon( 'Baker' , "gbxInventory.WeapUSM1_" );

					sleep( 0.35 );

				ACTION_PlayAnimWithQueueDirect( AP_Campbell , 'standing_idle_combat_1' , 0.3 , 1.0 , , 1 );
				ACTION_PlayAnimWithQueueDirect( AP_Corrion , 'standing_idle_combat_1' , 0.3 , 1.0 , , 1 );
				ACTION_PlayAnimWithQueueDirect( AP_McConnel , 'standing_idle_combat_1' , 0.3 , 1.0 , , 1 );

					sleep( 0.3 );

				ACTION_PlayAnimWithQueueDirect( AP_Desola , 'standing_idle_combat_1' , 0.3 , 1.0 , , 1 );
				ACTION_PlayAnimWithQueueDirect( AP_Paige , 'standing_idle_combat_1' , 0.3 , 1.0 , , 1 );

				ACTION_WaitForEvent( 'Event_SS_Intro_Baker_Exit' );
				ACTION_ChangeControllerDirect( AP_Baker , class 'Mind' );
				ACTION_ChangeControllerDirect( AP_Baker , class 'ScriptedController' );
				ACTION_RunDirect( AP_Baker );
				ACTION_SetAnimSetDirect( AP_Baker , "a_hold_rifle.a_hold_rifle" );
				WarGamePawn( GetPawn( 'Baker ' )).eWeaponAimedState = WAS_CombatRelaxed ;
					sleep( 0.5 );

			//===== Move extras out
				ACTION_MoveToward( AP_Baker , PN_Dest_01 , FALSE );
					sleep( 0.3 );
				ACTION_MoveToward( AP_Campbell , PN_Dest_02 , FALSE );
					sleep( 0.5 );
				ACTION_MoveToward( AP_Paige , PN_Dest_06 , FALSE );
					sleep( 0.4 );
				ACTION_MoveToward( AP_Corrion , PN_Dest_03 , FALSE );
					sleep( 0.7 );
				ACTION_MoveToward( AP_McConnel , PN_Dest_05 , FALSE );
					sleep( 0.5 );
				ACTION_MoveToward( AP_Desola , PN_Dest_04 , FALSE );

			//===== Wait until the last two of the extras have reached destinations
				While( !PawnIsAtDestination( AP_Desola , PN_Dest_04 ))
					{
						sleep( 0.4 );
					}

						sleep( 0.1 );

				While( !PawnIsAtDestination( AP_McConnel , PN_Dest_05 ))
					{
						sleep( 0.4 );
					}

			//===== Remove AnimSets
    			ACTION_UnSetAnimSetDirect( AP_Campbell , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_UnSetAnimSetDirect( AP_Corrion , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_UnSetAnimSetDirect( AP_McConnel , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_UnSetAnimSetDirect( AP_Desola , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_UnSetAnimSetDirect( AP_Paige , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );

			//===== Destroy extras
				ACTION_DestroyActor( 'Baker' );
				ACTION_DestroyActor( 'Campbell' );
					sleep( 0.2 );
				ACTION_DestroyActor( 'Corrion' );
				ACTION_DestroyActor( 'Desola' );
					sleep( 0.1 );
				ACTION_DestroyActor( 'McConnel' );
				ACTION_DestroyActor( 'Paige' );

		ScriptEnd:
	}


