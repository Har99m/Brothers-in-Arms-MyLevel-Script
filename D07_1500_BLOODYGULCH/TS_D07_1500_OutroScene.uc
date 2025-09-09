//=============================================================================
// TS_D07_1500_OutroScene.
//=============================================================================
class TS_D07_1500_OutroScene extends TriggeredScript
	placeable;

var Actor MyPlayer;
var TS_D07_1500_CrazyMindChange CleanUp_Ref;
var TS_D07_1500_IntroScene IntroScene_Ref;
var AnimPawn AP_Baker, AP_Doe, AP_Hooper, AP_Jameson, AP_Browning,
			AP_Locke, AP_Mac, AP_Wheaton, AP_York, AP_Leggett_Dead;

var int BodyCount, Target_BakerTank, Target_OutroTank, AMB_HILL30FIRE;
var Unit GermanUnit[4];
var bool bIsAtOutro, bSpawnedSquad03;

function PostBeginPlay()
{
	Super.PostBeginPlay();
	GermanUnit[0] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad01' ));
	GermanUnit[1] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad02' ));
	GermanUnit[2] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad03' ));
	GermanUnit[3] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad04' ));

	BodyCount = 0;
	bIsAtOutro = false;
	bSpawnedSquad03 = false;
}

function GetBodyCount()
{
	BodyCount = GermanUnit[0].GetNumLivingMembers() +
				GermanUnit[1].GetNumLivingMembers() +
				GermanUnit[2].GetNumLivingMembers() +
				GermanUnit[3].GetNumLivingMembers();
	SLog( "BodyCount: " $ BodyCount );
}


state Triggered
{
	function OnTrigger()
	{
		GotoState( 'AtHill30' );
	}

	Begin:

	// Display Objective
	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
	ACTION_SetObjectiveStatus( 1, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 1, 'ObjectiveList', 4.0 );

	ACTION_DisplayObjectiveHint( S_Localize("HINT_B" ), 4.0 );

	CleanUp_Ref = TS_D07_1500_CrazyMindChange( GetFirstActor( 'TS_D07_1500_CrazyMindChange' ) );
	IntroScene_Ref = TS_D07_1500_IntroScene( GetFirstActor( 'TS_D07_1500_IntroScene' ) );

	CleanUp_Ref.bHideStaticGermans = False;
	CleanUp_Ref.bStopChargingDudes = False;
	CleanUp_Ref.bStopSquibs = false;
	CleanUp_Ref.bHideGuys = false;

	ACTION_TriggerEvent( 'Volume_TurnOnOutro' );				//===== Enable Outro Volume
	ACTION_TriggerEvent( 'Trigger_TS_D07_1500_OutroScene' );	//===== Enable Outro Trigger

	ACTION_TriggerEvent( 'BV_OutroPath' );

	ACTION_UnBlockNavPoints( 'PN_Outro' );
	ACTION_TriggerEvent( 'CSU_OutroGuys' );
//	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Squibs' );	//===== Start squibs
//	ACTION_TriggerEvent( 'Emitter_TracerHell_L' );		//===== Tracers Left
//	ACTION_TriggerEvent( 'Emitter_TracerHell_R' );		//===== Tracers Right
//	ACTION_TriggerEvent( 'TS_D07_1500_FakeGermans' );	//===== Mover Germans
	ACTION_TriggerEvent( 'TS_D07_1500_Hill30Dudes' );	//===== Charging Germans
	ACTION_TriggerEvent( 'Event_StartJamesonAnims' );	//===== Start Jameson Dead Anim

	AP_Mac = AnimPawn( Getpawn( 'Mac_Outro' ));
	AP_Locke = AnimPawn (GetPawn( 'AP_Locke_Outro' ) );
	AP_Browning = AnimPawn( GetPawn( 'AP_Browning' ) );
	AP_Jameson = AnimPawn( GetPawn( 'AP_Jameson' ) );
	AP_Wheaton = AnimPawn( GetPawn( 'AP_Wheaton' ) );
	AP_Hooper = AnimPawn( GetPawn( 'AP_Hooper' ) );
	AP_York = AnimPawn( GetPawn( 'AP_York' ) );
	AP_Doe = AnimPawn( GetPawn( 'AP_Doe' ) );

	MyPlayer = GetFirstActor( 'gbxPlayerStart' );

	AP_Mac.Controller.bGodmode = true;
	ACTION_SetRepelBullets( 'Mac_Outro', true );

	ACTION_SetHidden( 'AP_DestLeggTank' , false );
	ACTION_SetHidden( 'AP_Leggett_Dead' , false );
	ACTION_SetHidden( 'Leggett_dead_colt' , false );
	ACTION_SetHidden( 'AP_Browning' , false );

	AP_Locke.bHidden = false;
	AP_Wheaton.bHidden = false;
	AP_Hooper.bHidden = false;
	AP_York.bHidden = false;
	AP_Doe.bHidden = false;

	AP_Locke.bFriendlyFireListen = false;
	AP_Wheaton.bFriendlyFireListen = false;
	AP_Hooper.bFriendlyFireListen = false;
	AP_York.bFriendlyFireListen = false;
	AP_Doe.bFriendlyFireListen = false;

	AP_York.SetCollision( false, false, false );
	AP_Hooper.SetCollision( false, false, false );
	AP_Doe.SetCollision( false, false, false );
	AP_Wheaton.SetCollision( false, false, false );

	AMB_HILL30FIRE = MyPlayer.PlayMusic( "D07_1500_SOUNDS.BATTLE_AMBIENT", 3.0,, true );
	sleep( 2.0 );

	ACTION_TriggerEvent( 'Emitter_LeggettTankSmoke' );

	if ( IntroScene_Ref.bNoIntroPlayed )
	{
		ACTION_ChangeScriptedSequenceDirect( AP_Wheaton, 'SS_Wheaton_Outro' );
		ACTION_ChangeScriptedSequenceDirect( AP_Hooper, 'SS_Hooper_Outro' );
		ACTION_ChangeScriptedSequenceDirect( AP_York, 'SS_York_Outro' );
		ACTION_ChangeScriptedSequenceDirect( AP_Doe, 'SS_Doe_Outro' );
		ACTION_TriggerEvent( 'Event_StartOutroAnims_Reload' );
		ACTION_TriggerEvent( 'Emitter_MG42Smoke' );
	}
	else { ACTION_TriggerEvent( 'Event_StartOutroAnims' ); }

	ACTION_TriggerEvent( 'Event_StartOutroAnims_Locke' );

}

state AtHill30
{
	Begin:

	ACTION_DisplayObjectiveHint( S_Localize("HINT_C" ), 4.0 );

	// Display Objective
	ACTION_SetObjectiveStatus( 1, OI_Complete, 'ObjectiveList' );
	ACTION_SetObjectiveStatus( 2, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 2, 'ObjectiveList', 4.0 );

	ACTION_TriggerEvent( 'CSG_Hill30Squad04' );
	sleep( 3.0 );
	ACTION_OrderMove( 'Unit_DE_Hill30Squad04', 'PN_BakerTank_End' );
	sleep( 10.0 );
	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad04' );
	sleep( 5.0 );
	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad02' );
	sleep( 2.0 );

	if( GermanUnit[3].GetNumLivingMembers() <=0 )
		{
			bSpawnedSquad03 = true;
			ACTION_TriggerEvent( 'CSG_Hill30Squad03' );
			sleep( 3.0 );
			ACTION_OrderMove( 'Unit_DE_Hill30Squad03', 'PN_OutroTank_End' );
		}

	sleep( 5.0 );
	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad01' );
	sleep( 5.0 );
	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad03' );
	sleep( 5.0 );
	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad02' );
	sleep( 2.0 );

	if( GermanUnit[2].GetNumLivingMembers() <=0 && bSpawnedSquad03 == true )
		{
			ACTION_TriggerEvent( 'CSG_Hill30Squad04' );
			sleep( 3.0 );
			ACTION_OrderMove( 'Unit_DE_Hill30Squad04', 'PN_OutroTank_End' );
		}
	else if( GermanUnit[3].GetNumLivingMembers() <=0 )
		{
			ACTION_TriggerEvent( 'CSG_Hill30Squad03' );
			sleep( 3.0 );
			ACTION_OrderMove( 'Unit_DE_Hill30Squad03', 'PN_OutroTank_End' );
		}
	sleep( 5.0 );
	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad04' );
	sleep( 5.0 );
	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad03' );
	sleep( 5.0 );
	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad02' );
	sleep( 2.0 );

	GetBodyCount();
	DO
	{
		sleep(1.0);
		GetBodyCount();
	} UNTIL ( BodyCount <= 4 );
	bIsAtOutro = true;
	ACTION_SetRepelBullets( 'gbxPlayerPawn', true );
	ACTION_TriggerEvent( 'TS_D07_1500_OutroTankBaker' );

	ACTION_SetObjectiveStatus( 2, OI_Complete, 'ObjectiveList' );

	ACTION_WaitForEvent( 'Event_FadeoutHill30AMB' );	//---THIS IS IN THE OUTROTANKBAKER Script

	MyPlayer.StopMusic( AMB_HILL30FIRE, 5.0 );
}
