//=============================================================================
// TS_D00_0600_Midtro_Scene_B_Paige.
//=============================================================================
class TS_D00_0600_Midtro_Scene_B_Paige extends TriggeredScript
	placeable;

var AnimPawn AP_Paige ;
var ActorLite PN_Outro_Paige_Approach ;

state Triggered
	{
		Begin:

			//===== Define
				AP_Paige = AnimPawn( GetPawn( 'Midtro_Paige' ));
				PN_Outro_Paige_Approach = GetNavigationPoint( 'PN_Outro_Paige_Approach' );

			//===== Run to outro spot after being triggered
				ACTION_WaitForEvent( 'Event_SS_Outro_Paige_Run' );
				ACTION_ChangeController( 'Midtro_Paige' , class'Mind' );
				ACTION_ChangeController( 'Midtro_Paige' , class'ScriptedController' );
				ACTION_ChangeScriptedSequenceDirect( AP_Paige , 'SS_Outro_Paige_02' );

				ACTION_MoveToward( AP_Paige , PN_Outro_Paige_Approach , FALSE );

		ScriptEnd:
	}
