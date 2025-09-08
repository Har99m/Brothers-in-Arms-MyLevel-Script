//=============================================================================
// TS_D02_2300_OutroScene.
//=============================================================================
class TS_D02_2300_OutroScene extends TriggeredScript
	placeable;

var float i;
var Actor SM_OutroTruck ;
var AnimPawn AP_Mac, AP_Baker, AP_Truck;

function DestroyAllGrenades()
{
	local gbxGrenade A;

	foreach AllActors( class'gbxGrenade', A )
		A.Destroy();
}

state Triggered
	{
			function OnTrigger()
				{
					//GotoState( 'Dialogue' );
				}
		Begin:

			//===== Define Characters as AnimPawn Actors
				AP_Mac  = AnimPawn( GetPawn( 'AP_Mac' ));
				AP_Baker = AnimPawn( GetPawn( 'AP_Baker' ));
				AP_Truck = AnimPawn( GetPawn( 'AP_Truck' ));

				AP_Baker.SetCollision( FALSE, AP_Baker.bBlockActors, AP_Baker.bBlockPlayers );
				AP_Mac.SetCollision( FALSE, AP_Baker.bBlockActors, AP_Baker.bBlockPlayers );
				AP_Truck.SetCollision( FALSE, AP_Baker.bBlockActors, AP_Baker.bBlockPlayers );

				AP_Baker.Controller.bGodMode = TRUE;
				AP_Mac.Controller.bGodMode = TRUE;
				AP_Truck.Controller.bGodMode = TRUE;

				AP_Baker.bHidden = FALSE ;
				AP_Mac.bHidden = FALSE ;
				AP_Truck.bHidden = FALSE ;

				AP_Baker.bNoTurnBody = true;
				AP_Mac.bNoTurnBody = true;

				AP_BAKER.bDoHeadTurn = True;
				AP_MAC.bDoHeadTurn = True;

				ACTION_SetAnimSetDirect( AP_Mac, "a_cin_d02_Chateau.a_cin_d02_Chateau" );
				ACTION_SetAnimSetDirect( AP_Baker, "a_cin_d02_Chateau.a_cin_d02_Chateau" );
				ACTION_SetAnimSetDirect( AP_Truck, "k_vehicle_de.de_opel_blitz_chateau" );
				ACTION_SetAnimSetDirect( AP_Baker, "a_ev_all.a_ev_corrion" );

				ACTION_ClearPawnIdleQueue( 'AP_Baker' );
				ACTION_AddAnimToPawnIdleQueue( 'AP_Baker', 'Baker_idles_in_truck'  );
				ACTION_PlayAnimFromPawnIdleQueue( 'AP_Baker', FALSE );

				ACTION_ClearPawnIdleQueue( 'AP_Mac' );
				ACTION_AddAnimToPawnIdleQueue( 'AP_Mac', 'Mac_sitting_in_truck'  );
				ACTION_PlayAnimFromPawnIdleQueue( 'AP_Mac', FALSE );

			//===== Allow pawns to be attached to this pawn
				AP_Truck.bCanBeBaseForPawns = TRUE;

				AP_Baker.SetPhysics( PHYS_None );
				AP_Mac.SetPhysics( PHYS_None );

				gbxPawn(AP_Baker).Shadow.Destroy();
				gbxPawn(AP_Baker).Shadow = None; 
				gbxPawn(AP_Mac).Shadow.Destroy();
				gbxPawn(AP_Mac).Shadow = None; 

				AP_Truck.AttachToBone( AP_Baker, 'chassis' );
				AP_Truck.AttachToBone( AP_Mac, 'chassis' );

				AP_Baker.SetRelativeRotation( rot(0.0, 0.0, -16384.0) );
				AP_Baker.SetRelativeLocation( vect(106.5, -19.6, -45.7) );  // +forward/back, +down/up, +right/left

				AP_Mac.SetRelativeRotation( rot(0.0, 0.0, -16384.0) );
				AP_Mac.SetRelativeLocation( vect(160.5, -17.0, 35.7.0) );  // +forward/back, +down/up, +right/left

				ACTION_SetObjectiveStatus( 1 , OI_Complete , 'ObjectiveList' );
				ACTION_DisplayObjective( 1 , 'ObjectiveList' , 3.0 );
				ACTION_OrderMove('Unit_US_ass', 'PN_OutroOrder', False );
				ACTION_OrderMove('Unit_US_base', 'PN_OutroOrder', False );
					sleep( 3.5 );

			//	ACTION_DisplayObjectiveHint( S_Localize( "HINT_B" ) , 3.5 );
					//-----/-----HINT_B="Meet with Mac to end your mission."



				//ACTION_BlockNavPoints( 'PN_OutroBlock' );


					sleep( 0.1 );



					ACTION_FadeOverlay( GetLocalPlayerController(), 1, 2.0 );

					sleep(2.0);
					GetLocalPlayerController().bGodMode = TRUE;
					ACTION_EnablePlayerHeavyTrauma( FALSE );
					DestroyAllGrenades();
					ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
	ACTION_TeleportPlayerToActor( 'LT_OUTRO_TELEPORT' );
			
			AP_TRUCK.AttachToBone( getFirstActor('LT_TRUCKSOUND'), 'chassis');
			ACTION_PlaySoundDirect( getFirstActor('LT_TRUCKSOUND'), "V_TRUCK.IDLE", 1.0, 1.0, 22222);
				ACTION_TriggerEvent('SCENE_Outro');
			ACTION_PlayAnimDirect( AP_Truck, 'baker_drives_up', 0.2, 0.8, False, 50 , );
					ACTION_FadeOverlay( GetLocalPlayerController(), 2, 1.0 );
					ACTION_TriggerEvent( 'Trig_outro_drive' );
						ACTION_TriggerEvent('PFX_TRUCKDUSt');
				sleep(1.0);
			ACTION_PlayLocalSound( "V_TRUCK.STOP" );
		GotoState('Dialogue');
	//ACTION_SetHidden('SM_Outro_RoadBlock', True);
	}	

state Dialogue
	{
	function OnTrigger()
		{
			//None
		}
		Begin:

				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

			//===== Start Dialogue

					i = 2.0;

					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i );

					//-----/-----	Mac and Baker are waiting in a truck

					//-----/-----BAKER_A="Baker: hop in the back guys!"
				ACTION_PlayAnimWithqueue( 'AP_Baker', 'Baker_says_get_in_the_back', 0.1, 1.0, False, ,  );
				ACTION_PlayLipSyncSound( 'AP_Baker', "D02_2300.BAKER_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_A" ), 3.0, 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 1.0 );
				ACTION_SetLookAtTarget( 'AP_Mac', AP_BAKER, True );
					WaitForAbsoluteTime( i+= 1.0 );
				ACTION_SetLookAtTarget( 'AP_Baker', AP_MAC, True );
					WaitForAbsoluteTime( i+= 1.5 );	
				ACTION_SetLookAtTarget( 'AP_Baker', GetLocalPlayerPawn(), True );

					ACTION_FadeOverlay( GetLocalPlayerController(), 1, 2.0 );
					WaitForAbsoluteTime( i+= 2.0 );
			//===== End map
				ACTION_TriggerEvent('TriggeredScriptMapComplete');

	}
