//=============================================================================
// TS_D00_0600_Midtro_Scene_B_McConnel.
//=============================================================================
class TS_D00_0600_Midtro_Scene_B_McConnel extends TriggeredScript
	placeable;

var AnimPawn AP_McConnel ;
var ActorLite PN_Outro_McConnel_Approach ;

state Triggered
	{
		Begin:

			//===== Define
				AP_McConnel = AnimPawn( GetPawn( 'Midtro_McConnel' ));
				PN_Outro_McConnel_Approach = GetNavigationPoint( 'PN_Outro_McConnel_Approach' );

			//===== Run to outro spot after being triggered
				ACTION_WaitForEvent( 'Event_SS_Outro_McConnel_Run' );
				ACTION_ChangeController( 'Midtro_McConnel' , class'Mind' );
				ACTION_ChangeController( 'Midtro_McConnel' , class'ScriptedController' );
				ACTION_ChangeScriptedSequenceDirect( AP_McConnel , 'SS_Outro_McConnel_02' );

				ACTION_MoveToward( AP_McConnel , PN_Outro_McConnel_Approach , FALSE );
		ScriptEnd:
	}
