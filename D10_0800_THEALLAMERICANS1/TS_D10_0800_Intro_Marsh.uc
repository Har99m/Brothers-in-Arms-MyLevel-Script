//=============================================================================
// TS_D10_0800_Intro_Marsh.
//=============================================================================
class TS_D10_0800_Intro_Marsh extends TriggeredScript
	placeable;

var AnimPawn AP_Marsh ;
var ActorLite PN_Intro_Climb_Marsh ;
var Actor LT_Intro_Marsh_Jump ;
var WarGamePawn WGP_Marsh ;

state triggered
	{
		Begin:

			//===== Define variables
				AP_Marsh = AnimPawn( GetPawn( 'AP_Marsh' ));
				PN_Intro_Climb_Marsh = GetNavigationPoint( 'PN_Intro_Climb_Marsh' );
				LT_Intro_Marsh_Jump = GetFirstActor( 'LT_Intro_Marsh_Jump' );
				WGP_Marsh = WarGamePawn( GetPawn( 'AP_Marsh' ));

			//===== Wait to be triggered to set up for running
				ACTION_WaitForEvent( 'Event_SS_Intro_Marsh_Retreat' );

				ACTION_ChangeController( 'AP_Marsh' , class 'Mind' );
				ACTION_ChangeController( 'AP_Marsh' , class'ScriptedController' );
				WGP_Marsh.eWeaponAimedState = WAS_CombatRelaxed ;
				ACTION_ChangeScriptedSequenceDirect( AP_Marsh , 'SS_Intro_Marsh_02' );
				ACTION_RunDirect( AP_Marsh );

				AP_Marsh.Controller.Focus = LT_Intro_Marsh_Jump ;
				ACTION_WaitForPawnRotateToward( AP_Marsh );

				ACTION_MoveToward( AP_Marsh , PN_Intro_Climb_Marsh , FALSE , LT_Intro_Marsh_Jump );

		ScriptEnd:
	}
s