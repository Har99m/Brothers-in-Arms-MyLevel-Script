//=============================================================================
// TS_OnGround.
//=============================================================================
class TS_OnGround extends TriggeredScript
	placeable;

var bool bDemo;
var AnimPawn AnimPawn_Baker;


function OnStart()
	{
		Super.OnStart();
		AnimPawn_Baker = AnimPawn( GetPawn('AP_Baker') );
		AnimPawn_Baker.bNoTurnBody = true;
	}

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
	{
		Super.PostBeginPlay();		

		bDemo = FALSE;
	}

state triggered
	{
		Begin:
			ACTION_TriggerEvent('Clouds_Plane');
			ACTION_TriggerEvent('Planes_Moving');
			ACTION_TriggerEvent('Clouds_opening');
				sleep( 8.0 );
				ACTION_TriggerEvent('ChutesFromGround');
			ACTION_SetHidden( 'ChuteInTree', FALSE );

			//ACTION_PlayerToCameraPawn( 'AP_Baker' );
			
		Do // repeat until this is false
		{
			ACTION_PlayerToCameraPawn( 'AP_Baker' );
			sleep(0.1);
		} Until ( vSize( getLocalPlayerPawn().location - getFirstActor('BoxLoc').location ) > 1024 )

			ACTION_CameraInPawnHead( 'AP_Baker', 'InteriorScene', FALSE );
			ACTION_StopScene( 'InteriorScene','' );

			ACTION_UnsetAnimSet( 'AP_Baker', "a_cin_d0_Screaming_Eagles_intro" );
			ACTION_DestroyActor( 'AP_Baker' );

			ACTION_SaveMemoryReport( "SE_CheckPoint01" );
			ACTION_CheckPointSave( 1 );
				sleep(0.2);

		//========== Destroy old stuff ========================================

				ACTION_TriggerEvent('SearchBeams');
				ACTION_TriggerEvent('SearchBeams2');

				ACTION_TriggerEvent('ChutesFromGround');

			//===== Start Crash Site Emitters
				if ( !bDemo )
					ACTION_TriggerEvent('PlaneCrashFire');

				ACTION_TriggerEvent('Clouds_Plane');
				ACTION_TriggerEvent('Planes_Moving');
				ACTION_TriggerEvent('Planes_Moving');
				ACTION_TriggerEvent('Clouds_opening');

					sleep( 0.1 );
				ACTION_UnsetAnimSet( 'AP_01', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_02', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_03', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_04', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_05', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_06', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_07', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_08', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_09', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_10', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_11', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_12', "a_cin_d0_Screaming_Eagles_intro" );
				ACTION_UnsetAnimSet( 'AP_Corrion', "a_cin_d0_Screaming_Eagles_intro" );
					sleep( 0.1 );

				ACTION_UnsetAnimSet( 'Planes_Steady_09', "k_vehicle_us" );
				ACTION_UnsetAnimSet( 'Planes_Steady_08', "k_vehicle_us" );
				ACTION_UnsetAnimSet( 'Planes_Steady_07', "k_vehicle_us" );
				ACTION_UnsetAnimSet( 'Planes_Steady_06', "k_vehicle_us" );
				ACTION_UnsetAnimSet( 'Planes_Steady_05', "k_vehicle_us" );
				ACTION_UnsetAnimSet( 'Planes_Steady_04', "k_vehicle_us" );
				ACTION_UnsetAnimSet( 'Planes_Steady_03', "k_vehicle_us" );
				ACTION_UnsetAnimSet( 'Planes_Steady_02', "k_vehicle_us" );
				ACTION_UnsetAnimSet( 'Planes_Steady_01', "k_vehicle_us" );
					sleep( 0.1 );

				ACTION_DestroyActor('Planes_Steady_09');
				ACTION_DestroyActor('Planes_Steady_08');
				ACTION_DestroyActor('Planes_Steady_07');
				ACTION_DestroyActor('Planes_Steady_06');
				ACTION_DestroyActor('Planes_Steady_05');
				ACTION_DestroyActor('Planes_Steady_04');
				ACTION_DestroyActor('Planes_Steady_03');
				ACTION_DestroyActor('Planes_Steady_02');
				ACTION_DestroyActor('Planes_Steady_01');
					sleep( 0.1 );

				ACTION_DestroyActor('AP_01');
				ACTION_DestroyActor('AP_02');
				ACTION_DestroyActor('AP_03');
				ACTION_DestroyActor('AP_04');
				ACTION_DestroyActor('AP_05');
				ACTION_DestroyActor('AP_06');
				ACTION_DestroyActor('AP_07');
				ACTION_DestroyActor('AP_08');
				ACTION_DestroyActor('AP_09');
				ACTION_DestroyActor('AP_10');
				ACTION_DestroyActor('AP_11');
				ACTION_DestroyActor('AP_12');
				ACTION_DestroyActor('AP_Corrion');
					sleep( 0.1 );

				ACTION_DestroyActor('HorizonTracers01');
				ACTION_DestroyActor('HorizonTracers02');
				ACTION_DestroyActor('HorizonTracers03');
				ACTION_DestroyActor('HorizonTracers04');
					sleep( 0.1 );

				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers05' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers06' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers07' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers08' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers09' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers10' );
					sleep( 0.1 );

				ACTION_SetHidden( 'ChuteInTree', FALSE );

				ACTION_DestroyActor( 'AP_Baker' );

				ACTION_TriggerEvent('Static_Spawn');
				ACTION_SetStaticCharacterTarget( 'Static1', 'S1T1', 'S1T2', false, false );

			//====== kill animpawn pliz-anes
				ACTION_DestroyActor( 'Planes_Steady' );
				ACTION_DestroyActor( 'Planes_FlakPlaneCrash' );
					sleep( 0.1 );

			//===== kill pfx
				ACTION_DestroyActor( 'engine_fire' );
				ACTION_DestroyActor( 'Clouds_Plane' );
				ACTION_DestroyActor( 'Clouds_Plane' );
				ACTION_DestroyActor( 'FlakPlaneCrash' );
				ACTION_DestroyActor( 'Clouds_Plane' );
				ACTION_DestroyActor( 'VomitEmitter' );
				ACTION_DestroyActor( 'Flak_WingBlast' );
				ACTION_DestroyActor( 'PlaneCrashGroundEmitter' );
				ACTION_DestroyActor( 'Clouds_Plane' );
				ACTION_DestroyActor( 'CorrionBloodEmitter' );
				ACTION_DestroyActor( 'Clouds_Opening' );
				ACTION_DestroyActor( 'Clouds_Opening' );
				ACTION_DestroyActor( 'engine_fire' );
				ACTION_DestroyActor( 'WindowsLights' );
				ACTION_DestroyActor( 'Planes_Moving' );
					sleep(0.1);

			//===== kill AI Scripts
				ACTION_DestroyActor( 'SS_Plane04' );
				ACTION_DestroyActor( 'SS_Plane03' );
				ACTION_DestroyActor( 'SS_Plane02' );
				ACTION_DestroyActor( 'SS_Plane10' );
				ACTION_DestroyActor( 'SS_Plane05' );
				ACTION_DestroyActor( 'SS_Plane06' );
				ACTION_DestroyActor( 'SS_Plane07' );
				ACTION_DestroyActor( 'SS_Plane08' );
				ACTION_DestroyActor( 'SS_Plane09' );
					sleep( 0.1 );

			//===== try to kill static mesh
				ACTION_DestroyActor( 'IntroPlaneExterior' );
				ACTION_DestroyActor( 'SM_WingBlast' );
				ACTION_DestroyActor( 'IntroPlaneInerior' );
				ACTION_DestroyActor( 'StaticMeshActork1' );
				ACTION_DestroyActor( 'StaticMeshActork2' );
					sleep( 0.1 );

		//===== try killing scripts and trigs
			ACTION_DestroyActor( 'FlakLight' );
			ACTION_DestroyActor( 'FlakMedium' );
			ACTION_DestroyActor( 'FlakHeavy' );

			ACTION_DestroyActor( 'BigBlast_Squib4' );
			ACTION_DestroyActor( 'BigBlast_Glass' );
			ACTION_DestroyActor( 'BigBlast_Squib1' );
			ACTION_DestroyActor( 'BigBlast_Squib2' );
			ACTION_DestroyActor( 'BigBlast_Squib3' );
			ACTION_DestroyActor( 'BigBlast_Glass' );
				sleep( 0.1 );

			ACTION_DestroyActor( 'FlakExplosion08' );
			ACTION_DestroyActor( 'FlakExplosion04' );
			ACTION_DestroyActor( 'FlakExplosion09' );
			ACTION_DestroyActor( 'FlakExplosion07' );
			ACTION_DestroyActor( 'FlakExplosion05' );
			ACTION_DestroyActor( 'FlakExplosion03' );
			ACTION_DestroyActor( 'FlakExplosion06' );
			ACTION_DestroyActor( 'FlakExplosion01' );
			ACTION_DestroyActor( 'FlakExplosion10' );
			ACTION_DestroyActor( 'FlakExplosion02' );
					sleep( 0.1 );

			ACTION_DestroyActor( 'FlakPlaneCrash' );
			ACTION_DestroyActor( 'FlakAbovePlane01' );
			ACTION_DestroyActor( 'FlakAbovePlane02' );
			ACTION_DestroyActor( 'PlaneBoom1' );
			ACTION_DestroyActor( 'FlakAbovePlane03' );
					sleep( 0.1 );

			ACTION_DestroyActor( 'FlakLight01' );
			ACTION_DestroyActor( 'FlakLight02' );
			ACTION_DestroyActor( 'FlakLight03' );
			ACTION_DestroyActor( 'FlakLight04' );
			ACTION_DestroyActor( 'FlakLight05' );
			ACTION_DestroyActor( 'FlakLight06' );
			ACTION_DestroyActor( 'FlakLight07' );
			ACTION_DestroyActor( 'FlakLight08' );
			ACTION_DestroyActor( 'FlakLight09' );
			ACTION_DestroyActor( 'FlakLight10' );

			AnimPawn(GetPawn('GateBashAnim')).controller.bGodMode = True;
			AnimPawn(GetPawn('GateBash2Anim')).controller.bGodMode = True;
			AnimPawn(GetPawn('GateBash3Anim')).controller.bGodMode = True;

		//===== kill animSet
			ACTION_UnsetAnimSet( 'Planes_Steady', "a_cin_d0_Screaming_Eagles_intro" );

			ACTION_SaveMemoryReport( "SE_CheckPoint01_After" );
				sleep( 0.4 );
			ACTION_CheckpointSave( 1 );
			ACTION_TriggerEvent( 'Display_Objective' );

			GetLocalPlayerPawn().bNoTurnBody = False;
			ACTION_HideHUD( GetLocalPlayerController(), False );
			WargameHUD(getLocalPlayerController().MyHUD).bHideWargameHUD = False;
			ACTION_LimitPlayerInput( GetLocalPlayerController(), False );
			ACTION_UnLockPlayerMovement( GetLocalPlayerPawn() );

		    //===== Start objective stuff
			//ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
			//ACTION_DisplayObjective( 0, 'ObjectiveList', 5.0 );	

				sleep ( 1.0 );
			ACTION_TriggerEvent( 'beacon_crossroad' );
			ACTION_TriggerEvent( 'SA_WayPoint_Manager' );
			ACTION_TriggerEvent( 'MSG_Waypoint_To_Start' );
				sleep ( 4.0 );

			if ( !ACTION_IsTrainingDisabled() )
				{
					ACTION_DisplayTrainingMessage( S_Localize("TRAINING_A"), 4.0 );
						//	Hint: The arrow %icon_compass_arrow% on your compass directs you toward your next objective.
				}

				sleep( 3.0 );
		ScriptEnd:
	}


