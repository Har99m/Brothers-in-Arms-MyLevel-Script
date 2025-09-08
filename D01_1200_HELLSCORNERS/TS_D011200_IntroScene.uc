//=============================================================================
// TS_D011200_IntroScene.
//=============================================================================
class TS_D011200_IntroScene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Marsh, AP_Garnett, AP_Desola, AP_Friar, AP_Paddock, AP_Campbell;
var pawn Pawn_Campbell;
var ActorLite MoveCampbell;
var bool bPlayIntro;

state Triggered
{
	function OnTrigger()
	{
		GotoState( 'Dialogue' );
	}

	Begin:
	ACTION_TriggerEvent('BVT_Intro');

	//----- Debug: Turns intro scene on and off
	bPlayIntro = true;

	//ACTION_PlayLocalSound("D71400_SOUNDS.BATTLE_AMBIENT");

	ACTION_TriggerEvent( 'CSU_AmericanIntro' );

	AP_Marsh = AnimPawn( GetPawn( 'Pawn_Marsh' ) );
	AP_Garnett = AnimPawn( GetPawn( 'Pawn_Garnett' ) );
	AP_Desola = AnimPawn( GetPawn( 'Pawn_Desola' ) );
	AP_Friar = AnimPawn( GetPawn( 'Pawn_Friar' ) );
	AP_Paddock = AnimPawn( GetPawn( 'Pawn_Paddock' ) );
	AP_Campbell = AnimPawn( GetPawn( 'Pawn_Campbell' ) );

	AP_Marsh.Controller.bDemiGod = True;
	AP_Garnett.Controller.bDemiGod = True;
	AP_Desola.Controller.bDemiGod = True;
	AP_Friar.Controller.bDemiGod = True;
	AP_Paddock.Controller.bDemiGod = True;
	AP_Campbell.Controller.bDemiGod = True;

	ACTION_SetRepelBullets( 'Pawn_Marsh', True );
	ACTION_SetRepelBullets( 'Pawn_Garnett', True );
	ACTION_SetRepelBullets( 'Pawn_Desola', True );
	ACTION_SetRepelBullets( 'Pawn_Friar', True );
	ACTION_SetRepelBullets( 'Pawn_Paddock', True );
	ACTION_SetRepelBullets( 'Pawn_Campbell', True );

	Pawn_Campbell = GetPawn( 'Pawn_Campbell' );
	MoveCampbell = GetNavigationPoint( 'PN_Intro_Campbell01' );

	ACTION_SetAnimSet( 'AP_Chute1', "k_prop.us_cargo_parachute_anim" );
	ACTION_SetAnimSet( 'AP_Chute2', "k_prop.us_cargo_parachute_anim" );
	ACTION_SetAnimSet( 'AP_Chute3', "k_prop.us_cargo_parachute_anim" );

	ACTION_SetAnimSetDirect( AP_Marsh, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
	ACTION_SetAnimSetDirect( AP_Garnett, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
	ACTION_SetAnimSetDirect( AP_Desola, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
	ACTION_SetAnimSetDirect( AP_Friar, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
	ACTION_SetAnimSetDirect( AP_Paddock, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
	ACTION_SetAnimSetDirect( AP_Campbell, "a_cin_d01_hells_corner.a_cin_d01_hells_corner" );
	ACTION_SetAnimSetDirect( AP_Campbell, "a_hold_rifle.a_hold_rifle" );
	ACTION_SetAnimSetDirect( AP_Campbell, "a_ev_all.a_ev_corrion" );

	ACTION_ClearPawnIdleQueue( 'Pawn_Marsh' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Marsh', 'cover_b_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Marsh', 'cover_b_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Marsh', FALSE ); 

	ACTION_ClearPawnIdleQueue( 'Pawn_Garnett' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Garnett', 'cover_c_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Garnett', 'cover_c_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Garnett', FALSE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Desola' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Desola', 'cover_a_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Desola', 'cover_a_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Desola', FALSE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Friar' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Friar', 'cover_c_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Friar', 'cover_c_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Friar', FALSE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Paddock' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Paddock', 'cover_d_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Paddock', 'cover_d_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Paddock', FALSE );

	ACTION_ClearPawnIdleQueue( 'Pawn_Campbell' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Campbell', 'cover_d_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_Campbell', 'cover_d_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_Campbell', FALSE );


	AP_Campbell.controller.bRotateToDesired = False;
	ACTION_AttachStaticMesh( AP_Campbell, staticmesh'S_npc_weapon_us.US_M1', 'rifle_hold' );

	gbxPawn( AP_Marsh ).bDontLookAtPlayers = true;
	gbxPawn( AP_Friar ).bDontLookAtPlayers = true;
	gbxPawn( AP_Desola ).bDontLookAtPlayers = true;
	gbxPawn( AP_Garnett ).bDontLookAtPlayers = true;
	gbxPawn( AP_Paddock ).bDontLookAtPlayers = true;
	
}

state Dialogue
{
	function OnTrigger()
	{
		GotoState( 'NullState' );
	}
	Begin:

	ACTION_StartRain( 1.0 );

	ACTION_TriggerEvent('SCARE_G01');
	ACTION_TriggerEvent('SCARE_G02');
	ACTION_TriggerEvent('SCARE_G03');

	GetLocalPlayerPawn().StartGoingToCrouch( true );
	ACTION_BlockActionKeys( KEY_ACTION_CROUCH  );

	ACTION_TriggerEvent('PFX_Tracers');

	i = 1.0;

	ResetAbsoluteTime();
	StartAbsoluteTime();
	ACTION_TriggerEvent('TS_D011200_IntroScene_Subtitles');
	WaitForAbsoluteTime( i );


	
//DESOLA_A="Desola: There's no way we're getting this out."
	ACTION_PlayLipSyncSound( 'PAWN_MARSH', "D01_1200.MARSH_A", 1.0, 1.0, 1.0 );
	WaitForAbsoluteTime( i += 2.3 );



//GARNETT_A="Garnett: Seems Baker is all to willing to send us out on these wild goose chases."
//GARNETT_A2=Garnett: Would it kill him to give us a map?
	ACTION_PlayLipSyncSound( 'PAWN_GARNETT', "D01_1200.GARNETT_A", 1.0, 1.0, 1.0 );
	WaitForAbsoluteTime( i += 4.9 );

	ACTION_TriggerEvent('TS_D01_1200_BulletImpacts');

//PADDOCK_A=Paddock: What's up with Baker anyway?  Always seems to be alone, staring off and shit.
	ACTION_PlayLipSyncSound( 'PAWN_PADDOCK', "D01_1200.PADDOCK_A", 1.0, 1.0, 1.0 );
	WaitForAbsoluteTime( i += 4.5 );

//DESOLA_A1=Desola: He's always been like that.  We'd play baseball or whatever in England-
//DESOLA_A2=Desola: -not Baker.
	ACTION_PlayLipSyncSound( 'PAWN_DESOLA', "D01_1200.DESOLA_A", 1.0, 1.0, 1.0 );
	WaitForAbsoluteTime( i +=  5.1 );

//MARSH_B=Marsh: I don't think we're getting that hunk of crap out of the mud any time soon.
	ACTION_PlayLipSyncSound( 'PAWN_MARSH', "D01_1200.MARSH_b", 5.0, 1.0, 1.0 );
	WaitForAbsoluteTime( i += 1.6 );


	ACTION_PlayAnimWithQueue( 'Pawn_Paddock', 'cover_d_cower', 0.2, 1.2,FALSE,,);
///BAM!!!!
	ACTION_TriggerEvent('MetalImpacts1');
	ACTION_PlayAnimWithQueue( 'Pawn_Friar', 'cover_c_cower', 0.2, 1.0,FALSE,,);
	WaitForAbsoluteTime( i += 1.0 );


//FRIAR_A=Friar: We should think of something fast before they realize where we are.
	ACTION_PlayLipSyncSound( 'PAWN_FRIAR', "D01_1200.FRIAR_A", 1.0, 1.0, 1.0 );
	WaitForAbsoluteTime( i += 3.0 );

//DESOLA_B=Desola: Where the hell is Allen?  He never misses a Baker goose chase.
	ACTION_PlayLipSyncSound( 'PAWN_DESOLA', "D01_1200.DESOLA_B", 1.0, 1.0, 1.0 );
	WaitForAbsoluteTime( i += 2.5 );

//GARNETT_B1=Garnett: He's stuck unloading trucks for the push into St. Come du Mont.
//GARNETT_B2=Garnett: -he's on Mac's shit list.
//GARNETT_B3=Garnett: Actually I think he is Mac's shitlist.
	ACTION_PlayLipSyncSound( 'PAWN_GARNETT', "D01_1200.GARNETT_B", 1.0, 1.0, 1.0 );
	WaitForAbsoluteTime( i += 2.5 );

///BAM!!!!
	ACTION_TriggerEvent('IMPACT_Water_Ricochet');
	ACTION_PlayAnimWithQueue( 'Pawn_Marsh', 'cover_b_cower', 0.2, 1.0,FALSE,,);
	ACTION_PlayAnimWithQueue( 'Pawn_Paddock', 'cover_d_cower', 0.4, 1.0,FALSE,13,);
	WaitForAbsolutetime( i += 0.5 );
	ACTION_PlayAnimWithQueue( 'Pawn_Garnett', 'cover_c_cower', 0.2, 1.0,FALSE,,);
	ACTION_PlayLipSyncSound( 'PAWN_MARSH', "BD_MARSH.L_PAIN", 0.5, 1.0, 1.0 );
	WaitForAbsolutetime( i += 1.0 );




///BAM!!!!
	ACTION_TriggerEvent('RunningImpacts');
	WaitForAbsoluteTime( i += 2.0 );

//slide some rocks
	ACTION_TriggerEvent('PFX_RockSlide');

	WaitForAbsoluteTime( i += 0.5 );

	ACTION_PlayLipSyncSound( 'PFX_Tracers_01_Directed', "D_GER_B.SEEENEMYMOVE", 0.1, 1.0, 1.0 );


	ACTION_TriggerEvent('PFX_Tracers_01_Directed');

	ACTION_TriggerEvent('SCARE_G02');
	PAWN_CAMPBELL.bHidden = False;
	ACTION_PlayAnimWithQueue( 'Pawn_Campbell', 'Campbell_slides_down_hill', 0.0, 1.0,FALSE,,1);



	ACTION_PlayLipSyncSound( 'LT_CAMPBELL_YELLS_01', "BD_CAMPBELL.L_SUPERPAIN", 0.3, 1.0, 1.0 );
	ACTION_TriggerEvent( 'SCENE_CAMPBELL_YELLs' );
	WaitForAbsoluteTime( i += 1.7);

//shake some foliage
	ACTION_TriggerEvent('SCENE_INTRO_FOLIAGE_1');


	ACTION_PlaySound( 'PFX_Intro_Water_1', "IMPACTS.SPLASH_LARGE", 1.0, 1.0, 1.0 );
	//ACTION_PlaySound( 'Pawn_Campbell', "EVERYTHING.IMPACTS_SPLASH_LARGE", 1.0, 1.0, 1.0 );
	ACTION_PlayAnimWithQueue( 'Pawn_Marsh', 'cover_b_cower', 0.2, 1.0,FALSE,,);
	WaitForAbsoluteTime( i += 0.3);

	ACTION_PlayAnimWithQueue( 'Pawn_Garnett', 'cover_c_cower', 0.2, 1.0,FALSE,,);
	ACTION_TriggerEvent('PFX_Intro_Water_1');

	ACTION_PlayAnimWithQueue( 'Pawn_Desola', 'cover_a_cower', 0.2, 1.0,FALSE,,);
	ACTION_PlaySound( 'PFX_Intro_Water_3', "IMPACTS.SPLASH_SMALL", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent('PFX_Intro_Water_3');
	ACTION_TriggerEvent('SCENE_Intro_Water');
	WaitForAbsoluteTime( i += 0.3);
	ACTION_PlaySound( 'PFX_Intro_Water_4', "IMPACTS.SPLASH_LARGE", 0.5, 1.0, 1.0 );
	ACTION_PlayAnimWithQueue( 'Pawn_Friar', 'cover_c_cower', 0.2, 1.0,FALSE,,);
	ACTION_PlayAnimWithQueue( 'Pawn_Paddock', 'cover_d_cower', 0.2, 0.7,FALSE,,);
	ACTION_TriggerEvent('PFX_Intro_Water_4');	
	WaitForAbsolutetime( i += 1.2);
//GARNETT_C=Garnett: Follow the gunfire, that's how you can always find us.
	ACTION_PlayLipSyncSound( 'PAWN_GARNETT', "D01_1200.GARNETT_C", 0.5, 1.0, 1.0 );

//	ACTION_PlayLipSyncSound( 'LT_CAMPBELL_YELLS_02', "BD_CAMPBELL.L_PAIN_F", 1.0, 1.0, 1.0 );


	WaitForAbsolutetime( i += 2.0);

	ACTION_TriggerEvent('PFX_Intro_Water_3');	
	ACTION_TriggerEvent('PFX_DebrisBlast');
	WaitForAbsoluteTime( i += 2.5 );
	
	//ACTION_TriggerEvent('EXP_Mortar');

	ACTION_DestroyActor('SCARE_G03');

//CAMPBELL_A1=Campbell: Got word you guys were on your way.  Colonel Johnson sent me to find you.
//CAMPBELL_A2=Campbell: Fucking Germans...

	ACTION_PlayLipSyncSound( 'PAWN_CAMPBELL', "D01_1200.CAMPBELL_A", 0.9, 1.0, 1.0 );

	WaitForAbsoluteTime( i += 3.5 );


///BAM!!!!
	ACTION_TriggerEvent('MiscEndImpacts');

	ACTION_TriggerEvent('EXP_Mortar');
	ACTION_TriggerEvent('PFX_MortarDust');
	WaitForAbsoluteTime( i += 2.0 );

//CAMPBELL_B1=Campbell: Krauts are attacking the Locks and tore us to pieces with some damn mortar fire.
//CAMPBELL_B2=Campbell: Here comes the supply drop. Mark the supplies with smoke. We'll pick 'em up later.
//CAMPBELL_B3=Campbell: You'll rendezvous with the Colonel on the other side of the locks. Good luck Red.
	ACTION_PlayLipSyncSound( 'PAWN_CAMPBELL', "D01_1200.CAMPBELL_B", 1.0, 1.0, 1.0 );
	ACTION_PlayAnimWithQueue( 'Pawn_Desola', 'cover_a_idle_look_up', 0.2, 1.0,FALSE,,);
	WaitForAbsoluteTime( i += 4.5 );


	ACTION_PlayAnimWithQueue( 'Pawn_Paddock', 'cover_d_idle_look_up', 0.2, 1.0,FALSE,,);
	ACTION_PlayAnimWithQueue( 'Pawn_Friar', 'cover_c_idle_look_up', 0.2, 0.8,FALSE,,);
	ACTION_PlayAnimWithQueue( 'Pawn_Marsh', 'cover_b_idle_look_up', 0.2, 1.0,FALSE,,);
	ACTION_PlayAnimWithQueue( 'Pawn_Garnett', 'cover_c_idle_look_up', 0.2, 1.0,FALSE,,);
	WaitForAbsoluteTime( i += 4.5 );


	ACTION_PlayAnimWithQueue( 'Pawn_Campbell', 'cover_d_idle_look_up', 0.2, 1.0,FALSE,,);
	ACTION_PlayAnimWithQueue( 'Pawn_Garnett', 'cover_c_idle_look_up', 0.2, 0.7,FALSE,,);
	WaitForAbsoluteTime( i += 3.0 );

	WaitForAbsoluteTime( i += 1.5 );

	ACTION_PlayAnimWithQueue( 'Pawn_Desola', 'cover_a_idle_look_up', 0.2, 1.0,FALSE,,);
	StopAbsoluteTime();

	ACTION_BlockNavPoints('PN_Intro_Block');
	ACTION_TriggerEvent('BVT_Intro');

	ACTION_TriggerEvent('PFX_Tracers');
	ACTION_TriggerEvent( 'TriggeredScriptIntro' );

	ACTION_UnBlockActionKeys( KEY_ACTION_CROUCH  );
	GetLocalPlayerPawn().ForceUnCrouch();

	ACTION_DestroyActor('SCARE_G01');
	ACTION_DestroyActor('SCARE_G02');
	ACTION_DestroyActor('SCARE_G03');

	ACTION_ClearPawnIdleQueue( 'Pawn_Marsh' );
	ACTION_ClearPawnIdleQueue( 'Pawn_Garnett' );
	ACTION_ClearPawnIdleQueue( 'Pawn_Desola' );
	ACTION_ClearPawnIdleQueue( 'Pawn_Friar' );
	ACTION_ClearPawnIdleQueue( 'Pawn_Paddock' );
	ACTION_ClearPawnIdleQueue( 'Pawn_Campbell' );

	//===== First chute drops
	ACTION_TriggerEvent('TS_D01_1200_Drop01Scene');
	
	ACTION_PlayAnim( 'Pawn_Paddock', 'cover_d_dismount', 0.2, 1.0,FALSE,,);

	ACTION_PlayAnim( 'Pawn_Marsh', 'cover_b_dismount', 0.2, 1.0,FALSE,,);

	sleep(0.4);

	ACTION_PlayAnim( 'Pawn_Garnett', 'cover_c_dismount', 0.2, 1.0,FALSE,,);

	sleep(0.2);

	//ACTION_PlayAnim( 'Pawn_Campbell', 'cover_d_dismount', 0.2, 1.0,FALSE,,);

	sleep(0.6);

	ACTION_PlayAnim( 'Pawn_Desola', 'cover_a_dismount', 0.2, 1.0,FALSE,,);

	ACTION_PlayAnim( 'Pawn_Friar', 'cover_c_dismount', 0.2, 0.8,FALSE,,);



	sleep(1.0);
	//ACTION_MoveToward( PAWN_CAMPBELL, GetNavigationPoint('PN_Intro_Campbell_Esc'), False );
	//ACTION_PlayAnimDirect( PAWN_CAMPBELL, 'standing_run', 0.0, 1.0, True );
	sleep(2.0);


	//ACTION_PlayLipSyncSound( 'PAWN_FRIAR', "D01_1200.FRIAR_BB", 1.0, 1.0, 1.0 );
	//ACTION_DisplaySubTitleMessage2( S_Localize( "FRIAR_BB" ), 1.0, 1, 1, 1, TRUE, TRUE );

	ACTION_ChangeController( 'Pawn_Paddock', class'Mind' );
	ACTION_ChangeController( 'Pawn_Friar', class'Mind' );
	ACTION_ChangeController( 'Pawn_Desola', class'Mind' );
	ACTION_ChangeController( 'Pawn_Garnett', class'Mind' );
	ACTION_ChangeController( 'Pawn_Marsh', class'Mind' );
	ACTION_TriggerEvent( 'TS_D01_1200_SupplyDrop' );

	ACTION_SetRepelBullets( 'Pawn_Marsh', False );
	ACTION_SetRepelBullets( 'Pawn_Garnett', False );
	ACTION_SetRepelBullets( 'Pawn_Desola', False );
	ACTION_SetRepelBullets( 'Pawn_Friar', False );
	ACTION_SetRepelBullets( 'Pawn_Paddock', False );
	ACTION_SetRepelBullets( 'Pawn_Campbell', False );
}

state NullState
{
	function OnTrigger() { GotoState( 'NullState' ); }
	Begin:
}


