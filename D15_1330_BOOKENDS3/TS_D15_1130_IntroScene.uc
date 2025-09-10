//=============================================================================
// TS_D15_1130_IntroScene.
//=============================================================================
class TS_D15_1130_IntroScene extends TriggeredScript
	placeable;

var int DOYLE, C47_FLAK , C47_FLAK_HEAVY , C47_MUZZA , BARN_AMB, LT_Garnett, MUSIC;
var sound DOYLE2;
var Actor MyPlayer, Garnett, SM_HiddenFence, LT_DoyleSound;
var AnimPawn AP_Hartsock, AP_Scribe, AP_Marshall, AP_Fishlistener, AP_Fishteller, AP_Bringer, AP_Doyle,
	AP_Baker, AP_Corrion, Walker01, Walker02, Walker03, Walker04, Walker05, Walker06;
var Actorlite PN_Walker01, PN_Walker02, PN_Walker03, PN_Walker04, PN_Walker06;
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
	ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
	MyPlayer = GetFirstActor( 'gbxPlayerStart' );

	ACTION_TriggerEvent( 'CSU_Corrion' );

	ACTION_SetHidden( 'AP_Walker01', true );

	PN_Walker01 = GetNavigationPoint( 'PN_Walker01' );
	PN_Walker02 = GetNavigationPoint( 'PN_Walker02' );
	PN_Walker03 = GetNavigationPoint( 'PN_Walker03' );
	PN_Walker04 = GetNavigationPoint( 'PN_Walker04' );

	AP_Hartsock = AnimPawn( Getpawn( 'AP_Hartsock' ));
	AP_Marshall = AnimPawn( Getpawn( 'AP_Marshall' ));
	AP_Bringer = AnimPawn( Getpawn( 'AP_Bringer' ));
	AP_Doyle = AnimPawn(GetPawn('AP_Doyle_Doyle'));
	AP_Fishlistener = AnimPawn(GetPawn('AP_Fishlistener'));

	AP_Baker = AnimPawn(GetPawn('AP_Baker'));
	AP_Baker.bNoTurnBody = true;

	SS_Hartsock = ScriptedSequence( GetFirstActor( 'SS_HartsockSitDown' ));
	PN_CorrionToMarshall = GetNavigationPoint( 'PN_CorrionToMarshall' );

	LT_DoyleSound = GetfirstActor( 'LT_DoyleSound' );

	ACTION_SetAnimSetDirect( AP_Hartsock, "a_cin_d15_Bookends_3.a_cin_d15_Bookends_3" );
	ACTION_SetAnimSetDirect( AP_Marshall, "a_cin_d15_Bookends_3.a_cin_d15_Bookends_3" );
	ACTION_SetAnimSetDirect( AP_Hartsock, "a_cin_d15_Prologue.a_cin_d15_Prologue" );
	ACTION_SetAnimSetDirect( AP_Marshall, "a_cin_d15_Prologue.a_cin_d15_Prologue" );

	ACTION_ClearPawnIdleQueue( 'AP_Marshall' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Marshall', 'Marshall_listens_simple' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Marshall', FALSE );

	ACTION_AttachStaticMesh( AP_Marshall, StaticMesh's_npc_item_us.equipment.pencil', 'pencil_marshall' );

	ACTION_TriggerEvent( 'Event_StartFishTale' );
	ACTION_TriggerEvent( 'Event_StartScribe' );		//---Start Scribe

	ACTION_ClearPawnIdleQueue( 'AP_Hartsock' );
//	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_sits_accepts_coffee', 0.2, 1.0,,,1 );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_sitting_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock', 'Hartsock_sitting_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hartsock', FALSE );

	ACTION_GivePlayerWeapon( AP_Fishlistener, "gbxInventory.WeapUSM1_" );
	ACTION_ReattachWeapon( AP_Fishlistener, '');

	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	ACTION_TriggerEvent( 'Event_StartBakerAnims' );
	ACTION_TriggerEvent( 'Event_StartFenceAnims' );
	ACTION_TriggerEvent( 'Event_StartBirdAnims_Doyle' );
	ACTION_TriggerEvent( 'TS_D15_1330_TankCommander' );
}


state FirstScene
{
Begin:

//-------------------------------------------------------
//-------------------------------------FIRST SEQUENCE----
//-------------------------------------------------------
	ACTION_SaveMemoryReport( "BOOKENDS3_SEQ1" );
	BARN_AMB = MyPlayer.PlayMusic( "D15_1130_SOUNDS.AMB_WIND_BIRDS_BUGS", 3.0,, true );
	ACTION_SetHiddenDirect( AP_Marshall, true );

	Walker01 = AnimPawn( GetPawn( 'Walker01' ));
	Walker02 = AnimPawn( GetPawn( 'Walker02' ));
	Walker03 = AnimPawn( GetPawn( 'Walker03' ));
	Walker04 = AnimPawn( GetPawn( 'Walker04' ));

	ACTION_Walk( 'Walker01' );
	ACTION_Walk( 'Walker02' );
	ACTION_Walk( 'Walker03' );
	ACTION_Walk( 'Walker04' );

	ACTION_SetDesiredSpeed( 'Walker01', 0.24 );
	ACTION_SetDesiredSpeed( 'Walker02', 0.25 );
	ACTION_SetDesiredSpeed( 'Walker03', 0.27 );
	ACTION_SetDesiredSpeed( 'Walker04', 0.25 );


	ACTION_MoveToward( Walker01, PN_Walker01 );
	ACTION_MoveToward( Walker04, PN_Walker04 );
	sleep( 0.1 );
	ACTION_MoveToward( Walker02, PN_Walker02 );
	sleep( 0.1 );
	ACTION_MoveToward( Walker03, PN_Walker03 );

	ResetAbsoluteTime();
	StartAbsoluteTime();

//	ACTION_TriggerEvent( 'TS_D15_1130_Walkers' );
	AP_Corrion = AnimPawn(GetPawn('AP_Corrion'));
	WaitForAbsoluteTime( i += 3.0 );
//	AP_Corrion.bNoTurnBody = true;
	ACTION_SetHiddenDirect( AP_Corrion, true );

//	HARTSOCK is still sitting at the table with MARSHALL.  HARTSOCK is visually more beaten down than before.

//	Hartsock: "That was five days ago."
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_A1" ), 3.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_that_was_five', 0.2, 1.0 );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_U", 1.0, 1.0, 120.0 );

	WaitForAbsoluteTime( i+= 0.2 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_U" );
	WaitForAbsoluteTime( i+= 2.8 );
	ACTION_SetHiddenDirect( AP_Marshall, false );

//	Hartsock: (a beat) I remember on the way to St. Martin he was going on and on about himself.  Sort of like a Doyle history lesson."
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_A2" ), 5.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 2.5 );
	ACTION_TriggerEvent( 'Scene_IntroShot2' );			//-----SHOT 2
	WaitForAbsoluteTime( i+= 4.4 );

//-------------------------------------------------------
//-------------------------------------DOYLE SEQUENCE----
//-------------------------------------------------------
//	ROAD TO ST. MARTIN - morning
//	DOYLE is walking and talking over his shoulder to HARTSOCK.

//	ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
	AP_Doyle.AttachtoBone( LT_DoyleSound, 'Bottom_Lip' );
	ACTION_TriggerEvent( 'Scene_DoyleDummy' );
	ACTION_TriggerEvent( 'Event_StartAnimsDoyle' );
	WaitForAbsoluteTime( i+= 0.1 );
	ACTION_CameraInPawnHead( 'AP_Hartsock_Doyle', 'Scene_DoyleDummy', TRUE);//----------CAM IN ANIMATION

//	Doyle: Well my full name is Seamus Doyle.  
	ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_A1" ), 3.0, 1 , 1 , 1 , , TRUE );
//	DOYLE = LT_DoyleSound.PlayOwnedSound( sound'D15_1130.DOYLE_A' );
	ACTION_PlaySoundDirect( LT_DoyleSound, "D15_1130.DOYLE_A", 1.0, 1.0, 512.0 );

	WaitForAbsoluteTime( i+= 3.0 );

	ACTION_SetHiddenDirect( AP_Marshall, true );
//	Doyle: You see Seamus was my father's name, which is odd because I never knew my father really so I guess I never understood why my mother would name me after him.  
	ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_A2" ), 8.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 7.0 );

//	Doyle: -and my mother, she was a real piece of work.  Once made me wash the dishes at three o' clock in the morning.
	ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_A3" ), 6.5, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_TriggerEvent( 'Event_DoyleBirdsTakeoff' );
	WaitForAbsoluteTime( i+= 4.0 );

//	Doyle: I mean she could cook like nobody's business, but the smell-
	ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_A4" ), 4.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 3.5 );

//	Doyle: -she once caught my sister kissing this guy... stapled her dress shut.
	ACTION_DisplaySubtitleMessage2(S_Localize("DOYLE_A5" ), 4.0, 1 , 1 , 1 , , TRUE );
	WaitForAbsoluteTime( i+= 4.14 );

	PN_Walker01 = GetNavigationPoint( 'PN_Walker01b' );
	PN_Walker02 = GetNavigationPoint( 'PN_Walker02b' );
	PN_Walker03 = GetNavigationPoint( 'PN_Walker03b' );
	PN_Walker04 = GetNavigationPoint( 'PN_Walker04b' );

	ACTION_MoveToward( Walker01, PN_Walker01 );
	ACTION_MoveToward( Walker04, PN_Walker04 );
	WaitForAbsoluteTime( i+= 0.25 );
	ACTION_MoveToward( Walker02, PN_Walker02 );
	ACTION_TriggerEvent( 'Scene_IntroShot4' );			//-----SHOT 4
	WaitForAbsoluteTime( i+= 0.25 );
	ACTION_MoveToward( Walker03, PN_Walker03 );

	ACTION_CameraInPawnHead( 'AP_Hartsock_Doyle', 'Scene_DoyleDummy', FALSE);//----------CAM IN ANIMATION
//-------------------------------------------------------
//-------------------------------------BACK IN BARN------
//-------------------------------------------------------

//	Int. SMALL BARN - CONTINUOUS

	WaitForAbsoluteTime( i+= 1.0 );

//	HARTSOCK:  That boy could talk.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_V", 1.0, 1.0, 120.0 );
	ACTION_PlayAnimWithQueueDirect( AP_Hartsock, 'Hartsock_says_that_boy_could_talk', 0.2, 1.0 );

	WaitForAbsoluteTime( i+= 0.2 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_V" );
	WaitForAbsoluteTime( i+= 3.9 );

//	Marshall: I think that's all the questions I have.
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_R", 1.0, 1.0, 120.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A1" ), 5.0, 1 , 1 , 1 , , TRUE );

	ACTION_PlayLocalSound( "D15_1130.MARSHALL_R" );
	WaitForAbsoluteTime( i+= 0.233 );
	ACTION_SetHiddenDirect( AP_Marshall, false );
	ACTION_PlayAnimDirect( AP_Marshall, 'Marshall_says_I_think_thats', 0.0, 1.0,,13.0 );
	ACTION_TriggerEvent( 'Scene_IntroShot3' );			//-----SHOT 3
	WaitForAbsoluteTime( i+= 2.55 );

//	Marshall: Everything you said is important, a lot of good we can learn from this.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A2" ), 5.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 2.75 );
	ACTION_TriggerEvent( 'Scene_IntroShot5' );			//-----SHOT 5
	WaitForAbsoluteTime( i+= 1.0 );

//	MARSHALL_A3="Marshall: Sergeant Hartsock, you should get some rest.
	ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A3" ), 5.0, 1 , 1 , 1 , , TRUE );

	ACTION_SetHiddenDirect( AP_Corrion, false );
	ACTION_WalkDirect( AP_Corrion );
	ACTION_TriggerEvent( 'Event_StartCorrionAnims' );

	WaitForAbsoluteTime( i+= 4.0 );
//	CLOSE UP: HELMET.  DOYLE's 82nd patch is glued to the back of it.
	ACTION_TriggerEvent( 'Scene_HartsockHelmet' );		//-----SHOT HARTSOCK HELMET
	WaitForAbsoluteTime( i+= 1.5 );

//HARTSOCK:  Still got miles to go before we rest sir.
	ACTION_DisplaySubtitleMessage2(S_Localize( "HARTSOCK_C" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_W", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_W" );

	WaitForAbsoluteTime( i+= 1.5 );
//HARTSOCK stands up from the table grabbing his helmet.
	ACTION_ClearPawnIdleQueue( 'AP_Hartsock' );
	ACTION_ChangeScriptedSequenceDirect( AP_Hartsock, 'SS_HartsockGetUp' );

	ACTION_SetLookAtTargetDirect( AP_Marshall, AP_Corrion, true );
	ACTION_PlayAnimDirect( AP_Marshall, 'Marshall_listens_simple', 0.0, 1.0 );

	ACTION_TriggerEvent( 'Event_StartHartsockGetUp' );
	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'Scene_CorrionShot3' );		//-----SHOT CORRION 3

	WaitForAbsoluteTime( i+= 4.0 );

//	HARTSOCK salutes and walks to the door.  On the way out CORRION is standing there waiting to go in.
	ACTION_TriggerEvent( 'Scene_CorrionShot1' );		//-----SHOT CORRION 1
	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'Event_CorrionTalk' );
	WaitForAbsoluteTime( i+= 1.0 );

//	CorRION:  (to HARTSOCK) That took a while.
//	ACTION_PlayLipSyncSoundDirect( AP_Corrion, "D15_1130.CORRION_A", 1.0, 1.0, 120.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize( "CORRION_A" ), 4.0, 1 , 1 , 1 , , TRUE );
	ACTION_PlayLocalSound( "D15_1130.CORRION_A" );
	ACTION_SetHidden( 'SM_HartsockChair', true );

	WaitForAbsoluteTime( i+= 3.3 );
	ACTION_ClearLookAtTargetDirect( AP_Marshall );

//	HARTSOCK:  Got a lot on my mind Sam.
	ACTION_DisplaySubtitleMessage2(S_Localize( "HARTSOCK_E" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_X", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_X" );

	WaitForAbsoluteTime( i+= 0.75 );
	ACTION_TriggerEvent( 'Scene_CorrionShot2' );		//-----SHOT CORRION 2
	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_PlayAnimDirect( AP_Marshall, 'Marshall_listens_writes', 0.2, 1.0,true );
	WaitForAbsoluteTime( i+= 1.5 );
	ACTION_TriggerEvent( 'Scene_CorrionShot5' );		//------CORRION SHOT 3
	WaitForAbsoluteTime( i+= 0.75 );

//	HARTSOCK puts his hand on CORRION's shoulder for a moment and then walks off.
//	Int. Small BARN - conTINUOUS
//	CORRION stands before MARSHALL at the table.
//	ACTION_SetDesiredSpeedDirect( AP_Corrion, 0.75 );
//	AP_Corrion.MaxDesiredSpeed = 0.2;
//	ACTION_MoveToward( AP_Corrion, PN_CorrionToMarshall,, AP_Marshall );
	ACTION_TriggerEvent( 'Event_CorrionWalkToMarshall' );
	WaitForAbsoluteTime( i+= 2.5 );

//	MaRSHALL:  Name and rank?
	ACTION_DisplaySubtitleMessage2(S_Localize( "MARSHALL_B" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Marshall, "D15_1130.MARSHALL_B", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.MARSHALL_B" );

	WaitForAbsoluteTime( i+= 1.0 );
	AP_Corrion.DetachWeapon( '' );	//rifle_hold
	WaitForAbsoluteTime( i+= 1.9 );

	ACTION_TriggerEvent( 'Scene_CorrionShot4' );		//------CORRION SHOT 4
	WaitForAbsoluteTime( i+= 0.15 );

//	CorRION:  Cpl. Sam Corrion sir.
	ACTION_DisplaySubtitleMessage2(S_Localize("CORRION_B" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Corrion, "D15_1130.CORRION_B", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.CORRION_B" );

	WaitForAbsoluteTime( i+= 0.40 );
	ACTION_TriggerEvent( 'Event_StartHartsockSitDown' );
	AP_Hartsock = AnimPawn( GetPawn( 'AP_Hartsock_SitDown' ) );
	WaitForAbsoluteTime( i+= 1.60 );


//--------------------------------------------------
//	Ext. Small BARN - conTINUOUS
//	HARTSOCK walks for a few moments around the side of the barn.  He sees BAKER sitting against the side of the barn and decides to sit down next to him.
//	BakER:  How did it go with Col. Marshall?
//--------------------------------------------------

	ACTION_TriggerEvent( 'Scene_BakerShot1' );			//------BAKER SHOT 1
	WaitForAbsoluteTime( i+= 2.1 );
	ACTION_TriggerEvent( 'Event_BakerTalk' );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_A" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_BAKER, "D15_1130.BAKER_A", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.BAKER_A" );

	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'Scene_BakerShot2' );			//------BAKER SHOT 2
	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'TS_D15_1130_Jeep' );
	WaitForAbsoluteTime( i+= 2.0 );

//	HARTSOCK:  Oh you know, talked his ear off.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_F" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_Y", 1.0, 1.0, 120.0 );
	ACTION_TriggerEvent( 'Event_Hartsock_says_oh' );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_Y" );

	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'Scene_BakerShot3' );			//------BAKER SHOT 3
	WaitForAbsoluteTime( i+= 2.0 );

//	BAKER:  Yeah me too.(laughs)
	ACTION_TriggerEvent( 'Event_Baker_says_yeah' );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_B1" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_BAKER, "D15_1130.BAKER_B", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.BAKER_B" );

	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_TriggerEvent( 'Scene_BakerShot2' );			//------BAKER SHOT 2

//	BAKER:  We should write a book.  We can call it "Baker and Red, through Hell and Highwater."
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_B2" ), 5.0, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_TriggerEvent( 'Scene_BakerShot3' );			//------BAKER SHOT 3
	WaitForAbsoluteTime( i+= 3.0 );

//	HARTSOCK:  Why not Red and Baker?
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_G" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_Z", 1.0, 1.0, 120.0 );
	ACTION_TriggerEvent( 'Event_Hartsock_says_y_not' );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_Z" );

	WaitForAbsoluteTime( i+= 2.0 );

//	BAKER:  -because I made Sergeant before you did.
	ACTION_TriggerEvent( 'Event_Baker_says_because' );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_C" ), 4.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_BAKER, "D15_1130.BAKER_C", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.BAKER_C" );

	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TriggerEvent( 'Scene_BakerShot4' );			//------BAKER SHOT 4
	WaitForAbsoluteTime( i+= 1.75 );

//	HARTSOCK:  Fair enough. 
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_H" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_ZA", 1.0, 1.0, 120.0 );
	ACTION_TriggerEvent( 'Event_Hartsock_says_fair' );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_ZA" );

	WaitForAbsoluteTime( i+= 2.5 );

//	HARTSOCK:  (a beat) If we ever get back to England, I'm buying you a Whiskey.
	ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_I" ), 5.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_Hartsock, "D15_1130.HARTSOCK_ZB", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.HARTSOCK_ZB" );

	WaitForAbsoluteTime( i+= 4.0 );

//	BAKER:  I like Whiskey.
	ACTION_TriggerEvent( 'Event_Baker_Like_Whiskey' );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_D" ), 3.0, 1 , 1 , 1 , , TRUE );
//	ACTION_PlayLipSyncSoundDirect( AP_BAKER, "D15_1130.BAKER_E", 1.0, 1.0, 120.0 );
	ACTION_PlayLocalSound( "D15_1130.BAKER_E" );


	WaitForAbsoluteTime( i+= 4.0 );

//	ACTION_TriggerEvent( 'TriggeredScriptMapComplete' );
	ACTION_FadeOverlay( GetLocalPlayerController(), 1, 3.0 );
	MyPlayer.StopMusic( BARN_AMB, 7.0 );

	WaitForAbsoluteTime( i+= 7.0 );
	ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_eib_credits.full.cred_04_eib', , , 2, 2.0, 640, 480 );
	WaitForAbsoluteTime( i+= 5.0 );
	ACTION_ScreenOverlay( GetLocalPlayerController(), Texture't_eib_credits.full.cred_04_eib', , , 1, 2.0, 640, 480 );

	WaitForAbsoluteTime( i+= 4.5 );

	ACTION_DisplayVictory();


}
