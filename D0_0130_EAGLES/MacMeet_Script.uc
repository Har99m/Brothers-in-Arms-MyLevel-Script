//=============================================================================
// MacMeet_Script.
//=============================================================================
class MacMeet_Script extends TriggeredScript
	placeable;

var AnimPawn AP_Mac;
var AnimPawn German_01 , German_02 ;

var int MacTrigCount;

var vector MoveToLocation;  // the location in front of the player where Mac runs to
var Vector NewVect;			// The New Vector For Mac to Run too

var MacMeetShoot_Script MSS_Ref;

var bool bGerman_Mind;
var bool shotsFired;
var bool readyToDismount;
var bool MacFireNow;
var bool PlayerWantsPistol;

var actor Mac45 , Mesh_K98 , Knife ;
var actor MacMap ;
var actorLite MacNode, LeggettNode, ColeNode, FreeNode;
var ActorLite Dest_Walk , Dest_Corner;
var bool PlayerNear;
var float DistanceMe;


Function CheckMacDistance( int DistanceVal )
{
	DistanceMe = vSize(AP_Mac.location - GetLocalPlayerPawn().location);

	if ( DistanceMe > DistanceVal )
		PlayerNear = False;
	else
		PlayerNear = True;
}


State Triggered
{
	function OnTrigger()
	{
		GotoState( 'SeeBaker' );
	}

Begin:
	MacMap = GetFirstActor('MacMapMesh');
	MacTrigCount = 0;

	MSS_Ref = MacMeetShoot_Script( GetFirstActor( 'MacMeetShoot_Script' ));

	ACTION_DestroyActor('FakeRun21');
	ACTION_DestroyActor('FakeRun22');
	ACTION_DestroyActor('FakeRun23');
		sleep(0.2);	
	ACTION_DestroyActor('FakeRun1');
	ACTION_DestroyActor('FakeRun2');
	ACTION_DestroyActor('FakeRun3');

	ACTION_DestroyActor('Static1');
	
	//===== Spawn Mac and put him in an idling loop
	ACTION_TriggerEvent( 'Macspawn' );
	AP_Mac = AnimPawn( GetPawn( 'mac' ) );
	Mac45 = GetFirstActor( 'Mac45Mesh' );
	AP_Mac.AttachToBone( Mac45, 'colt_chest' );
	ACTION_SetRepelBullets( 'Mac' , TRUE );
	AP_Mac.controller.bDemiGod = TRUE;
	Knife = GetFirstActor( 'Mesh_Knife' );
	Mesh_K98 = GetFirstActor( 'Mesh_K98' );

		sleep( 1.5 );

	ACTION_SetAnimSetDirect( AP_Mac , "a_cin_d0_Screaming_Eagles.a_cin_d0_Screaming_Eagles" );
	ACTION_SetAnimSetDirect( AP_Mac , "a_hold_rifle.a_hold_rifle" );
		sleep(0.5);

	ACTION_ClearPawnIdleQueue( 'mac' );
	ACTION_AddAnimToPawnIdleQueue( 'mac', 'standing_wall_lean_left_idle' );
	ACTION_AddAnimToPawnIdleQueue( 'mac', 'standing_wall_lean_left_idle_2' );
	ACTION_AddAnimToPawnIdleQueue( 'mac', 'standing_wall_lean_left_idle_3' );
	ACTION_AddAnimToPawnIdleQueue( 'mac', 'standing_wall_lean_left_idle_4' );
	ACTION_PlayAnimFromPawnIdleQueue( 'mac', False );
}

State SeeBaker
{
	function OnTrigger()
	{
		ACTION_TriggerEvent('GermanWalkback_script');
		ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
	}

Begin:
	ACTION_TriggerEvent('GermanWalkback_script');

	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

	PlayerWantsPistol = True;

	ACTION_ClearPawnIdleQueue( 'mac' );
	AP_Mac.bNoTurnBody = True;

	ACTION_PlayAnimDirect( AP_Mac , 'standing_wall_lean_left_dismount_to_standing', 0.2, 1.1, False);
	ACTION_WaitForAnimEnd( AP_Mac ,0 );

	WargamePawn( AP_Mac ).CompleteCornerDismount();
	
	ACTION_PlayAnimDirect( AP_Mac , 'standing_idle_combat_1', 0.0, 1.0, True );		
		sleep ( 1.0 );
	AP_Mac.bDoHeadTurn = TRUE ;
	ACTION_SetLookAtTarget( 'mac', GetLocalPlayerPawn(), TRUE );
	//ACTION_DisplaySubtitleMessage2( S_Localize("MAC_HA"), 1.0, 1, 1, 1, TRUE, TRUE );
	//sleep( ACTION_PlayLipSyncSound('Mac',"D_MAC.BAKER_A", 1.0, 1.0, 4096.0, True ) );
	//	Mac: Baker!

	AP_Mac.bNoTurnBody = False;
	AP_Mac.controller.focus = GetLocalPlayerPawn();

	ACTION_SetDesiredSpeed('mac',0.43);

	//ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_H" ), 3.0, 1, 1, 1, TRUE, TRUE );
	//sleep( ACTION_PlayLipSyncSound('Mac',"D00130.MAC_H", 1.0, 1.0, 4096.0, True ) - 1.0 );		// ( 1.36 )
	// Mac: "Where the hell is all your gear?"

		sleep(0.3);
	MoveToLocation = GetLocalPlayerPawn().location - vector( AP_Mac.rotation ) * 170.0f;

	ACTION_WaitForPawnMoveTo( AP_Mac, MoveToLocation );
		sleep(0.2);
	AP_Mac.Controller.Focus = GetLocalPlayerPawn();
	ACTION_SetLookAtTarget( 'Mac', GetLocalPlayerPawn(), TRUE );
	ACTION_WaitforPawnRotateToward( AP_Mac );

	GotoState('MeetBaker');
}

State MeetBaker
{
	function OnTrigger()
	{
		//this is triggered when the player LOOKS at mac.
		PlayerWantsPistol = True;
	}

Begin:
	//===== Mac should be close enough for the player to not notice beacons updating
	ACTION_TriggerEvent( 'beacon_crossroad' );
	ACTION_TriggerEvent( 'MSG_Waypoint_End' );

	ACTION_PlayAnimDirect( AP_Mac, 'standing_chatting_1', 0.3, 1.4, False );

	ACTION_DisplaySubtitleMessage2( S_Localize("MAC_HA"), 1.0, 1, 1, 1, TRUE, TRUE );
		sleep( ACTION_PlayLipSyncSound('Mac',"D_MAC.BAKER_A", 1.0, 1.0, 4096.0, True ) );
	//	Mac: Baker!

	ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_H" ), 3.0, 1, 1, 1, TRUE, TRUE );
		sleep( ACTION_PlayLipSyncSound('Mac',"D00130.MAC_H", 1.0, 1.0, 4096.0, True ) );	
	// Mac: "Where the hell is all your gear?"

		sleep( 1.0 );

	ACTION_PlayLipSyncSound('Mac',"D00130.MAC_I", 1.0, 1.0, 1024.0, True );
	ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_I" ), 4.5, 1, 1, 1, TRUE, TRUE );
	// Mac: "Well shit, take my 45 and shoot anything wearing grey."

		sleep( 1.0 );

	ACTION_PlayAnimDirect( AP_Mac, 'Mac_offers_45_mount', 0.5, 1.0, False );
		sleep(0.51);
	ACTION_ReattachWeapon( AP_Mac, 'thompson_left_eagles' );
		sleep( 1.49 );
	AP_Mac.AttachToBone( Mac45, 'pistol_hold' );

	ACTION_WaitForAnimEnd( AP_Mac, 0 );
	ACTION_PlayAnimDirect( AP_Mac, 'Mac_offers_45_idle', 0.5, 1.0, True );
		sleep( 0.5 );

	ACTION_DisableBattleDialogue();

	Mac45.SetBase( None );
	Mac45.bHidden = True;
	ACTION_DestroyActor( 'Mac45Mesh' );

	ACTION_PlayAnimDirect( AP_Mac, 'Mac_offers_45_dismount', 0.1, 1.0, False );

	ACTION_GivePlayerWeapon( GetLocalPlayerPawn(), "gbxInventory.WeapUSColt1911_" );

	ACTION_WaitForAnimEnd( AP_Mac, 0 );

	ACTION_PlayAnimDirect( AP_Mac, 'standing_idle_relaxed_1', 0.5, 1.0, True );
	ACTION_ReattachWeapon( AP_Mac, 'rifle_hold' );

	ACTION_TriggerEvent('MacMeetBlocker');

		sleep( 0.1 );
	ACTION_ClearLookAtTarget( 'Mac' );
		sleep( 0.1 );
	ACTION_SetDesiredSpeed( 'mac' ,1.0);
		sleep( 0.1 );
	AP_Mac.controller.focus = none;
		sleep (0.5);

	ACTION_TriggerEvent ('firstgunScript');

	// ==================== TRAINING ==========================================

	if ( !ACTION_IsTrainingDisabled() )
	{
		ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_E" ), 3.0 );

							
			sleep (3.5);


		ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_F" ), 3.0 );



			sleep (3.5);

		ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_G" ), 3.0 );
	}

	// ========================================================================


	sleep( 3.5 ); 

	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
	ACTION_SetObjectiveStatus( 1, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 1, 'ObjectiveList', 3.0 );
	ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );


	German_01 = AnimPawn( getPawn( 'GermanMacKill1' ));
	German_02 = AnimPawn( getPawn( 'GermanMacKill2' ));

	bGerman_Mind = TRUE;

	Dest_Walk = GetNavigationPoint( 'Path_Slow_Mac' );
	Dest_Corner = GetNavigationPoint( 'MacMeet02' );

/*

		//ACTION_TriggerEvent ('Releaseplayeratmacscript' );
	
	German_01 = AnimPawn( getPawn( 'GermanMacKill1' ));
	German_02 = AnimPawn( getPawn( 'GermanMacKill2' ));

	bGerman_Mind = TRUE;

				Dest_Walk = GetNavigationPoint( 'Path_Slow_Mac' );
				Dest_Corner = GetNavigationPoint( 'MacMeet02' );

					sleep( 2.0 );

			//===== Move Mac to walk path
				ACTION_MoveToward( AP_Mac , Dest_Walk , FALSE );
					While( !PawnIsAtDestination( AP_Mac , Dest_Walk ))
						{
								sleep( 0.5 );
						}

			//===== Make Mac walk to corner path
				ACTION_Walk( 'Mac' );
				ACTION_MoveToward( AP_Mac , Dest_Corner , FALSE );
					While( !PawnIsAtDestination( AP_Mac , Dest_Corner ))
						{
								sleep( 0.5 );
							ACTION_MoveToward( AP_Mac , Dest_Corner , FALSE );
						}

					sleep( 0.2 );

			//===== Mac is at corner, Rotate
				AP_Mac.Controller.Focus = GetFirstActor( 'Look_Mac_Corner' );
				ACTION_WaitForPawnRotateToward( AP_Mac );

			//===== Animate
				ACTION_PlayAnimDirect( AP_Mac , 'standing_wall_lean_right_mount_from_standing' , 0.5 , 1.0 , , , , 1 );
					ACTION_WaitForAnimEnd( AP_Mac , 0 );
				AP_Mac.bNoTurnBody = TRUE ;
				AP_Mac.m_fDispositionAnimPlaying = TRUE ;
				ACTION_PlayAnimDirect( AP_Mac , 'standing_wall_lean_right_idle' , 0.5 , 1.0 , TRUE , , , 2 );

*/

	GotoState('MacKillsGermans_NoShot');
}


State MacKillsGermans_NoShot


{
	function OnTrigger()
	{ }

Begin:

	ACTION_WaitForEvent( 'MacStartsShooting');

	AP_Mac.Controller.Focus = German_02;

	slog("--------------------------------New state begins--------");

	//===== Clear physics volumes of special sounds
	GetFirstActor( 'PV_FallTop' ).AmbientSound = None;
	GetFirstActor( 'PV_FallBrush' ).AmbientSound = None;
	GetFirstActor( 'PV_NoBrush' ).AmbientSound = None;

	MacMeetShoot_Script(getFirstActor('MacMeetShoot_Script')).DontTrig = True;
	//===== Change one of the Germans to mind
	if( German_01.Health > 0 )
	{
		German_01.controller.focus = None;
		ACTION_ClearPawnIdleQueue( 'GermanMacKill1' );
		ACTION_ChangeController('GermanMacKill1',class'Mind');
		ACTION_OrderTarget('GermanSquad14', 'USAFireTeam' );
	}

	//===== Mac gets ready to shoot
	ACTION_PlayAnimDirect( AP_Mac, 'standing_wall_lean_right_peek_dismount', 0.3, 1.0, False, , ,0 );
	ACTION_WaitForAnimEnd(AP_Mac,0);

	ACTION_PlayLipSyncSound('Mac',"D_MAC.SEEENEMYSHIFT_C", 1.0, 1.0, 1024.0, TRUE);
	ACTION_PlayAnimDirect( AP_Mac, 'standing_wall_lean_right_fire_mount', 0.0, 1.0, false, , ,4 );
	ACTION_WaitForAnimEnd(AP_Mac,0);

	ACTION_DisablePawnTurn( 'Mac', False );
	ACTION_PlayAnimDirect( AP_Mac, 'standing_idle_aimed_sighted_1', 0.1, 1.0, true );
		sleep( 1.0 );

	//===== Mac shoots the shit out of the Germans until they are dead
	Do {
		if ( German_02.health > 0 )
			{
				ACTION_PawnFireAtTarget( 'Mac' , 'GermanMacKill2' );
					sleep( 0.1 );
				ACTION_PawnFireAtTarget( 'Mac' , 'GermanMacKill2' );		
					sleep( 0.3 );
				ACTION_PawnFireAtTarget( 'Mac' , 'GermanMacKill2' );
					sleep( 0.1 );
				ACTION_PawnFireAtTarget( 'Mac' , 'GermanMacKill2' );		
					sleep( 0.2 );
				ACTION_PawnFireAtTarget( 'Mac' , 'GermanMacKill2' );		
					sleep( 0.1 );
			}

			sleep(0.5);	

		if ( German_01.health > 0 )
			{
				ACTION_PawnFireAtTarget( 'Mac', 'GermanMacKill1' );	
					sleep( 0.2 );	
				ACTION_PawnFireAtTarget( 'Mac', 'GermanMacKill1' );	
					sleep( 0.1 );
				ACTION_PawnFireAtTarget( 'Mac', 'GermanMacKill1' );	
					sleep( 0.3 );	
				ACTION_PawnFireAtTarget( 'Mac', 'GermanMacKill1' );	
					sleep( 0.1 );
				ACTION_PawnFireAtTarget( 'Mac', 'GermanMacKill1' );	
					sleep( 0.2 );
			}

		ACTION_SetPawnWeaponAmmo( AP_Mac, class'WeapUSTHOMPSON', 30 ); 

	} Until ( Unit( GetFirstActor( 'GermanSquad14' )).GetNumLivingMembers() == 0 )

		sleep( 0.5 );
	AP_Mac.FlushAnimQueueChannel( 0,,true );
	GetPawn( 'Mac' ).controller.focus = None ;
	AP_Mac.Controller.Focus = None ;
	ACTION_ClearLookAtTarget( 'Mac' );
	ACTION_ClearPawnFireAtTarget( 'Mac' );
	AP_Mac.m_fDispositionAnimPlaying = FALSE ;
		sleep( 0.5 );

	GotoState('MacKillsGermans');
}

State MacKillsGermans
{
	function OnTrigger()
	{
		GotoState('MacExits');	
		MacTrigCount = MacTrigCount + 1;
	}

Begin:
	AP_Mac.Controller.Focus = None ;
	ACTION_ClearLookAtTarget( 'Mac' );
	ACTION_ClearPawnFireAtTarget( 'Mac' );

	MacMeetShoot_Script(getFirstActor('MacMeetShoot_Script')).DontTrig = True;

	ACTION_RestoreUnlimitedAmmo( AP_Mac, class'WeapUSTHOMPSON' );

	Knife.bHidden = TRUE;
	WarGamePawn(AP_Mac).eWeaponAimedState = WAS_CombatRelaxed;

	//===== Move Mac next to hanging para guy and wait until he reaches that spot
	ACTION_Walk( 'Mac' );
	AP_Mac.Controller.Focus = None ;
	ACTION_ClearLookAtTarget( 'Mac' );
	ACTION_ClearPawnFireAtTarget( 'Mac' );

	MacNode = GetNavigationPoint('MacMeet04');

	ACTION_Walk( 'mac' );
	ACTION_MoveToward( AP_Mac , MacNode , FALSE );

	While ( !PawnIsAtDestination( AP_Mac , MacNode ) )
	{
			sleep( 0.2 );
	} 


/*
	ACTION_MoveToward( AP_Mac, MacNode , FALSE );
	WarGamePawn( GetPawn( 'mac' )).eWeaponAimedState = WAS_Relaxed;
	do {
		sleep(0.5);
	} until ( PawnIsAtDestination( AP_Mac, MacNode) );
*/
	//===== Rotate Mac towards the player
		//sleep( 0.1 );
	//AP_Mac.Controller.Focus = None ;
		//sleep( 0.1 );
	//ACTION_ClearLookAtTarget( 'Mac' );
		//sleep( 0.1 );
	//ACTION_ClearPawnFireAtTarget( 'Mac' );
		//sleep( 0.1 );

	AP_Mac.bNoTurnBody = TRUE;
		//sleep( 0.1 );
	//AP_Mac.Controller.Focus = None;
		sleep( 0.1 );

	ACTION_SetLookAtTarget( 'Mac', getFirstActor('MapViewLook'), TRUE );


	CheckMacDistance( 1024 );
	While ( !PlayerNear )
	{
		CheckMacDistance( 1024 );
			sleep(0.1);
	}


















	ACTION_PlayAnimDirect( AP_Mac, 'Mac_pulls_map', 0.4, 1.0, False );

	ACTION_PlayLipSyncSound('Mac',"D00130.MAC_J", 1.0, 1.0, 1024.0, TRUE );
	ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_J" ), 2.4, 1, 1, 1, TRUE, TRUE );
	//	Mac: There's a couple of houses here.

		sleep(1.9);

	//===== Show map, attach to Mac's hand, make him look at it
	MacMap.bHidden = FALSE;

	AP_Mac.AttachToBone( MacMap, 'field_map' );

	ACTION_WaitForAnimEnd( AP_Mac , 0 );

	ACTION_PlayAnimDirect( AP_Mac, 'Mac_studies_map_2', 0.3, 1.0, True, , , 1 );

	CheckMacDistance( 1024 );
	While ( !PlayerNear )
	{
		CheckMacDistance( 1024 );
		sleep(0.1);
	}

	ACTION_PlayLipSyncSound('Mac',"D00130.MAC_K", 1.0, 1.0, 1024.0, TRUE);
	ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_K" ), 3.3, 1, 1, 1, TRUE, TRUE );
	//	Mac: I'm gonna try and figure out where the hell we are.

	ACTION_WaitForAnimEnd( AP_Mac , 0 );
		
	ACTION_PlayAnimDirect( AP_Mac, 'Mac_studies_map_1', 0.3, 1.0, True );

	CheckMacDistance( 2048 );
	While ( !PlayerNear )
	{
		CheckMacDistance( 2048 );
		sleep(0.1);
	}

		sleep(2.4);
	ACTION_PlayLipSyncSound('Mac',"D00130.MAC_L", 1.0, 1.0, 1024.0, TRUE );
	ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_L" ), 4.8, 1, 1, 1, TRUE, TRUE );
	//	Mac: I don't know where the hell we are, but I sure as shit don't want to stay here with all these Krauts about.
		sleep ( 4.8 );

	ACTION_WaitForAnimEnd( AP_Mac,0 );

	GoToState('MacExits');
}	

State MacExits
{
	Function OnTrigger()
	{
		MacTrigCount = MacTrigCount + 1;
	}

Begin:
		sleep(0.4);
	ACTION_PlayAnimDirect( AP_Mac, 'Mac_stows_map', 0.5, 1.0, False, , ,2);

		sleep(0.8);
	MacMap.bHidden = TRUE;

	ACTION_WaitForAnimEnd( AP_Mac , 0 );

	AP_Mac.Controller.Focus = None ;
	ACTION_ClearPawnFireAtTarget( 'Mac' );
	
	//AP_Mac.bNoTurnBody = TRUE;
	ACTION_ClearLookAtTarget( 'Mac' );
	ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_M" ), 2.5, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayLipSyncSound('Mac',"D00130.MAC_M", 1.0, 1.0, 1024.0, TRUE);
	//	Mac: Let's move Baker.

	ACTION_ChangeController( 'Mac', class'Mind' );
	AP_Mac.controller.bGodMode = TRUE ;
	ACTION_SetRepelBullets( 'Mac' , TRUE );
	
	ACTION_WaitForAnimEnd( AP_Mac, 0 );

	While ( !AP_Mac.Controller.IsA('Mind') )
	{
		sleep( 0.5 );
	}

	AP_Mac.Controller.Focus = None ;
	ACTION_ClearPawnFireAtTarget( 'Mac' );
	//AP_Mac.bNoTurnBody = TRUE;
	ACTION_ClearLookAtTarget( 'Mac' );

	ACTION_Run( 'Mac' );
	ACTION_OrderMove( 'USAFireTeam1' , 'MacMeet05' );
	ACTION_DestroyActor( MacMap.Tag );

	ACTION_SetRepelBullets( 'Mac' , TRUE );
	AP_Mac.controller.bDemiGod = TRUE;

	//===== Spawn Cole and Leggett, initialize the script
	ACTION_TriggerEvent( 'FrenchHouse_Script' );

	Switch ( MacTrigCount )
	{
		Case 1:
				ACTION_SetDesiredSpeed( 'Mac', 1.0 );
				GotoState('MacPreStep1');
				break;
		Case 2:
				ACTION_SetDesiredSpeed( 'Mac', 1.0 );
				GotoState('MacPreStep2');
				break;
		Case 3:
				ACTION_SetDesiredSpeed( 'Mac', 1.0 );
				GotoState('MacPreStep3');
				break;
		Case 4:
				ACTION_SetDesiredSpeed( 'Mac', 1.0 );
				GotoState('MacPreStep4');
				break;
	}

	if ( MacTrigCount > 4 )
	{
		GotoState('MacPreStep5');	
	}

	GotoState('MacPreStep0');	
}

State MacPreStep0
{
	Function OnTrigger()
	{
		GotoState('MacPreStep1');
	}

Begin:
}

State MacPreStep1
{
	function OnTrigger()
	{

	AP_Mac.Controller.Focus = None ;
	ACTION_ClearPawnFireAtTarget( 'Mac' );
	ACTION_ClearLookAtTarget( 'Mac' );

		MacTrigCount = MacTrigCount + 1;
		GotoState('MacPreStep2');	
	}

Begin:
	ACTION_SetDesiredSpeed( 'Mac', 1.0 );
	ACTION_OrderMove('USAFireTeam1','MacMeet06',FALSE);
}

State MacPreStep2
{	
	function OnTrigger()
	{

	AP_Mac.Controller.Focus = None ;
	ACTION_ClearPawnFireAtTarget( 'Mac' );
	ACTION_ClearLookAtTarget( 'Mac' );

		MacTrigCount = MacTrigCount + 1;
		GotoState('MacPreStep3');	
	}

Begin:
	ACTION_OrderMove('USAFireTeam1','MacMeet07',FALSE);
}

state MacPreStep3
{
	function OnTrigger()
	{
		MacTrigCount = MacTrigCount + 1;
		GotoState('MacPreStep4');	
	}

Begin:
	ACTION_OrderMove('USAFireTeam1','MacMeet08',FALSE);
}

State MacPreStep4
{
	function OnTrigger()
	{
		MacTrigCount = MacTrigCount + 1;
		GotoState('MacPreStep5');	
	}

Begin:
	ACTION_OrderMove('USAFireTeam1','MacMeet09',FALSE);
}

State MacPreStep5
{
	function OnTrigger()
	{
		MacTrigCount = MacTrigCount + 1;
		ACTION_TriggerEvent('MacState');	
	}

Begin:
	ACTION_OrderMove('USAFireTeam1','MacMeet10',FALSE);
}
