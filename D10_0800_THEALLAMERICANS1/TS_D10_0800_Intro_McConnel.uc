//=============================================================================
// TS_D10_0800_Intro_McConnel.
//=============================================================================
class TS_D10_0800_Intro_McConnel extends TriggeredScript
	placeable;

var AnimPawn AP_McConnel ;
var ActorLite PN_Intro_Climb_McConnel , PN_Intro_Setup_McConnel ;
var Actor LT_Intro_McConnel_Jump ;
var WarGamePawn WGP_McConnel ;

state Triggered
	{
		Begin:

			//===== Define variables
				AP_McConnel = AnimPawn( GetPawn( 'AP_McConnel' ));

				PN_Intro_Climb_McConnel = GetNavigationPoint( 'PN_Intro_Climb_McConnel' );
				PN_Intro_Setup_McConnel = GetNavigationPoint( 'PN_Intro_Setup_McConnel' );

				LT_Intro_McConnel_Jump = GetFirstActor( 'LT_Intro_McConnel_Jump' );

				WGP_McConnel = WarGamePawn( GetPawn( 'AP_McConnel' ));

			//===== Wait for trigger to set up McConnel for running
				ACTION_WaitForEvent( 'Event_SS_Intro_McConnel_Retreat' );

				ACTION_ChangeController( 'AP_McConnel' , class 'Mind' );
				ACTION_ChangeController( 'AP_McConnel' , class'ScriptedController' );
				WGP_McConnel.eWeaponAimedState = WAS_CombatRelaxed ;
				ACTION_ChangeScriptedSequenceDirect( AP_McConnel , 'SS_Intro_McConnel_02' );
				ACTION_RunDirect( AP_McConnel );

				AP_McConnel.Controller.Focus = LT_Intro_McConnel_Jump ;
				ACTION_WaitForPawnRotateToward( AP_McConnel );

				ACTION_MoveToward( AP_McConnel , PN_Intro_Climb_McConnel , FALSE , LT_Intro_McConnel_Jump );

			//===== Wait for second trigger to move McConnel in close
				ACTION_WaitForEvent( 'Event_SS_Intro_McConnel_Approach' );

				ACTION_ChangeController( 'AP_McConnel' , class 'Mind' );
				ACTION_ChangeController( 'AP_McConnel' , class'ScriptedController' );
				WGP_McConnel.eWeaponAimedState = WAS_CombatRelaxed ;
				ACTION_ChangeScriptedSequenceDirect( AP_McConnel , 'SS_Intro_McConnel_03' );
				ACTION_WalkDirect( AP_McConnel );

				ACTION_MoveToward( AP_McConnel , PN_Intro_Setup_McConnel , FALSE );

		ScriptEnd:
	}
