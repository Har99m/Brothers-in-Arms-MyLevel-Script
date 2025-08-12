//=============================================================================
// TS_D000230_Midtro_B_Campbell.
//=============================================================================
class TS_D000230_Midtro_B_Campbell extends TriggeredScript
	placeable;

var AnimPawn AP_Campbell ;
var ActorLite PN_Campbell_Corner ;
var Actor LT_Campbell_Corner ;

state Triggered
	{
		Begin:
				ACTION_ChangeController( 'AP_Campbell' , class'Mind' );
				ACTION_ChangeController( 'AP_Campbell' , class'ScriptedController' );

				ACTION_ChangeScriptedSequenceDirect( AP_Campbell , 'None' );

			//===== Define
				AP_Campbell = AnimPawn( GetPawn( 'AP_Campbell' ));
				PN_Campbell_Corner = GetNavigationPoint( 'PN_Campbell_Corner' );
				LT_Campbell_Corner = GetFirstActor( 'LT_Campbell_Corner' );

			//===== Move it up
				ACTION_ChangeScriptedSequenceDirect( AP_Campbell , 'SS_Campbell_02' );
				ACTION_MoveToward( AP_Campbell , PN_Campbell_Corner , TRUE , LT_Campbell_Corner );

			//===== Wait for trigger again and go to mind
				ACTION_WaitForEvent( 'Event_SS_Campbell_02_Exit' );
				ACTION_ChangeController( 'AP_Campbell' , class'Mind' );
				ACTION_RunDirect( AP_Campbell );
				ACTION_AssignToUnit( 'AP_Campbell' , 'UNIT_US_Cole' );

					sleep( 3.0 );
				ACTION_OrderMove( 'UNIT_US_Cole' , 'PN_Cole_Unit_Setup' );
				ACTION_OrderTarget( 'UNIT_US_Cole' , 'UNIT_C202' );
				ACTION_DisableTalkToMessageForCharacter( 'AP_Campbell' );

		ScriptEnd:
	}
