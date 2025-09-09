//=============================================================================
// TS_D08_1030_IntroScene.
//=============================================================================
class TS_D08_1030_IntroScene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Corrion, AP_Mac, AP_Zanovich, AP_McCreary, AP_Courtland,
		AP_Friar, AP_Marsh, AP_Campbell, AP_Paige, AP_Baker;
var PlayerController LPC;
var WargamePlayerController WPC;
var Actor LT_MacSound;
var Int MAC_LINE;
var Unit Unit_US_Assault, Unit_US_Base, Unit_Player;
var WargamePawn WGP_Paddock, WGP_McConnel;
var bool bTrainingEnabled;

state Triggered
{
	function OnTrigger()
	{
		GotoState( 'Dialogue' );
	}
Begin:

	bTrainingEnabled = false;
        ACTION_TriggerEvent( 'CSU_IntroChar2' );
        ACTION_TriggerEvent( 'CSU_IntroChar' );
	ACTION_BlockNavPoints( 'PN_OutroWall' );
//setup XBox button detection
		WPC = GetLocalPlayerController();
		LPC = GetLocalPlayerController();

//	INIT VARIABLES
	AP_Baker = AnimPawn( GetPawn( 'AP_BakerIntro') );
	AP_Corrion = AnimPawn( GetPawn( 'AP_CorrionIntro' ));
	AP_Mac = AnimPawn( GetPawn( 'AP_MacIntro' ));
	AP_McCreary = AnimPawn( GetPawn( 'AP_McCrearyIntro' ));

	ACTION_TriggerEvent( 'gbxWaypointBeacon_Training' );
	ACTION_SetObjectiveBeaconState( 'gbxWaypointBeacon_MainStreet', false, false, true );
	ACTION_SetObjectiveBeaconState( 'gbxWaypointBeacon_Training', true, false, false );

	LT_MacSound = GetfirstActor( 'LT_MacSound' );
}


state Dialogue
	{

	Begin:

	ACTION_TriggerEvent( 'STOCH_DistantExplosions' );
//Start Animations
	ACTION_TriggerEvent( 'Event_StartIntroAnims' );

	ACTION_GivePlayerWeapon( AP_Baker, "gbxInventory.WeapUSM1_" );
	ACTION_ReattachWeapon( AP_Baker, '');


//START DIALOGUE	
		i = 0.0;
		ResetAbsoluteTime();
		StartAbsoluteTime();

		ACTION_TriggerEvent('PFX_Dust05');

		ACTION_TriggerEvent('Emitter_CorrionCleansCouch');
			WaitForAbsoluteTime(i+=4.5);

//BAKER_A="Baker: McCreary.  Stay with 'im."
		ACTION_PlayLipSyncSoundDirect( AP_Baker, "D08_1030.BAKER_A", 1.0, 1.0, 1.0,,AP_Baker.RootBone );
		ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_A" ), 3.0 , 1 , 1 , 1 , , TRUE );

			WaitForAbsoluteTime(i+=0.2);

		GetFirstActor( 'SM_McCreary_M1' ).bHidden=true;
		ACTION_GivePlayerWeapon( AP_McCreary, "gbxInventory.WeapUSM1_" );
		ACTION_ReattachWeapon( AP_McCreary, '');
	
			WaitForAbsoluteTime(i+=2.8);

//BAKER_B1="Baker: Alright, we're going to attack in two separate routes and meet back at the plaza."
		ACTION_PlayLipSyncSoundDirect( AP_Baker, "D08_1030.BAKER_B", 1.0, 1.0, 1.0,,AP_Baker.RootBone );
		ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_B1" ), 4.0 , 1 , 1 , 1 , , TRUE );
			WaitForAbsoluteTime(i+=5.0);

		ACTION_TriggerEvent('PFX_Dust04');

		GetFirstActor( 'SM_Corrion_Thompson' ).bHidden=true;
		ACTION_GivePlayerWeapon( AP_Corrion, "gbxInventory.WeapUSThompson" );
		ACTION_ReattachWeapon( AP_Corrion, '');

//BAKER_B2="Baker: No point in wastin' a buncha words...    Let's just get this done."
		ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_B2" ), 3.0 , 1 , 1 , 1 , , TRUE );
			WaitForAbsoluteTime(i+=4.3);

//MAC_A1="Mac: It went in and out I think. Krauts weren't supposed to shoot at me, the little bastards."
	ACTION_PlayLipSyncSoundDirect( AP_Mac, "D08_1030.MAC_A", 1.0, 1.0, 1.0,, AP_Mac.RootBone );
	ACTION_DisplaySubTitleMessage2(S_Localize("MAC_A1" ), 6.0 , 1 , 1 , 1 , , TRUE );
			WaitForAbsoluteTime(i+=5.3);

//MAC_A2="Mac: Hurts like a son of a bitch."
		ACTION_DisplaySubTitleMessage2(S_Localize("MAC_A2" ), 3.0 , 1 , 1 , 1 , , TRUE );

			WaitForAbsoluteTime(i+=4.5);


	//ACTION_ChangeController( 'AP_BakerIntro', class'ScriptedController');
	//sleep(0.2);
	//ACTION_MoveTowardTag('AP_BakerIntro','PN_BakerIntro');

	ACTION_ChangeController( 'Friar',class'Mind' );
	ACTION_ChangeController( 'Paddock',class'Mind' );
	ACTION_ChangeController( 'Marsh',class'Mind' );
	ACTION_ChangeController( 'Campbell',class'Mind' );
	ACTION_ChangeController( 'Paige',class'Mind' );
	ACTION_ChangeController( 'McConnel',class'Mind' );

	ACTION_TriggerEvent( 'TriggeredScriptIntro_Early' );
	ACTION_BlockNavPoints('PN_BLOCK_C3');
	ACTION_BlockNavPoints('PN_BLOCK_C2');

}
