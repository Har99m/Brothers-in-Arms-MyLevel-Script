//=============================================================================
// Bomberman.
//=============================================================================
class Bomberman extends TriggeredScript
	placeable;

var float DistanceMe;
var bool PlayerNear;
var AnimPawn MacPawn , LeggettPawn;
var ActorLite MacNode;
var ActorLite LeggettNode;
var AAKill2_Script AAKS_Ref;

function CheckMacDistance( float DistanceVal )
	{
		DistanceMe = vSize(MacPawn.location - GetLocalPlayerPawn().location);

		if ( DistanceMe > DistanceVal )
			PlayerNear = false;
		else
			PlayerNear = True;
	}

State Triggered
	{
		Begin:

				AAKS_Ref = AAKill2_Script( GetFirstActor('AAKill2_Script') );
				MacPawn = AnimPawn( getPawn( 'Mac' ));
				LeggettPawn = AnimPawn( getPawn( 'Legget' ));

				ACTION_SetAnimSetDirect( MacPawn , "a_cin_d0_Screaming_Eagles.a_cin_d0_Screaming_Eagles" );
				ACTION_SetAnimSetDirect( MacPawn , "a_hold_rifle.a_hold_rifle" );

			//===== Mac to SC
				ACTION_Run( 'Mac' );
					sleep( 0.5 );
				ACTION_ChangeController('Mac',class'ScriptedController');
				ACTION_SetAnimSetDirect( MacPawn , "a_hold_rifle.a_hold_rifle" );
			//===== Leggett to SC
				ACTION_Run( 'Legget' );
					sleep( 0.5 );
				ACTION_ChangeController('Legget',class'ScriptedController');
				ACTION_SetAnimSetDirect( LeggettPawn , "a_hold_rifle.a_hold_rifle" );
					sleep( 2.0 );
				ACTION_Run( 'Legget' );
				ACTION_ClearPawnIdleQueue( 'legget' );
				ACTION_AddAnimToPawnIdleQueue( 'legget', 'standing_idle_combat_4' );
				ACTION_AddAnimToPawnIdleQueue( 'legget', 'standing_idle_combat_1' );
				ACTION_AddAnimToPawnIdleQueue( 'legget', 'standing_idle_combat_3' );
				ACTION_PlayAnimFromPawnIdleQueue( 'legget', False );

					sleep( 0.5 );

			//===== Check if last AA gun was already destroyed, if so go to correct script area
				If ( AAKill2_Script( GetFirstActor('AAKill2_Script') ).Flak2Kill == True )
					{
						Goto('AlreadyKilled');
					}

			//===== Move Mac next to wall
				ACTION_ClearPawnIdleQueue( 'Mac' );
				ACTION_Run( 'Mac' );
				ACTION_SetDesiredSpeed( 'Mac' , 1.0 );
				MacPawn.controller.focus = None ;
				MacNode = GetNavigationPoint('g32');
					sleep( 1.0 );
				ACTION_MoveToward( MacPawn, MacNode, FALSE );

			//===== Move Leggett to wall to be covered from AA explosion
				LeggettPawn.controller.focus = NONE;
				ACTION_Run( 'Legget' );
				LeggettNode = GetNavigationPoint('leggettOutroWall');
				ACTION_MoveToward( LeggettPawn, LeggettNode, FALSE , getFirstActor('AA2Point'));

			//===== Wait for Mac to reach his destination
				While ( !PawnIsAtDestination( MacPawn, MacNode ) )
					{
						sleep( 0.5 );
					}

					sleep( 0.2 );
				MacPawn.controller.focus = GetLocalPlayerPawn() ;
				ACTION_SetLookAtTarget( 'Mac', GetLocalPlayerPawn(), True );
				ACTION_ClearPawnIdleQueue( 'mac' );
				ACTION_AddAnimToPawnIdleQueue( 'mac', 'standing_idle_relaxed_1' );
				ACTION_AddAnimToPawnIdleQueue( 'mac', 'standing_idle_relaxed_3' );
				ACTION_AddAnimToPawnIdleQueue( 'mac', 'standing_idle_relaxed_4' );
				ACTION_PlayAnimFromPawnIdleQueue( 'mac', False );
				ACTION_WaitForPawnRotateToward( MacPawn );

			//===== Mac tells Baker to blow up the gun
				MacPawn.bNoTurnBody = TRUE ;
				ACTION_PlayAnimWithQueueDirect( MacPawn , 'Mac_says_shove_a_sock', 0.5 , 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_ZE" ), 4.0, 1, 1, 1, TRUE, TRUE );
				sleep( ACTION_PlayLipSyncSound('Mac',"D00130.MAC_ZE", 1.0, 1.0, 1024.0, TRUE) );
					//	Mac: Baker disable that gun with some TNT so we can get the hell out of here.

				MacPawn.bNoTurnBody = FALSE ;

			//===== Update objectives
				ACTION_SetObjectiveStatus( 1, OI_INACTIVE, 'ObjectiveList' );
				ACTION_SetObjectiveStatus( 2, OI_ACTIVE, 'ObjectiveList' );
				ACTION_DisplayObjective( 2, 'ObjectiveList', 4.0 );

			//===== Move Mac behind wall with Leggett for cover
				ACTION_Run( 'Mac' );
				ACTION_SetDesiredSpeed( 'Mac' , 1.0 );
				ACTION_ClearPawnIdleQueue( 'Mac' );
				MacNode = GetNavigationPoint('Mac33');
				ACTION_MoveToward( MacPawn, MacNode, FALSE , getFirstActor('AA2Point'));

				While ( AAKill2_Script( GetFirstActor('AAKill2_Script') ).Flak2Kill == False )
					{
						sleep( 0.5 );
					}

		AlreadyKilled:

			//===== Second gun destroyed, objective complete
				ACTION_SetObjectiveStatus( 1, OI_ACTIVE, 'ObjectiveList' );
				ACTION_SetObjectiveStatus( 2, OI_COMPLETE, 'ObjectiveList' );

			//===== Turn to scripted controllers
				ACTION_Run( 'Mac' );
					sleep( 0.2 );
				ACTION_ChangeController('Mac',class'ScriptedController');
				ACTION_SetAnimSetDirect( MacPawn , "a_hold_rifle.a_hold_rifle" );
				ACTION_Run( 'Legget' );
					sleep( 0.2 );
				ACTION_ChangeController('Legget',class'ScriptedController');
				ACTION_SetAnimSetDirect( LeggettPawn , "a_hold_rifle.a_hold_rifle" );
				ACTION_Run( 'Mac' );
				ACTION_Run( 'Legget' );

					sleep( 2.0 );

				WarGamePawn(LeggettPawn).eWeaponAimedState = WAS_Relaxed;
	
			//===== Move Mac first then Leggett to outro positions

				MacNode = GetNavigationPoint('OutroSpot1');
				LeggettNode = GetNavigationPoint('OutroSpot3');

				ACTION_MoveToward( MacPawn, MacNode, TRUE );
					sleep( 1.5 );
				ACTION_MoveToward( LeggettPawn, LeggettNode, TRUE );
	
			//===== Wait for Mac to reach his outro position
				While ( !PawnIsAtDestination( MacPawn, MacNode ) )
					{
						sleep( 0.5 );
					}

					sleep( 0.2 );
				MacPawn.Controller.Focus = GetLocalPlayerPawn();
				ACTION_SetLookAtTarget( 'Mac', GetLocalPlayerPawn(), True );

			//===== Wait for Leggett to reach his outro position
				While ( !PawnIsAtDestination( LeggettPawn, LeggettNode ) )
					{
						sleep( 0.5 );
					}

					sleep( 0.2 );

				ACTION_ClearPawnIdleQueue( 'legget' );
				ACTION_AddAnimToPawnIdleQueue( 'legget', 'standing_idle_relaxed_4' );
				ACTION_AddAnimToPawnIdleQueue( 'legget', 'standing_idle_relaxed_1' );
				ACTION_AddAnimToPawnIdleQueue( 'legget', 'standing_idle_relaxed_3' );
				ACTION_PlayAnimFromPawnIdleQueue( 'legget', False );

				LeggettPawn.Controller.Focus = GetLocalPlayerPawn();
				ACTION_SetLookAtTarget( 'Legget', GetLocalPlayerPawn(), True );
				ACTION_TriggerEvent( 'beacon_aa' );
				gbxFollowBeacon(getFirstActor('macbeacon')).bEnabled = True;

				ACTION_DisplayObjectiveHint( S_Localize( "HINT_I" ), 4.0 );
					//	Hint: Meet with Mac to end your mission.

			//===== Set weapon states relaxed
				WarGamePawn(MacPawn).eWeaponAimedState = WAS_Relaxed;
				WarGamePawn(LeggettPawn).eWeaponAimedState = WAS_Relaxed;

			//===== Wait until the player gets close to Mac
				do	{
						CheckMacDistance( 400.0 );
						sleep( 0.5 );
					} until ( PlayerNear );

			//===== Player should be at Mac's position, lock the player and rotate Mac toward the player's position
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_HideHUD( GetLocalPlayerController(), true );
  				ACTION_LimitPlayerInput( GetLocalPlayerController(), true );

				ACTION_WaitForPawnRotateToward(MacPawn);
					sleep( 0.5 );

				ACTION_SetLookAtTarget( 'Mac', GetLocalPlayerPawn(), True );
				ACTION_SetLookAtTarget( 'Leggett', MacPawn, True );

				ACTION_PlayAnimWithQueueDirect( MacPawn ,'standing_chatting_2', 0.5 , 1.0 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_ZF" ), 6.0, 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Mac',"D00130.MAC_ZF", 1.0, 1.0, 1024.0, TRUE);
					//	Mac: We can't stop to rest now.  The 4th Infantry Division is coming up through Utah Beach, and there are Germans all over that area.	// ( 7.07 )

					sleep( 4.0 );
			//===== Mac moves into combat ready pose
				ACTION_PlayAnimDirect( MacPawn , 'standing_idle_to_combat_2' , 0.5 , 1.0 );				// ( 3.11 )
					ACTION_WaitForAnimEnd( MacPawn , 0 );

				ACTION_DetachWeapon( MacPawn , '' );
				ACTION_AttachStaticMesh( MacPawn , StaticMesh's_npc_weapon_us.us_thompson', 'rifle_hold_lefthand' );

				ACTION_PlayAnimDirect( MacPawn , 'standing_gesture_move' , 0.5 , 1.0 );					// ( 1.60 )
					sleep( 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_ZG" ), 2.0, 1, 1, 1, TRUE, TRUE );
				ACTION_PlayLipSyncSound('Mac',"D00130.MAC_ZG", 1.0, 1.0, 1024.0, TRUE);					// ( 0.60 )
					//	Mac: Let's move.

					ACTION_WaitForAnimEnd( MacPawn , 0 );
				ACTION_PlayAnimDirect( MacPawn , 'standing_idle_combat_5' , 0.5 , 1.0 , TRUE );
					sleep( 1.0 );

			//===== End the map
				ACTION_SaveMemoryReport( "SE_Outro" );
				ACTION_DisplayMapStats();
	}
