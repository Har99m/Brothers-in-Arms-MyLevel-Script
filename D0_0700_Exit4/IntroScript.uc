//=============================================================================
// IntroScript.
//=============================================================================
class IntroScript extends TriggeredScript
	placeable;

var Actor MyPlayer;
var int Monologue;
var int Music;
var float HartsockDistance;

var pawn Leggett;
var pawn Mac;
var pawn Hartsock;
var pawn Scarecrow;

var bool bHartDone;

var bool bTargetIssued;
var bool bAssaultIssued;
var bool bFallInIssued;

function Signal(Actor Sender, int command, Actor ActorData, int IntegerData, float FloatData)
{
   if (command == 1)  // was target command issued?
   {
      bTargetIssued = true;
   }
   else if (command == 2)  // was assault command issued?
   {
      bAssaultIssued = true;
   }
   else if (command == 3)	// was fall-in command issued?
   {
      bFallInIssued = true;
   }
}

state Triggered
{
Begin:
	Scarecrow = GetPawn('MyScarecrow');
	ACTION_TriggerEvent( 'Hartsock_Checkpoint0' );
	ACTION_TriggerEvent( 'SpawnMac' );
	ACTION_TriggerEvent( 'SpawnLeggett' );

	// lock player movement
	ACTION_DisableBattleDialogue();
	ACTION_HideHUD( GetLocalPlayerController(), true );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_BlockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_LOOK );
	ACTION_SaveMemoryReport( "Exit4_Start" );

	// Map name, date, time
	ACTION_MapIntroTextPos( GetLocalPlayerController(), 50, 350 );
	ACTION_MapIntroText( GetLocalPlayerController(), 1, 2.0 );

	// Monologue
	MyPlayer = GetFirstActor('Player');
	Music = MyPlayer.PlayMusic("MUSIC.D00600_VO", 0.0);
	sleep(7.0);
	Monologue = MyPlayer.PlayMusic("D00600.VOICEOVER_A", 0.0, false);
//	monologue = Action_PlaySoundReturnHandle( 'Player', "D00600.VOICEOVER_A", 1.0, 1.0, 10000);
//	sleep(7.0);
	ACTION_DisplaySubTitleMessage2(S_Localize( "VOICEOVER_A", "D0_0700_EXIT4" ), 8.0, 1 , 1 , 1, , TRUE );
	sleep(9.0);
	ACTION_DisplaySubTitleMessage2(S_Localize( "VOICEOVER_B", "D0_0700_EXIT4" ), 8.0, 1 , 1 , 1, , TRUE  );
	sleep(7.0);
	ACTION_DisplaySubTitleMessage2(S_Localize( "VOICEOVER_C", "D0_0700_EXIT4" ), 4.5, 1 , 1 , 1, , TRUE  );
	sleep(4.0);

	// Stop Monologue
//	MyPlayer.StopSound(Monologue, 2.5);  // stop sound by fading out over 2.5 seconds;
//	ACTION_StopSound ('Player', Monologue, 1.5);
	MyPlayer.StopMusic( monologue, 1.5 );
	MyPlayer.StopMusic( music, 1.5 );
	ACTION_UnBlockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_LOOK );
	ACTION_BlockActionKeys( -1 );
	ACTION_UnblockActionKeys( KEY_ACTION_LOOK + KEY_ACTION_SHOW_MENU + KEY_ACTION_JUMP );

	//===== Attach radio to Leggett
	ACTION_AttachStaticMesh( GetPawn('Leggett') , StaticMesh's_military_us.equipment.us_radio_field_pack' , 'radio_bone' );

	// Fade out text and fade into game
	ACTION_MapIntroText( GetLocalPlayerController(), 2, 2.0 );
		sleep( 2.0 );
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
//    Action_PlaySoundReturnHandle( 'Player', "D00600_SOUNDS.AMB_WIND", 1.0, 1.0, 10000);
		sleep (1.0);

	//legget init
//	GetPawn('Leggett').bNoTurnBody = true;
	ACTION_SetLookAtTarget( 'Leggett', GetPawn('Mac'), TRUE );
	ACTION_SetAnimSet( 'Leggett', "a_cin_d0_exit4.a_cin_d0_exit4" );

	//mac init
//	GetPawn('Mac').bNoTurnBody = true;
//	ACTION_SetLookAtTarget( 'Mac', MyPlayer, TRUE );
	ACTION_SetLookAtTarget( 'Mac', GetLocalPlayerPawn(), TRUE );
	ACTION_SetAnimSet( 'Mac', "a_cin_d0_exit4.a_cin_d0_exit4" );

	//hartsock init
	ACTION_SetAnimSet( 'hartsock', "a_cin_d0_exit4.a_cin_d0_exit4" );
	ACTION_ClearPawnIdleQueue( 'hartsock' );
	ACTION_AddAnimToPawnIdleQueue( 'hartsock', 'Hartsock_out_of_breath_idle' );
	ACTION_AddAnimToPawnIdleQueue( 'hartsock', 'Hartsock_out_of_breath_idle' );

//	"Mac: I got word from another platoon that some of our boys dropped in this area."
	ACTION_DisplaySubTitleMessage2(S_Localize( "MAC_LINE_A", "D0_0700_EXIT4" ), 6.0, 1 , 1 , 1, , TRUE  );
	sleep( ACTION_PlayLipSyncSound( 'mac', "D00600.MAC_A", 255.0, 1.0, 1.0 ) );

//	ACTION_SetLookAtTarget( 'Leggett', MyPlayer, TRUE );
	ACTION_SetLookAtTarget( 'Leggett', GetLocalPlayerPawn(), TRUE );

//	"Mac: The krauts were nice enough to flood it for us as a welcoming gift."
	ACTION_DisplaySubTitleMessage2(S_Localize( "MAC_LINE_B", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'mac', "D00600.MAC_B", 255.0, 1.0, 1.0 ) );


	ACTION_OrderMove( 'USAFireTeam1', 'Hartsock_Path01' );
	ACTION_MoveTowardTag( 'Hartsock' , 'Hartsock_Path01', false, 'Leggett' );

//	"Leggett: Sure as shit isnt gonna be easy finding them out here."
	ACTION_DisplaySubTitleMessage2(S_Localize("LEGGETT_LINE_A", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'leggett', "D00600.LEGGETT_A", 255.0, 1.0, 1.0 ) );

	ACTION_SetLookAtTarget( 'Leggett', GetPawn('Hartsock'), TRUE, 'c_eyebrow' );

//	"Leggett: Unless of course they find us. is that Red?."
	ACTION_DisplaySubTitleMessage2(S_Localize("LEGGETT_LINE_B", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'leggett', "D00600.LEGGETT_B", 255.0, 1.0, 1.0 ) );

	ACTION_SetLookAtTarget( 'Mac', GetPawn('Hartsock'), TRUE, 'c_eyebrow' );

//	ACTION_ChangeController ( 'Hartsock', Class 'ScriptedController');	

	//hartsock
	//ACTION_WaitForPawnMoveTo(GetPawn('Hartsock'),GetLocalPlayerPawn().location + vector( GetLocalPlayerPawn().Rotation) * 200.0f );
//	GetPawn('Hartsock').Controller.Focus=GetLocalPlayerPawn();
//	ACTION_WaitforPawnRotateToward ( GetPawn('Hartsock'));

//	GetPawn('Mac').Controller.Focus = GetFirstActor('Hartsock'); 
//	ACTION_WaitForPawnRotateToward( GetPawn('Mac') );

//	GetPawn('Leggett').Controller.Focus = GetFirstActor('Hartsock'); 
//	ACTION_WaitForPawnRotateToward( GetPawn('Mac') );

	bHartDone = PawnIsAtDestination( GetPawn('Hartsock'), GetNavigationPoint('Hartsock_Path01'));	
	while (!bHartDone)
	{
		sleep(0.1);
		bHartDone = PawnIsAtDestination( GetPawn('Hartsock'), GetNavigationPoint('Hartsock_Path01'));	
	}
//	GetPawn('Hartsock').bNoTurnBody = true;
	ACTION_PlayAnimFromPawnIdleQueue( 'hartsock', FALSE );
	ACTION_PlayAnimWithQueue( 'Hartsock', 'Hartsock_out_of_breath_chat_1', 0.1, 1.0);

	ACTION_SetLookAtTarget( 'Hartsock', GetPawn('Leggett'), TRUE );

	sleep(0.5);

	//hartsock
//	"Hartsock: Theres Germans all over the area and I think I saw a mortar team.  Jesus its great to see you guys.  I spent this morning in a ditch, picked one guy off as he sipped his morning joe.  Did I mention it was great to see you guys?"
	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_LINE_A", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'hartsock', "D00600.HARTSOCK_A", 255.0, 1.0, 1.0 ) );

	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_LINE_B", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'hartsock', "D00600.HARTSOCK_B", 255.0, 1.0, 1.0 ) );

	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_LINE_C", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'hartsock', "D00600.HARTSOCK_C", 255.0, 1.0, 1.0 ) );

//	ACTION_SetLookAtTarget( 'Hartsock', MyPlayer, TRUE );
	ACTION_SetLookAtTarget( 'Hartsock', GetLocalPlayerPawn(), TRUE );

	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_LINE_D", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'hartsock', "D00600.HARTSOCK_D", 255.0, 1.0, 1.0 ) );

	ACTION_SetLookAtTarget( 'Mac', GetLocalPlayerPawn(), TRUE );

//	ACTION_DisplayObjectiveString(S_Localize("HARTSOCK_LINE_E", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'hartsock', "D00600.HARTSOCK_E", 255.0, 1.0, 1.0 ) );

	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_LINE_F", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'hartsock', "D00600.HARTSOCK_F", 255.0, 1.0, 1.0 ) );

	ACTION_SetLookAtTarget( 'Hartsock', GetPawn('Leggett'), TRUE );
	ACTION_SetLookAtTarget( 'Mac', GetPawn('Leggett'), TRUE );

	ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_LINE_G", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'hartsock', "D00600.HARTSOCK_G", 255.0, 1.0, 1.0 ) );


//	ACTION_SetLookAtTarget( 'Mac', MyPlayer, TRUE );
	ACTION_SetLookAtTarget( 'Mac', GetLocalPlayerPawn(), TRUE );
	ACTION_SetLookAtTarget( 'Leggett', GetPawn('Mac'), TRUE );
	ACTION_SetLookAtTarget( 'hartsock', GetPawn('Mac'), TRUE );


	//Mac
//	"Mac: Hate to do this but I dont have a choice, Baker you take Hartsock and clear the main road.  Ill link up with you once we get to the beachhead.  Lets move."
	ACTION_DisplaySubTitleMessage2(S_Localize("MAC_LINE_C", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'mac', "D00600.MAC_C", 255.0, 1.0, 1.0 ) );

	ACTION_DisplaySubTitleMessage2(S_Localize("MAC_LINE_D", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'mac', "D00600.MAC_D", 255.0, 1.0, 1.0 ) );

//	ACTION_SetLookAtTarget( 'hartsock', MyPlayer, TRUE );
	ACTION_SetLookAtTarget( 'Hartsock', GetLocalPlayerPawn(), TRUE );

	ACTION_DisplaySubTitleMessage2(S_Localize("MAC_LINE_E", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'mac', "D00600.MAC_E", 255.0, 1.0, 1.0 ) );

	ACTION_DisplaySubTitleMessage2(S_Localize("MAC_LINE_F", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'mac', "D00600.MAC_F", 255.0, 1.0, 1.0 ) );

	ACTION_SetLookAtTarget( 'hartsock', GetPawn('Mac'), TRUE );

	ACTION_DisplaySubTitleMessage2(S_Localize("MAC_LINE_G", "D0_0700_EXIT4" ), 2.0 , 1 , 1 , 1, , TRUE );
	sleep( ACTION_PlayLipSyncSound( 'mac', "D00600.MAC_G", 255.0, 1.0, 1.0 ) );

	ACTION_ClearLookAtTarget( 'Mac' );
	ACTION_ClearLookAtTarget( 'Leggett' );
	ACTION_ClearLookAtTarget( 'Hartsock' );

	ACTION_ChangeController ( 'Hartsock', Class 'gbxAI.Mind');
//	ACTION_ChangeController ( 'Mac', Class 'gbxAI.Mind');
//	ACTION_ChangeController ( 'Leggett', Class 'gbxAI.Mind');

//	ACTION_AssigntoUnit( 'Mac', 'MacLeggs' );
//	ACTION_AssigntoUnit( 'Leggett', 'MacLeggs' );

//	ACTION_OrderMove( 'MacLeggs', 'Mac_Path01' );

	ACTION_MoveTowardTag ( 'Mac' , 'Mac_Path01', true );
	sleep(0.5);
	ACTION_MoveTowardTag ( 'Leggett' , 'Leggett_Path01', true );


	// unlock player
	ACTION_HideHUD( GetLocalPlayerController(), false );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), false );
	ACTION_EnableBattleDialogue();

//=============================================================================
// TRAINING YOU BAD MOFO YOU
//=============================================================================

If (!ACTION_IsTrainingDisabled())
	{

	ACTION_BlockNavPoints( 'PN_KeepHartsockInGarden' );

		Unit(GetFirstActor('USAFireTeam1')).AddNotifyOrderTarget(self);
		Unit(GetFirstActor('USAFireTeam1')).AddNotifyOrderAssault(self);
		Unit(GetFirstActor('USAFireTeam1')).AddNotifyOrderFallIn(self);
		GetPawn('Hartsock').sightradius=0;
	
		GetLocalPlayerController().bTargetOrderEnabled = false;
		GetLocalPlayerController().bAssaultOrderEnabled = false;
		GetLocalPlayerController().bMoveOrderEnabled = false;
	
	//"Cpl. Hartsock is now part of your squad.  You are the squad leader, so
	//Hartsock will obey your commands!  He is part of your Fire Team %icon_team_fire%.
	//%newline%%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_A", "D0_0700_EXIT4"), 0.0);
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE
	
	//"Fire teams %icon_team_fire% are equipped with rifles, light machineguns,
	//and grenades.  This team is ideal for suppressing the enemy.%newline%%newline%
	//%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_B", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE
	
	//"Notice, as you look around, that the Fire team icon %icon_team_fire% on
	//the outer ring of your compass adjusts to show Hartsock’s position.%newline%
	//%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_C", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE
	
	//"As squad leader, you can command Hartsock to move to a new location,
	//fire on a target, assault (charge) an enemy's position, or follow you
	//around.%newline%%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_D", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE
	
	//"%+action_order% %icon_order% to bring up the command ring. Then %action_look%
	//%icon_look% to point the command ring into the nearby garden and %-action_order%
	//%icon_order% to issue a 'move' order." 
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_E", "D0_0700_EXIT4"), 0.0 );
		ACTION_UnblockActionKeys( KEY_ACTION_ORDER );
		GetLocalPlayerController().bMoveOrderEnabled = true; 
		ACTION_WaitForEvent( 'HartsockMoved' );
		GetLocalPlayerController().bMoveOrderEnabled = false;
		sleep(2.0);
	
	//"Hartsock will move to the general area where you placed the command ring.
	//%newline%%newline%%icon_continue% to Continue"
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_G", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
	
	//"Hartsock is a trained soldier.  He is smart enough to find nearby cover,
	//especially if there are enemies around.%newline%%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_H", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//HARTSOCK MOVES TO COVER BEHIND CART AND BARREL, AUTOMATICALLY (SCRIPTED)
		//PRESS TO CONTINUE
	
	//Clear Training Messages
		ACTION_DisplayTrainingMessage( "", 0.0 );
		ACTION_OrderMove( 'USAFireTeam1', 'Hartsock_Path02' );
		Mind(GetPawn('Hartsock').Controller).NavigationController.ManeuverToActor(GetNavigationPoint('Hartsock_Path02'),false);
		HartsockDistance = VSize(GetPawn('Hartsock').Location - GetNavigationPointLocation('Hartsock_Path02'));

		while (HartsockDistance > 100.0f)
				{
					sleep(0.1);
					HartsockDistance = VSize(GetPawn('Hartsock').Location - GetNavigationPointLocation('Hartsock_Path02'));
				}

//		while
//			(!GetPawn('Hartsock').ReachedDestination(GetNavigationPoint('Hartsock_Path02')))
//				{
//				sleep(0.1);
//				}	
	//"Soldiers in your squad will automatically fire on enemy units.  However,
	//you can command them to intensify their fire on a specific target by using
	//the 'fire' order.%newline%%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_I", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE
	
	//"In the garden there is a scarecrow dressed in a German uniform.  Imagine
	//that the scarecrow is a live enemy and use it as a practice target.
	//%newline%%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_J", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE
	
	//"To issue a 'fire' order, %+action_order% %icon_order% and aim at the scarecrow.
	//Notice, as you move the command ring near the enemy target, it changes its
	//shape to a crosshair."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_K", "D0_0700_EXIT4"), 0.0 );
		Pawn(GetFirstActor('MyScarecrow')).PawnTeam = TEAM_German;
		ACTION_UnblockActionKeys( KEY_ACTION_ORDER );
		GetLocalPlayerController().bTargetOrderEnabled = true;
		while(!bTargetIssued)
			{
				sleep(0.5);
			}
	
	//"Until he is given a new order, Hartsock will concentrate his fire as
	//intensely as he can to suppress (pin down) the enemy target.%newline%
	//%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_M", "D0_0700_EXIT4"), 0.0 );
		GetPawn('Hartsock').sightradius=GetPawn('Hartsock').default.sightradius;
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE
	
	//"When an enemy is suppressed they will spend more time behind cover and
	//less time firing.  Their shots will also become less frequent and less
	//accurate.%newline%%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_N", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE

	if (!ACTION_SuppressionIconsDisabled())
	{
		//"The Suppression Icon over the enemy target is used to show the target's
		//suppression level.  Red %icon_suppression_red% means unsuppressed, and gray
		//%icon_suppression_gray% means suppressed.%newline%%newline%%icon_continue% to Continue."
			ACTION_DisplayTrainingMessage( S_Localize("TRAINING_O", "D0_0700_EXIT4"), 0.0 );
			ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
			//FLASH SUPPRESSION ICON?
			//CHEESY SUPPRESSION RAMPING ON SCARECROW?
			//PRESS TO CONTINUE
		
		//"Notice that a flag with the Fire Team icon %icon_fire_team_flag% is now attached
		//to the target’s suppression icon.  This flag tells you that the Fire Team has
		//focused fire on that target.%newline%%newline%%icon_continue% to Continue."
			ACTION_DisplayTrainingMessage( S_Localize("TRAINING_P", "D0_0700_EXIT4"), 0.0 );
			ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
			//FLASH FIRE TEAM FLAG?
			//PRESS TO CONTINUE
	}	
	//"You can also issue an 'assault' order.  An 'assault' order will command your
	//men to charge the target’s position.%newline%%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_Q", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE
	
	//"To issue an 'assault' order, %+action_order% %icon_order% and aim at a target.
	//When the command ring changes to a crosshair, %action_fire% %icon_fire%."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_R", "D0_0700_EXIT4"), 0.0 );
		ACTION_UnblockActionKeys( KEY_ACTION_FIRE );
		GetLocalPlayerController().bAssaultOrderEnabled = true; 
		while(!bAssaultIssued)
			{
				sleep(0.5);
			}
		//PLAYER PERFORMS ASSAULT COMMAND ON SCARECROW
	
	//"Hartsock will now quickly rush the enemy’s position and engage them in close
	//combat.  He may also throw grenades as he charges at the target.%newline%
	//%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_S", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE
	
	//"Assaulting is a risky maneuver.  It is only recommended when the enemy is
	//heavily suppressed or very outnumbered.%newline%%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_T", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE
	
	//Wait for Hartsock to finish Assaulting
	//Clear Training Messages
		ACTION_DisplayTrainingMessage( "", 0.0 );
		while (Scarecrow.Health > 0)
			{
				sleep(0.2);
			}


	//"%+action_team_select% %icon_team_select% or %action_fall_in% %icon_fall_in%
	//to order Hartsock to fall in.  When you order your team to fall in, they
	//will stay close to you.  They will do what you do and go where you go."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_U", "D0_0700_EXIT4"), 0.0 );
		ACTION_UnblockActionKeys( KEY_ACTION_FALL_IN );
		ACTION_UnblockActionKeys( KEY_ACTION_TEAMSELECT );
	
	// GBX:naj - this won't work on the PC nor will it work with the Xbox black-button
	// because ACTION_WaitForInterceptedActionKeys cannot work with buttons that have 
	// more than one function...
	//	ACTION_WaitForInterceptedActionKeys( KEY_ACTION_FALL_IN ); 
	    while(!bFallInIssued)
			{
				sleep(0.5);
			}
		//PLAYER ISSUES FALL IN COMMAND TO HARTSOCK
	
	//"Look at the Fire Team icon %icon_team_fire% in your compass.  It has moved
	//from the outer ring and is now inside the center of the compass.  This reminds
	//you that the Fire Team is following you.%newline%%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_V", "D0_0700_EXIT4"), 0.0 );
		Pawn(GetFirstActor('MyScarecrow')).PawnTeam = TEAM_NONE;
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//FLASH FIRE TEAM ICON?
		//PRESS TO CONTINUE
	
	//"To exit command mode without issuing an order, %action_jump%
	//%icon_jump%.%newline%%newline%%icon_continue% to Continue."
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_W", "D0_0700_EXIT4"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE ); 
		//PRESS TO CONTINUE
	
	//Clear Training Messages
		ACTION_DisplayTrainingMessage( "", 0.0 );
	
		sleep(0.5);

		GetLocalPlayerController().bMoveOrderEnabled = true;

	ACTION_UnBlockNavPoints( 'PN_KeepHartsockInGarden' );

	}
//-----------------------------------------------------------------------------------	
	
	
		ACTION_UnBlockActionKeys( -1 );
		ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );

		ACTION_CheckPointSave( 1 );
		sleep(3.5);
		ACTION_TriggerEvent( 'Checkpoint1Script' );
}
