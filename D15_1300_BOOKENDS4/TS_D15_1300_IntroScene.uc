//=============================================================================
// TS_D15_1300_IntroScene.
//=============================================================================
class TS_D15_1300_IntroScene extends TriggeredScript
	placeable;

var int BARN_AMB;
var Actor MyPlayer, SM_HiddenFence;
var AnimPawn AP_Hartsock, AP_Scribe, AP_Marshall, AP_Fishlistener, AP_Fishteller, AP_Bringer;
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

	i = 1.0;
	ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
	MyPlayer = GetFirstActor( 'gbxPlayerStart' );

//	ACTION_SetHidden( 'AP_Jeep', true );
//	ACTION_SetHidden( 'AP_JeepPass', true );
//	ACTION_SetHidden( 'AP_JeepDriver', true );
	ACTION_SetHidden( 'AP_Walker01', true );

	AP_Hartsock = AnimPawn( Getpawn( 'AP_Hartsock' ));
	AP_Marshall = AnimPawn( Getpawn( 'AP_Marshall' ));
	AP_Bringer = AnimPawn( Getpawn( 'AP_Bringer' ));
	AP_Fishlistener = AnimPawn(GetPawn('AP_Fishlistener'));

	SS_Hartsock = ScriptedSequence( GetFirstActor( 'SS_HartsockSitDown' ));
	PN_CorrionToMarshall = GetNavigationPoint( 'PN_CorrionToMarshall' );

	ACTION_SetAnimSetDirect( AP_Hartsock, "a_cin_d15_Bookends_3.a_cin_d15_Bookends_3" );
	ACTION_SetAnimSetDirect( AP_Hartsock, "a_cin_d15_Bookends_4.a_cin_d15_Bookends_4" );
	ACTION_SetAnimSetDirect( AP_Marshall, "a_cin_d15_Bookends_4.a_cin_d15_Bookends_4" );

	ACTION_ClearPawnIdleQueue( 'AP_Marshall' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Marshall', 'Marshall_sitting_idle_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Marshall', FALSE );

	ACTION_TriggerEvent( 'Event_StartFishTale' );
	ACTION_TriggerEvent( 'Event_StartScribe' );		//---Start Scribe
//	ACTION_TriggerEvent( 'Event_StartBringer' );

	ACTION_ClearPawnIdleQueue( 'AP_Hartsock' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_sitting_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_sitting_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hartsock', FALSE );

	ACTION_AttachStaticMesh( AP_Marshall, StaticMesh's_npc_item_us.equipment.pencil', 'pencil_marshall' );

	ACTION_GivePlayerWeapon( AP_Fishlistener, "gbxInventory.WeapUSM1_" );
	ACTION_ReattachWeapon( AP_Fishlistener, '');

//------------------------------------------------------------*****Start Matinee Sequence
	ACTION_TriggerEvent( 'Scene_IntroShot1' );			//-----SHOT 1
}


state FirstScene
{
Begin:

//-------------------------------------------------------
//-------------------------------------FIRST SEQUENCE----
//-------------------------------------------------------
	ACTION_SaveMemoryReport( "BOOKENDS4_SEQ1" );
	ResetAbsoluteTime();
	StartAbsoluteTime();
	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_WIND_BIRDS_BUGS", 3.0,, true );
//	ACTION_TriggerEvent( 'Emitter_IntroRain' );
//	ACTION_TriggerEvent( 'Emitter_HouseRain' );
//	MyPlayer.StopSound( BARN_AMB, 0 );
	ACTION_TriggerEvent( 'TS_D15_1300_Walkers' );

//	HARTSOCK is looking outside as the rain begins to slow down and stop.
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_can_I_speak', 0.2, 1.0 );
	WaitForAbsoluteTime( i += 2.53 );

//	Hartsock: Can I speak candidly sir?
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_A" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_BB", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 0.1 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_BB" );
	WaitForAbsoluteTime( i+= 2.4 );

//	Marshall: Of course Sargeant.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_of_course', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 0.1 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_BB" );
	WaitForAbsoluteTime( i+= 2.4 );

//	Hartsock: Well me and Baker... way before either one of us made Sargeant, used to
//	joke about how jumping in a stick of thirteen is bad luck.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B" ), 8.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_well_me_and_baker', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 0.2 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_CC" );

	WaitForAbsoluteTime( i+= 1.4 );
	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i+= 0.2 );
	AP_Marshall.bHidden = true;
	WaitForAbsoluteTime( i+= 7.0 );
	AP_Marshall.bHidden = false;
	WaitForAbsoluteTime( i+= 0.3 );
	ACTION_TriggerEvent( 'Scene_IntroShot5' );			//-----SHOT 5

//	Marshall: That's a bit juvenile, don't you think Sergeant?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_B" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_thats_a_bit', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 0.2 );
//	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_sitting_idle_1', 0.4, 1.0 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_CC" );
	WaitForAbsoluteTime( i+= 3.3 );

//	Hartsock: Well we were all so young then Sir. We even went so far as to paint a 13 on the back of our helmets...
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_C1" ), 6.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_all_so_young', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 0.15 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_DD" );
	WaitForAbsoluteTime( i+= 0.85 );
	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2
	WaitForAbsoluteTime( i+= 6.0 );

//	Hartsock: Basically saying if fate wants us fate can have us.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_C2" ), 3.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 1.5 );
	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i+= 2.0 );

//	Hartsock: Like we weren't afraid.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_C3" ), 2.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 2.0 );

//------------------------------------------------------------
//			EXT. PURPLE HEART LANE - MORNING
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Event_HartsockMourn' );
	ACTION_TriggerEvent( 'Scene_DesolaShot1' );			//-----SHOT DESOLA 1
	WaitForAbsoluteTime( i += 0.75 );

//	Hartsock:  But we were.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_D1" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_EE" );

	WaitForAbsoluteTime( i += 2.0 );

//	Hartsock:  Seeing Desola like that...
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_D2" ), 3.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i += 3.0 );

//	Hartsock: I was afraid sir.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_D3" ), 3.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i += 3.0 );

//------------------------------------------------------------
//			INT. SMALL BARN - CONTINUOUS
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2

//	Hartsock: I guess you could say I changed my mind at that point.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_E" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_I_guess', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 0.17 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_FF" );
	WaitForAbsoluteTime( i+= 3.83 );

//	Marshall: Changed your mind?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_C" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_changed_your_mind', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 0.1 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_DD" );
	WaitForAbsoluteTime( i+= 2.9 );

//------------------------------------------------------------
//			EXT. PURPLE HEART LANE CAUSEWAY - CONTINUOUS
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Event_HartsockThrowHelmet' );
//	ACTION_SetHidden( 'AP_Hartsock_ThrownHelmet', false );
	ACTION_TriggerEvent( 'Scene_DesolaShot2' );			//-----SHOT Desola 2

	WaitForAbsoluteTime( i+= 1.5 );

//	HARTSOCK holds his helmet in his hand staring out over the river.
//	Hartsock: Yeah I decided fate couldn't have me...
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_F1" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_GG" );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_GG", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 4.0 );

//	Hartsock: Or anyone else.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_F2" ), 3.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 1.0 );

//	HARTSOCK heaves his helmet far off into the river.

	WaitForAbsoluteTime( i+= 2.0 );


//------------------------------------------------------------
//			INT. SMALL BARN - AFTERNOON
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Scene_IntroShot5' );			//-----SHOT 5
//	Marshall: Was this around when you were promoted to Sergeant?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_D" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_EE", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_Was_this_around', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 0.3 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_EE" );
	WaitForAbsoluteTime( i+= 2.7 );

//	Hartsock: It was around the time I started to act like one.
//			There was one person who was going to get me home safely to my family.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_G1" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_HH", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_it_was_around', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 0.15 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_HH" );
	WaitForAbsoluteTime( i+= 0.85 );
	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i+= 2.2 );

	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_G2" ), 3.5, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 3.75 );

//	Hartsock: -and it wasn’t Baker.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_G3" ), 2.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_TriggerEvent( 'Event_StartHartsockWading' );
	WaitForAbsoluteTime( i+= 0.75 );

//------------------------------------------------------------
//			EXT. PURPLE HEART LANE CAUSEWAY - CONTINUOUS
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Scene_DesolaShot3' );			//-----SHOT Desola 3

	WaitForAbsoluteTime( i+= 2.0 );

//	Hartsock: It was me.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_H" ), 2.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_II", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_II" );
	WaitForAbsoluteTime( i+= 4.0 );


//------------------------------------------------------------
//			INT. SMALL BARN - AFTERNOON
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Scene_IntroShot1' );			//-----SHOT 1
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_because_I_wasnt', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 1.0 );

//	Marshall: Then why did you go to St. Saveur to fight?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_E" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_FF", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_then_why', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 0.2 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_FF" );
	WaitForAbsoluteTime( i+= 3.5 );

//	Hartsock: Because I wasn’t going to let the same thing happen to Doyle.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_I" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_JJ", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_JJ" );
	WaitForAbsoluteTime( i+= 4.0 );

	ACTION_TriggerEvent( 'TriggeredScriptMapComplete' );
	MyPlayer.StopMusic( BARN_AMB, 3.0 );

}
