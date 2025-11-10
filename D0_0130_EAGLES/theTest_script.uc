//=============================================================================
// theTest_script.
//=============================================================================
class theTest_script extends TriggeredScript
	placeable;

State Triggered
{
Begin:
	

	ACTION_TriggerEvent('Mac_test');
	ACTION_TriggerEvent('Leggett_test');

	ACTION_AssignToUnit('Legget','USAFireTeam1');

	ACTION_DisableBattleDialogue();

	getPawn('Mac').SightRadius = 2272;
	getPawn('Legget').SightRadius = 2272;

	getPawn('Mac').controller.bDemiGod = TRUE;
	getPawn('Legget').controller.bDemiGod = TRUE;

	ACTION_TriggerEvent('macbeacon');
	ACTION_TriggerEvent('macbeacon');
	gbxFollowBeacon(getFirstActor('macbeacon')).m_anOwner = GetPawn('Mac');

	MacState(getFirstActor('MacState')).GotoState('Mac05');

	ACTION_DestroyActor('Macspawn');

	ACTION_TriggerEvent('beacon_crossroad');

	ACTION_TriggerEvent('Clouds_Plane');

	ACTION_TriggerEvent('Planes_Moving');

	ACTION_TriggerEvent('Planes_Moving');

	ACTION_TriggerEvent('Clouds_opening');

// do previous checkpoint crap (arrrrgg!)
	ACTION_TriggerEvent('SearchBeams');
	sleep(0.1);
	ACTION_TriggerEvent('SearchBeams2');
	sleep(0.1);
	ACTION_TriggerEvent('SearchBeamsStagger');
	sleep(0.1);
	ACTION_TriggerEvent('SearchBeamsStagger2');


	// Start Crash Site Emitters

	ACTION_TriggerEvent('PlaneCrashFire');

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
sleep(0.2);

	ACTION_DestroyActor('HorizonTracers01');
	ACTION_DestroyActor('HorizonTracers02');
	ACTION_DestroyActor('HorizonTracers03');
	ACTION_DestroyActor('HorizonTracers04');

	ACTION_RemoveHorizonTracerTarget( 'HorizonTracers05' );
	ACTION_RemoveHorizonTracerTarget( 'HorizonTracers06' );
	ACTION_RemoveHorizonTracerTarget( 'HorizonTracers07' );
	ACTION_RemoveHorizonTracerTarget( 'HorizonTracers08' );
	ACTION_RemoveHorizonTracerTarget( 'HorizonTracers09' );
	ACTION_RemoveHorizonTracerTarget( 'HorizonTracers10' );


	ACTION_SetHidden( 'ChuteInTree', FALSE );

	ACTION_DestroyActor( 'AP_Baker' );


	// kill animpawn pliz-anes
	ACTION_DestroyActor( 'Planes_Steady' );
	ACTION_DestroyActor( 'Planes_FlakPlaneCrash' );

	// kill pfx
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
sleep(0.2);

	// kill AI Scripts
	ACTION_DestroyActor( 'SS_Plane04' );
	ACTION_DestroyActor( 'SS_Plane03' );
	ACTION_DestroyActor( 'SS_Plane02' );
	ACTION_DestroyActor( 'SS_Plane10' );
	ACTION_DestroyActor( 'SS_Plane05' );
	ACTION_DestroyActor( 'SS_Plane06' );
	ACTION_DestroyActor( 'SS_Plane07' );
	ACTION_DestroyActor( 'SS_Plane08' );
	ACTION_DestroyActor( 'SS_Plane09' );

	// try to kill static mesh
	ACTION_DestroyActor( 'IntroPlaneExterior' );
	ACTION_DestroyActor( 'SM_WingBlast' );
	ACTION_DestroyActor( 'IntroPlaneInerior' );
	ACTION_DestroyActor( 'StaticMeshActork1' );
	ACTION_DestroyActor( 'StaticMeshActork2' );

	// try killing scripts and trigs
	ACTION_DestroyActor( 'FlakLight' );
	ACTION_DestroyActor( 'FlakMedium' );
	ACTION_DestroyActor( 'FlakHeavy' );

	ACTION_DestroyActor( 'BigBlast_Squib4' );
	ACTION_DestroyActor( 'BigBlast_Glass' );
	ACTION_DestroyActor( 'BigBlast_Squib1' );
	ACTION_DestroyActor( 'BigBlast_Squib2' );
	ACTION_DestroyActor( 'BigBlast_Squib3' );
	ACTION_DestroyActor( 'BigBlast_Glass' );

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

	ACTION_DestroyActor( 'FlakPlaneCrash' );
	ACTION_DestroyActor( 'FlakAbovePlane01' );
	ACTION_DestroyActor( 'FlakAbovePlane02' );
	ACTION_DestroyActor( 'PlaneBoom1' );
	ACTION_DestroyActor( 'FlakAbovePlane03' );

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
/// end checkpoint 1 stuff

	sleep(0.2);

//kill triggers. kill.
	ACTION_DestroyActor('germansrun2');
	ACTION_DestroyActor('LineOfSightTrigger_PlaneCrash');
	ACTION_DestroyActor('hintJump');
	ACTION_DestroyActor('LineOfSightTriggerBridge');
	ACTION_DestroyActor('GermanNoiseKill1');
	ACTION_DestroyActor('hintCrouch');
	ACTION_DestroyActor('hintCrouch2');
	ACTION_DestroyActor('GermanWalkback');
	ACTION_DestroyActor('Trig_MacFirst');
	ACTION_DestroyActor('Trig_MacShoot');
	ACTION_DestroyActor('PlayerShotNearWall');
	ACTION_DestroyActor('MacExits');
	ACTION_DestroyActor('MacPreStep1');
	ACTION_DestroyActor('MacPreStep2');
	ACTION_DestroyActor('MacPreStep3');
	ACTION_DestroyActor('MacPathTrig2p');
	ACTION_DestroyActor('MacPathTrig3p');
	ACTION_DestroyActor('MacPathTrig4');
	ACTION_DestroyActor('MacPathTrig4p');
	ACTION_DestroyActor('Trigger_TS_FrenchMac');
	ACTION_DestroyActor('MacPathTrig5ap');
	ACTION_DestroyActor('coleKilla');

	AnimPawn(GetPawn('GateBashAnim')).controller.bGodMode = True;
	AnimPawn(GetPawn('GateBash2Anim')).controller.bGodMode = True;
	AnimPawn(GetPawn('GateBash3Anim')).controller.bGodMode = True;
	ACTION_PlayAnim( 'GateBashAnim', 'kicked_breaks', 0.1, 1.0 );
	ACTION_TriggerEvent( 'frenchgateblock' );



}
