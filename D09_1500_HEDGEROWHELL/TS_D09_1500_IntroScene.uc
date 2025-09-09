//=============================================================================
// TS_D09_1500_IntroScene.
//=============================================================================
class TS_D09_1500_IntroScene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Doyle, AP_Paddock, AP_Friar, AP_McConnel, AP_Paige, AP_Campbell, AP_Marsh, AP_Cassidy, AP_Doe, AP_York;
var WargamePawn WP_Player;
var Actor A_LT_Intro, A_LT_Back, LT_DoyleHead;
var ActorLite AL_PathNode;

state Triggered
{
	function OnTrigger()
	{
		GotoState( 'Dialogue' );
	}

	Begin:

	ACTION_TriggerEvent( 'CSU_Intro' );
	ACTION_TriggerEvent( 'CSU_IntroScene' );

	AP_Doyle = AnimPawn( GetPawn('IG_Doyle') );
	AP_Paddock = AnimPawn( GetPawn('IG_Paddock') );
	AP_Friar = AnimPawn( GetPawn('IG_Friar') );
	AP_McConnel = AnimPawn( GetPawn('IG_McConnel') );
	AP_Paige = AnimPawn( GetPawn('IG_Paige') );
	AP_Campbell = AnimPawn( GetPawn('IG_Campbell') );
	AP_Marsh = AnimPawn( GetPawn('IG_Marsh') );
	AP_Cassidy = AnimPawn( GetPawn('IG_Cassidy') );

	AP_Doe = AnimPawn( GetPawn('IG_J_Doe') );
	AP_York = AnimPawn( GetPawn('IG_J_York') );

	LT_DoyleHead = GetFirstActor( 'LT_DoyleHead' );

	WP_Player = GetLocalPlayerPawn();

	A_LT_Intro = GetFirstActor( 'LT_IntroScene01' );
	A_LT_Back = GetFirstActor( 'LT_IntroScene_Back' );

	ACTION_ClearPawnIdleQueue( 'IG_Cassidy' );
	ACTION_AddAnimToPawnIdleQueue( 'IG_Cassidy', 'standing_chatting_1' );
	ACTION_AddAnimToPawnIdleQueue( 'IG_Cassidy', 'standing_chatting_2' );
	ACTION_AddAnimToPawnIdleQueue( 'IG_Cassidy', 'standing_chatting_3' );
	ACTION_AddAnimToPawnIdleQueue( 'IG_Cassidy', 'standing_chatting_4' );
	ACTION_PlayAnimFromPawnIdleQueue( 'IG_Cassidy', TRUE );

	sleep( 1.0 );

	AP_Doyle.AttachToBone( LT_DoyleHead, 'Bone51' );
	AP_Doyle.bDoHeadTurn = true;
	AP_Paddock.bDoHeadTurn = true;
	AP_Paige.bDoHeadTurn = true;
	AP_Campbell.bDoHeadTurn = true;
	AP_Marsh.bDoHeadTurn = true;
	AP_Cassidy.bDoHeadTurn = true;

	AP_Doyle.bExcludeFromOracleCam = TRUE;
	AP_Doe.bExcludeFromOracleCam = TRUE;
	AP_York.bExcludeFromOracleCam = TRUE;

	AP_Cassidy.bExcludeFromOracleCam = TRUE;
	GetPawn('IG_D_Doe').bExcludeFromOracleCam = TRUE;
	GetPawn('IG_D_York').bExcludeFromOracleCam = TRUE;

	ACTION_TriggerEvent( 'Event_StartIntroAnims' );
}

//=============================================================================

state Dialogue
{
	Begin:

	i = 0;
	ResetAbsoluteTime();
	StartAbsoluteTime();

	// Ext. Near somewhere erik fill this in - afternoon
	// DOYLE, HARTSOCK, (AT) PADDOCK, FRIAR, MARSH, (FT) CAMPBELL, MCCONNEL, and PAIGE are standing around joking.

// Doyle: Closest I got to being injured so far is some cuts from those damn trees I dropped though.
	ACTION_PlayLipSyncSoundDirect( AP_Doyle, "D09_1500.DOYLE_A", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_A"), 5.5, 1, 1, 1, TRUE, TRUE );

	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Marsh, TRUE );
	ACTION_SetLookAtTargetDirect( AP_Campbell, LT_DoyleHead, TRUE );
	WaitForAbsoluteTime( i+=0.5 );

	ACTION_SetLookAtTargetDirect( AP_Paddock, LT_DoyleHead, TRUE );
	ACTION_SetLookAtTargetDirect( AP_Paige, LT_DoyleHead, TRUE );
	WaitForAbsoluteTime( i+=0.5 );

	ACTION_SetLookAtTargetDirect( AP_Marsh, AP_Doyle, TRUE );
	ACTION_SetLookAtTargetDirect( AP_Doyle, WP_Player, TRUE );
	WaitForAbsoluteTime( i+=1.5 );

	ACTION_SetLookAtTargetDirect( AP_Doyle, A_LT_Intro, TRUE );
	
	WaitForAbsoluteTime( i+=2.5 );




// Campbell: Count your blessings and hang onto 'em.
	ACTION_DisplaySubTitleMessage2( S_Localize("CAMPBELL_A"), 3.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Campbell, "D09_1500.CAMPBELL_A", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Event_CampbellSpeak' );
	AP_Campbell.RotationRate.Yaw = 8000; //default is 30000
	AP_Campbell.Controller.RotationRate.Yaw = 8000; //default is 30000
	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Campbell, TRUE );

	// AL_PathNode = GetNavigationPoint('PN_Intro_Peek0');
	ACTION_WalkDirect( AP_Campbell );
	
	WaitForAbsoluteTime( i+=2.0 );
	ACTION_SetLookAtTargetDirect( AP_Campbell, WP_Player, FALSE );

	WaitForAbsoluteTime( i+=1.0 );
	AP_Campbell.Controller.Focus = getFirstActor('LT_IntroScene_Peek' );
	ACTION_SetLookAtTargetDirect( AP_Campbell, NONE, TRUE );
	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Friar, TRUE );


	
//	Doyle: Looks like we're moving out to St. Saveur to complete our main objective.  
//		Gotta clear the way so that the infantry can take Cherbourg.
	ACTION_TriggerEvent( 'Event_Doyle_Says_Looks_Like' );
	ACTION_PlayLipSyncSoundDirect( AP_Doyle, "D09_1500.DOYLE_B", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_B1"), 5.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i+=1.3 );
	ACTION_MoveTowardTag( 'IG_Campbell', 'PN_Intro_peek1', False, 'LT_IntroScene_Peek' );
	WaitForAbsoluteTime( i+=1.0 );

	ACTION_SetLookAtTargetDirect( AP_Doyle, WP_Player, TRUE );
	WaitForAbsoluteTime( i+=3.0 );

	ACTION_SetLookAtTargetDirect( AP_Marsh, WP_Player, TRUE );

//	Doyle: You 101st boys have fun playing guard duty while the real men go to work.
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_B2"), 4.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i+=1.75 );

	ACTION_MoveTowardTag( 'IG_Campbell', 'PN_Intro_peek2', False, 'LT_IntroScene_Peek' );
	WaitForAbsoluteTime( i+=0.5 );

	ACTION_CrouchDirect( AP_Campbell );
	ACTION_SetLookAtTargetDirect( AP_Marsh, LT_DoyleHead, TRUE );
	WaitForAbsoluteTime( i+=0.25 );

	ACTION_SetLookAtTargetDirect( AP_Doyle, WP_Player, TRUE );
	WaitForAbsoluteTime( i+=2.5 );

//	Paddock: ...and I'm sure we’ll be saving your asses up there in Saint Saveur.  Not like you won't need it.
	ACTION_PlayLipSyncSoundDirect( AP_Paddock, "D09_1500.PADDOCK_AA", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_A"), 3.5, 1, 1, 1, TRUE, TRUE );
	ACTION_TriggerEvent( 'Event_PaddockTalk' );

	ACTION_PlayAnimDirect( AP_Campbell, 'crouched_idle_relaxed_3', 1.0, 1.0, TRUE );

	ACTION_SetLookAtTargetDirect( AP_Paddock, LT_DoyleHead, TRUE );
	WaitForAbsoluteTime( i+=1.0 );

	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Paddock, TRUE );
	WaitForAbsoluteTime( i+=0.5 );

	ACTION_SetLookAtTargetDirect( AP_Paige, AP_Paddock, TRUE );
	WaitForAbsoluteTime( i+=0.75 );
	ACTION_SetLookAtTargetDirect( AP_Marsh, AP_Paddock, TRUE );
	WaitForAbsoluteTime( i+=0.75 );
	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Paige, TRUE );
	WaitForAbsoluteTime( i+=0.5 );
	ACTION_SetLookAtTargetDirect( AP_Paige, AP_Paddock, TRUE );
	WaitForAbsoluteTime( i+=1.0 );
	ACTION_SetLookAtTargetDirect( AP_Doyle, WP_Player, TRUE );


	WaitForAbsoluteTime( i+=1.0 );



	ACTION_TriggerEvent( 'Event_MarshTalk' );
	ACTION_PlayAnimWithQueueDirect( AP_Cassidy, 'standing_combat_5', 0.2, 1.5 );
//	Marsh: Why do you say that, Paddock?
	ACTION_PlayLipSyncSoundDirect( AP_Marsh, "D09_1500.MARSH_AA", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("MARSH_A"), 2.5, 1, 1, 1, TRUE, TRUE );



	AP_Campbell.Controller.Focus = getFirstActor('LT_IntroScene_Peek');

	

	WaitForAbsoluteTime( i+=0.75 );
	ACTION_SetLookAtTargetDirect( AP_Paige, AP_Marsh, TRUE );
	WaitForAbsoluteTime( i+=0.25 );
	ACTION_SetLookAtTargetDirect( AP_Paddock, AP_Marsh, TRUE );
	WaitForAbsoluteTime( i+=0.5 );
	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Marsh, TRUE );
	WaitForAbsoluteTime( i+=0.75 );





//	Paddock: Because the 82nd always needs saving.
	ACTION_PlayLipSyncSoundDirect( AP_Paddock, "D09_1500.PADDOCK_BB", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_B"), 2.0, 1, 1, 1, TRUE, TRUE );

	WaitForAbsoluteTime( i+=0.25 );	
	ACTION_SetLookAtTargetDirect( AP_Paddock, WP_Player, TRUE );
	WaitForAbsoluteTime( i+=0.25 );



	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Paddock, TRUE );
	WaitForAbsoluteTime( i+=0.5 );
	ACTION_SetLookAtTargetDirect( AP_Paddock, LT_DoyleHead, TRUE );
	WaitForAbsoluteTime( i+=0.5 );
	ACTION_SetLookAtTargetDirect( AP_Marsh, LT_DoyleHead, TRUE );
	WaitForAbsoluteTime( i+=0.8 );
	ACTION_SetLookAtTargetDirect( AP_Doyle, WP_Player, TRUE );
	WaitForAbsoluteTime( i+=1.2 );


	ACTION_WalkDirect( AP_York );
	ACTION_MoveTowardTag( 'IG_J_York', 'PN_82_York', True );




//	Doyle: Heh, well I better get moving.  You boys keep your heads down.
//		After me and the 82nd kills Hitler and ends this war we'll get that whiskey back in England.
	ACTION_TriggerEvent( 'Event_Doyle_Says_Well_I_Better' );
	WaitForAbsoluteTime( i+=1.0 );
	ACTION_PlayLipSyncSoundDirect( AP_Doyle, "D09_1500.DOYLE_C", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_C1"), 8.0, 1, 1, 1, TRUE, TRUE );
	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Marsh, TRUE );
	WaitForAbsoluteTime( i+=0.75 );
	ACTION_SetLookAtTargetDirect( AP_Paddock, WP_Player, TRUE );

	AP_Doe.Controller.Focus = GetFirstActor('LT_IntroScene_Back');

	WaitForAbsoluteTime( i+=0.75 );
	ACTION_SetLookAtTargetDirect( AP_Doyle, WP_Player, TRUE );

	ACTION_WalkDirect( AP_Doe );
	ACTION_MoveTowardTag( 'IG_J_Doe', 'PN_82_Doe', False );

	WaitForAbsoluteTime( i+=2.0 );
	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Paige, TRUE );
	WaitForAbsoluteTime( i+=2.0 );
	ACTION_WalkDirect( AP_Cassidy );
	AL_PathNode = GetNavigationPoint( 'PN_82_Group02' );
	AP_Cassidy.Controller.Focus = AL_PathNode;
	sleep(1.5);
	ACTION_MoveToward( AP_Cassidy, AL_PathNode, FALSE );
	ACTION_SetLookAtTargetDirect( AP_Doyle, AP_Paddock, TRUE );
	WaitForAbsoluteTime( i+=1.0 );
	ACTION_SetLookAtTargetDirect( AP_Doyle, WP_Player, FALSE );
	WaitForAbsoluteTime( i+=1.75 );
	//	Doyle: -and I like whiskey.
	ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_C2"), 2.5, 1, 1, 1, TRUE, TRUE );
	StopAbsoluteTime();

	ACTION_WaitForEvent( 'Event_DoyleDoneAnim' );

	i = 0.0;
	ResetAbsoluteTime();
	StartAbsoluteTime();

	AP_Cassidy.RotationRate.Yaw = 20000; //default is 30000
	AP_Cassidy.Controller.RotationRate.Yaw = 20000; //default is 30000

// Doyle runs off and joins the 82nd boys nearby.  Cassidy comes walking up to the bunch of them.
	ACTION_WalkDirect( AP_Doyle );
	AL_PathNode = GetNavigationPoint('PN_82_Group');
	ACTION_SetLookAtTargetDirect( AP_Doyle, GetPawn('IG_D_Doe'), FALSE );
	ACTION_MoveToward( AP_Doyle, AL_PathNode, FALSE, A_LT_Back );


	WaitForAbsoluteTime( i+=2.0 );

	StopAbsoluteTime();

	AP_Cassidy.Controller.Focus = AP_Paige;
	ACTION_WaitForPawnRotateToward( AP_Cassidy );

	i = 0.0;
	ResetAbsoluteTime();
	StartAbsoluteTime();

	ACTION_SetLookAtTargetDirect( AP_Cassidy, AP_Doyle, TRUE );
	WaitForAbsoluteTime( i+=1.0 );



// Paige: Oh it's Col. Cassidy.  Crap that means we're going out on patrol again.
	ACTION_DisplaySubTitleMessage2( S_Localize("PAIGE_A1"), 3.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Paige, "D09_1500.PAIGE_A", 1.0, 1.0, 1.0 );

	WaitForAbsoluteTime( i+=0.5 );
	ACTION_SetLookAtTargetDirect( AP_Paige, AP_Paddock, TRUE );
	WaitForAbsoluteTime( i+=0.75 );
	AP_Doe.Controller.Focus = AP_Cassidy;
	AP_York.Controller.Focus = AP_Cassidy;
	ACTION_SetLookAtTargetDirect( AP_Cassidy, WP_Player, TRUE );
	ACTION_SetLookAtTargetDirect( AP_Paige, AP_Cassidy, TRUE );
	WaitForAbsoluteTime( i+=0.75 );

	AL_PathNode = GetNavigationPoint('PN_Fence_Intro');
	ACTION_WalkDirect( AP_Cassidy );
	AP_Cassidy.MaxDesiredSpeed = 0.2;
	WaitForAbsoluteTime( i+=0.5 );
	ACTION_MoveToward( AP_Cassidy, AL_PathNode, FALSE, WP_Player );


	ACTION_SetLookAtTargetDirect( AP_Paddock, AP_Paige, TRUE );

	WaitForAbsoluteTime( i+=0.75 );
	ACTION_DisplaySubTitleMessage2( S_Localize("PAIGE_A2"), 3.0, 1, 1, 1, TRUE, TRUE );
	ACTION_SetLookAtTargetDirect( AP_Paddock, AP_Cassidy, TRUE );
	WaitForAbsoluteTime( i+=0.75 );

	ACTION_SetLookAtTargetDirect( AP_Paige, AP_Cassidy, TRUE );

	// Cassidy reaches them.
	ACTION_SetLookAtTargetDirect( AP_Marsh, AP_Cassidy, TRUE );


	// Paddock: Sir
	WaitForAbsoluteTime( i+=2.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_C"), 1.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Paddock, "D09_1500.PADDOCK_B", 1.0, 1.0, 1.0 );

	ACTION_SetLookAtTargetDirect( AP_Cassidy, AP_Paddock, TRUE );

	// Marsh: Sir
	WaitForAbsoluteTime( i+=1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("MARSH_B"), 1.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Marsh, "D09_1500.MARSH_A", 1, 1.0, 1.0 );
	
	ACTION_SetLookAtTargetDirect( AP_Cassidy, AP_Marsh, TRUE );

	// Cassidy: The Germans that retreated from Baupte have taken up some strong positions in the Hedgerows south of town.
	WaitForAbsoluteTime( i+=2.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("CASSIDY_A1"), 2.0, 1, 1, 1, TRUE, TRUE );
	ACTION_PlayLipSyncSoundDirect( AP_Cassidy, "D09_1500.CASSIDY_A", 1.0, 1.0, 1.0 );

	ACTION_SetLookAtTargetDirect( AP_Cassidy, WP_Player, TRUE );
	WaitForAbsoluteTime( i+=2.0 );

	ACTION_DisplaySubTitleMessage2( S_Localize("CASSIDY_A2"), 6.0, 1, 1, 1, TRUE, TRUE );

	ACTION_SetLookAtTargetDirect( AP_Cassidy, AP_Paddock, TRUE );
	WaitForAbsoluteTime( i+=1.5 );

	ACTION_SetLookAtTargetDirect( AP_Cassidy, AP_Marsh, TRUE );
	WaitForAbsoluteTime( i+=1.0 );

	ACTION_SetLookAtTargetDirect( AP_Cassidy, WP_Player, TRUE );
	WaitForAbsoluteTime( i+=1.5 );

	ACTION_SetLookAtTargetDirect( AP_Cassidy, AP_Paddock, TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Cassidy, 'standing_chatting_5', 0.2, 1.5 );
	WaitForAbsoluteTime( i+=2.0 );

	// Cassidy: You boys are going to go out there and push those motherless Krauts off.  Get ready to move out.
	ACTION_DisplaySubTitleMessage2( S_Localize("CASSIDY_A3"), 4.0, 1, 1, 1, TRUE, TRUE );
	ACTION_SetLookAtTargetDirect( AP_Cassidy, AP_Marsh, TRUE );
	WaitForAbsoluteTime( i+=2.5 );

	// WaitForAbsoluteTime( i+=1.0 );
	ACTION_MoveTowardTag( 'IG_Campbell', 'PN_Intro_peek1', FALSE );

	ACTION_SetLookAtTargetDirect( AP_Cassidy, AP_Paddock, TRUE );
	WaitForAbsoluteTime( i+=2.5 );

	// Cassidy: -and don't be afraid to blow a few holes in the hedgerows out here.  They grow back.
	ACTION_DisplaySubTitleMessage2( S_Localize("CASSIDY_A4"), 4.0, 1, 1, 1, TRUE, TRUE );

	ACTION_SetLookAtTargetDirect( AP_Cassidy, WP_Player, TRUE );
	WaitForAbsoluteTime( i+=1.5 );

	ACTION_SetLookAtTargetDirect( AP_Cassidy, A_LT_Intro, TRUE );
	WaitForAbsoluteTime( i+=0.75 );

	ACTION_SetLookAtTargetDirect( AP_Cassidy, WP_Player, TRUE );
	AP_Cassidy.RotationRate.Yaw = 8000; //default is 30000
	AP_Cassidy.Controller.RotationRate.Yaw = 8000; //default is 30000
	WaitForAbsoluteTime( i+=1.0 );

	ACTION_WalkDirect( AP_Campbell );
	ACTION_PlayAnimDirect( AP_Campbell, 'standing_idle_relaxed_3', 1.0, 1.0, TRUE );

	// Cassidy walks off to another group of men
	WaitForAbsoluteTime( i+=1.0 );
	StopAbsoluteTime();

	ACTION_SetLookAtTargetDirect( AP_Cassidy, A_LT_Back, TRUE );

	AL_PathNode = GetNavigationPoint( 'PN_82_Group02' );

	AP_Cassidy.Controller.Focus = AL_PathNode;
	sleep(1.0);
	ACTION_MoveToward( AP_Cassidy, AL_PathNode, FALSE );
	ACTION_TriggerEvent('INTRO_CAMPBELL_END');
	StartAbsoluteTime();
	i += 0.0;

	AP_Campbell.RotationRate.Yaw = 30000; //default is 30000
	AP_Campbell.Controller.RotationRate.Yaw = 30000; //default is 30000
	AP_Cassidy.RotationRate.Yaw = 30000; //default is 30000
	AP_Cassidy.Controller.RotationRate.Yaw = 30000; //default is 30000
	AP_Doe.RotationRate.Yaw = 30000; //default is 30000
	AP_Doe.Controller.RotationRate.Yaw = 30000; //default is 30000
	AP_York.RotationRate.Yaw = 30000; //default is 30000
	AP_York.Controller.RotationRate.Yaw = 30000; //default is 30000

	AP_Cassidy.Controller.Focus = NONE;
	AP_Doe.Controller.Focus = NONE;
	AP_York.Controller.Focus = NONE;

	ACTION_RunDirect( AP_Doe );
	ACTION_ChangeController( 'IG_J_York', class'Mind' );


	// Paige: Told ya.
	WaitForAbsoluteTime( i+=1.75 );
	ACTION_DisplaySubTitleMessage2( S_Localize("PAIGE_C"), 2.5, 1, 1, 1, TRUE, TRUE );
	i += ACTION_PlayLipSyncSoundDirect( AP_Paige, "D09_1500.PAIGE_C", 1.0, 1.0, 1.0 ) + 0.5;

	ACTION_SetLookAtTargetDirect( AP_Paige, AP_Paddock, TRUE );
	WaitForAbsoluteTime( i+= 0.5 );
	ACTION_SetLookAtTargetDirect( AP_Paddock, AP_Paige, TRUE );

	WaitForAbsoluteTime( i+= 0.5 );

	//=============================================================================
	ACTION_TriggerEvent( 'Event_EndIntroAnims' );

	// CLEAN UP
	ACTION_UnsetAnimSetDirect( AP_Doyle, "a_generic_poses.poses" );
	ACTION_UnsetAnimSetDirect( AP_Paddock, "a_generic_poses.poses" );
	ACTION_UnsetAnimSetDirect( AP_Friar, "a_generic_poses.poses" );
	ACTION_UnsetAnimSetDirect( AP_McConnel, "a_generic_poses.poses" );
	ACTION_UnsetAnimSetDirect( AP_Paige, "a_generic_poses.poses" );
	ACTION_UnsetAnimSetDirect( AP_Campbell, "a_generic_poses.poses" );
	ACTION_UnsetAnimSetDirect( AP_Marsh, "a_generic_poses.poses" );
	ACTION_UnsetAnimSetDirect( AP_Cassidy, "a_generic_poses.poses" );

	ACTION_ChangeController( 'IG_Cassidy', class'Mind' );
	ACTION_TriggerEvent( Event );
	ACTION_TriggerEvent( 'TS_Combat1' );

	ACTION_TriggerEvent( 'gbxWB_Train' );

	WaitForAbsoluteTime( i+= 3.5 );
	ACTION_OrderMove( 'Unit_US_Johnson', 'PN_Intro_Destroy' );
	ACTION_OrderMove( 'Unit_US_Doyle', 'PN_Intro_Destroy' );
	ACTION_MoveTowardTag( 'IG_J_Doe', 'PN_Intro_Destroy' );
	WaitForAbsoluteTime( i+= 10.5 );
	ACTION_DestroyActor( 'IG_Cassidy' );
	ACTION_DestroyActor( 'IG_Doyle' );
	ACTION_DestroyActor( 'IG_J_York' );
	ACTION_DestroyActor( 'IG_J_Doe' );
	ACTION_DestroyActor( 'IG_D_York' );
	ACTION_DestroyActor( 'IG_D_Doe' );

	ScriptEnd:
}
