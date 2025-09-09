//=============================================================================
// TS_D07_1500_CrazyMindChange.
//=============================================================================
class TS_D07_1500_CrazyMindChange extends TriggeredScript
	placeable;

var Pawn GermanPawn[8];
var bool bStopChargingDudes, bStopSquibs, bHideStaticGermans, bHideGuys, bStopMortars;

var TS_D07_1500_CheckPoint02_Setup CP2_Setup_Ref;
var TS_D07_1500_CheckPoint03_Setup CP3_Setup_Ref;
var TS_D07_1500_CheckPoint04_Setup CP4_Setup_Ref;

function PostBeginPlay()
{
	bHideStaticGermans = False;
	bStopChargingDudes = False;
	bStopSquibs = false;
	bStopMortars = false;
	bHideGuys = false;
}

state Triggered
{
	function OnTrigger()
	{
		GotoState( 'CleanAgain' );
	}

	Begin:


	CP2_Setup_Ref = TS_D07_1500_CheckPoint02_Setup( GetFirstActor( 'TS_D07_1500_CheckPoint02_Setup' ) );
	CP3_Setup_Ref = TS_D07_1500_CheckPoint03_Setup( GetFirstActor( 'TS_D07_1500_CheckPoint03_Setup' ) );
	CP4_Setup_Ref = TS_D07_1500_CheckPoint04_Setup( GetFirstActor( 'TS_D07_1500_CheckPoint04_Setup' ) );

	if( CP2_Setup_Ref.bCheckpointloaded == true )
		{
		GotoState( 'SwitchBack' );
		}
	else if( CP3_Setup_Ref.bCheckpointloaded == true )
		{
		GotoState( 'SwitchBack' );
		}
	else if( CP4_Setup_Ref.bCheckpointloaded == true )
		{
		GotoState( 'Nullstate' );
		}

	ACTION_SetRepelBullets( 'gbxPlayerPawn', false );
	ACTION_SetRepelBullets( 'Pawn_Friar', false );
	ACTION_SetRepelBullets( 'Pawn_Corrion', false );
	ACTION_SetRepelBullets( 'Pawn_Paddock', false );
	ACTION_SetRepelBullets( 'Pawn_Marsh', false );
	ACTION_SetRepelBullets( 'Pawn_Campbell', false );

	bStopChargingDudes = True;
	bStopSquibs = True;
	bHideStaticGermans = True;

	GermanPawn[0] = GetPawn( 'Hill30Squad01Dude01' );
	GermanPawn[1] = GetPawn( 'Hill30Squad01Dude02' );
	GermanPawn[2] = GetPawn( 'Hill30Squad02Dude01' );
	GermanPawn[3] = GetPawn( 'Hill30Squad02Dude02' );
	GermanPawn[4] = GetPawn( 'Hill30Squad03Dude01' );
	GermanPawn[5] = GetPawn( 'Hill30Squad03Dude02' );
	GermanPawn[6] = GetPawn( 'Hill30Squad04Dude01' );
	GermanPawn[7] = GetPawn( 'Hill30Squad04Dude02' );

	Sleep( 0.2 );

	ACTION_DestroyActor( 'Hill30Squad01Dude01' );
	ACTION_DestroyActor( 'Hill30Squad01Dude02' );
	ACTION_DestroyActor( 'Hill30Squad02Dude01' );
	ACTION_DestroyActor( 'Hill30Squad02Dude02' );
	ACTION_DestroyActor( 'Hill30Squad03Dude01' );
	ACTION_DestroyActor( 'Hill30Squad03Dude02' );
	ACTION_DestroyActor( 'Hill30Squad04Dude01' );
	ACTION_DestroyActor( 'Hill30Squad04Dude02' );

/*
	ACTION_ChangeControllerDirect( GermanPawn[0], class'scriptedcontroller' );
	ACTION_ChangeControllerDirect( GermanPawn[1], class'scriptedcontroller' );
	ACTION_ChangeControllerDirect( GermanPawn[2], class'scriptedcontroller' );
	ACTION_ChangeControllerDirect( GermanPawn[3], class'scriptedcontroller' );
	ACTION_ChangeControllerDirect( GermanPawn[4], class'scriptedcontroller' );
	ACTION_ChangeControllerDirect( GermanPawn[5], class'scriptedcontroller' );
	ACTION_ChangeControllerDirect( GermanPawn[6], class'scriptedcontroller' );
	ACTION_ChangeControllerDirect( GermanPawn[7], class'scriptedcontroller' );
*/

	ScriptEnd:
}

state CleanAgain
{
	function OnTrigger()
	{
		GotoState( 'SwitchBack' );
	}

	Begin:

	ACTION_TriggerEvent( 'Emitter_TracerHell_L' );		//===== Tracers Left
	ACTION_TriggerEvent( 'Emitter_TracerHell_R' );		//===== Tracers Right
	ACTION_TriggerEvent( 'Event_StopIntroAnims' );

	Sleep( 0.2 );

	ACTION_DestroyActor( 'Hill30Squad01Dude01' );
	ACTION_DestroyActor( 'Hill30Squad01Dude02' );
	ACTION_DestroyActor( 'Hill30Squad02Dude01' );
	ACTION_DestroyActor( 'Hill30Squad02Dude02' );
	ACTION_DestroyActor( 'Hill30Squad03Dude01' );
	ACTION_DestroyActor( 'Hill30Squad03Dude02' );
	ACTION_DestroyActor( 'Hill30Squad04Dude01' );
	ACTION_DestroyActor( 'Hill30Squad04Dude02' );

/*	ACTION_SetHidden( 'AP_Jameson' , true );
	ACTION_SetHidden( 'AP_Browning' , true );
	ACTION_SetHidden( 'AP_Wheaton' , true );
	ACTION_SetHidden( 'AP_Hooper' , true );
	ACTION_SetHidden( 'AP_York' , true );
	ACTION_SetHidden( 'AP_Doe' , true );
*/
	bStopMortars = True;
	bHideGuys = true;

	Sleep( 0.2 );

	ACTION_DestroyActor( 'AP_Leggett_berzerk' );
	ACTION_DestroyActor( 'SS_Leggett_berzerk' );
	ACTION_DestroyActor( 'AP_Leggett_Intro' );
	ACTION_DestroyActor( 'SS_Leggett_Intro' );
	ACTION_DestroyActor( 'AP_Baker_Intro' );
	ACTION_DestroyActor( 'SS_Baker_Intro' );
	ACTION_DestroyActor( 'AP_Locke_Intro' );
	ACTION_DestroyActor( 'SS_Locke_Intro' );
	ACTION_DestroyActor( 'AP_Mac_Intro' );
	ACTION_DestroyActor( 'SS_Mac_Intro' );
	ACTION_DestroyActor( 'Mac_Thompson' );

	ScriptEnd:
}

state SwitchBack
{
	function OnTrigger()
	{
		GotoState( 'NullState' );
	}

	Begin:

	Sleep( 0.2 );

	// Kill tanks
	ACTION_DestroyActor( 'Pawn_Panzer01' );
	ACTION_DestroyActor( 'Pawn_Panzer02' );

	ScriptEnd:
}

state NullState
{
	function OnTrigger()
	{
		GotoState( 'NullState' );
	}
	Begin:
}
