//=============================================================================
// TS_D08_1000_IntroScene.
//=============================================================================
class TS_D08_1000_IntroScene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Baker, AP_McCreary, AP_Corrion, AP_Zanovich, AP_Courtland, AP_Paddock, 
			AP_Friar, AP_Marsh, AP_Campbell, AP_Paige;
var ActorLite PN_IntroEnd_Baker, PN_IntroMid_Corrion;

state Triggered
	{
    function OnTrigger()
        {
        GotoState( 'Dialogue' );
        }

	Begin:

	ACTION_TriggerEvent( 'CSU_IntroCharacters' );

//Define Characters as AnimPawn Actors

	AP_Baker = AnimPawn( GetPawn( 'Baker' ));
	AP_Corrion = AnimPawn( GetPawn( 'Corrion' ));
	AP_Zanovich = AnimPawn( GetPawn( 'Zanovich' ));
	AP_Courtland = AnimPawn( GetPawn( 'Courtland' ));
	AP_McCreary = AnimPawn( GetPawn( 'McCreary' ));

	AP_Campbell = AnimPawn( GetPawn( 'Campbell' ));
	AP_Paige = AnimPawn( GetPawn( 'Paige' ));
	AP_Paddock = AnimPawn( GetPawn( 'Paddock' ));
	AP_Friar = AnimPawn( GetPawn( 'Friar' ));
	AP_Marsh = AnimPawn( GetPawn( 'Marsh' ));

	PN_IntroEnd_Baker = GetNavigationPoint( 'PN_IntroEnd_Baker' );
	PN_IntroMid_Corrion = GetNavigationPoint( 'PN_IntroMid_Corrion' );

	sleep( 2.0 );
	ACTION_TriggerEvent( 'Event_StartIntroAnims' );
}


state Dialogue
{
Begin:

//START DIALOGUE

	ACTION_OrderMove( 'Unit_US_Baker_Ass', 'PN_Zanovich_Intro' );

	i = 2.0;

	ResetAbsoluteTime();
	StartAbsoluteTime();

	AP_Baker.EWeaponAimedState = WAS_CombatRelaxed;
	ACTION_SetLookAtTargetDirect( AP_Baker, AP_Corrion, true );

	WaitForAbsoluteTime( i+=2.0 );

	ACTION_TriggerEvent( 'gbxExplosion_IntroMortar1' );

	WaitForAbsoluteTime( i+=2.45 );



	ACTION_SetLookAtTargetDirect( AP_Baker, GetLocalPlayerPawn(), true );
	WaitForAbsoluteTime( i+=0.35 );
	ACTION_TriggerEvent( 'Event_BakerIntroAnim' );

//BAKER_A1="Baker: Those mortars are coming from the train yard about a block away."
	ACTION_PlayLipSyncSoundDirect( AP_Baker, "D08_1000.BAKER_A", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_A1" ), 3.0, 1 , 1 , 1 , , TRUE );
	WaitForAbsoluteTime( i+= 2.1 );

	ACTION_TriggerEvent( 'gbxExplosion_IntroMortar2' );
	WaitForAbsoluteTime( i+= 1.0 );

	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_A2" ), 3.2, 1 , 1 , 1 , , TRUE );
	WaitForAbsoluteTime( i+= 3.2 );

	ACTION_TriggerEvent( 'gbxExplosion_IntroMortar3' );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_A3" ), 2.3, 1 , 1 , 1 , , TRUE );

	WaitForAbsoluteTime( i+= 1.5 );
	ACTION_ClearLookAtTargetDirect( AP_Baker );

	ACTION_TriggerEvent( 'Event_StopIntroAnims_Wave1' );
	ACTION_TriggerEvent( 'Event_StopIntroAnims_Wave2' );
	ACTION_OrderMove( 'Unit_US_Baker_Ass', 'PN_Intro_WallJump' );
	ACTION_OrderMove( 'Unit_US_Baker_Base', 'PN_IntroEnd_Baker' );

//CLEAN UP
//CHANGE TO MIND CONTROLLER

	ACTION_WaitForEvent( 'Event_CorrionDoneIntro' );

	ACTION_OrderMove( 'Unit_US_Baker_Base', 'PN_IntroEnd_Baker', true );

	sleep(2.0);
	ACTION_TriggerEvent( 'gbxExplosion_IntroMortar4' );

	ACTION_TriggerEvent('gbxWaypointBeacon_MainObjective');

	ACTION_TriggerEvent( 'TriggeredScriptIntro' );
}
