//=============================================================================
// TS_D15_1230_IntroScene_NoCamera.
//=============================================================================
class TS_D15_1230_IntroScene_NoCamera extends TriggeredScript
	placeable;

var int C47 , C47_FLAK , C47_FLAK_HEAVY , C47_MUZZA , BARN_AMB, LT_Garnett, C47_DAMAGED;
var Actor MyPlayer, Garnett, SM_HiddenFence, SM_HartsockCig, Emitter_CigSmoke, Emitter_BreatheSmoke;
var AnimPawn AP_Hartsock, AP_Scribe, AP_Marshall, AP_Fishlistener, AP_Fishteller, AP_Bringer, AP_Doyle, AP_Lumberjack,
	AP_Baker, AP_Mac, AP_Leggett, AP_Allen, AP_Corrion, AP_Zanovich, AP_Muzza, AP_HartsockPlane;
var Tank AP_Tank1;
var ActorLite MoveTank1_01, PN_CorrionToMarshall;
var float i;
var ScriptedSequence SS_Hartsock;

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
//	ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
	MyPlayer = GetFirstActor( 'gbxPlayerStart' );

	ACTION_FadeOverlay( GEtLocalPlayerController(), 2, 6.0 );

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
	AP_Leggett = AnimPawn( Getpawn( 'AP_Leggett_Radio' ));
	AP_Baker = AnimPawn(GetPawn('AP_Baker_Dazed'));

	SM_HartsockCig = GetFirstActor( 'LT_Smoke' );
	Emitter_CigSmoke = GetFirstActor( 'Emitter_CigEmbers' );
	Emitter_BreatheSmoke = GetFirstActor( 'Emitter_BreatheSmoke' );

	AP_Mac = AnimPawn(GetPawn('AP_Mac'));
	AP_Mac.bNoTurnBody = true;

	SS_Hartsock = ScriptedSequence( GetFirstActor( 'SS_HartsockSitDown' ));
	PN_CorrionToMarshall = GetNavigationPoint( 'PN_CorrionToMarshall' );

	ACTION_SetAnimSetDirect( AP_Hartsock, "a_cin_d15_Bookends_2.a_cin_d15_Bookends_2" );
	ACTION_SetAnimSetDirect( AP_Marshall, "a_cin_d15_Bookends_2.a_cin_d15_Bookends_2" );

	ACTION_ClearPawnIdleQueue( 'AP_Marshall' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Marshall', 'Marshall_sitting_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Marshall', FALSE );

	ACTION_TriggerEvent( 'Event_StartFishTale' );
	ACTION_TriggerEvent( 'Event_StartScribe' );		//---Start Scribe
//	ACTION_TriggerEvent( 'Event_StartBringer' );

	ACTION_ClearPawnIdleQueue( 'AP_Hartsock' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_sitting_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_sitting_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hartsock', FALSE );

	ACTION_AttachStaticMesh( AP_Hartsock, StaticMesh's_npc_item_us.prop.cigarette', 'cig_hartsock' );
//	AP_Hartsock.AttachToBone( SM_HartsockCig, 'cig_in_hand' );
	AP_Hartsock.AttachToBone( Emitter_CigSmoke, 'cig_hartsock' );
	AP_Hartsock.AttachToBone( Emitter_BreatheSmoke, 'Bone56' );

//	SM_HartsockCig.SetRelativeLocation( vect(3, 7, -2 ) );  // +right/left, +forward/back, +down/up
//	SM_HartsockCig.SetRelativeRotation( rot( 0.0, -6000.0, 18384.0) );


//	ACTION_TriggerEvent( 'Scene_CorrionShot2' );			//-----SHOT 1
	ACTION_TriggerEvent( 'Event_StartBakerAnims' );
	ACTION_SetHidden( 'SM_Table', true );/*
}


state FirstScene
{
Begin:
*/
//-------------------------------------------------------
//-------------------------------------FIRST SEQUENCE----
//-------------------------------------------------------
//	ACTION_TriggerEvent( 'TS_D15_1230_Intro' );
	ACTION_SaveMemoryReport( "BOOKENDS2_SEQ1" );
	ResetAbsoluteTime();
	StartAbsoluteTime();
//	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_RAIN_BATTLE", 3.0 );
//	ACTION_TriggerEvent( 'Emitter_IntroRain' );
//	ACTION_TriggerEvent( 'Emitter_HouseRain' );
//	MyPlayer.StopSound( BARN_AMB, 0 );
//	ACTION_TriggerEvent( 'TS_D15_1130_Walkers' );
	WaitForAbsoluteTime( i += 3.0 );

//	HARTSOCK and MARSHALL are still sitting at the table discussing.  HARTSOCK is now smoking a cigarette and looking outside at the men talking and doing some army chores.

//	Marshall: Which brings us to Hill 30.
//	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_K", 1.0, 1.0, 120.0 );
//	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_second_N_your_men', 0.2, 1.0 );

	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_baker_didnt', 0.2, 1.0, true );

/*	WaitForAbsoluteTime( i+= 1.0 );
//	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i+= 2.0 );

//	Marshall: Sgt. Baker did a good job on that line.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_B1" ), 5.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_L", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 2.5 );

//	Marshall: Must have been a hell of a fight.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_B2" ), 2.5, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_sitting_smoking_3', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 1.5 );
//	ACTION_TriggerEvent( 'Emitter_CigSmoke' );
	WaitForAbsoluteTime( i+= 0.5 );
//	ACTION_TriggerEvent( 'Emitter_CigSmoke' );
	WaitForAbsoluteTime( i+= 2.0 );

//	Hartsock: Baker didn't save us.

	WaitForAbsoluteTime( i+= 2.0 );

	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_A" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_L", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 2.0 );
//	ACTION_TriggerEvent( 'Scene_IntroShot5' );			//-----SHOT 5

//	Marshall: Excuse me Sergeant?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_C" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_M", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 2.75 );
//	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4

//	Hartsock: Sorry sir.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B1" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_M", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 4.0 );

//	Hartsock: What I mean is... I've been hearing a lot of talk around here that Baker saved us at Hill 30, bringing in those tanks and all.  That's not what happened.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B2" ), 7.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 2.0 );
//	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2
	WaitForAbsoluteTime( i+= 4.0 );
*/
/*
//------------------------------------------------------------
//			EXT. HILL 30 - MORNING - LEGGETT RADIO
//------------------------------------------------------------

	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Squibs' );	//===== Start squibs
	ACTION_TriggerEvent( 'Emitter_TracerHell' );		//===== Tracers

	WaitForAbsoluteTime( i+= 2.0 );

	ACTION_TriggerEvent( 'Event_StartLeggettRadio' );
	AP_Leggett.bHidden = False;
	ACTION_TriggerEvent( 'Scene_LeggettShot1' );			//-----SHOT LEGGETT 1
//	Leggett:  I need Armor support now!
	ACTION_DisplaySubtitleMessage2(S_Localize("LEGGETT_A" ), 7.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Leggett, "D71400.LEGGETT_L", 1.0, 1.0, 160.0 );

	WaitForAbsoluteTime( i += 3.0 );

//	Leggett:  I mean right now!!!
	ACTION_DisplaySubtitleMessage2(S_Localize("LEGGETT_B" ), 7.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Leggett, "D71400.LEGGETT_M", 1.0, 1.0, 160.0 );

	AP_Marshall.bHidden = true;
	WaitForAbsoluteTime( i += 1.5 );


//------------------------------------------------------------
//			INT. SMALL BARN - CONTINUOUS
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	AP_Leggett.bHidden = True;
	WaitForAbsoluteTime( i += 0.75 );
//	Hartsock: Leggett saved us.  Just no one wants to talk about it.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_C" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_N", 1.0, 1.0, 120.0 );
	WaitForAbsoluteTime( i+= 4.0 );

//	Marshall: Why is that, Sergeant?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_D" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_N", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 3.0 );


//------------------------------------------------------------
//			EXT. HILL 30 - MORNING - LEGGETT TAKE ME
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Event_StartIntroAnims' );
	ACTION_SetHidden( 'AP_Wheaton' , false );
	ACTION_SetHidden( 'AP_Hooper' , false );
	ACTION_SetHidden( 'AP_York' , false );
	ACTION_SetHidden( 'AP_Doe' , false );

	ACTION_TriggerEvent( 'Event_StartLeggettBerzerk' );
	AP_Leggett = AnimPawn( Getpawn( 'AP_Leggett_berzerk' ));
	AP_Leggett.bHidden = False;
	ACTION_TriggerEvent( 'Scene_LeggettShot2' );			//-----SHOT LEGGETT 2

//	LEGGETT is standing on the hill firing his pistol at the tank.
//	Leggett: TAKE ME!!!
	ACTION_DisplaySubtitleMessage2(S_Localize("LEGGETT_C" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Leggett, "D15_1130.LEGGETT_B", 1.0, 1.0, 120.0 );
	WaitForAbsoluteTime( i+= 3.0 );
	ACTION_TriggerEvent( 'Leggett_Dead_Explosion' );
	AP_Leggett.bHidden = True;
	WaitForAbsoluteTime( i+= 1.75 );
	AP_Marshall.bHidden = false;
//	A blast hits the mound and sends LEGGETT backwards.


//------------------------------------------------------------
//			INT. SMALL BARN - AFTERNOON
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	AP_Leggett.bHidden = True;

	WaitForAbsoluteTime( i+= 0.75 );

//	Hartsock: He somehow managed to reach HQ on the radio.  They sent the tanks.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_D" ), 5.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_O", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2
	WaitForAbsoluteTime( i+= 2.0 );

//	Marshall: I can't confirm that.  I thought Pvt. Leggett's radio wasn't working.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_E" ), 5.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_O", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 1.5 );
	ACTION_TriggerEvent( 'Scene_IntroShot3' );			//-----SHOT 3
	WaitForAbsoluteTime( i+= 3.0 );

//	Hartsock: Couldn't receive sir, but he was transmitting.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_E" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_P", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'Event_BlownBackAnims' );
	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2
	WaitForAbsoluteTime( i+= 2.0 );

//	Marshall: And Sgt. Baker?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_F" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_P", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 2.5 );


//------------------------------------------------------------
//			EXT. HILL 30 - MORNING
//------------------------------------------------------------
//	A series of mortars strike down the field
//	the final one hitting very near BAKER and sending him flying into the hedgerow behind him.

	ACTION_TriggerEvent( 'Scene_BakerShot1' );			//-----SHOT 1

	WaitForAbsoluteTime( i+= 0.5 );
	ACTION_TriggerEvent( 'ET_Mortar4' );
	WaitForAbsoluteTime( i+= 0.05 );
	ACTION_TriggerEvent( 'Event_BakerBlownBack' );
	WaitForAbsoluteTime( i+= 1.0 );

//------------------------------------------------------------
//			INT. SMALL BARN - AFTERNOON
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i+= 1.25 );
//	Hartsock: He loved being in the thick of it.
//			Every time I turned around in Normandy he'd been knocked out by artillery or a mortar or some damn thing.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_F1" ), 7.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_Q", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 4.0 );
	ACTION_TriggerEvent( 'Scene_IntroShot3' );			//-----SHOT 3
	WaitForAbsoluteTime( i+= 4.5 );	

//	Hartsock: Yeah, he earned his stripes.  But so did the rest of us.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_F2" ), 5.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 4.0 );


//------------------------------------------------------------
//			EXT. HILL 30 - MORNING
//	BAKER is staring at MAC sort of dazed.  Blood is coming from inside BAKER's helmet and down the front of his face.
//	The sound is muted but faintly MAC ca be heard giving BAKER orders.
//------------------------------------------------------------
	ACTION_SetHidden( 'AP_Leggett_dead' , false );
	AP_Baker.bHidden = false;
	ACTION_TriggerEvent( 'Event_StartBakerDazedAnims' );
	ACTION_TriggerEvent( 'Scene_BakerShot2' );			//-----SHOT BAKER 2
	WaitForAbsoluteTime( i+= 2.0 );
//	Hartsock: -and I do mean earned.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_G" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_R", 1.0, 1.0, 120.0 );
	WaitForAbsoluteTime( i+= 4.0 );


//------------------------------------------------------------
//			INT. SMALL BARN - AFTERNOON
//------------------------------------------------------------
//	MARSHALL writes a few notes down for a moment.  There is a comfortable silence.

	ACTION_TriggerEvent( 'Scene_IntroShot1' );			//-----SHOT 1
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_listens_writes', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 4.0 );

//	Marshall: Baker got quite a scar.  Is yours from that battle too?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_G" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_Q", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'Scene_IntroShot1' );			//-----SHOT 1
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_yes_sir', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 3.5 );

//------------------------------------------------------------
//			INT. DIMLY LIT BAR - NIGHT
//------------------------------------------------------------

//	HARTSOCK FOV.
//	A man in a plaid shirt with a bit of a scruffy beard is holding a bottle in front of HARTSOCK.  He is clearly drunk.  He is shouting.

	AP_Lumberjack = AnimPawn( GetPawn( 'AP_Lumberjack' ));
	ACTION_TriggerEvent( 'Event_StartLumberjackAnims' );
	ACTION_TriggerEvent( 'Scene_Bar' );			//-----SHOT BAR

//	DRUNKEN MAN: It was my wife!  How dare you touch my wife!  I'll kill you, you son of a bitch!
	ACTION_DisplaySubtitleMessage2(S_Localize("DRUNKEN_MAN_A" ), 5.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Lumberjack, "D15_1130.DRUNKENMAN_A", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 4.0 );
//	DRUNKEN MAN breaks his bottle on the counter and lunges at HARTSOCK's face.
//	DRUNKEN MAN: I'll kill you!
	ACTION_DisplaySubtitleMessage2(S_Localize("DRUNKEN_MAN_B" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Lumberjack, "D15_1130.DRUNKENMAN_B", 1.0, 1.0, 120.0 );

	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_rocky', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 1.5 );

//------------------------------------------------------------
//			INT. SMALL BARN - CONTINUOUS
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4

	WaitForAbsoluteTime( i+= 1.75 );

//	Hartsock: Can we just talk about Hill 30 sir?
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_H" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_T", 1.0, 1.0, 120.0 );


	WaitForAbsoluteTime( i+= 4.0 );


	ACTION_DisplayMapStats();
//	MyPlayer.StopMusic( BARN_AMB, 0 );
*/
}
