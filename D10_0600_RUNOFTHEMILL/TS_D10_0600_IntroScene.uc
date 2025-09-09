//=============================================================================
class TS_D10_0600_IntroScene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Doyle, AP_Paddock, AP_Paige, AP_McConnel, AP_Marsh, AP_Campbell, AP_Friar;
var Tank AP_Tank2;

var ActorLite MoveTank1_Intro_1, MoveTank2_Intro_1, MovePaddock_Intro_1, MoveMcConnel_Intro_1, MoveMcConnel_Intro_2, MoveMcConnel_Intro_3, MovePaige_Intro_1, MovePaige_Intro_2, MoveMarsh_Intro_1, MoveMarsh_Intro_2, MoveDoyle_Intro_1, MoveDoyle_Intro_2, MoveDoyle_Intro_3, MoveDoyle_Intro_4, MoveDoyle_Intro_5;

var bool bFirst;

function Timer()
{
	Super.Timer();

	if ( bFirst )
	{
		bFirst = FALSE;

		ACTION_UnSetAnimSetDirect( AP_Doyle, "a_cin_d10_Run_of_the_mill.a_cin_d10_Runofthemill" );
		ACTION_UnSetAnimSetDirect( AP_McConnel, "a_cin_d10_Run_of_the_mill.a_cin_d10_Runofthemill" );
		ACTION_UnSetAnimSetDirect( AP_Marsh, "a_cin_d10_Run_of_the_mill.a_cin_d10_Runofthemill" );
	
		ACTION_TriggerEvent('PFX_Dust01');
		SetTimer( 8.0, FALSE );
	}
	else
	{
		ACTION_DestroyActor( 'Doyle' );
		ACTION_DestroyActor( 'Paige' );
		ACTION_DestroyActor( 'McConnel' );
		ACTION_DestroyActor( 'Marsh' );
		ACTION_DestroyActor( 'Tank1' );
		ACTION_DestroyActor( 'Tank2' );
	}
}

state Triggered
{
	function OnTrigger()
	{
		GotoState( 'Dialogue' );
	}

	Begin:

	bFirst = TRUE;

	ACTION_TriggerEvent( 'TankSpawner_US' );
	ACTION_TriggerEvent( 'CSU_IntroCharacters' );
	ACTION_TriggerEvent( 'TankSpawner_US_Intro' );

	ACTION_UnblockNavPoints('PN_Block_Intro');

	// Define Characters as AnimPawn Actors
	AP_Doyle = AnimPawn( GetPawn( 'Doyle' ));
	AP_Paddock = AnimPawn( GetPawn( 'Paddock' ));
	AP_Paige = AnimPawn( GetPawn( 'Paige' ));
	AP_McConnel = AnimPawn( GetPawn( 'McConnel' ));
	AP_Marsh = AnimPawn( GetPawn( 'Marsh' ));
	AP_Campbell = AnimPawn( GetPawn( 'Campbell' ));
	AP_Friar = AnimPawn( GetPawn( 'Friar' ));

	AP_Tank2 = Tank( GetFirstActor( 'Tank2' ));

	// Place tanks in scripted mode
	ACTION_TankEnterScriptedMode( AP_Tank2 );

	// Remove intro scene pawns from SA
	AP_Doyle.bExcludeFromOracleCam = TRUE;
	AP_Paige.bExcludeFromOracleCam = TRUE;
	AP_McConnel.bExcludeFromOracleCam = TRUE;
	AP_Marsh.bExcludeFromOracleCam = TRUE;
	AP_Tank2.bExcludeFromOracleCam = TRUE;

	// Define Destination actors
	MoveMcConnel_Intro_1 = GetNavigationPoint( 'PN_MoveMcConnel_Intro_1' );
	MoveMcConnel_Intro_2 = GetNavigationPoint( 'PN_MoveMcConnel_Intro_2' );
	MoveMcConnel_Intro_3 = GetNavigationPoint( 'PN_MoveMcConnel_Intro_2' );
	MovePaige_Intro_1 = GetNavigationPoint( 'PN_MovePaige_Intro_1' );
	MovePaige_Intro_2 = GetNavigationPoint( 'PN_MovePaige_Intro_2' );
	MoveMarsh_Intro_1 = GetNavigationPoint( 'PN_MoveMarsh_Intro_1' );
	MoveMarsh_Intro_2 = GetNavigationPoint( 'PN_MoveMarsh_Intro_2' );
	MoveDoyle_Intro_1 = GetNavigationPoint( 'PN_MoveDoyle_Intro_1' );
	MoveTank1_Intro_1 = GetNavigationPoint( 'PN_MoveTank1_Intro_1' );
	MoveTank2_Intro_1 = GetNavigationPoint( 'PN_MoveTank2_Intro_1' );

	// Define Animpawns AnimSets
	ACTION_SetAnimSetDirect( AP_Doyle, "a_cin_d10_Run_of_the_mill.a_cin_d10_Runofthemill" );


	ACTION_ClearPawnIdleQueue( 'Doyle' );
	ACTION_AddAnimToPawnIdleQueue( 'Doyle', 'Doyle_looking_at_map_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Doyle', 'Doyle_looking_at_map_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Doyle', FALSE );

	ACTION_ClearPawnIdleQueue( 'Paddock' );
	ACTION_AddAnimToPawnIdleQueue( 'Paddock', 'standing_idle_relaxed_3' );
	ACTION_AddAnimToPawnIdleQueue( 'Paddock', 'standing_idle_relaxed_4' );
	ACTION_AddAnimToPawnIdleQueue( 'Paddock', 'standing_idle_relaxed_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Paddock', FALSE );

	ACTION_ClearPawnIdleQueue( 'Paige' );
	ACTION_AddAnimToPawnIdleQueue( 'Paige', 'standing_idle_relaxed_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Paige', FALSE );

	ACTION_ClearPawnIdleQueue( 'McConnel' );
	ACTION_AddAnimToPawnIdleQueue( 'McConnel', 'Standing_idle_relaxed_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'McConnel', FALSE );

	ACTION_ClearPawnIdleQueue( 'Marsh' );
	ACTION_AddAnimToPawnIdleQueue( 'Marsh', 'crouched_idle_relaxed_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Marsh', FALSE );

	ACTION_ClearPawnIdleQueue( 'Campbell' );
	ACTION_AddAnimToPawnIdleQueue( 'Campbell', 'crouched_idle_relaxed_4' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Campbell', FALSE );

	ACTION_ClearPawnIdleQueue( 'Friar' );
	ACTION_AddAnimToPawnIdleQueue( 'Friar', 'crouched_idle_aimed_sighted_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Friar', FALSE );


	ACTION_AttachStaticMesh( AP_Doyle, StaticMesh's_npc_item_us.equipment.field_map', 'field_map' );
}


state Dialogue
{
	function OnTrigger()
	{
	}

	Begin:

//*************-----------Start Dialogue

	i = 3.4;

	ResetAbsoluteTime();
	StartAbsoluteTime();

	ACTION_PlayAnimWithQueue( 'Doyle', 'Doyle_looking_at_map_idle_1', 0.0, 0.9,FALSE,,);

	WaitForAbsoluteTime( i );

	ACTION_PlayAnimWithQueue( 'Doyle', 'Doyle_says_damn_nice_job', 0.5, 1.0,FALSE,,);
	
	WaitForAbsoluteTime( i += 0.5 );

	ACTION_PlayLipSyncSound( 'Doyle', "D10_0500.DOYLE_A", 1.0, 1.0, 1.0 );
//DOYLE_A1="Doyle: Damn nice job, Red.  Damn nice job."
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_A1"), 4.0, 1, 1, 1, TRUE, TRUE );  
	WaitForAbsoluteTime( i += 3.5 );

//DOYLE_A2="Doyle: Wanna stick around for a bit? We're short handed around here, need all the men we can muster."
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_A2"), 4.6, 1, 1, 1, TRUE, TRUE );  
	WaitForAbsoluteTime( i += 4.6 );

//DOYLE_A3="Doyle: Alright. I'll leave you with a tank but I'm gonna need a few of your men for the main assault."
	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_A3"), 6.0, 1, 1, 1, TRUE, TRUE );  
	WaitForAbsolutetime( i += 2.7 );
	ACTION_PlayAnimDirect( AP_Doyle, 'standing_idle_relaxed_3', 0.5, 1.0,True,,);
	WaitForAbsoluteTime( i += 2.5 );

	ACTION_ClearPawnIdleQueue( 'Doyle' );
	ACTION_AddAnimToPawnIdleQueue( 'Doyle', 'standing_idle_relaxed_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Doyle', FALSE );

//PAIGE_A="Paige: I'll go with ya."
	ACTION_SetLookAtTarget( 'Paige', AP_Doyle, True );
	ACTION_PlayLipSyncSound( 'PAIGE', "D10_0500.PAIGE_A", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Paige_A"), 2.0, 1, 1, 1, TRUE, TRUE );  
	WaitForAbsoluteTime( i += 0.4 );

	ACTION_SetLookAtTarget( 'DOYLE', AP_PAIGE, True );

	WaitForAbsoluteTime( i += 1.3 );

//DOYLE_B="Doyle: Alright.  That's one."
	ACTION_PlayLipSyncSound( 'Doyle', "D10_0500.DOYLE_B", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_B"), 2.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 0.9 );

	ACTION_SetLookAtTarget( 'DOYLE', GetLocalPlayerPawn(), True );

	WaitForAbsoluteTime( i += 0.9 );

//MARSH_A="Marsh: I'm with you."
	ACTION_SetLookAtTarget( 'Marsh', AP_Doyle, True );
	ACTION_SetLookAtTarget( 'DOYLE', AP_MARSH, True );
	ACTION_PlayLipSyncSound( 'MARSH', "D10_0500.MARSH_A", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Marsh_A"), 2.0, 1, 1, 1, TRUE, TRUE );  // "Marsh: I'm with you."
	WaitForAbsoluteTime( i += 0.4 );

	AP_Doyle.RotationRate.Yaw = 6000; //default is 30000
	AP_Doyle.Controller.RotationRate.Yaw = 6000; //default is 30000
	AP_Doyle.Controller.Focus = AP_MARSH;

	WaitForAbsoluteTime( i += 1.2 );

	//ACTION_PlayAnimWithQueue( 'Doyle', 'standing_idle_relaxed_6', 0.5, 1.0,FALSE,,);

//MCCONNEL_A="Mcconnel: Well, I'm going if Paige is going.  If anyone's gonna shoot him it's gonna be me."
	ACTION_SetDesiredSpeed( 'McConnel', 0.3 );
	ACTION_MoveToward( AP_McConnel, MoveMcConnel_Intro_1 , FALSE, GetLocalPlayerPawn() );

	WaitForAbsolutetime( i += 1.2 );
	ACTION_PlayAnimWithQueue( 'McConnel', 'Standing_chatting_5', 0.5, 1.0,FALSE,,);

	ACTION_PlayLipSyncSound( 'MCCONNEL', "D10_0500.MCCONNEL_A", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("McConnel_A"), 5.0, 1, 1, 1, TRUE, TRUE );  // "Mcconnel: Well I'm going if Paige is going.  If anyone's gonna shoot him it's gonna be me."
	WaitForAbsoluteTime( i += 0.7 );
	ACTION_SetLookAtTarget( 'DOYLE', AP_MCCONNEL, True );
	WaitForAbsoluteTime( i += 0.6 );
	ACTION_SetLookAtTarget( 'MCCONNEL', AP_PAIGE, True );
	WaitForAbsoluteTime( i += 0.5 );
	//AP_Doyle.Controller.Focus = AP_MCCONNEL;

	WaitForAbsoluteTime( i += 0.2 );
	ACTION_SetLookAtTarget( 'PAIGE', AP_MCCONNEL, True );
	WaitForAbsolutetime( i += 0.6 );
	ACTION_SetLookAtTarget( 'MCCONNEL', AP_Doyle, True );
	WaitForAbsolutetime( i += 0.3 );

	AP_Doyle.Controller.Focus = GetLocalPlayerPAWN();
	ACTION_SetLookAtTarget( 'DOYLE', GETLOCALPLAYERPAWN(), True );
	WaitForAbsoluteTime( i += 0.7 );

	WaitforAbsoluteTime( i += 0.6 );


	ACTION_PlayAnimDirect( AP_Doyle, 'Doyle_says_you_guys_are_going_down', 0.5, 1.0,FALSE,,);
	WaitForAbsoluteTime( i += 0.5 );
	ACTION_SetLookAtTarget( 'PAIGE', AP_Doyle, True );
	ACTION_PlayLipSyncSound( 'Doyle', "D10_0500.DOYLE_BB", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_B1"), 3.0, 1, 1, 1, TRUE, TRUE );  // "Doyle: You guys are going to go down the right flank and focus on the mill factory."
	WaitForAbsoluteTime( i += 3.5 );

	ACTION_ClearPawnIdleQueue( 'Campbell' );
	ACTION_AddAnimToPawnIdleQueue( 'Campbell', 'standing_idle_relaxed_4' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Campbell', FALSE );

	ACTION_PlayAnimWithQueue( 'CAMPBELL', 'standing_idle_relaxed_3', 0.5, 1.0,FALSE,,);

	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_B2"), 3.0, 1, 1, 1, TRUE, TRUE );  // "Doyle: Keep the krauts inside.  That should allow us to take that bridge."
	WaitForAbsoluteTime( i += 3.5 );

	ACTION_ClearPawnIdleQueue( 'Friar' );
	ACTION_AddAnimToPawnIdleQueue( 'Friar', 'standing_idle_relaxed_4' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Friar', FALSE );

	ACTION_PlayAnimWithQueue( 'FRIAR', 'standing_idle_relaxed_3', 0.6, 1.0,FALSE,,);

	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_B3"), 2.0, 1, 1, 1, TRUE, TRUE );  // "Doyle: Let's go men."



	WaitForAbsoluteTime( i += 1.4 );



	ACTION_DetachStaticMesh( AP_Doyle, StaticMesh's_npc_item_us.equipment.field_map', 'field_map' );

	WaitForAbsoluteTime( i += 1.0 );

	ACTION_TankMoveTo( AP_Tank2, MoveTank2_Intro_1 );

	ACTION_SetDesiredSpeed( 'McConnel', 1.0 );
	ACTION_TriggerEvent ( 'gbxWB_Bridge' );
	ACTION_TriggerEvent ( 'gbxWB_Bridge_Start' );

	AP_Doyle.RotationRate.Yaw = 30000;
	AP_Doyle.Controller.RotationRate.Yaw = 30000;
	ACTION_MoveToward( AP_Doyle , MoveDoyle_Intro_1 , FALSE );

	WaitForAbsoluteTime( i += 1.0 );

	ACTION_PlayLipSyncSound( 'PADDOCK', "D10_0500.PADDOCK_AA", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Paddock_AA"), 3.5, 1, 1, 1, TRUE, TRUE );  // "Paddock: I'm never working at no damn factory."

	ACTION_MoveToward( AP_McConnel , MoveDoyle_Intro_1 , FALSE );

	WaitForAbsoluteTime( i += 1.0 );
	ACTION_MoveToward( AP_Paige, MoveDoyle_Intro_1 , FALSE );

	WaitForAbsolutetime( i += 1.0 );
	ACTION_MoveToward( AP_Marsh, MoveDoyle_Intro_1 , FALSE );

	AP_Doyle.RotationRate.Yaw = 30000; //default is 30000
	AP_Doyle.Controller.RotationRate.Yaw = 30000; //default is 30000
	AP_Doyle.Controller.Focus = NONE;

	ACTION_TriggerEvent ( 'TriggeredScriptIntro' );

	ACTION_ChangeController( 'Paddock', class'Mind' );
	ACTION_ChangeController( 'Friar', class'Mind' );
	ACTION_ChangeController( 'Campbell', class'Mind' );

	WaitForAbsolutetime( i += 7.0 );

	ACTION_BlockNavPoints('PN_Block_Intro');

	SetTimer( 4.5, FALSE );

	ACTION_DisableBattleDialogue();
	GoToState( 'SkippableDialogue' );
}

state SkippableDialogue
{
	function OnTrigger()
	{
		GoToState( 'FinishUp' );
	}

	Begin:

	ACTION_TriggerEvent('TS_D10_0600_IntroScene_Command');

	// Begin Skippable Dialogue
	ACTION_SetLookAtTargetDirect( AP_Friar, AP_Paddock, True );
	AP_Friar.Controller.Focus = AP_Paddock;

	StopAbsoluteTime();
	ACTION_WaitForPawnRotateToward( AP_Friar );
	StartAbsoluteTime();

	ACTION_PlayLipSyncSound( 'FRIAR', "D10_0500.FRIAR_AA", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("FRIAR_AA"), 4.0, 1, 1, 1, TRUE, TRUE );

	ACTION_SetLookAtTargetDirect( AP_Paddock, AP_Friar, True );
	AP_Paddock.Controller.Focus = AP_Friar;

	StopAbsoluteTime();
	ACTION_WaitForPawnRotateToward( AP_Paddock );
	StartAbsoluteTime();

	WaitForAbsolutetime( i += 4.5 );
	ACTION_PlayLipSyncSound( 'PADDOCK', "D10_0500.PADDOCK_BB", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Paddock_BB"), 5.0, 1, 1, 1, TRUE, TRUE );

	WaitForAbsoluteTime( i += 5.0 );
	ACTION_PlayLipSyncSound( 'FRIAR', "D10_0500.FRIAR_BB", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("FRIAR_BB"), 4.0, 1, 1, 1, TRUE, TRUE );

	WaitForAbsoluteTime( i += 4.0 );
	ACTION_PlayLipSyncSound( 'PADDOCK', "D10_0500.PADDOCK_CC", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Paddock_CC"), 3.0, 1, 1, 1, TRUE, TRUE );

	GoToState( 'FinishUp' );
}

state FinishUp
{
	function OnTrigger()
	{
		// Ignore
	}

	Begin:

	ACTION_EnableBattleDialogue();

	StopAbsoluteTime();

	ScriptEnd:
}



