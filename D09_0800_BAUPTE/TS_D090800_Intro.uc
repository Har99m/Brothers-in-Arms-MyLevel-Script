//=============================================================================
// TS_D090800_Intro.
//=============================================================================
class TS_D090800_Intro extends TriggeredScript
	placeable;

var AnimPawn AP_Hartsock, AP_Hartsock_ARM, AP_Hartsock_BODY, AP_Paddock, AP_Friar, AP_Marsh, AP_Tree;
var Pawn PAWN_Intro_g1, PAWN_Intro_g2, PAWN_Intro_g3, PAWN_Intro_g4;
var float i;
var actor HartsockJunk[2];


State Triggered
{
	Function OnTrigger() 
	{
		GotoState('OkGo');
	}

	Begin:

	ACTION_BlockNavPoints('PN_INTRO_CLOSE');
	ACTION_TriggerEvent('CSU_IntroChars');

	ACTION_SetHidden( 'AP_Hartsock_Intro', False );

	ACTION_TriggerEvent('CSU_Tank_intro');

	i = 0.0;
	ACTION_OrderMove('Unit_US_B','PN_Tank1intro',false);

	AP_Hartsock = AnimPawn( Getpawn( 'AP_Hartsock_Intro' ));
	AP_Hartsock_BODY = AnimPawn( Getpawn( 'AP_Hartsock_Intro_BODY' ));
	AP_Paddock = AnimPawn( Getpawn( 'AP_Paddock' ));
	AP_Friar = AnimPawn( GetPawn( 'AP_Friar' ));
	AP_Marsh = AnimPawn( GetPawn( 'AP_Marsh' ));	
	AP_Tree = AnimPawn( GetPawn( 'AP_Tree' ));

	AP_Paddock.Controller.bDemiGod = True;
	AP_Friar.Controller.bDemiGod = True;
	AP_Marsh.Controller.bDemiGod = True;

	AP_Hartsock.Controller.bDemiGod = True;
	AP_Hartsock_BODY.Controller.bDemiGod = True;

	ACTION_SetRepelBullets( 'AP_Hartsock', True );
	ACTION_SetRepelBullets( 'AP_Hartsock_BODY', True );

	ACTION_SetRepelBullets( 'AP_Paddock', True );
	ACTION_SetRepelBullets( 'AP_Friar', True );
	ACTION_SetRepelBullets( 'AP_Marsh', True );
	ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn(), True );

	AP_Paddock.Controller.bRotateToDesired = True;
	AP_Friar.Controller.bRotateToDesired = True;
	AP_Marsh.Controller.bRotateToDesired = True;

	GetLocalPlayerController().bDemiGod = True;

	ACTION_SetAnimSetDirect( AP_Hartsock, "a_cin_d09_Baupte.a_cin_d09_Baupte" );
	ACTION_SetAnimSetDirect( AP_Hartsock_BODY, "a_cin_d09_Baupte.a_cin_d09_Baupte" );

	ACTION_SetAnimSetDirect( AP_Paddock, "a_cin_d09_Baupte.a_cin_d09_Baupte" );
	ACTION_SetAnimSetDirect( AP_Friar, "a_cin_d09_Baupte.a_cin_d09_Baupte" );

	ACTION_ClearPawnIdleQueue( 'AP_Hartsock_Intro' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Hartsock_Intro', 'player_idle_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hartsock_Intro', FALSE );

	ACTION_ClearPawnIdleQueue( 'AP_Friar' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Friar', 'standing_react_to_bullets_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Friar', 'standing_react_to_bullets_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Friar', 'standing_react_to_bullets_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Friar', 'standing_react_to_bullets_4' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Friar', 'standing_react_to_bullets_5' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Friar', FALSE );

	ACTION_ClearPawnIdleQueue( 'AP_Marsh' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Marsh', 'standing_react_to_bullets_4' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Marsh', 'standing_react_to_bullets_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Marsh', 'standing_react_to_bullets_5' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Marsh', 'standing_react_to_bullets_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Marsh', 'standing_react_to_bullets_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Marsh', FALSE );

	ACTION_ClearPawnIdleQueue( 'AP_Paddock' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'standing_react_to_bullets_4' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'standing_idle_combat_4' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'standing_react_to_bullets_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'standing_idle_combat_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'standing_react_to_bullets_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'standing_idle_combat_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'standing_react_to_bullets_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'standing_react_to_bullets_5' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Paddock', FALSE );

	ACTION_TriggerEvent( 'D090800_Dummy' );
	ACTION_CameraInPawnHead( 'AP_Hartsock_Intro' , 'D090800_Dummy' , TRUE );

	ACTION_AttachStaticMesh( AP_Hartsock, staticmesh's_npc_weapon_us.us_bar', 'rifle_hold_lefthand' );
	if ( AP_Hartsock.Attached[0] != None )
	{
		AP_Hartsock.Attached[0].SetRelativeLocation( vect(0.0,2.0,-2.0) );
		AP_Hartsock.Attached[0].SetRelativeRotation( rot(400, 0, -3000) );
	}

	HartsockJunk[0] = GetFirstActor( 'EXP_INTRO_Stock' );
	HartsockJunk[1] = GetFirstActor( 'PFX_Intro_Blood01' );

	AP_Hartsock_Body.AttachToBone( HartsockJunk[0], 'Bip01 L Finger11' );
	AP_Hartsock_Body.AttachToBone( HartsockJunk[1], 'Bip01 L Finger11' );
}

State OkGo
{
	Function OnTrigger()
	{
		//
	}

	Begin:

	ACTION_TriggerEvent('CSG_101');
	PAWN_Intro_g1 = GetPawn('IG_101_01');
	PAWN_Intro_g2 = GetPawn('IG_101_02');	
	PAWN_Intro_g3 = GetPawn('IG_101_03');
	PAWN_Intro_G1.Controller.bDemiGod = True;
	PAWN_Intro_G2.Controller.bDemiGod = True;
	PAWN_Intro_G3.Controller.bDemiGod = True;

	ACTION_OrderTarget('Unit_US_A', 'Unit_DE_101' );
	ACTION_OrderTarget('Unit_US_B','Unit_DE_101');
	ACTION_OrderTarget('Unit_DE_101', 'Unit_US_A' );

	ResetAbsoluteTime();
	StartAbsoluteTime();

// DAI OH LAWG ///////////////////////////////////////////////////////////////////////////////////////////

//PADDOCK_A="Paddock: Krauts are just appearing left and right.  Like damn jack rabbits."
				ACTION_PlayLipSyncSound( 'AP_Paddock', "D09_0800.PADDOCK_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("PADDOCK_A" ), 3.0, 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 3.4 );

//FRIAR_A="Friar: Three more there!  Near the train track-"
	ACTION_PlayAnimWithQueue( 'AP_Friar', 'Friar_points_three_more', 0.2, 1.0, False, 0, 1 );
				ACTION_PlayLipSyncSound( 'AP_Friar', "D09_0800.FRIAR_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("FRIAR_A" ), 2.5, 1 , 1 , 1 , , TRUE );
	
//BAM!
	ACTION_TriggerEvent('TS_D090800_ImpactsIntro');

					WaitForAbsoluteTime( i+= 2.8 );

	ACTION_TriggerEvent('PFX_INTRO_MOOD1');
//BAM, Tree hit


					WaitForAbsoluteTime( i+=1.5 );
	ACTION_DestroyActor('SM_SandLift');
		ACTION_PlayLocalSound("W_PANZERFAUST.FIRE_ST");
	ACTION_PlayAnimWithQueue( 'AP_Hartsock_Intro', 'player_watches_tree_hit', 0.2, 0.8, False, 0, 0 );
	WaitForAbsolutetime( i+=0.55 );

	ACTION_ClearPawnIdleQueue( 'AP_Tree' );

	ACTION_PlayLocalSound( "D71400_SOUNDS.TREE_EXPLODE" );
	ACTION_TriggerEvent('PFX_Intro_TreeBlast');
	ACTION_TriggerEvent('GBXExTrig_BridgeHit'); //boom
	ACTION_PlayAnimWithQueue( 'AP_Tree', 'fall_baupte', 0.2, 1.0, False, 0, );
	ACTION_TriggerEvent('PFX_INTRO_Dirt_1');
	ACTION_TriggerEvent('PFX_INTRO_WOOD');

//PADDOCK_B="Paddock: They just blew up a fucking tree.  Let's get off the bridge Red!"
				ACTION_PlayLipSyncSound( 'AP_Paddock', "D09_0800.PADDOCK_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("PADDOCK_B" ), 3.0, 1 , 1 , 1 , , TRUE );	

					WaitForAbsoluteTime( i+=3.8 );



	ACTION_TriggerEvent( 'EVENT_FingerBlast' );

	WaitForAbsolutetime( i+= 0.8 );

//BAM, Hartsock get's hit
//HARTSOCK_B="Hartsock: AHHHH!!%$@"

	ACTION_DestroyActor('SM_SandLift');
	

	ACTION_SetHidden( 'AP_Hartsock_Intro_BODY', False );
	ACTION_SetHidden( 'AP_Hartsock_Intro', True );

	ACTION_CameraInPawnHead( 'AP_Hartsock_Intro' , 'D090800_Dummy' , False );
	ACTION_CameraInPawnHead( 'AP_Hartsock_Intro_BODY' , 'D090800_Dummy' , TRUE );

	ACTION_TriggerEvent('TS_D090800_Intro_Hartsock');
   
	ACTION_PlayAnimDirect( AP_Marsh, 'standing_idle_relaxed_1', 0.5, 1.0, True,   );



	ACTION_PlayLocalSound("IMPACTS.bullet_body"); 
	ACTION_PlayLocalSound("IMPACTS.bullet_body"); 
	ACTION_PlayLocalSound("IMPACTS.bullet_body"); 
	//ACTION_PlayLocalSound("Player.shellshock_loop");

	ACTION_DetachStaticMesh( AP_Hartsock, staticmesh's_npc_weapon_us.us_bar', 'rifle_hold_lefthand' );
	ACTION_TriggerEvent('EXP_INTRO_Stock');
	ACTION_TriggerEvent('PFX_Intro_Blood01');
	ACTION_SetHidden( 'SM_INTRO_GunA', False );
	ACTION_SetHidden( 'SM_INTRO_GunB', False );
	ACTION_SetHidden( 'SM_INTRO_GunC', False );
	ACTION_SetHidden( 'SM_INTRO_GunD', False );

				ACTION_PlayLocalSound( "D09_0800.HARTSOCK_B" );
				ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_B" ), 3.0, 1 , 1 , 1 , , TRUE );

	GetLocalPlayerController().CreateHudBloodEffect( AP_Paddock.Location, 64 );
	GetLocalPlayerController().CreateHudBloodEffect( AP_Friar.Location, 64 );
	GetLocalPlayerController().CreateHudBloodEffect( AP_Marsh.Location, 64 );
		WaitForAbsoluteTime( i+=1.0 );
	GetLocalPlayerController().CreateHudBloodEffect( AP_Friar.Location, 64 );
	ACTION_ChangeController('AP_Marsh',class'Mind');
	ACTION_OrderTarget('Unit_US_A', 'Unit_DE_101' );

	ACTION_OrderTarget('Unit_DE_101', 'Unit_US_A' );


		WaitForAbsoluteTime( i+=1.0 );

	GetLocalPlayerController().CreateHudBloodEffect( AP_Friar.Location, 64 );

		WaitForAbsoluteTime( i+=2.0 );

//PADDOCK_C="Paddock: Shit!  Red's down!  Medic!"
				ACTION_PlayLipSyncSound( 'AP_Paddock', "D09_0800.PADDOCK_C", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("PADDOCK_C" ), 3.0, 1 , 1 , 1 , , TRUE );

	ACTION_ClearPawnIdleQueue( 'AP_Paddock' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'crouched_react_to_bullets_4' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'crouched_idle_aimed_sighted_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'crouched_react_to_bullets_1' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'crouched_idle_aimed_sighted_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'crouched_react_to_bullets_3' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'crouched_react_to_bullets_2' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'crouched_idle_aimed_sighted_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Paddock', FALSE );

	ACTION_PlayAnimWithQueue( 'AP_Paddock', 'Paddock_says_shit_reds_down', 0.2, 1.0, False, 0, );

	AP_Friar.Controller.bRotateToDesired = False ;
				WaitForAbsoluteTime( i+=3.0 );
	GetLocalPlayerController().CreateHudBloodEffect( AP_HARTSOCK_BODY.Location, 64 );


//FRIAR runs over to HARTSOCK
//FRIAR_B1="Friar: There is no medic!  Look where we are Paddock!"
				ACTION_PlayLipSyncSound( 'AP_Friar', "D09_0800.FRIAR_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("FRIAR_B1" ), 3.0, 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime( i+=1.0 );
	ACTION_ClearPawnIdleQueue( 'AP_Friar' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Friar', 'standing_idle_aimed_sighted_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Friar', FALSE );
				WaitForAbsoluteTime( i+=0.5 );
	ACTION_PlayAnimDirect( AP_Friar, 'Friar_runs_to_help_hartsock', 0.0, 1.0, False, 0, , 1 );
	ACTION_ClearPawnIdleQueue( 'AP_Friar' );



	StopAbsoluteTime();
	ACTION_WaitForAnimEnd( AP_Friar, 0 );
	StartAbsoluteTime();

	GetLocalPlayerController().ScriptViewRestriction = rot(4096, 8191, 4096);

	ACTION_PlayAnimDirect( AP_Friar, 'Friar_kneeling_idle', 0.0, 1.0, True, 0, , 1 );
	//ACTION_DetachWeapon( getPawn('AP_Friar'), 'Bip01 R Hand' );


//FRIAR_B2="Friar: We're gonna fix you up Red.  Just hang in there.  Look at me."
				ACTION_DisplaySubtitleMessage2(S_Localize("FRIAR_B2" ), 4.0, 1 , 1 , 1 , , TRUE );

					WaitForAbsoluteTime( i+=2.5 );

	ACTION_StripAllWeapons( AP_Friar );
	ACTION_SetHidden( 'SM_INTRO_CARBINE', False );
	ACTION_PlayAnimDirect( AP_Friar, 'Friar_gets_bandage', 0.4, 1.0, False, 0, , 1);

	// FRIAR_B3="Friar: Just hang in there."
	ACTION_DisplaySubtitleMessage2(S_Localize("FRIAR_B3" ), 2.0, 1 , 1 , 1 , , TRUE );
	GetLocalPlayerController().ScriptViewRestriction = rot(2048, 8191, 0);

	sleep(2.04);
	ACTION_AttachStaticMesh( AP_Friar, StaticMesh's_npc_item_us.Prop.bandage', 'wine_righthand' );
	AP_Friar.Attached[2].SetRelativeLocation( vect(-1,-2,-9) );
	AP_Friar.Attached[2].SetRelativeRotation( rot(16384,0,30037) );

	StopAbsoluteTime();
	ACTION_WaitForAnimEnd( AP_Friar, 0 );
	StartAbsoluteTime();

	ACTION_PlayAnimDirect( AP_Friar, 'Friar_bandages_Hartsock_loop', 0.4, 1.0, True, 0, , 1);
	WaitForAbsoluteTime( i+=3.5 );
	
	ACTION_TriggerEvent('EXP_INTRO_BAGS');
	ACTION_TriggerEvent('PFX_INTRO_BAGS');

	ACTION_TriggerEvent('PFX_INTRO_Dirt_1');

	ACTION_PlaySound( 'EXP_Intro_SANDBAG', "IMPACTS.BULLET_DIRT", 1.0, 1.0, 10240.0 );
	ACTION_PlayLocalSound("W_PANZERFAUST.FIRE_ST");

	ACTION_TriggerEvent('EXP_INTRO_SandBag');
	ACTION_TriggerEvent('D090800_SandBag');	
	ACTION_TriggerEvent('EXP_Intro_SANDBAG');
	ACTION_TriggerEvent('PFX_INTRO_SAND02');

	ACTION_PlayLocalSound("Player.SHOCK_3A");

	ACTION_TriggerEvent('PFX_INTRO_SAND03');
	ACTION_TriggerEvent('PFX_DIRT_FACE');

	WaitForAbsoluteTime( i+=0.5 );

//Sound drops out and time slows down, HARTSOCK brings hand up
	ACTION_DisableBattleDialogue();
	ACTION_TriggerEvent( 'D090800_SlomoA' );
	ACTION_BlockActionKeys( -1 );
	ACTION_UnBlockActionKeys( KEY_ACTION_MOVE + KEY_ACTION_LOOK );

	ACTION_TriggerEvent('TS_D090800_INTRO_DESATURATE');

				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_AMBIENT , false , 1.5 );	
				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_CINEMATIC , false , 1.5 );
		//		GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_SOUNDFX	 , false , 1.5 );

				i=0.0;
					ResetAbsoluteTime();
					StartAbsoluteTime();
	WaitForAbsoluteTime( i+=0.5 );
	ACTION_TriggerEvent( 'EXP_SLOMOSTUFF' );
	ACTION_TriggerEvent( 'PFX_SLOMOSTUFF' );

//MARSHALL_A="Marshall: That explains the bandage..."
				ACTION_PlayLocalSound( "D09_0800.MARSHALL_A" );
				ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_A" ), 0.3, 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+=0.21 );

//HARTSOCK_C="Hartsock: Figures the only married man in the squad would get his ring finger blown off."
				ACTION_PlayLocalSound( "D09_0800.HARTSOCK_C" );
				ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_C" ), 0.3, 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+=0.21 );


				ACTION_StopScene( 'D090800_SlomoA' , 'D090800_SlomoB' );
				ACTION_UnBlockActionKeys( -1 );

				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_AMBIENT , true , 1.5 );	
				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_CINEMATIC , true , 1.5 );
		//		GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_SOUNDFX	 , true , 1.5 );	

	ACTION_TriggerEvent('TS_D090800_INTRO_DESATURATE');
	WaitForAbsolutetime( i+=4.0);

	AP_Paddock.Controller.Focus = NONE;
	ACTION_ClearPawnIdleQueue( 'AP_Paddock' );
	ACTION_AddAnimToPawnIdleQueue( 'AP_Paddock', 'Standing_idle_combat_1' );
	ACTION_PlayAnimFromPawnIdleQueue( 'AP_Paddock', FALSE );

//PADDOCK_D="Paddock: We ain't got time here for something pretty.  Friar, Just wrap the damn thing up."
	ACTION_PlayAnimWithQueue( 'AP_Paddock', 'Paddock_says_we_aint_got_time', 0.4, 1.0, False, 0, 1 );

				ACTION_PlayLipSyncSound( 'AP_Paddock', "D09_0800.PADDOCK_D", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("PADDOCK_D" ), 4.0, 1 , 1 , 1 , , TRUE );

					WaitForAbsoluteTime( i+=1.0 );

					WaitForAbsoluteTime( i+=2.0 );

//FRIAR_C="Friar: Why are you yelling at me Kansas boy?  Fire at the fucking Germans!"
	ACTION_PlayAnimDirect( AP_Friar, 'Friar_says_y_are_you_yelling', 0.4, 1.0, False, 0,  );

				ACTION_PlayLipSyncSound( 'AP_Friar', "D09_0800.FRIAR_C", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("FRIAR_C" ), 3.0, 1 , 1 , 1 , , TRUE );

	ACTION_UnBlockNavPoints('PN_INTRO_CLOSE');

		StopAbsoluteTime();
		ACTION_WaitForAnimEnd( AP_Friar, 0 );
		ACTION_PlayAnimDirect( AP_Friar, 'Friar_helps_hartsock_up', 0.3, 1.0, False, 0, , 1 );
		StartAbsoluteTime();

	ACTION_TriggerEvent('Paddock_Mind');


	// ACTION_PlayAnimDirect( AP_Friar, 'Friar_bandages_Hartsock_loop', 0.3, 0.4, True, 0, , );

	WaitForAbsoluteTime( i+=1.0 );



	ACTION_OrderTarget('Unit_US_A', 'Unit_DE_101' );

				// FRIAR_D1="Friar: Can you fire a weapon?"
				ACTION_PlayLipSyncSound( 'AP_Friar', "D09_0800.FRIAR_D", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("FRIAR_D1" ), 2.0, 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime (i+=1.49 );

	ACTION_DetachStaticMesh( AP_Friar, StaticMesh's_npc_item_us.Prop.bandage', 'wine_righthand' );
				WaitForAbsoluteTime (i+=0.51 );

				// ACTION_PlayAnimDirect( AP_Friar, 'Friar_helps_hartsock_up', 0.3, 1.0, False, 0, , 1 );

				ACTION_SetLookAtTarget( 'AP_Friar', getFirstActor('LT_FRIAR_HARTSOCK'), True );
				ACTION_DisplaySubtitleMessage2(S_Localize("FRIAR_D2" ), 4.0, 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime (i+=1.0 ); // 4

	ACTION_SetHidden( 'SM_INTRO_CARBINE', True );
	ACTION_GivePlayerWeapon( AP_Friar, "gbxInventory.WeapUSM1Carbine" );

	ACTION_TriggerEvent('TS_D090800_Intro_Hartsock');
	ACTION_WaitForEvent('EVENT_ONFEET');

		StopAbsoluteTime();
		ACTION_WaitForAnimEnd( AP_Friar, 0 );
		ACTION_PlayAnimDirect( AP_Friar, 'standing_idle_relaxed_1', 0.5, 1.0, True, , , 1 );
		StartAbsoluteTime();

	WaitForAbsoluteTime (i+=2.0 );

	//FRIAR hands HARTSOCK a thompson and helps him to his feet.
	ACTION_TriggerEvent('TriggeredScriptIntro');


	AP_Friar.bDontFrustumCull = FALSE;
	ACTION_ChangeController('AP_Friar',class'Mind');



	ACTION_StopScene( 'D090800_Dummy' , '' );
	ACTION_HideHUD( getLocalPlayerController() , FALSE );
	ACTION_PlayerToCameraPawn( 'AP_Hartsock_Intro_BODY' );
	sleep(0.2);

	ACTION_OrderMove( 'Unit_US_A', 'PN_US_IntroStart' );
	ACTION_OrderMove( 'Unit_US_B', 'PN_Intro_Tank' );

	ACTION_CameraInPawnHead( 'AP_Hartsock_Intro_BODY' , 'D090800_Dummy' , FALSE );
	ACTION_TeleportPlayerToActor( 'LT_TELEPORT_INTRO' );

		sleep(0.2);
	ACTION_DestroyActor( 'AP_Hartsock_Intro' );
	ACTION_DestroyActor( 'AP_Hartsock_Intro_BODY' );

	GetLocalPlayerController().bDemiGod = False;


	sleep(2.0);

	// BLAKE_A="Blake: Those bastards have panzerfausts, you have to clear out the marsh before I can move safely."
	ACTION_TankCommanderPlayLipSyncSound( tank(getPawn('Intro_Tank')), "D09_0800.BLAKE_A", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("BLAKE_A"), 4.0, 1, 1, 1, TRUE, TRUE );


	sleep(4.5);

	ACTION_TriggerEvent('TS_C1');

	AP_Paddock.Controller.bDemiGod = False;
	AP_Friar.Controller.bDemiGod = False;
	AP_Marsh.Controller.bDemiGod = False;

	PAWN_Intro_G1.Controller.bDemiGod = False;
	PAWN_Intro_G2.Controller.bDemiGod = False;
	PAWN_Intro_G3.Controller.bDemiGod = False;

	ACTION_SetRepelBullets( 'AP_Paddock', False );
	ACTION_SetRepelBullets( 'AP_Friar', False );
	ACTION_SetRepelBullets( 'AP_Marsh', False );
	ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn(), False );

	ACTION_TriggerEvent('gbxWB_Obj0');
	sleep(10.0);
	ACTION_TriggerEvent('PFX_INTRO_MOOD1');

}

