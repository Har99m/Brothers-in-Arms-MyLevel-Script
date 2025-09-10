//=============================================================================
// TS_D15_1230_IntroScene.
//=============================================================================
class TS_D15_1230_IntroScene extends TriggeredScript
	placeable;

var int HILL30_AMB, HILL30_AMB_SOUND, HILL30_GUNS, HILL30_GUNS_SOUND, BAR_AMB, BARN_AMB;
var Actor MyPlayer, Garnett, SM_HiddenFence, SM_HartsockCig, Emitter_CigSmoke;
var AnimPawn AP_Hartsock, AP_Scribe, AP_Marshall, AP_Fishlistener, AP_Fishteller, AP_Bringer, AP_Doyle, AP_Lumberjack,
	AP_Baker, AP_Mac, AP_Leggett, AP_Allen, AP_Corrion, AP_Zanovich, AP_Muzza, AP_HartsockPlane;
var Tank AP_Tank1;
var ActorLite MoveTank1_01, PN_CorrionToMarshall;
var float i;
var ScriptedSequence SS_Hartsock;

var ZoneInfo ziZone;

var Actor PFX_CIG[4];

function PlayHill30AMB()
{
	HILL30_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.BATTLE_AMBIENT", 0.5,, true );
	if (HILL30_AMB == -1)
		{
		   HILL30_AMB_SOUND = ACTION_PlaySoundReturnHandle('gbxPlayerStart', "D15_1130_SOUNDS.BATTLE_AMBIENT", 1.0, 1.0, 40000);
		}
}
function StopHill30AMB()
{
	if (HILL30_AMB != -1)
		MyPlayer.StopMusic( HILL30_AMB, 0.2 );
	else
 		ACTION_StopSound( 'gbxPlayerStart', HILL30_AMB_SOUND, 0.2 );
}


function PlayHill30GunAMB()
{
	HILL30_GUNS = MyPlayer.PlayMusic( "D15_1130_SOUNDS.BATTLE", 0.75,, true );
	if (HILL30_GUNS == -1)
		{
		   HILL30_GUNS_SOUND = ACTION_PlaySoundReturnHandle('gbxPlayerStart', "D15_1130_SOUNDS.BATTLE", 1.0, 1.0, 40000);
		}
}
function StopHill30GunAMB()
{
	if (HILL30_GUNS != -1)
		MyPlayer.StopMusic( HILL30_GUNS, 0.2 );
	else
 		ACTION_StopSound( 'gbxPlayerStart', HILL30_GUNS_SOUND, 0.2 );
}


state Triggered
{
	function ontrigger()
		{
		Gotostate( 'FirstScene' );
		}
Begin:

//------------------------------------------------------------*****Start Matinee Sequence
	i = 1.0;
	ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
	MyPlayer = GetFirstActor( 'gbxPlayerStart' );

	ACTION_SetHidden( 'AP_Walker01', true );

	ziZone = ZoneInfo( GetFirstActor( 'ZoneInfoBar' ));

	AP_Hartsock = AnimPawn( Getpawn( 'AP_Hartsock' ));
	AP_Marshall = AnimPawn( Getpawn( 'AP_Marshall' ));
	AP_Bringer = AnimPawn( Getpawn( 'AP_Bringer' ));
	AP_Leggett = AnimPawn( Getpawn( 'AP_Leggett_Radio' ));
	AP_Baker = AnimPawn(GetPawn('AP_Baker_Outro'));
	AP_Mac = AnimPawn(GetPawn('AP_Mac_Intro'));
	AP_Fishlistener = AnimPawn(GetPawn('AP_Fishlistener'));

	SM_HartsockCig = GetFirstActor( 'SM_HartsockCig' );
	Emitter_CigSmoke = GetFirstActor( 'Emitter_CigEmbers' );
	PFX_CIG[1] = GetFirstActor('PFX_CIG_Flare');
	PFX_CIG[0] = GetFirstActor('PFX_CIG_FlareSep');
	PFX_CIG[2] = GetFirstActor('Emitter_BreatheSmoke');
	PFX_CIG[3] = GetFirstActor('PFX_CIG_Suck');

	SS_Hartsock = ScriptedSequence( GetFirstActor( 'SS_HartsockSitDown' ));
	PN_CorrionToMarshall = GetNavigationPoint( 'PN_CorrionToMarshall' );

	ACTION_SetAnimSetDirect( AP_Hartsock, "a_cin_d15_Bookends_2.a_cin_d15_Bookends_2" );
	ACTION_SetAnimSetDirect( AP_Marshall, "a_cin_d15_Bookends_2.a_cin_d15_Bookends_2" );

	ACTION_ClearPawnIdleQueue( 'AP_Marshall' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Marshall', 'Marshall_sitting_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Marshall', FALSE );

	ACTION_TriggerEvent( 'Event_StartFishTale' );
	ACTION_TriggerEvent( 'Event_StartScribe' );		//---Start Scribe

	ACTION_ClearPawnIdleQueue( 'AP_Hartsock' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_sitting_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_sitting_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hartsock', FALSE );

	ACTION_AttachStaticMesh( AP_Marshall, StaticMesh's_npc_item_us.equipment.pencil', 'pencil_marshall' );
	ACTION_AttachStaticMesh( AP_Hartsock, StaticMesh's_npc_item_us.prop.cigarette', 'cig_hartsock' );
	AP_Hartsock.AttachToBone( Emitter_CigSmoke, 'cig_hartsock' );
	AP_Hartsock.AttachToBone( PFX_CIG[1], 'cig_hartsock' );
	AP_Hartsock.AttachToBone( PFX_CIG[0], 'cig_hartsock' );
	AP_Hartsock.AttachToBone( PFX_CIG[2], 'top_lip' );
	AP_Hartsock.AttachToBone( PFX_CIG[3], 'top_lip' );

	ACTION_GivePlayerWeapon( AP_Fishlistener, "gbxInventory.WeapUSM1_" );
	ACTION_ReattachWeapon( AP_Fishlistener, '');

	ACTION_TriggerEvent( 'Scene_IntroShot1' );			//-----SHOT 1
	ACTION_TriggerEvent( 'Event_StartBakerAnims' );
}


state FirstScene
{
Begin:

//-------------------------------------------------------
//-------------------------------------FIRST SEQUENCE----
//-------------------------------------------------------
	ACTION_SaveMemoryReport( "BOOKENDS2_SEQ1" );
	ResetAbsoluteTime();
	StartAbsoluteTime();
	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_LIGHT_RAIN", 3.0,, true );

	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_which_brings_us', 0, 1.0 );
	WaitForAbsoluteTime( i += 3.2 );

//	HARTSOCK and MARSHALL are still sitting at the table discussing.  
//	HARTSOCK is now smoking a cigarette and looking outside at the men talking and doing some army chores.

//	Marshall: Which brings us to Hill 30.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_K" );

	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i+= 0.2 );
	AP_Marshall.bHidden = true;
	WaitForAbsoluteTime( i+= 1.8 );

//	Marshall: Sgt. Baker did a good job on that line.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_B1" ), 5.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_L" );

	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_baker_didnt', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 0.5 );

//	Marshall: Must have been a hell of a fight.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_B2" ), 2.5, 1 , 1 , 1 , , TRUE );
	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'PFX_CIG_Flare' );
	WaitForAbsoluteTime( i+= 1.5 );
	ACTION_TriggerEvent( 'PFX_CIG_FlareSep' );
	WaitForAbsoluteTime( i+= 0.4 );
	ACTION_TriggerEvent( 'PFX_CIG_Suck' );

	WaitForAbsoluteTime( i+= 2.3 );
	ACTION_TriggerEvent( 'Emitter_BreatheSmoke' );
	WaitForAbsoluteTime( i+= 1.8 );


//	Hartsock: Baker didn't save us.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_A" ), 3.0, 1 , 1 , 1 , , TRUE );

	AP_Marshall.bHidden = false;
	WaitForAbsoluteTime( i+= 0.1 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_L" );
	WaitForAbsoluteTime( i+= 1.9 );
	ACTION_TriggerEvent( 'Scene_IntroShot5' );			//-----SHOT 5

//	Marshall: Excuse me Sergeant?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_C" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_excuse_me', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 0.1 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_M" );
	WaitForAbsoluteTime( i+= 2.65 );
	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4

//	Hartsock: Sorry sir.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B1" ), 2.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_sorry_sir', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 0.1 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_M" );
	WaitForAbsoluteTime( i+= 2.6 );

//	Hartsock: What I mean is... I've been hearing a lot of talk around here that Baker saved us at Hill 30,
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B2" ), 4.5, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2
	WaitForAbsoluteTime( i+= 4.0 );

//	Hartsock:  bringing in those tanks and all.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B3" ), 2.25, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 3.4 );

//	Hartsock: That's not what happened.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B4" ), 1.5, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 0.55 );

//------------------------------------------------------------
//			EXT. HILL 30 - MORNING - LEGGETT RADIO
//------------------------------------------------------------

	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Squibs' );	//===== Start squibs
	WaitForAbsoluteTime( i+= 0.25 );
	ACTION_TriggerEvent( 'Emitter_TracerHell' );		//===== Tracers
	WaitForAbsoluteTime( i+= 0.25 );
	ACTION_SetHidden( 'AP_Wheaton' , false );
	ACTION_SetHidden( 'AP_Hooper' , false );
	ACTION_SetHidden( 'AP_York' , false );
	ACTION_SetHidden( 'AP_Doe' , false );

	WaitForAbsoluteTime( i+= 0.5 );
	ACTION_AttachStaticMesh( AP_Leggett, StaticMesh's_military_us.us_radio_field_handset', 'phone_bone' );
	WaitForAbsoluteTime( i+= 0.5 );
	ACTION_TriggerEvent( 'Event_StartIntroAnims' );
	WaitForAbsoluteTime( i+= 0.5 );
	ACTION_TriggerEvent( 'Event_StartLeggettRadio' );
	AP_Leggett.bHidden = False;
	ACTION_TriggerEvent( 'TS_D15_1230_GermansPOWs' );
	WaitForAbsoluteTime( i+= 0.5 );

	ACTION_TriggerEvent( 'Scene_LeggettShot1' );			//-----SHOT LEGGETT 1

	MyPlayer.StopMusic( BARN_AMB, 0.4 );
	PlayHill30AMB();
	PlayHill30GunAMB();

//	Leggett:  I need Armor support now!
	ACTION_DisplaySubtitleMessage2(S_Localize("LEGGETT_A" ), 7.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Leggett, "D15_1130.LEGGETT_E", 1.0, 1.0, 512.0 );

	WaitForAbsoluteTime( i += 2.25 );

//	Leggett:  I mean right now!!!
	ACTION_DisplaySubtitleMessage2(S_Localize("LEGGETT_B" ), 7.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Leggett, "D15_1130.LEGGETT_D", 1.0, 1.0, 512.0 );

	AP_Marshall.bHidden = true;
	WaitForAbsoluteTime( i += 3.0 );
	ACTION_TriggerEvent( 'Event_StopIntroAnims' );
	WaitForAbsoluteTime( i += 1.25 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_leggett_saved_us', 0.2, 1.0 );
	WaitForAbsoluteTime( i += 0.25 );
	StopHill30AMB();
	StopHill30GunAMB();

	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_LIGHT_RAIN", 3.0,, true );

//------------------------------------------------------------
//			INT. SMALL BARN - CONTINUOUS
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i += 1.25 );
	AP_Leggett.bHidden = True;
//	Hartsock: Leggett saved us.  Just no one wants to talk about it.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_C" ), 3.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 0.1 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_N" );
	WaitForAbsoluteTime( i+= 3.9 );

//	Marshall: Why is that, Sergeant?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_D" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_N" );

	WaitForAbsoluteTime( i+= 3.0 );

//------------------------------------------------------------
//			EXT. HILL 30 - MORNING - LEGGETT TAKE ME
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Event_StartLeggettBerzerk' );
	AP_Leggett = AnimPawn( Getpawn( 'AP_Leggett_berzerk' ));
	AP_Leggett.bHidden = False;
	ACTION_TriggerEvent( 'Scene_LeggettShot2' );			//-----SHOT LEGGETT 2
	MyPlayer.StopMusic( BARN_AMB, 0.4 );
	PlayHill30AMB();
	PlayHill30GunAMB();

//	LEGGETT is standing on the hill firing his pistol at the tank.
//	Leggett: TAKE ME!!!
	ACTION_DisplaySubtitleMessage2(S_Localize("LEGGETT_C" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Leggett, "D15_1130.LEGGETT_B", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 0.1 );
	ACTION_PlayLocalSound( "D15_1130.LEGGETT_B" );
	WaitForAbsoluteTime( i+= 2.9 );
	AP_Baker.bHidden = false;
	AP_Mac.bHidden = false;
	WaitForAbsoluteTime( i+= 0.65 );
	AP_Marshall.bHidden = false;
//	A blast hits the mound and sends LEGGETT backwards.

	StopHill30AMB();
	StopHill30GunAMB();
	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_LIGHT_RAIN", 3.0,, true );
//------------------------------------------------------------
//			INT. SMALL BARN - AFTERNOON
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i+= 0.75 );
	AP_Leggett.bHidden = True;

//	Hartsock: He somehow managed to reach HQ on the radio.  They sent the tanks.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_D" ), 5.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_O", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_he_some_how', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 0.2 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_O" );
	WaitForAbsoluteTime( i+= 1.8 );
	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2
	WaitForAbsoluteTime( i+= 2.0 );

//	Marshall: I can't confirm that.  I thought Pvt. Leggett's radio wasn't working.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_E" ), 5.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_O", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_I_cant_confirm', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 0.2 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_O" );
	WaitForAbsoluteTime( i+= 1.3 );
	ACTION_TriggerEvent( 'Scene_IntroShot3' );			//-----SHOT 3
	WaitForAbsoluteTime( i+= 3.0 );

//	Hartsock: Couldn't receive sir, but he was transmitting.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_E" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_P", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_couldnt_transmit', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 0.2 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_P" );
	WaitForAbsoluteTime( i+= 0.8 );
	ACTION_TriggerEvent( 'Event_BlownBackAnims' );
	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2
	WaitForAbsoluteTime( i+= 2.0 );

//	Marshall: And Sgt. Baker?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_F" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_P", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_and_sgt_baker', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 0.4 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_P" );
	AP_Baker.bHidden = false;
	AP_Mac.bHidden = false;
	WaitForAbsoluteTime( i+= 2.4 );


//------------------------------------------------------------
//			EXT. HILL 30 - MORNING
//------------------------------------------------------------
//	A series of mortars strike down the field
//	the final one hitting very near BAKER and sending him flying into the hedgerow behind him.

	ACTION_TriggerEvent( 'Scene_BakerShot1' );			//-----SHOT 1
//	HILL30_GUNS = MyPlayer.PlayMusic( "D15_1130_SOUNDS.BATTLE", 1.0,, true );
	PlayHill30GunAMB();

	WaitForAbsoluteTime( i+= 0.5 );
	AP_Marshall.bHidden = true;
	ACTION_TriggerEvent( 'ET_Mortar4' );
	ACTION_PlayLocalSound( "EXPLOSIONS.ARTILLERY_IMPACT_B" );
	WaitForAbsoluteTime( i+= 0.05 );
	ACTION_TriggerEvent( 'Event_BakerBlownBack' );
	WaitForAbsoluteTime( i+= 0.9 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_he_loved_being', 0.2, 1.0 );
	AP_Baker = AnimPawn(GetPawn('AP_Baker_Dazed'));
	WaitForAbsoluteTime( i+= 0.25 );
	StopHill30GunAMB();

//------------------------------------------------------------
//			INT. SMALL BARN - AFTERNOON
//------------------------------------------------------------

	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i+= 1.65 );
//	Hartsock: He loved being in the thick of it.
//			Every time I turned around in Normandy he'd been knocked out by artillery or a mortar or some damn thing.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_F1" ), 7.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 0.1 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_Q" );
	WaitForAbsoluteTime( i+= 3.9 );
	AP_Marshall.bHidden = false;
	ACTION_TriggerEvent( 'Scene_IntroShot3' );			//-----SHOT 3
	WaitForAbsoluteTime( i+= 4.5 );	

//	Hartsock: Yeah, he earned his stripes.  But so did the rest of us.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_F2" ), 5.0, 1 , 1 , 1 , , TRUE );
	WaitForAbsoluteTime( i+= 4.1 );

//------------------------------------------------------------
//			EXT. HILL 30 - MORNING
//	BAKER is staring at MAC sort of dazed.  Blood is coming from inside BAKER's helmet and down the front of his face.
//	The sound is muted but faintly MAC ca be heard giving BAKER orders.
//------------------------------------------------------------
	AP_Baker.bHidden = false;
	ACTION_TriggerEvent( 'Event_StartBakerDazedAnims' );
	ACTION_TriggerEvent( 'Scene_BakerShot2' );			//-----SHOT BAKER 2
	MyPlayer.StopMusic( BARN_AMB, 0.0 );
//	HILL30_GUNS = MyPlayer.PlayMusic( "D15_1130_SOUNDS.BATTLE", 1.0,, true );
//	HILL30_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.BATTLE_AMBIENT", 1.0,, true );
	PlayHill30AMB();
	PlayHill30GunAMB();

	WaitForAbsoluteTime( i+= 2.0 );
//	Hartsock: -and I do mean earned.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_G" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_R", 1.0, 1.0, 120.0 );

	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_R" );
	WaitForAbsoluteTime( i+= 3.6 );
	ACTION_PlayAnimWithQueueDirect( AP_Marshall, 'Marshall_says_baker_got_quite', 0.0, 1.0 );
	WaitForAbsoluteTime( i+= 0.4 );
//	MyPlayer.StopMusic( HILL30_GUNS, 0.2 );
//	MyPlayer.StopMusic( HILL30_AMB, 0.2 );
	StopHill30AMB();
	StopHill30GunAMB();
	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_LIGHT_RAIN", 3.0,, true );

//------------------------------------------------------------
//			INT. SMALL BARN - AFTERNOON
//------------------------------------------------------------
//	MARSHALL writes a few notes down for a moment.  There is a comfortable silence.
	ACTION_TriggerEvent( 'Scene_IntroShot1' );			//-----SHOT 1
	WaitForAbsoluteTime( i+= 3.6 );

//	Marshall: Baker got quite a scar.  Is yours from that battle too?
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_G" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_Q", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_Q" );

	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'Scene_IntroShot1' );			//-----SHOT 1
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_looks_down', 0.2, 1.0 );
	WaitForAbsoluteTime( i+= 3.5 );

//------------------------------------------------------------
//			INT. DIMLY LIT BAR - NIGHT
//------------------------------------------------------------

//	HARTSOCK FOV.
//	A man in a plaid shirt with a bit of a scruffy beard is holding a bottle in front of HARTSOCK.  He is clearly drunk.  He is shouting.

	AP_Lumberjack = AnimPawn( GetPawn( 'AP_Lumberjack' ));
	ACTION_TriggerEvent( 'Event_StartLumberjackAnims' );
	MyPlayer.StopMusic( BARN_AMB, 0 );
	BAR_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_BAR", 0.75,, true );
	ACTION_TriggerEvent( 'Scene_Bar' );			//-----SHOT BAR
	ACTION_CameraInPawnHead( 'AP_Hartsock_Hit', 'Scene_Bar', TRUE);//----------CAM IN ANIMATION

//	DRUNKEN MAN: She was my wife!  How dare you touch my wife!
	ACTION_DisplaySubtitleMessage2(S_Localize("DRUNKEN_MAN_AA" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLocalSound( "D15_1130.DRUNKENMAN_AA" );

	WaitForAbsoluteTime( i+= 2.4 );

	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_can_we_just_talk', 0, 1.0 );
	AP_Marshall.bHidden = true;
	ACTION_PlayLocalSound( "D15_1130_SOUNDS.BOTTLE_BREAK" );
	ACTION_PlayLocalSound( "PLAYER.MELEE" );
	WaitForAbsoluteTime( i+= 0.2 );

	ziZone.DistanceFogEnd = 20000;
	ziZone.DistanceFogStart = 300;

	WaitForAbsoluteTime( i+= 0.15 );

//------------------------------------------------------------
//			INT. SMALL BARN - CONTINUOUS
//------------------------------------------------------------
	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	ACTION_CameraInPawnHead( 'AP_Hartsock_Hit', 'Scene_Bar', FALSE);//----------CAM IN ANIMATION
	MyPlayer.StopMusic( BAR_AMB, 1.0 );
	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_LIGHT_RAIN", 3.0,, true );

	WaitForAbsoluteTime( i+= 3.2 );

//	Hartsock: Can we just talk about Hill 30 sir?
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_H" ), 4.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 0.1 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_T" );
	WaitForAbsoluteTime( i+= 3.9 );

	ACTION_TriggerEvent( 'TriggeredScriptMapComplete' );
	MyPlayer.StopMusic( BARN_AMB, 2.0 );

}
