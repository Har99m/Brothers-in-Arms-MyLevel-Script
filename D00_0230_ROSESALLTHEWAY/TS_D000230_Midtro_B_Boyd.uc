//=============================================================================
// TS_D000230_Midtro_B_Boyd.
//=============================================================================
class TS_D000230_Midtro_B_Boyd extends TriggeredScript
	placeable;

var AnimPawn AP_Boyd ;
var ActorLite PN_Boyd_Corner ;
var Actor LT_Boyd_Corner , LT_Boyd_Teleport_Flank ;
var WarGamePawn WGP_Boyd ;

state Triggered
	{
		Begin:
				ACTION_ChangeController( 'AP_Boyd' , class'Mind' );
				ACTION_ChangeController( 'AP_Boyd' , class'ScriptedController' );

				ACTION_ChangeScriptedSequenceDirect( AP_Boyd , 'None' );

			//===== Define
				WGP_Boyd = WarGamePawn( GetPawn( 'AP_Boyd' ));
				AP_Boyd = AnimPawn( GetPawn( 'AP_Boyd' ));
				PN_Boyd_Corner = GetNavigationPoint( 'PN_Boyd_Corner' );
				LT_Boyd_Corner = GetFirstActor( 'LT_Boyd_Corner' );
				LT_Boyd_Teleport_Flank = GetFirstActor( 'LT_Boyd_Teleport_Flank' );

			//===== Move it up
					sleep( 0.4 );
				ACTION_ChangeScriptedSequenceDirect( AP_Boyd , 'SS_Boyd_02' );
				ACTION_MoveToward( AP_Boyd , PN_Boyd_Corner , TRUE , LT_Boyd_Corner );

				ACTION_WaitForEvent( 'Event_SS_Boyd_02_End' );
					sleep( 0.8 );
				ACTION_PawnFireAtTargetDirect( WGP_Boyd , LT_Boyd_Teleport_Flank );
					sleep( 0.2 );
				ACTION_PawnFireAtTargetDirect( WGP_Boyd , LT_Boyd_Teleport_Flank );
					sleep( 0.2 );
				ACTION_PawnFireAtTargetDirect( WGP_Boyd , LT_Boyd_Teleport_Flank );
					sleep( 0.2 );
				ACTION_PawnFireAtTargetDirect( WGP_Boyd , LT_Boyd_Teleport_Flank );
					sleep( 0.2 );
				ACTION_PawnFireAtTargetDirect( WGP_Boyd , LT_Boyd_Teleport_Flank );
					sleep( 0.2 );
				ACTION_PawnFireAtTargetDirect( WGP_Boyd , LT_Boyd_Teleport_Flank );
					sleep( 0.2 );
				ACTION_ClearPawnFireAtTargetDirect( WGP_Boyd );
				ACTION_TriggerEvent( 'Event_SS_Boyd_02_Cease' );
				
			//===== Wait for trigger again and go to mind
				ACTION_WaitForEvent( 'Event_SS_Boyd_02_Exit' );
				ACTION_ChangeController( 'AP_Boyd' , class'Mind' );
				ACTION_RunDirect( AP_Boyd );
				ACTION_AssignToUnit( 'AP_Campbell' , 'UNIT_US_Cole' );

					sleep( 1.0 );
				ACTION_OrderMove( 'UNIT_US_Cole' , 'PN_Cole_Unit_Setup' );
					sleep( 4.0 );
				ACTION_OrderTarget( 'UNIT_US_Cole' , 'UNIT_C201' );

		ScriptEnd:
	}
