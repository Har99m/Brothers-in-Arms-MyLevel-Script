//=============================================================================
// TS_IntroSceneNoMat.
//=============================================================================
class TS_IntroSceneNoMat extends TriggeredScript
	placeable;

var int C47 , C47_FLAK , C47_FLAK_HEAVY , C47_MUZZA , BARN_AMB, LT_Garnett, C47_DAMAGED;
var Actor MyPlayer, Garnett, SM_HiddenFence;
var AnimPawn AP_Hartsock, AP_Scribe, AP_Marshall, AP_Fishlistener, AP_Fishteller, AP_Bringer, AP_Doyle,
	AP_Baker, AP_Mac, AP_Leggett, AP_Allen, AP_Corrion, AP_Zanovich, AP_Muzza, AP_HartsockPlane;
var Tank AP_Tank1;
var ActorLite MoveTank1_01, PN_CorrionToMarshall;
var float i;

state Triggered
{
	function ontrigger()
		{
		Gotostate( 'FirstScene' );
		}
Begin:

//	ACTION_TriggerEvent( 'TS_D15_1130_E3IntroBuzz' );

//------------------------------------------------------------*****Start Matinee Sequence
	i = 1.0;
//	ACTION_StartRain( 50.0 );
	ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
	MyPlayer = GetFirstActor( 'gbxPlayerStart' );

	ACTION_TriggerEvent( 'CSU_Corrion' );
//	SM_HiddenFence = GetFirstActor( 'SM_HiddenFence' );
//	SM_HiddenFence.bHidden = true;
//	ACTION_SetHidden( 'SM_HiddenFence', true );

//	ACTION_SetHidden( 'AP_Jeep', true );
//	ACTION_SetHidden( 'AP_JeepPass', true );
//	ACTION_SetHidden( 'AP_JeepDriver', true );
	ACTION_SetHidden( 'AP_Walker01', true );
//	ACTION_SetHidden( 'AP_Walker02', true );

//	ACTION_SetHidden( 'SM_ScribeCoffeeCup', true );

/*	SPAWN TANK
	ACTION_TriggerEvent( 'Tank_USA_01' );
	AP_Tank1 = Tank( GetFirstActor( 'Tank1' ));
	ACTION_TankEnterScriptedMode( AP_Tank1 );
	ACTION_TankSetSpeed( AP_Tank1, 0.4 );
	MoveTank1_01 = GetNavigationPoint( 'PN_MoveTank1_01' );
	AP_Tank1.bNoSound = true;
*/
	AP_Hartsock = AnimPawn( Getpawn( 'AP_Hartsock' ));
	AP_Marshall = AnimPawn( Getpawn( 'AP_Marshall' ));
	AP_Bringer = AnimPawn( Getpawn( 'AP_Bringer' ));

	AP_Doyle = AnimPawn(GetPawn('AP_Doyle_Doyle'));

	AP_Baker = AnimPawn(GetPawn('AP_Baker'));
	AP_Baker.bNoTurnBody = true;

	AP_Mac = AnimPawn(GetPawn('AP_Mac'));
	AP_Mac.bNoTurnBody = true;

	PN_CorrionToMarshall = GetNavigationPoint( 'PN_CorrionToMarshall' );

	ACTION_SetAnimSetDirect( AP_Hartsock, "a_ev_all.a_ev_corrion" );
	ACTION_SetAnimSetDirect( AP_Hartsock, "a_cin_d15_Bookends_3.a_cin_d15_Bookends_3" );
	ACTION_SetAnimSetDirect( AP_Hartsock, "a_cin_d15_Prologue.a_cin_d15_Prologue" );
	ACTION_SetAnimSetDirect( AP_Marshall, "a_cin_d15_Prologue.a_cin_d15_Prologue" );
	ACTION_SetAnimSetDirect( AP_Marshall, "a_ev_all.a_ev_corrion" );

	ACTION_ClearPawnIdleQueue( 'AP_Marshall' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Marshall', 'Marshall_listens_simple' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Marshall', FALSE );

	ACTION_TriggerEvent( 'Event_StartFishTale' );
	ACTION_TriggerEvent( 'Event_StartScribe' );		//---Start Scribe
//	ACTION_TriggerEvent( 'Event_StartBringer' );

	ACTION_ClearPawnIdleQueue( 'AP_Hartsock' );
//	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_sits_accepts_coffee', 0.2, 1.0,,,1 );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_sitting_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_sitting_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hartsock', FALSE );

//	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	ACTION_TriggerEvent( 'Event_StartBakerAnims' );
}


state FirstScene
{
Begin:

//-------------------------------------------------------
//-------------------------------------FIRST SEQUENCE----
//-------------------------------------------------------
	ACTION_SaveMemoryReport( "E3_BARN_SEQ1" );
	ResetAbsoluteTime();
	StartAbsoluteTime();
//	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_RAIN_BATTLE", 3.0 );
//	ACTION_TriggerEvent( 'Emitter_IntroRain' );
//	ACTION_TriggerEvent( 'Emitter_HouseRain' );


//	MyPlayer.StopSound( BARN_AMB, 0 );
//	ACTION_TriggerEvent( 'TS_D15_1130_Walkers' );
	AP_Corrion = AnimPawn(GetPawn('AP_Corrion'));
	WaitForAbsoluteTime( i += 3.0 );
//	AP_Corrion.bNoTurnBody = true;
	ACTION_SetHiddenDirect( AP_Corrion, true );

//	HARTSOCK is still sitting at the table with MARSHALL.  HARTSOCK is visually more beaten down than before.

//	Hartsock: "That was five days ago."
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_A1" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_sgt_joe', 0.2, 1.0 );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_U", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_second_N_your_men', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 3.0 );

//	Hartsock: (a beat) I remember on the way to St. Martin he was going on and on about himself.  Sort of like a Doyle history lesson."
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_A2" ), 5.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 2.5 );
/*	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 4
	WaitForAbsoluteTime( i+= 4.5 );

//-------------------------------------------------------
//-------------------------------------DOYLE SEQUENCE----
//-------------------------------------------------------
//	ROAD TO ST. MARTIN - morning
//	DOYLE is walking and talking over his shoulder to HARTSOCK.

	ACTION_TriggerEvent( 'Scene_DoyleDummy' );
	ACTION_TriggerEvent( 'Event_StartAnimsDoyle' );
	ACTION_CameraInPawnHead( 'AP_Hartsock_Doyle', 'Scene_DoyleDummy', TRUE);//----------CAM IN ANIMATION

//	Doyle: Well my full name is Seamus Doyle.  
	ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_A1" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Doyle, "D15_1130.DOYLE_A", 1.0, 1.0, 120.0 );
	WaitForAbsoluteTime( i+= 3.0 );

//	Doyle: You see Seamus was my father's name, which is odd because I never knew my father really so I guess I never understood why my mother would name me after him.  
	ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_A2" ), 8.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 3.0 );
	ACTION_TriggerEvent( 'TS_D15_1130_Jeep' );
	WaitForAbsoluteTime( i+= 4.0 );

//	Doyle: -and my mother, she was a real piece of work.  Once made me wash the dishes at three o' clock in the morning.
	ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_A3" ), 6.5, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 6.0 );

//	Doyle: I mean she could cook like nobody's business, but the smell-
	ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_A4" ), 4.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 3.5 );

//	Doyle: -she once caught my sister kissing this guy... stapled her dress shut.
	ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_A5" ), 4.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 4.5 );

	ACTION_CameraInPawnHead( 'AP_Hartsock_Doyle', 'Scene_DoyleDummy', FALSE);//----------CAM IN ANIMATION

//-------------------------------------------------------
//-------------------------------------BACK IN BARN------
//-------------------------------------------------------

//	Int. SMALL BARN - CONTINUOUS
	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_well_I_wasnt', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 1.0 );

//	HARTSOCK:  That boy could talk.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_V", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 4.0 );

//	Marshall: I think that's all the questions I have.
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.MARSHALL_R", 1.0, 1.0, 120.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A1" ), 5.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_at_ease', 1.0, 1.0 );

	WaitForAbsoluteTime( i+= 0.45 );
	ACTION_TriggerEvent( 'Scene_IntroShot3' );			//-----SHOT 3
	WaitForAbsoluteTime( i+= 2.55 );

//	Marshall: Everything you said is important, a lot of good we can learn from this.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A2" ), 5.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 2.75 );
	ACTION_TriggerEvent( 'Scene_IntroShot5' );			//-----SHOT 5
	WaitForAbsoluteTime( i+= 1.0 );

//	MARSHALL_A3="Marshall: Sergeant Hartsock, you should get some rest.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A3" ), 5.0, 1 , 1 , 1 , , TRUE );
*/
	ACTION_SetHiddenDirect( AP_Corrion, false );
	ACTION_WalkDirect( AP_Corrion );
	ACTION_TriggerEvent( 'Event_StartCorrionAnims' );

	WaitForAbsoluteTime( i+= 4.0 );
//	CLOSE UP: HELMET.  DOYLE's 82nd patch is glued to the back of it.
//	ACTION_TriggerEvent( 'Scene_HartsockHelmet' );		//-----SHOT HARTSOCK HELMET

	WaitForAbsoluteTime( i+= 1.5 );

//HARTSOCK:  Still got miles to go before we rest sir.
	ACTION_DisplaySubtitleMessage2(S_Localize( "HARTSOCK_C" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_W", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 1.5 );
//HARTSOCK stands up from the table grabbing his helmet.
//	ACTION_PlayAnimDirect( AP_Hartsock, 'Hartsock_gets_up', 0.2, 1.0 );
	ACTION_ClearPawnIdleQueue( 'AP_Hartsock' );
//	ACTION_ChangeScriptedSequenceDirect( AP_Hartsock, 'SS_HartsockSitDown' );
	ACTION_ChangeScriptedSequenceDirect( AP_Hartsock, 'SS_HartsockGetUp' );

	ACTION_TriggerEvent( 'Event_StartHartsockGetUp' );
//	ACTION_TriggerEvent( 'Event_StartHartsockSitDown' );

//	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_gets_up', 0.2, 1.0,,,1 );
//	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_sits_down', 0.2, 1.0,,,1 );
//	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_sitting_idle' );
//	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hartsock', FALSE );
	WaitForAbsoluteTime( i+= 1.0 );
//	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2

	WaitForAbsoluteTime( i+= 4.0 );

//	HARTSOCK salutes and walks to the door.  On the way out CORRION is standing there waiting to go in.
//	ACTION_TriggerEvent( 'Scene_CorrionShot1' );		//-----SHOT CORRION 1
	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'Event_CorrionTalk' );
	WaitForAbsoluteTime( i+= 1.0 );

//	CorRION:  (to HARTSOCK) That took a while.
	ACTION_PlayLipSyncSoundDirect( AP_Corrion, "D15_1130.CORRION_A", 1.0, 1.0, 120.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize( "CORRION_A" ), 4.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 3.0 );

//	HARTSOCK:  Got a lot on my mind Sam.
	ACTION_DisplaySubtitleMessage2(S_Localize( "HARTSOCK_E" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_X", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 0.75 );
//	ACTION_TriggerEvent( 'Scene_CorrionShot2' );		//-----SHOT CORRION 2
	WaitForAbsoluteTime( i+= 4.25 );

//	HARTSOCK puts his hand on CORRION's shoulder for a moment and then walks off.
//	Int. Small BARN - conTINUOUS
//	CORRION stands before MARSHALL at the table.
	ACTION_MoveToward( AP_Corrion, PN_CorrionToMarshall,, AP_Marshall );
	WaitForAbsoluteTime( i+= 0.5 );
//	ACTION_TriggerEvent( 'Scene_CorrionShot3' );		//------CORRION SHOT 3

	while( !PawnIsAtDestination( AP_Corrion, PN_CorrionToMarshall ))
		{
			WaitForAbsoluteTime( i+= 0.5 );
		}

	WaitForAbsoluteTime( i+= 0.75 );
	ACTION_TriggerEvent( 'Event_CorrionAtMarshall' );
	WaitForAbsoluteTime( i+= 0.75 );
	AP_Corrion.Controller.Focus = AP_Marshall;
//	ACTION_WaitForPawnRotateToward( AP_Corrion );


//	MaRSHALL:  Name and rank?
	ACTION_DisplaySubtitleMessage2(S_Localize( "MARSHALL_B" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_B", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 1.0 );
	AP_Corrion.DetachWeapon( '' );	//rifle_hold
	WaitForAbsoluteTime( i+= 2.5 );

//	ACTION_TriggerEvent( 'Scene_CorrionShot4' );		//------CORRION SHOT 4
//	CorRION:  Cpl. Sam Corrion sir.
	ACTION_DisplaySubtitleMessage2(S_Localize("CORRION_B" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Corrion, "D15_1130.CORRION_B", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_TriggerEvent( 'Event_StartHartsockSitDown' );
	AP_Hartsock = AnimPawn( GetPawn( 'AP_Hartsock_SitDown' ) );
	WaitForAbsoluteTime( i+= 2.0 );

//	Ext. Small BARN - conTINUOUS
//	HARTSOCK walks for a few moments around the side of the barn.  He sees BAKER sitting against the side of the barn and decides to sit down next to him.
//	BakER:  How did it go with Col. Marshall?
//	ACTION_TriggerEvent( 'Scene_BakerShot1' );			//------BAKER SHOT 1
	ACTION_TriggerEvent( 'Event_BakerTalk' );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_A" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_BAKER, "D15_1130.BAKER_A", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 1.0 );
//	ACTION_TriggerEvent( 'Scene_BakerShot2' );			//------BAKER SHOT 2
	WaitForAbsoluteTime( i+= 3.0 );

//	HARTSOCK:  Oh you know, talked his ear off.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_F" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_Y", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_sitting_says_oh_you_know', 0.2, 1.0,,,1 );

	WaitForAbsoluteTime( i+= 1.0 );
//	ACTION_TriggerEvent( 'Scene_BakerShot3' );			//------BAKER SHOT 3
	WaitForAbsoluteTime( i+= 3.0 );

//	BAKER:  Yeah me too.(laughs)
	ACTION_TriggerEVent( 'Event_Baker_says_yeah' );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_B1" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_BAKER, "D15_1130.BAKER_B", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 2.0 );
//	ACTION_TriggerEvent( 'Scene_BakerShot2' );			//------BAKER SHOT 2

//	BAKER:  We should write a book.  We can call it "Baker and Red, through Hell and Highwater."
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_B2" ), 5.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 2.0 );
//	ACTION_TriggerEvent( 'Scene_BakerShot3' );			//------BAKER SHOT 3
	WaitForAbsoluteTime( i+= 3.0 );

//	HARTSOCK:  Why not Red and Baker?
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_G" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_Z", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_sitting_says_y_not_red', 0.2, 1.0,,,1 );

	WaitForAbsoluteTime( i+= 2.0 );

//	BAKER:  -because I made Sergeant before you did.
	ACTION_TriggerEvent( 'Event_Baker_says_because' );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_C" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_BAKER, "D15_1130.BAKER_C", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 1.5 );
//	ACTION_TriggerEvent( 'Scene_BakerShot4' );			//------BAKER SHOT 4
	WaitForAbsoluteTime( i+= 2.0 );

//	HARTSOCK:  Fair enough. 
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_H" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_ZA", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_sitting_says_fair_enough', 0.2, 1.0,,,1 );

	WaitForAbsoluteTime( i+= 2.5 );
/*
//	HARTSOCK:  (a beat) Baker...
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_I" ), 3.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 3.0 );

//	BAKER:  Yeah Red?
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_E" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_BAKER, "D15_1130.BAKER_D", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 4.0 );
*/
//	HARTSOCK:  (a beat) If we ever get back to England, I'm buying you a Whiskey.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_I" ), 5.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_ZB", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_sitting_says_if_we_ever', 0.2, 1.0,,,1 );

	WaitForAbsoluteTime( i+= 4.0 );

//	BAKER:  I like Whiskey.
	ACTION_TriggerEvent( 'Event_Baker_Like_Whiskey' );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_D" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_BAKER, "D15_1130.BAKER_E", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 5.0 );

	ACTION_DisplayMapStats();
	MyPlayer.StopMusic( BARN_AMB, 0 );

}

