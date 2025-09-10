//=============================================================================
// TS_D15_1130_IntroScene.
//=============================================================================
class TS_D15_1130_IntroScene extends TriggeredScript
	placeable;

var int C47_FLAK_HEAVY , C47_MUZZA , BARN_AMB, LT_Garnett, C47_DAMAGED;
var Actor MyPlayer, Garnett, SM_HiddenFence;
var AnimPawn AP_Hartsock, AP_Scribe, AP_Marshall, AP_Bringer,	AP_Mac, AP_Allen, AP_Corrion, AP_Muzza, AP_Fishlistener;
var float i;

state Triggered
{
	function ontrigger()
		{
		Gotostate( 'FirstScene' );
		}
Begin:

//------------------------------------------------------------*****Start Matinee Sequence
	i = 1.0;
//	ACTION_StartRain( 50.0 );
	ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
	MyPlayer = GetFirstActor( 'gbxPlayerStart' );

	ACTION_SetHidden( 'AP_Jeep', true );
	ACTION_SetHidden( 'AP_JeepPass', true );
	ACTION_SetHidden( 'AP_JeepDriver', true );
	ACTION_SetHidden( 'AP_Walker01', true );
//	ACTION_SetHidden( 'AP_Walker02', true );

	ACTION_SetHidden( 'SM_ScribeCoffeeCup', true );
	ACTION_SetHidden( 'SM_HartsockCoffeeCup2', true );

	AP_Hartsock = AnimPawn( Getpawn( 'AP_Hartsock' ));
	AP_Marshall = AnimPawn( Getpawn( 'AP_Marshall' ));
	AP_Bringer = AnimPawn( Getpawn( 'AP_Bringer' ));
	AP_Corrion = AnimPawn(GetPawn('AP_Corrion'));
	AP_Mac = AnimPawn(GetPawn('AP_Mac'));
	AP_Allen = AnimPawn(GetPawn('AP_Allen'));
	AP_Fishlistener = AnimPawn(GetPawn('AP_Fishlistener'));

	AP_Bringer.bHidden = true;

	ACTION_SetAnimSetDirect( AP_Hartsock, "a_cin_d15_Bookends_1.bookends1" );
	ACTION_SetAnimSetDirect( AP_Marshall, "a_cin_d15_Bookends_1.bookends1" );

	ACTION_ClearPawnIdleQueue( 'AP_Marshall' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Marshall', 'Marshall_idle_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Marshall', FALSE );

	ACTION_TriggerEvent( 'Event_StartFishTale' );
	ACTION_TriggerEvent( 'Event_StartScribe' );		//---Start Scribe

	ACTION_ClearPawnIdleQueue( 'AP_Hartsock' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_standing_idle' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hartsock', FALSE );

	ACTION_GivePlayerWeapon( AP_Fishlistener, "gbxInventory.WeapUSM1_" );
	ACTION_ReattachWeapon( AP_Fishlistener, '');

	ACTION_TriggerEvent( 'Scene_IntroBarn' );		//---FIRST SHOT!

	sleep( 0.5 );
	ACTION_UnblockActionKeys( -1 );
	ACTION_TriggerEvent( 'TS_D15_1130_Credits' );
	ACTION_TriggerEvent( 'Event_StartHelmetAnims' );
}


state FirstScene
{
Begin:

//-------------------------------------------------------
//-------------------------------------FIRST SEQUENCE----
//-------------------------------------------------------
	ACTION_SaveMemoryReport( "BOOKENDS1_SEQ1" );
	ResetAbsoluteTime();
	StartAbsoluteTime();
	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_RAIN_BATTLE", 5.0,, true );

	WaitForAbsoluteTime( i += 0.75 );
	ACTION_TriggerEvent( 'TS_D15_1130_Walkers' );
	WaitForAbsoluteTime( i += 4.625 );


	ACTION_ClearPawnIdleQueue( 'AP_Hartsock' );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_sits_accepts_coffee', 0.0, 1.0 );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_idle_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hartsock', FALSE );
	ACTION_TriggerEvent( 'Event_StartHelmetSitdown' );

//	MARSHALL (motions towards chair)
//	Marshall: At ease Sargeant.
	ACTION_DisplaySubTitleMessage2(S_Localize("MARSHALL_A1"), 2.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_at_ease_sgt', 1.0, 1.0 );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_A", 1.0, 1.0, 1024, TRUE );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_A" );

	WaitForAbsoluteTime( i += 0.4 );
	WaitForAbsoluteTime( i += 2.6 );
	ACTION_TriggerEvent( 'Scene_HartsockSitdown' );			//-----Scene HartsockSitdown
	WaitForAbsoluteTime( i += 1.0 );

//	Marshall: You want some coffee son?  It's fresh.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A2" ), 3.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i += 1.0 );
	ACTION_SetHidden( 'SM_HartsockCoffeeCup1', true );
	WaitForAbsoluteTime( i += 1.0 );

//	Marshall: Well as fresh as it gets around here.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A3" ), 2.5, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i += 0.1 );
	ACTION_SetHidden( 'SM_HartsockCoffeeCup2', false );
	WaitForAbsoluteTime( i += 4.65 );

//	HARTSOCK stutters for a moment as he gets his helmet off.  He has a seat and sets down his Thompson next to him.  
//	He tries to settle for a moment in the chair.
//	He grabs the cup from across the table with both hands, he holds it near his face for a moment.

//HARTSOCK_A1="Hartsock: Yes sir.  Haven't had a good cup o' coffee in three or four days now."
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_A", 1.0, 1.0, 1024, TRUE );
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_A1" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_A" );

	WaitForAbsoluteTime( i += 1.0 );
	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2
	WaitForAbsoluteTime( i += 3.5 );
	ACTION_AttachStaticMesh( AP_Marshall, StaticMesh's_npc_item_us.equipment.pencil', 'pencil_marshall' );

//HARTSOCK_A2="Hartsock: Smell's great.  Thank you sir."
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_A2" ), 2.5, 1 , 1 , 1 , , TRUE );

	ACTION_TriggerEvent( 'Emitter_RainOnBarn' );
	ACTION_TriggerEvent( 'Emitter_IntroRain' );
	ACTION_TriggerEvent( 'Emitter_InsideOnlyRain' );
	WaitForAbsoluteTime( i += 2.5 );

	ACTION_TriggerEvent( 'Scene_IntroShot1' );			//-----SHOT 1
	WaitForAbsoluteTime( i += 1.35 );

//	WaitForAbsoluteTime( i += 2.5 );
//	Marshall: Name and rank?
	ACTION_DisplaySubTitleMessage2(S_Localize("MARSHALL_B"), 2.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_name_and_rank', 0.2, 1.0 );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_B", 1.0, 1.0, 1024, TRUE );

	WaitForAbsoluteTime( i += 0.1 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_B" );
	WaitForAbsoluteTime( i += 0.4 );

	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2
	ACTION_SetHidden( 'AP_Walker01', false );
	ACTION_SetHidden( 'AP_Walker02', false );
	WaitForAbsoluteTime( i += 1.6 );

//	Hartsock: Sgt. Joe Hartsock, sir.  Uh, well everyone calls me Red.
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_B1"), 5.5, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_sgt_joe', 0.2, 1.0 );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hartsock', FALSE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_B", 1.0, 1.0, 1024, TRUE );

	WaitForAbsoluteTime( i += 0.13 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_B" );
	WaitForAbsoluteTime( i += 8.37 );

//HARTSOCK_B2="Hartsock: So how long is this gonna take?"
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B2" ), 2.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i += 1.75 );
	ACTION_TriggerEvent( 'Scene_IntroShot1' );			//-----SHOT 1
	WaitForAbsoluteTime( i += 0.25 );

//(a self corrective beat)
//HARTSOCK_B3="Hartsock: Sir."
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B3" ), 1.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i += 1.5 );

//HARTSOCK_B4="Hartsock: I'd just like to get back to my men."
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B4" ), 2.3, 1 , 1 , 1 , , TRUE );
	WaitForAbsoluteTime( i += 3.0 );

//	Marshall: 2nd?
	ACTION_DisplaySubTitleMessage2(S_Localize("MARSHALL_C"), 2.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_second', 0.2, 1.0 );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_C", 1.0, 1.0, 1024, TRUE );

	ACTION_TriggerEvent( 'Event_CoffeeLookUp' );
	WaitForAbsoluteTime( i += 0.1 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_C" );
	WaitForAbsoluteTime( i += 0.9 );

//HARTSOCK_C="Hartsock: Sir?"
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_C" ), 1.4, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_sir', 0.2, 1.0 );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_C", 1.0, 1.0, 1024, TRUE );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_C" );

	ACTION_TriggerEvent( 'Scene_IntroShot3' );			//-----SHOT 3
	ACTION_TriggerEvent( 'Event_StartBringer' );
	AP_Bringer.bHidden = false;
	WaitForAbsoluteTime( i += 2.0 );
	ACTION_TriggerEvent( 'Emitter_RainOnBarn' );

//	Marshall: You and your men are in 2nd squad correct?
	ACTION_DisplaySubTitleMessage2(S_Localize("MARSHALL_D"), 3.0, 1, 1, 1, TRUE, TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_D", 1.0, 1.0, 1024, TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_you_and_your_men', 0.2, 1.0 );

	WaitForAbsoluteTime( i += 0.5 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_D" );
	WaitForAbsoluteTime( i += 3.2 );

//	Hartsock: Oh!  Yes, sir.  Second took heavy losses at Carentan.  I was with 3rd at the time-
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_D"), 4.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_oh_yes_sir', 0.2, 1.0 );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_D", 1.0, 1.0, 1024, TRUE );

	WaitForAbsoluteTime( i += 0.3 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_D" );
	WaitForAbsoluteTime( i += 0.9 );
	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i += 0.2 );
//	AP_Marshall.bHidden = true;
	ACTION_DestroyActor( 'AP_Bringer' );
	WaitForAbsoluteTime( i += 3.8 );
	ACTION_TriggerEvent( 'Event_StartRunner04' );
	WaitForAbsoluteTime( i += 0.5 );
	ACTION_TriggerEvent( 'Event_StartRunner05' );
	WaitForAbsoluteTime( i += 0.6 );

//	Marshall: Under Sgt. Matthew Baker?
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_under_sgt_matthew', 0.2, 1.0 );

	WaitForAbsoluteTime( i += 0.4 );
	AP_Marshall.bHidden = false;
	ACTION_TriggerEvent( 'Scene_IntroShot5' );			//-----SHOT 5
//	AP_Hartsock.bHidden = true;
	WaitForAbsoluteTime( i += 0.2 );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_E", 1.0, 1.0, 1024, TRUE );
	ACTION_DisplaySubTitleMessage2(S_Localize("MARSHALL_E"), 2.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_E" );
	WaitForAbsoluteTime( i += 2.7 );

//	Hartsock: Sort of, yes sir.
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_sort_of_yes', 0.2, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_E"), 2.0, 1, 1, 1, TRUE, TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_E", 1.0, 1.0, 1024, TRUE );

	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i += 0.15 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_E" );
	WaitForAbsoluteTime( i += 0.1 );
	AP_Marshall.bHidden = true;
	WaitForAbsoluteTime( i += 2.2 );

//	Marshall: Sort of?
	ACTION_DisplaySubTitleMessage2(S_Localize("MARSHALL_F"), 2.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_sort_of', 0.2, 1.0 );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_F", 1.0, 1.0, 1024, TRUE );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_F" );

	WaitForAbsoluteTime( i += 0.5 );
	AP_Marshall.bHidden = false;
	ACTION_TriggerEvent( 'Scene_IntroShot3' );			//-----SHOT 3
	WaitForAbsoluteTime( i += 1.0 );

//	Hartsock: We were promoted less than twenty days apart.
//			Carentan seemed so small next to what happened in St. Saveur.
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_we_were_promoted', 0.2, 1.0 );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_AA", 1.0, 1.0, 1024, TRUE );
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_F"), 5.0, 1, 1, 1, TRUE, TRUE );

	WaitForAbsoluteTime( i += 0.175 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_AA" );
	WaitForAbsoluteTime( i += 2.8 );
	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2
	WaitForAbsoluteTime( i += 3.75 );

//	Marshall: -and your first objective as a Sergeant was taking St. Saveur?
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_and_your_first', 0.2, 1.0 );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_AA", 1.0, 1.0, 1024, TRUE );
	ACTION_DisplaySubTitleMessage2(S_Localize("MARSHALL_G"), 3.0, 1, 1, 1, TRUE, TRUE );

	WaitForAbsoluteTime( i += 0.1 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_AA" );
	WaitForAbsoluteTime( i += 4.0 );

	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i += 0.1 );
	AP_Marshall.bHidden = true;
	WaitForAbsoluteTime( i += 0.15 );

//	Hartsock: (dejected) Yes sir.
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_G"), 2.0, 1, 1, 1, TRUE, TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_G", 1.0, 1.0, 1024, TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_yes_sir', 0.2, 1.0 );


	WaitForAbsoluteTime( i += 0.2 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_G" );
	WaitForAbsoluteTime( i += 1.4 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_looks_down', 0.2, 1.0 );

//	Marshall: How did your drop go?
	ACTION_DisplaySubTitleMessage2(S_Localize("MARSHALL_H"), 2.0, 1, 1, 1, TRUE, TRUE );
//	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_how_did_the_drop_go', 0.2, 1.0 );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_H", 1.0, 1.0, 1024, TRUE );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_H" );

	ACTION_TriggerEvent( 'Emitter_InsideOnlyRain' );
	WaitForAbsoluteTime( i += 3.0 );
	MyPlayer.StopMusic( BARN_AMB, 0 );


//-------------------------------------------------------
//-------------------------------------PLANE SEQUENCE----
//-------------------------------------------------------

//slog( "****-------------------------------------PLANE SEQUENCE" );
	ACTION_SaveMemoryReport( "CQ_E3_PLANE_SEQ" );
	ACTION_TriggerEvent( 'InteriorScene' );

	ACTION_TriggerEvent('Clouds_Plane');
	ACTION_TriggerEvent('Planes_Moving');
	ACTION_WideScreenOverlay( GetLocalPlayerController(), 0 );


//slog("--------------------------------------Shake--------------");
		ACTION_PlayLocalSound( "EXPLOSIONS.FLAK" );

	ACTION_TriggerEvent( 'Event_StartPlaneAnims' );
	ACTION_CameraInPawnHead( 'AP_HartsockPlane', 'InteriorScene', TRUE);//----------CAM IN ANIMATION

//SLog( "********* Moving Skybox ACTIVATE! *********" );	
	ACTION_TriggerEvent( 'Moving_SkyDome' );
	ACTION_TriggerEvent( 'Moving_SkyTerrain' );

//slog("--------------------------------------BigBlast---------");
	C47_DAMAGED = MyPlayer.PlayMusic( "MUSIC.INT_C47_DAMAGED", 3.0,, true );
	ACTION_TriggerEvent( 'WindowsLights' );
	ACTION_PlayLocalSound( "EXPLOSIONS.PLANE_HIT_LARGE_A" );
	ACTION_TriggerEvent( 'engine_fire' );

	ResetAbsoluteTime();
	StartAbsoluteTime();

	i = 0.25;

		WaitForAbsoluteTime( i );
//	ACTION_TriggerEvent('TL_EngineFire');
		WaitForAbsoluteTime( i += 0.3 );

	ACTION_PlaySound( 'BigBlast_Squib1_SM', "IMPACTS.bullet_glass", 1.0, 1.0, 160.0 );
	ACTION_TriggerEvent('BigBlast_Glass');
	ACTION_PlayLocalSound( "EXPLOSIONS.PLANE_HIT_LARGE_A" );

		WaitForAbsoluteTime( i += 0.2 );
	ACTION_PlaySound('BigBlast_Squib1_SM' , "EXPLOSIONS.PLANE_HIT_SMALL_A", 1.0, 1.0, 160.0 );
	ACTION_SetHidden ('BigBlast_Squib1_SM' , FALSE);
	ACTION_TriggerEvent('BigBlast_Squib1');

		WaitForAbsoluteTime( i += 0.15 );
	ACTION_PlaySound('BigBlast_Squib2_SM' , "IMPACTS.bullet_metal", 1.0, 1.0, 160.0 );
	ACTION_SetHidden ('BigBlast_Squib2_SM' , FALSE);
	ACTION_TriggerEvent('BigBlast_Squib2');

		WaitForAbsoluteTime( i += 0.2 );
	ACTION_PlaySound('BigBlast_Squib3_SM' , "IMPACTS.bullet_metal", 1.0, 1.0, 160.0 );
	ACTION_SetHidden ('BigBlast_Squib3_SM' , FALSE);
	ACTION_TriggerEvent('BigBlast_Squib3');

		WaitForAbsoluteTime( i += 0.1 );
	ACTION_PlaySound('BigBlast_Squib4_SM' , "IMPACTS.bullet_metal", 1.0, 1.0, 160.0 );
	ACTION_SetHidden ('BigBlast_Squib4_SM' , FALSE);
	ACTION_TriggerEvent('BigBlast_Squib4');
	ACTION_TriggerEvent('FlakHigh');

		WaitForAbsoluteTime( i += 1.5 );
//slog("--------------------------------------Shake1---------");
	ACTION_PlayLocalSound( "EXPLOSIONS.FLAK" );
		WaitForAbsoluteTime( i += 0.6 );
	Garnett = GetFirstActor( 'LT_Garnett' );
	LT_Garnett = Garnett.PlayOwnedSound( sound'D15_1130.GARNETT_A' );
	ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_A" ), 3.0, 1, 1, 1, TRUE, TRUE );		
		WaitForAbsoluteTime( i += 1.5 );
	ACTION_PlayLipSyncSoundDirect( AP_Allen, "D15_1130.ALLEN_A", 1.0, 1.0, 1024.0, TRUE );
	ACTION_DisplaySubTitleMessage2( S_Localize( "ALLEN_A" ), 3.0, 1, 1, 1, TRUE, TRUE );
		WaitForAbsoluteTime( i += 1.4 );

//slog("--------------------------------------Shake2---------");
	ACTION_PlayLocalSound( "EXPLOSIONS.FLAK" );
	ACTION_PlayLipSyncSoundDirect( AP_Mac, "D15_1130.MAC_A", 1.0, 1.0, 1024.0, TRUE );
	ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_A" ), 2.2, 1, 1, 1, TRUE, TRUE );
		WaitForAbsoluteTime( i += 2.4 );

	ACTION_DisplaySubTitleMessage2( S_Localize( "ALLEN_B" ), 3.0, 1, 1, 1, TRUE, TRUE );	
		WaitForAbsoluteTime( i += ACTION_PlayLipSyncSoundDirect( AP_Allen, "D15_1130.ALLEN_B", 1.0, 1.0, 1024.0, TRUE ) );

//slog("--------------------------------------Shake3---------");
	ACTION_PlayLocalSound( "EXPLOSIONS.FLAK" );
		WaitForAbsoluteTime( i += 1.2 );

//slog("-------------------------------BakerStandInDoor---------------------------------------------------");
	ACTION_TriggerEvent( 'Event_Baker_walks' );

//	Mac: Baker!  Stand in the door!
	ACTION_PlayLipSyncSoundDirect( AP_Mac, "D15_1130.Mac_C", 1.0, 1.0, 1024.0, TRUE );
	ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_B" ), 5.0, 1, 1, 1, TRUE, TRUE );

	ACTION_TriggerEvent( 'Event_Mac_Baker_Stand' );

	ACTION_TriggerEvent('para_dudes');
//	ACTION_TriggerEvent('SearchBeams');
//	ACTION_TriggerEvent('SearchBeamsTwo');
		WaitForAbsoluteTime( i += 0.3 );
	ACTION_TriggerEvent('stick_b');
		WaitForAbsoluteTime( i += 0.4 );
	ACTION_TriggerEvent('stick_c');
//slog("--------------------------------------Shake----------");
	ACTION_PlayLocalSound( "EXPLOSIONS.FLAK" );
		WaitForAbsoluteTime( i += 0.8 );
	ACTION_TriggerEvent('stick_e');

	ACTION_TriggerEvent('FlakHeavy');
	ACTION_TriggerEvent('FlakLight');
		WaitForAbsoluteTime( i += 0.9 );

//slog("--------------------------------------Shake4---------");
	ACTION_PlayLocalSound( "EXPLOSIONS.FLAK" );
		WaitForAbsoluteTime( i += 0.7 );

//slog("--------------------------------------Shake5---------");
	ACTION_PlayLocalSound( "EXPLOSIONS.FLAK" );
		WaitForAbsoluteTime( i += 2.0 );
	ACTION_TriggerEvent('FlakPlaneCrash');

	ACTION_DestroyActor( 'Planes_FlakPlaneCrash' );

//sLog("--------------------------------------WingBlast------");
		WaitForAbsoluteTime( i += 3.0 );

	ACTION_TriggerEvent('FlakPlaneCrashGround');

	ACTION_TriggerEvent( 'Event_Mac_GoGoGo' );
	WaitForAbsoluteTime( i += 2.25 );
//	Mac: Everyone out now now now!
	ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_C" ), 5.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Mac, "D15_1130.MAC_B", 1.0, 1.0, 1024, TRUE );
	ACTION_TriggerEvent( 'Event_LeggettJump' );
	ACTION_TriggerEvent( 'Event_AllenJump' );
	WaitForAbsoluteTime( i += 1.25 );
	ACTION_TriggerEvent( 'Event_CorrionJump' );
	ACTION_WaitForAnimEnd( AP_Corrion, 0 );

//------------------------------------------------------------*****Prepare Barn Animations
	ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
	AP_Marshall.bHidden = false;
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_idle_looking_down', 0.0, 1.0,,75 );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_second', 0.2, 1.0 );
//------------------------------------------------------------*****Stop Matinee Sequence
	ACTION_TriggerEvent( 'Scene_IntroShot2' );
	ACTION_CameraInPawnHead( 'AP_HartsockPlane', 'InteriorScene', FALSE);//----------CAM DONE
	ACTION_TriggerEvent('FlakHeavy');
	ACTION_TriggerEvent('FlakLight');
	MyPlayer.StopMusic( C47_DAMAGED, 0.2 );
	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_RAIN_BATTLE", 1.5,, true );

//-------------------------------------------------------
//-------------------------------BACK INSIDE BARN--------
//-------------------------------------------------------

	ResetAbsoluteTime();
	StartAbsoluteTime();
	ACTION_SaveMemoryReport( "CQ_E3_BARN_SEQ2" );
	i = 0.5;
	WaitForAbsoluteTime( i );
	ACTION_PlayLocalSound( "D15_1130_SOUNDS.JEEP_PULL_UP" );
	WaitForAbsoluteTime( i += 0.55 );

//	HARTSOCK: Rocky.
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_rocky', 0.2, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_H1"), 2.0, 1, 1, 1, TRUE, TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_H", 1.0, 1.0, 1024, TRUE );

	WaitForAbsoluteTime( i += 0.2 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_H" );

//	(a beat)
	WaitForAbsoluteTime( i += 1.9 );
	ACTION_TriggerEvent( 'Moving_SkyDome' );
	ACTION_SetHidden( 'AP_JeepPass', false );
	ACTION_SetHidden( 'AP_JeepDriver', false );
	ACTION_SetHidden( 'AP_Jeep', false );
	ACTION_TriggerEvent( 'TS_D15_1130_Jeep' );					//-----Jeep Scene
	WaitForAbsoluteTime( i += 2.0 );
	ACTION_TriggerEvent( 'engine_fire' );
	ACTION_DestroyActor( 'engine_fire' );

//	Hartsock: There was so much smoke and fire we didn't even see Muzza.
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_H2"), 4.0, 1, 1, 1, TRUE, TRUE );

//	ACTION_TankMoveTo( AP_Tank1, MoveTank1_01 );		//-----MOVE TANK

	WaitForAbsoluteTime( i += 0.8 );
	ACTION_TriggerEvent( 'Emitter_JeepRain' );
	WaitForAbsoluteTime( i += 1.7 );

//-------------------------------------------------------
//-------------------------------MUZZA SHOT IN PLANE-----
//-------------------------------------------------------
//------------------------------------------------------------*****Start Matinee Sequence
	slog( "----------------------------------------------------------*****Muzza Scene" );
	ACTION_TriggerEvent( 'Scene_IntroSceneMuzza' );

	MyPlayer.StopMusic( BARN_AMB, 0 );
	C47_MUZZA = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_C47DROP", 3.0,, true );

	WaitForAbsoluteTime( i += 1.5 );

//	Marshall (V.O.): Muzza?
	ACTION_DisplaySubTitleMessage2(S_Localize("MARSHALL_I"), 3.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_I" );

	WaitForAbsoluteTime( i += 2.0 );

//	Hartsock (V.O.): He was the last in the stick.  Took a piece of flak in the chest.", 3.0, 1, 1, 1, TRUE, TRUE );
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_I1"), 4.0, 1, 1, 1, TRUE, TRUE );

	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_I" );

	WaitForAbsoluteTime( i += 4.5 );

//	Hartsock (V.O.): He was dead before we even noticed he was on the floor.
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_I2"), 3.0, 1, 1, 1, TRUE, TRUE );

	WaitForAbsoluteTime( i += 2.0 );
//	ACTION_TriggerEvent( 'FlakExplosion01' );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_we_just_left', 0.2, 1.0 );
	WaitForAbsoluteTime( i += 1.75 );

//------------------------------------------------------------*****Stop Matinee Sequence
	ACTION_TriggerEvent( 'Scene_IntroShot2' );
//	ACTION_TriggerEvent('FlakHeavy');
	MyPlayer.StopMusic( C47_MUZZA, 3.0 );
	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_RAIN_BATTLE", 3.0,, true );
	WaitForAbsoluteTime( i += 2.5 );

//-------------------------------------------------------
//-------------------------------BACK INSIDE BARN--------
//-------------------------------------------------------

//	Hartsock: We just left him in the plane.
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_J"), 3.0, 1, 1, 1, TRUE, TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_J", 1.0, 1.0, 1024, TRUE );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_J" );

	WaitForAbsoluteTime( i += 4.6 );

//	Hartsock:  Can we talk about something else sir?
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_K"), 3.0, 1, 1, 1, TRUE, TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_K", 1.0, 1.0, 1024, TRUE );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_K" );
	WaitForAbsoluteTime( i += 3.0 );

//	Marshall: Alright, tell me what happened after you landed in Normandy?
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_alright_tell_me', 0.2, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize("MARSHALL_J"), 4.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_J" );
	WaitForAbsoluteTime( i += 6.0 );

// NO_FADE = 0;
// FADE_TO_BLACK = 1;
// FADE_FROM_BLACK = 2;
// FADE_START_BLACK = 3;
	ACTION_FadeOverlay( GetLocalPlayerController(), 1, 2.0, false );
	MyPlayer.StopMusic( BARN_AMB, 8.0 );
	ACTION_TriggerEvent( 'TriggeredScriptMapComplete' );
}

