//=============================================================================
// FrenchHouse_Script.
//=============================================================================
class FrenchHouse_Script extends TriggeredScript
	placeable;


var AnimPawn Pawn_Mac, Pawn_Leggett, Pawn_Cole;
var Actor Look_01 , Look_02 , Look_03 , Look_04 , Look_05 , Look_06 ;
var ActorLite Path_01 , Path_02 , Path_03 , Path_04 , Path_05 , Path_06 ;
var vector MoveToPlayer;
var vector MoveToLeggett;
var vector MoveToCole;
var Actor MyPlayer;

state triggered
	{
		Begin:

//=============================================================================
// SPAWN LEGGET AND COLE
//=============================================================================

			//===== Spawn Leggett and Cole
				ACTION_TriggerEvent( 'CharacterSpawnerUSAlinkup' );

			//===== Define pawns
				Pawn_Leggett = AnimPawn( GetPawn( 'Pawn_Leggett' ));
				Pawn_Cole = AnimPawn( GetPawn( 'Pawn_Cole' ));
				//Pawn_Mac = AnimPawn( GetPawn( 'mac' ));

				//Pawn_Mac.bDoHeadTurn = TRUE ;
				Pawn_Leggett.bDoHeadTurn = TRUE ;
				Pawn_Cole.bDoHeadTurn = TRUE ;

			//===== Define look targets
				Look_01 = GetFirstActor( 'Outro_Look_Gate' );
				Look_02 = GetFirstActor( 'Look_French_Door' );
				Look_03 = GetFirstActor( 'Look_Intro_Steps' );
				Look_04 = GetFirstActor( 'Look_Intro_Door_Low' );
				Look_05 = GetFirstActor( 'look_intro_cole_ask' );

			//===== Define paths
				Path_01 = GetNavigationPoint( 'Path_Leggett_Start' );
				Path_02 = GetNavigationPoint( 'Path_Cole_Start' );
				Path_03 = GetNavigationPoint( 'doornodeleft' );
				Path_04 = GetNavigationPoint( 'Coles_last_words' );
				Path_05 = GetNavigationPoint( 'doornodeleft2' );


			//===== Point Cole toward gate
				ACTION_SetLookAtTarget( 'Pawn_Cole' , Look_01 , TRUE );
				ACTION_WaitForPawnRotateToward( Pawn_Cole );

			//===== Set animation sets for Leggett and Cole
				ACTION_SetAnimSetDirect( Pawn_Leggett , "a_cin_d0_Screaming_Eagles.a_cin_d0_Screaming_Eagles" );
				ACTION_SetAnimSetDirect( Pawn_Leggett , "a_hold_rifle.a_hold_rifle" );
				ACTION_SetAnimSetDirect( Pawn_Cole , "a_cin_d0_Screaming_Eagles.a_cin_d0_Screaming_Eagles" );
				ACTION_SetAnimSetDirect( Pawn_Cole , "a_hold_rifle.a_hold_rifle" );

			//===== Set up idle animations
				ACTION_ClearPawnIdleQueue( 'Pawn_Leggett' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Leggett', 'crouched_wall_lean_left_idle' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Leggett', 'crouched_wall_lean_left_idle_2' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Leggett', 'crouched_wall_lean_left_idle_3' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Leggett', FALSE );

				ACTION_ClearPawnIdleQueue( 'Pawn_Cole' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Cole', 'crouched_idle_relaxed_3' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Cole', 'crouched_idle_relaxed_4' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Cole', 'crouched_idle_relaxed_5' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Cole', FALSE );

			//===== Add attachment to Leggett
				Pawn_Leggett.AttachToBone( GetFirstActor('StaticMeshActor_FieldPack'), 'radio_bone' );

				Pawn_Leggett.bDoHeadTurn = TRUE ;
				Pawn_Cole.bDoHeadTurn = TRUE ;
				//Pawn_Mac.bDoHeadTurn = TRUE ;

				ACTION_PawnSetHeadTurnMult( 'Pawn_Leggett' , 0.6 );
				ACTION_PawnSetHeadTurnMult( 'Pawn_Cole' , 0.6 );
				//ACTION_PawnSetHeadTurnMult( 'Pawn_Mac' , 0.6 );

//=============================================================================
// COLE AND LEGGET REVEAL THEMSELVES
//=============================================================================

			//===== Wait for event
				ACTION_WaitForEvent( 'Reveal' );

			//===== Set Absolute Time
				ResetAbsoluteTime();
				StartAbsoluteTime();

			//===== Leggett stands up
				Pawn_Leggett.bNoTurnBody = TRUE;
				ACTION_PlayAnimWithQueueDirect( Pawn_Leggett , 'crouched_wall_lean_left_idle' , 0.5 , 1.0 );
		WaitForAbsoluteTime( 1.40 );
				ACTION_PlayAnimWithQueueDirect( Pawn_Leggett , 'crouched_wall_lean_left_dismount_to_standing' , 0.5 , 1.0 );	
		WaitForAbsoluteTime( 2.70 );
				ACTION_PlayAnimWithQueueDirect( Pawn_Leggett , 'standing_idle_relaxed_1' , 0.5 , 1.0 );	
		WaitForAbsoluteTime( 3.80 );

				Pawn_Leggett.bNoTurnBody = FALSE;
				Pawn_Leggett.FlushAnimQueueChannel( 0,,true );

				ACTION_ClearPawnIdleQueue( 'Pawn_Leggett' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Leggett', 'standing_idle_relaxed_2' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Leggett', 'standing_idle_relaxed_3' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Leggett', False );

			//===== Leggett walks out into the open and yells at Mac & Baker
				ACTION_Walk( 'Pawn_Leggett' );
				ACTION_MoveToward( Pawn_Leggett , Path_01 , FALSE );

				ACTION_PlayLipSyncSound('Pawn_Leggett',"D00130.LEGGETT_A", 1.0, 1.0, 1024.0, TRUE);		// ( 3.09 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "LEGGETT_A" ), 3.4, 1, 1, 1, TRUE, TRUE );		// Leggett: Oh shit it's Mac and Baker!
				ACTION_SetLookAtTarget( 'Pawn_Leggett' , GetLocalPlayerPawn() , TRUE );

				While ( !PawnIsAtDestination( Pawn_Leggett , Path_01 ) )
					{
							sleep( 0.2 );
					} 
				Pawn_Leggett.controller.focus = GetLocalPlayerPawn();

			//===== Cole yells "Quiet" and stands up
		WaitForAbsoluteTime( 8.0 );
				ACTION_PlayLipSyncSound( 'Pawn_Cole',"D00130.COLE_B", 1.0, 1.0, 1024.0, TRUE );			// ( 0.57 )	
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_B" ), 1.0, 1, 1, 1, TRUE, TRUE );		// Cole: Quiet.	
				Pawn_Cole.bNoTurnBody = TRUE;
				ACTION_PlayAnimWithQueueDirect( Pawn_Cole , 'crouched_to_standing' , 0.5 , 1.0 );	
		WaitForAbsoluteTime( 9.2 );
				ACTION_PlayAnimWithQueueDirect( Pawn_Cole , 'standing_idle_relaxed_3' , 0.5 , 1.0 );	

				Pawn_Cole.bNoTurnBody = FALSE;
				ACTION_SetLookAtTarget( 'Pawn_Cole' , Pawn_Leggett , TRUE );
				Pawn_Cole.controller.focus = Pawn_Leggett;
				ACTION_WaitForPawnRotateToward( Pawn_Cole );
				Pawn_Cole.FlushAnimQueueChannel( 0,,true );

				ACTION_ClearPawnIdleQueue( 'Pawn_Cole' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Cole', 'standing_idle_relaxed_4' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Cole', 'standing_idle_relaxed_5' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Cole', False );

			//===== Cole walks into the open and mouths off
		WaitForAbsoluteTime( 10.0 );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_D", 1.0, 1.0, 1024.0, TRUE);			// ( 2.89 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_D" ), 3.0, 1, 1, 1, TRUE, TRUE );		// Cole: Keep your voice down or the whole god damn German army will show up.
				ACTION_Walk( 'Pawn_Cole' );
				ACTION_MoveToward( Pawn_Cole , Path_02 , TRUE );

				While ( !PawnIsAtDestination( Pawn_Cole , Path_02 ) )
					{
							sleep( 0.2 );
					} 

					sleep( 1.5 );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_C", 1.0, 1.0, 1024.0, TRUE);			// ( 1.79 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_C" ), 3.0, 1, 1, 1, TRUE, TRUE );		// Cole: They'll be plenty of time to reminisce later.

			//===== Trigger event
				ACTION_TriggerEvent ('EaglesEndScript');

//=============================================================================
// MAC AND THE PLAYER MOVE INTO POSITION
//=============================================================================

			//===== Wait for event
				ACTION_WaitForEvent ('End_Eagles');

			//===== Set up Mac
				Pawn_Mac = AnimPawn( GetPawn( 'mac' ));

			//===== Set animation sets for Mac
				ACTION_SetAnimSetDirect( Pawn_Mac , "a_cin_d0_Screaming_Eagles.a_cin_d0_Screaming_Eagles" );
				ACTION_SetAnimSetDirect( Pawn_Mac , "a_hold_rifle.a_hold_rifle" );

			//===== Move characters into final positions
				//MoveToPlayer = GetLocalPlayerPawn().location - vector( Pawn_Leggett.rotation ) * 170.0f;
				//ACTION_WaitForPawnMoveTo( Pawn_Leggett, MoveToPlayer );
				//MoveToLeggett = Pawn_Leggett.location - vector( Pawn_Cole.rotation ) * 170.0f;

			//===== Set Absolute Time
				ResetAbsoluteTime();
				StartAbsoluteTime();

			//===== Mac, Leggett and Cole discuss where they are
		WaitForAbsoluteTime( 0.5 );
				//Pawn_Mac.controller.focus = GetLocalPlayerPawn();
		WaitForAbsoluteTime( 2.0 );
				Pawn_Mac.controller.focus = Pawn_Cole;
				ACTION_SetLookAtTarget( 'mac', Pawn_Cole, True );
				ACTION_PlayLipSyncSound('Mac',"D00130.MAC_Q", 1.0, 1.0, 1024.0, TRUE);				// ( 1.18 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_Q" ), 1.2 , 1, 1, 1, TRUE, TRUE );		// Mac: anybody know where we are?

		WaitForAbsoluteTime( 3.5 );
				Pawn_Cole.controller.focus = GetLocalPlayerPawn();
				ACTION_SetLookAtTarget( 'Pawn_Leggett', Pawn_Mac, True );
				ACTION_SetLookAtTarget( 'Pawn_Cole', Pawn_Mac, True );
				ACTION_PlayLipSyncSound('Pawn_Leggett',"D00130.LEGGETT_B", 1.0, 1.0, 1024.0, TRUE) - 0.5;		// ( 0.89 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "LEGGETT_B" ), 2.0, 1, 1, 1, TRUE, TRUE );		// Leggett: no idea

		WaitForAbsoluteTime( 5.0 );
				ACTION_PlayAnimWithQueueDirect( Pawn_Cole , 'Cole_gonna_ask_local' , 0.5 , 1.0 );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_E", 1.0, 1.0, 1024.0, TRUE) - 0.5;		// ( 0.66 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_E" ), 3.0, 1, 1, 1, TRUE, TRUE );		// Cole: I'll find out

		WaitForAbsoluteTime( 7.0 );
				ACTION_SetLookAtTarget( 'Pawn_Cole', Pawn_Leggett, True );
				sleep( ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_F", 1.0, 1.0, 1024.0, TRUE) );		// ( 0.65 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_F" ), 2.0, 1, 1, 1, TRUE, TRUE );		// Cole: Stay put

//=============================================================================
// DOOR SCENE
//=============================================================================
/*
			//===== Clear and add new 'focus' and 'look at'
				Pawn_Cole.Controller.Focus = None ;
				ACTION_ClearLookAtTarget( 'Pawn_Cole' );
				Pawn_Leggett.controller.focus = Pawn_Cole;
				ACTION_SetLookAtTarget( 'Pawn_Leggett', Pawn_Cole, True );

			//===== Cole walks to the door
				ACTION_MoveToward( Pawn_Cole , Path_03 , FALSE );

				While ( !PawnIsAtDestination( Pawn_Cole , Path_03 ) )
					{
							sleep( 0.2 );
					}

			//===== Set Absolute Time
				ResetAbsoluteTime();
				StartAbsoluteTime();

			//===== Cole bangs on the door
				ACTION_PlayAnimWithQueueDirect( Pawn_Cole , 'Cole_bangs_on_door' , 0.5 , 1.0 );

		WaitForAbsoluteTime( 0.8 );
				ACTION_PlaySound('doorlook',"IMPACTS.DOORKNOCK", 1.0, 1.0, 2048.0);
		WaitForAbsoluteTime( 1.2 );
				ACTION_PlaySound('doorlook',"IMPACTS.DOORKNOCK", 1.0, 1.0, 2048.0);
		WaitForAbsoluteTime( 1.6 );
				ACTION_PlaySound('doorlook',"IMPACTS.DOORKNOCK", 1.0, 1.0, 2048.0);
		WaitForAbsoluteTime( 2.5 );
				ACTION_PlaySound('doorlook',"IMPACTS.DOORKNOCK", 1.0, 1.0, 1024.0);

		WaitForAbsoluteTime( 4.8 );
				//ACTION_PlayAnimWithQueueDirect( Pawn_Cole , 'Cole_listens_to_woman' , 0.5 , 1.0 );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_G", 1.0, 1.0, 1024.0, TRUE);			// ( 0.53 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_G" ), 1.0, 1, 1, 1, TRUE, TRUE );		// Cole: Hello

			//===== Move Mac up a little bit
		WaitForAbsoluteTime( 6.0 );
				Pawn_Mac.Controller.Focus = None ;
/*				ACTION_MoveToward( Pawn_Mac , Path_04 , FALSE );

			//===== Set up idle animations
				ACTION_ClearPawnIdleQueue( 'Pawn_Mac' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'Mac_kicks_gate' );
				ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'Mac_kicks_gate' );
				//ACTION_AddAnimToPawnIdleQueue( 'Pawn_Mac', 'standing_wall_lean_left_idle_4' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Mac', FALSE );
*/
			//===== Cole talks to the French lady
				sleep( ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_H", 1.0, 1.0, 1024.0, TRUE) );		// ( 1.31 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_H" ), 3.4, 1, 1, 1, TRUE, TRUE );		// Cole: Je suis American
		WaitForAbsoluteTime( 7.4 );
				Pawn_Mac.controller.focus = Pawn_Cole;
				ACTION_PlaySound('doorlook',"D00130.FRENCH_A", 1.0, 1.0, 2048.0);					// ( 1.88 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "FRENCH_CHICK1" ), 4.0, 1, 1, 1, TRUE, TRUE );	// French: Please don't hurt us.
		WaitForAbsoluteTime( 9.4 );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_I", 1.0, 1.0, 1024.0, TRUE);			// ( 0.83 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_I" ), 1.1, 1, 1, 1, TRUE, TRUE );		// Cole: Americans.
		WaitForAbsoluteTime( 10.4 );
				ACTION_SetLookAtTarget( 'Mac', Pawn_Leggett, True);
		WaitForAbsoluteTime( 11.4 );
				ACTION_SetLookAtTarget( 'Pawn_Legget', Pawn_Mac, True);
		WaitForAbsoluteTime( 12.4 );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_J", 1.0, 1.0, 1024.0, TRUE);			// ( 1.10 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_J" ), 2.5, 1, 1, 1, TRUE, TRUE );		// Cole: What town is this?
				ACTION_SetLookAtTarget( 'Mac', Pawn_Cole, True);
		WaitForAbsoluteTime( 13.0 );
				ACTION_SetLookAtTarget( 'Pawn_Legget', Pawn_Cole, True);
				ACTION_PlaySound('doorlook',"D00130.FRENCH_B", 1.0, 1.0, 2048.0);					// ( 1.86 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "FRENCH_CHICK2" ), 4.0, 1, 1, 1, TRUE, TRUE );	// French: Please, please, you must go away from here!
		WaitForAbsoluteTime( 15.0 );

			//===== Cole questions his men
		WaitForAbsoluteTime( 16.5 );
				Pawn_Cole.bDoHeadTurn = FALSE;
				Pawn_Cole.Controller.Focus = Pawn_Leggett;
				ACTION_WaitForPawnRotateToward( Pawn_Cole );

			//===== Set Absolute Time
				ResetAbsoluteTime();
				StartAbsoluteTime();

				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_K", 1.0, 1.0, 1024.0, TRUE);			// ( 1.21 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_K" ), 2.5, 1, 1, 1, TRUE, TRUE );		// Cole: Any of yall know french?
		WaitForAbsoluteTime( 1.50 );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_L", 1.0, 1.0, 1024.0, TRUE);			// ( 2.34 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_L" ), 3.0, 1, 1, 1, TRUE, TRUE );		// Cole: I can't understand a GOD DAMN word she's jabbering


*/


						sleep( 1.0 );
					ACTION_SetLookAtTarget( 'Pawn_Cole' , Pawn_Mac , TRUE );
						sleep( 0.8 );
					ACTION_SetLookAtTarget( 'Pawn_Leggett' , Pawn_Mac , TRUE );
						sleep( 0.6 );
					Pawn_Cole.bDoHeadTurn = FALSE;
						sleep( 0.2 );
					ACTION_ClearLookAtTarget( 'Pawn_Cole' );

	// =======================================================================
	// Cole moves up to french woman's door
	// =======================================================================

				ACTION_Walk( 'Pawn_Cole' );
				ACTION_MoveToward( Pawn_Cole , Path_03 , FALSE );

						sleep( 0.4 );
					ACTION_SetLookAtTarget( 'Pawn_Leggett' , Pawn_Cole , TRUE );
						sleep( 0.3 );
					ACTION_SetLookAtTarget( 'Mac' , Pawn_Leggett , TRUE );
						sleep( 0.5 );

					Pawn_Leggett.Controller.Focus = Look_03;
						sleep( 0.4 );
					
					Pawn_Mac.bDoHeadTurn = TRUE ;
					ACTION_SetLookAtTarget( 'Mac' , Look_04 , TRUE );
					Pawn_Mac.Controller.Focus = Look_02;

			//===== Cole is at French woman's door
				Pawn_Cole.Controller.Focus = Look_02;
				ACTION_WaitForPawnRotateToward( Pawn_Cole );

					sleep( 0.4 );
				ACTION_PlayAnimWithQueueDirect( Pawn_Cole , 'standing_idle_relaxed_1', 0.3, 1.0 , , , 2 );
					sleep( 0.6 );
				ACTION_PlayAnimDirect( Pawn_Cole , 'Cole_bangs_on_door', 0.4 , 1.0 );
					sleep( 1.2 );
				ACTION_PlaySound( 'Look_French_Door' ,"IMPACTS.DOORKNOCK", 1.0, 1.0, 2048.0);
					sleep( 0.4 );

				ACTION_SetLookAtTarget( 'Pawn_Leggett' , GetFirstActor( 'LeggetLookDown' ), TRUE );
				ACTION_PlaySound( 'Look_French_Door' ,"IMPACTS.DOORKNOCK", 1.0, 1.0, 2048.0);
					sleep( 0.7 );
				ACTION_PlaySound( 'Look_French_Door' ,"IMPACTS.DOORKNOCK", 1.0, 1.0, 1024.0);
					sleep( 2.4 );
					
				ACTION_PlayAnimWithQueueDirect( Pawn_Cole , 'standing_idle_relaxed_7' , 0.2 , 1.0 ); 
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_G" ), 0.6 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_G", 1.0, 1.0, 1024.0, TRUE);					// ( 0.53 )
					// Cole: Hello

						sleep( 0.8 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_H" ), 1.4 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_H", 1.0, 1.0, 1024.0, TRUE);					// ( 1.31 )
					// Cole: Jesuis American

						sleep( 0.3 );
					Pawn_Cole.bDoHeadTurn = TRUE;
					ACTION_SetLookAtTarget( 'Pawn_Cole' , Look_02 , TRUE );
						sleep( 0.5 );
					ACTION_SetLookAtTarget( 'Pawn_Leggett' , Pawn_Mac , TRUE );
						sleep( 1.0 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "FRENCH_CHICK1" ), 1.9 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlaySound( 'Look_French_Door' ,"D00130.FRENCH_A", 1.0, 1.0, 2048.0);				// ( 1.88 )
					// French: Please don't hurt us.

						sleep( 0.4 );
					ACTION_SetLookAtTarget( 'Pawn_Leggett' , Pawn_Cole , TRUE );
						sleep( 0.5 );
					ACTION_ClearLookAtTarget( 'Pawn_Cole' );
						sleep( 1.0 );
					Pawn_Mac.bDoHeadTurn = TRUE ;
					ACTION_SetLookAtTarget( 'Mac' , Pawn_Cole , TRUE );
						sleep( 0.5 );

				ACTION_PlayAnimWithQueueDirect( Pawn_Cole , 'standing_idle_relaxed_4' , 0.5 , 1.0 ); 
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_I" ), 0.9 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_I", 1.0, 1.0, 1024.0, TRUE);					// ( 0.83 )
					// Cole: Americans.

						sleep( 1.0 );
					ACTION_SetLookAtTarget( 'Pawn_Leggett' , Look_03 , TRUE );
						sleep( 0.6 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_J" ), 1.1 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound( 'Pawn_Cole' ,"D00130.COLE_J", 1.0, 1.0, 1024.0, TRUE);				// ( 1.10 )
					// Cole: What town is this?

						sleep( 0.6 );
					Pawn_Mac.bDoHeadTurn = TRUE ;
					ACTION_SetLookAtTarget( 'Mac' , Look_04 , TRUE );
						sleep( 0.8 );
					Pawn_Cole.bDoHeadTurn = TRUE;
					ACTION_SetLookAtTarget( 'Pawn_Cole' , Look_02 , TRUE );
						sleep( 0.4 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "FRENCH_CHICK2" ), 1.9 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlaySound( 'Look_French_Door' ,"D00130.FRENCH_B", 1.0, 1.0, 2048.0);				// ( 1.86 )
					// French: Please, please, you must go away from here!

				Pawn_Cole.Controller.Focus = Look_05;
				ACTION_WaitForPawnRotateToward( Pawn_Cole );

				ACTION_PlayAnimDirect( Pawn_Cole , 'standing_chatting_3', 0.5, 1.0 , False, , , 2 );			
						sleep( 1.2 );
					ACTION_SetLookAtTarget( 'Pawn_Cole' , Pawn_Mac , TRUE );
						sleep( 1.5 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_K" ), 1.2 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_K", 1.0, 1.0, 1024.0, TRUE);					// ( 1.21 )
					// Cole: Any of yall know french?

						sleep( 0.3 );
					Pawn_Mac.bDoHeadTurn = TRUE ;
					ACTION_SetLookAtTarget( 'Mac' , Pawn_Cole , TRUE );
						sleep( 0.4 );
					Pawn_Cole.bDoHeadTurn = TRUE;
					ACTION_SetLookAtTarget( 'Pawn_Leggett' , Pawn_Cole , TRUE );
						sleep( 0.6 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_L" ), 2.4 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_L", 1.0, 1.0, 1024.0, TRUE);					// ( 2.34 )
					// Cole: I can't understand a GOD DAMN word she's jabbering






						sleep( 0.9 );
				Pawn_Cole.bDoHeadTurn = FALSE ;
				Pawn_Cole.Controller.Focus = Pawn_Leggett ;
				Pawn_Cole.bNoTurnBody = TRUE ;
				ACTION_PlayAnimDirect( Pawn_Cole , 'Cole_who_speaks_french', 0.5, 1.0 , False, , , 2 );			// ( 7.65 )
						sleep( 0.3 );
					ACTION_SetLookAtTarget( 'Pawn_Leggett' , Pawn_Mac , TRUE );
						sleep( 0.8 );
					ACTION_SetLookAtTarget( 'Mac' , Pawn_Leggett , TRUE );
						sleep( 0.5 );
					ACTION_SetLookAtTarget( 'Pawn_Cole', Pawn_Leggett , True );
					ACTION_SetLookAtTarget( 'Pawn_Leggett' , Pawn_Cole , TRUE );

				ACTION_PlayAnimDirect( Pawn_Leggett , 'Legs_speaks_French', 0.2 , 1.2 );	
				ACTION_DisplaySubTitleMessage2( S_Localize( "LEGGETT_C" ), 1.1 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Leggett',"D00130.LEGGETT_C", 1.0, 1.0, 1024.0, TRUE);				// ( 1.06 )
					// Leggett: I speak a bit sir

						sleep( 1.2 );
					ACTION_SetLookAtTarget( 'Mac' , Pawn_Cole , TRUE );
						sleep( 0.8 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_M" ), 2.5, 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_M", 1.0, 1.0, 1024.0, TRUE);					// ( 1.69 )
					// Cole: Then get your ass over here son

						sleep( 0.4 );

	// =======================================================================
	// Leggett moves up to french woman's door
	// =======================================================================

					sleep( 1.3 );
				ACTION_MoveToward( Pawn_Leggett , Path_05 , FALSE , Look_02 );

					sleep( 3.0 );
				ACTION_PlayAnimDirect( Pawn_Cole , 'standing_idle_relaxed_2', 0.5 , 1.0, TRUE, , , 1 );
					sleep( 0.5 );
				ACTION_PlayAnimDirect( Pawn_Leggett , 'standing_idle_relaxed_4', 0.2 , 1.0 );	
					sleep( 1.5 );
				Pawn_Leggett.Controller.Focus = Look_02;
				ACTION_WaitForPawnRotateToward( Pawn_Leggett );

				ACTION_PlayAnimDirect( Pawn_Leggett , 'Legs_listens', 0.2 , 1.0 );						// ( 11.17 )	

					sleep( 0.4 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "LEGGETT_D" ), 3.1, 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Leggett',"D00130.LEGGETT_D", 1.0, 1.0, 1024.0, TRUE);				// ( 3.01 )
					// Leggett: Can you tell us where we are?

						sleep( 3.5 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "FRENCH_CHICK3" ), 1.6 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlaySound( 'Look_French_Door' ,"D00130.FRENCH_C", 1.0, 1.0, 2048.0);						// ( 1.54 )
					// French Woman: Just outside of St. Mere Eglise.

						sleep( 2.0 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "LEGGETT_E" ), 3.0 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound( 'Pawn_Leggett' ,"D00130.LEGGETT_E", 1.0, 1.0, 1024.0, TRUE);				// ( 2.99 )
					// Leggett: Uh, she says we are just Northeast of St. Mere Eglise.

						sleep( 3.2 );

				ACTION_PlayAnimDirect( Pawn_Cole , 'Cole_says_damnit', 0.5 , 1.0 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_N" ), 0.6 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_N", 1.0, 1.0, 1024.0, TRUE);					// ( 0.49 )
					//	Cole: Dammit.

						sleep( 0.7 );

				ACTION_PlayAnimDirect( Pawn_Leggett , 'standing_chatting_2', 0.5, 1.0 , TRUE );

			//===== Cole turns towards the group

				ACTION_PlayAnimDirect( Pawn_Cole , 'standing_chatting_4', 0.5, 1.0 , TRUE );

					Pawn_Cole.bDoHeadTurn = TRUE;
					ACTION_SetLookAtTarget( 'Pawn_Cole' , Pawn_Leggett , TRUE );

						sleep( 0.5 );
				Pawn_Leggett.Controller.Focus = Look_03;

				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_O" ), 1.5 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_O", 1.0, 1.0, 1024.0, TRUE);					// ( 1.44 )
					//	Cole: Well we're headed in the wrong direction.

						sleep( 0.8 );
					Pawn_Cole.bDoHeadTurn = TRUE;
					ACTION_SetLookAtTarget( 'Pawn_Cole' , Pawn_Mac , TRUE );
						sleep( 0.8 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_Q" ), 2.0 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_Q", 1.0, 1.0, 1024.0, TRUE);					// ( 1.97 )
					//	Cole: I'm going to see if I can gather some more guys.

						sleep( 0.7 );
					Pawn_Cole.bDoHeadTurn = TRUE;
					ACTION_SetLookAtTarget( 'Pawn_Cole' , GetLocalPlayerPawn() , TRUE );
						sleep( 1.2 );

					Pawn_Cole.bDoHeadTurn = TRUE;
					ACTION_SetLookAtTarget( 'Pawn_Cole' , Pawn_Leggett , TRUE );
						sleep( 0.2 );

				ACTION_PlayAnimDirect( Pawn_Cole , 'Mac_says_shove_a_sock', 0.2 , 1.1 , False);
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_S" ), 4.1 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_S", 1.0, 1.0, 1024.0, TRUE);					// ( 4.02 )
					//	Cole: Y'all head that way through that gate and link up with anyone else you find as you head East.

						sleep( 3.0 );
					Pawn_Cole.bDoHeadTurn = TRUE;
					ACTION_SetLookAtTarget( 'Pawn_Cole' , Pawn_Mac , TRUE );
						sleep( 1.2 );

	
						sleep( 2.0 );

				Pawn_Cole.bNoTurnBody = FALSE ;
				Pawn_Cole.Controller.Focus = GetLocalPlayerPawn() ;

					Pawn_Cole.bDoHeadTurn = TRUE;
					ACTION_ClearLookAtTarget( 'Pawn_Cole' );

				ACTION_ChangeController( 'mac', class'mind');
				ACTION_ChangeController( 'Pawn_Leggett', class'mind');

				ACTION_OrderMove( 'USAFireTeam1', 'MacPathGate' );
				ACTION_OrderMove( 'USAFireTeam1linkup', 'MacPathGate' );

				ACTION_MoveToward( Pawn_Cole , Path_04 , FALSE );

						sleep( 2.0 );

			//===== Cole turns to face Leggett, and then the player
				Pawn_Cole.Controller.Focus = Pawn_Leggett;
				ACTION_WaitForPawnRotateToward( Pawn_Cole );
				Pawn_Cole.bDoHeadTurn = TRUE;
				ACTION_SetLookAtTarget( 'Pawn_Cole', Pawn_Leggett , True );

				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_T" ), 0.8 , 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_T", 1.0, 1.0, 1024.0, TRUE);					// ( 0.70 )
					//	Cole: Stay alive.

						sleep( 0.5 );
					Pawn_Leggett.bDoHeadTurn = TRUE ;
					ACTION_SetLookAtTarget( 'Pawn_Leggett', GetLocalPlayerPawn() , True );
						sleep( 0.4 );
					ACTION_SetLookAtTarget( 'Pawn_Cole' , GetLocalPlayerPawn() , TRUE );


				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_U" ), 0.8, 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_U", 1.0, 1.0, 1024.0, TRUE);					// ( 0.76 )
					//	Cole: That's an order!

				ACTION_FadeOverlay( GetLocalPlayerController(), 1, 2.0 );
						sleep( 1.0 );
				ACTION_SaveMemoryReport( "eagles_end" );
				ACTION_DisplayMapStats();




/*


		WaitForAbsoluteTime( 4.50 );
				ACTION_PlayAnimWithQueue( 'Pawn_Leggett', 'Legs_speaks_French', 0.2, 1.0,,,1);
				ACTION_PlayLipSyncSound('Pawn_Leggett',"D00130.LEGGETT_C", 1.0, 1.0, 1024.0, TRUE);		// ( 1.06 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "LEGGETT_C" ), 2.5, 1, 1, 1, TRUE, TRUE );		// Leggett: I speak a bit sir
		WaitForAbsoluteTime( 5.50 );	
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_M", 1.0, 1.0, 1024.0, TRUE);			// ( 1.69 )			
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_M" ), 2.5, 1, 1, 1, TRUE, TRUE );		// Cole: Then get your ass over here son
		WaitForAbsoluteTime( 7.70 );
				Pawn_Leggett.Controller.Focus = None ;
				Pawn_Cole.bDoHeadTurn = TRUE;
				ACTION_ClearLookAtTarget( 'Pawn_Leggett' );
				ACTION_MoveToward( Pawn_Leggett , Path_05 , FALSE );

				While ( !PawnIsAtDestination( Pawn_Leggett , Path_05 ) )
					{
							sleep( 0.2 );
					} 

			//===== Set Absolute Time
				ResetAbsoluteTime();
				StartAbsoluteTime();

			//===== Leggett talks to the lady
				ACTION_SetLookAtTarget( 'Pawn_Legget', getFirstActor('LeggetLookDown'), True );
				ACTION_PlayLipSyncSound('Pawn_Leggett',"D00130.LEGGETT_D", 1.0, 1.0, 1024.0, TRUE);		// ( 3.01 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "LEGGETT_D" ), 3.7, 1, 1, 1, TRUE, TRUE );		// Leggett: Can you tell us where we are?
		WaitForAbsoluteTime( 4.0 );
				ACTION_PlaySound('doorlook',"D00130.FRENCH_C", 1.0, 1.0, 2048.0);					// ( 1.54 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "FRENCH_CHICK3" ), 3.0, 1, 1, 1, TRUE, TRUE );	// French Woman: Just outside of St. Mere Eglise.
		WaitForAbsoluteTime( 6.0 );
				Pawn_Leggett.Controller.Focus = Pawn_Cole ;
				ACTION_PlayAnimWithQueueDirect( Pawn_Leggett, 'Standing_chatting_4', 0.5 , 1.0 );
		WaitForAbsoluteTime( 7.0 );
				ACTION_PlayLipSyncSound('Pawn_Leggett',"D00130.LEGGETT_E", 1.0, 1.0, 1024.0, TRUE);		// ( 2.99 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "LEGGETT_E" ), 2.5, 1, 1, 1, TRUE, TRUE );		// Leggett: Uh, she says we are just Northeast of St. Mere Eglise.
		WaitForAbsoluteTime( 11.5 );
				ACTION_PlayAnimWithQueueDirect( Pawn_Cole, 'Cole_says_damnit', 0.5 , 1.0 );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_N", 1.0, 1.0, 1024.0, TRUE);				// ( 0.49 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_N" ), 1.0, 1, 1, 1, TRUE, TRUE );		// Cole: Dammit.
		WaitForAbsoluteTime( 13.0 );
				Pawn_Cole.controller.focus = GetLocalPlayerPawn();
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_O", 1.0, 1.0, 1024.0, TRUE);			// ( 1.44 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_O" ), 2.0, 1, 1, 1, TRUE, TRUE );		//	Cole: Well we're headed in the wrong direction.
		WaitForAbsoluteTime( 15.0 );
				//Pawn_Leggett.Controller.Focus = Pawn_Mac ;
				ACTION_PlayAnimWithQueueDirect( Pawn_Cole , 'Cole_gonna_ask_local' , 0.5 , 1.0 );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_Q", 1.0, 1.0, 1024.0, TRUE);			// ( 1.97 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_Q" ), 3.0, 1, 1, 1, TRUE, TRUE );		//	Cole: I'm going to see if I can gather some more guys.
		WaitForAbsoluteTime( 17.0 );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_S", 1.0, 1.0, 1024.0, TRUE);				// ( 4.02 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_S" ), 4.0, 1, 1, 1, TRUE, TRUE );		//	Cole: Y'all head that way through that gate and link up with anyone else you find as you head East.
				ACTION_SetLookAtTarget( 'Pawn_Cole', Pawn_Mac, True);
		WaitForAbsoluteTime( 19.0 );
				ACTION_SetLookAtTarget( 'Pawn_Cole', Pawn_Leggett, True);
		WaitForAbsoluteTime( 21.0 );

//=============================================================================
// ENDING
//=============================================================================
				ACTION_ChangeController( 'mac', class'mind');
				ACTION_ChangeController( 'Pawn_Leggett', class'mind');

				ACTION_OrderMove( 'USAFireTeam1', 'MacPathGate' );
				ACTION_OrderMove( 'USAFireTeam1linkup', 'MacPathGate' );

			//===== Set Absolute Time
				ResetAbsoluteTime();
				StartAbsoluteTime();

			//===== Cole out
		WaitForAbsoluteTime( 2.0 );
				//ACTION_Walk( 'Pawn_Cole' );
				//MoveToPlayer = GetLocalPlayerPawn().location - vector( Pawn_Cole.rotation ) * 100.0f;
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_T", 1.0, 1.0, 1024.0, TRUE);			// ( 0.70 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_T" ), 1.6, 1, 1, 1, TRUE, TRUE );		//	Cole: Stay alive.
		WaitForAbsoluteTime( 2.7 );
				ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_U", 1.0, 1.0, 1024.0, TRUE);				// ( 0.76 )
				ACTION_DisplaySubTitleMessage2( S_Localize( "COLE_U" ), 1.8, 1, 1, 1, TRUE, TRUE );		//	Cole: That's an order!
		WaitForAbsoluteTime( 4.0 );
				ACTION_FadeOverlay( GetLocalPlayerController(), 1, 2.0 );
		WaitForAbsoluteTime( 10.0 );
				ACTION_SaveMemoryReport( "eagles_end" );
				ACTION_DisplayMapStats();

*/
	}
