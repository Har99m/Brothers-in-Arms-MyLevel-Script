//=============================================================================
// TS_D00_0600_Intro_Cassidy.
//=============================================================================
class TS_D00_0600_Intro_Cassidy extends TriggeredScript
	placeable;

var AnimPawn AP_Cassidy ;
var ActorLite PN_Cassidy_Approach , PN_Cassidy_Leave ;

State Triggered
	{
		Begin:

				AP_Cassidy = AnimPawn( GetPawn( 'Cassidy' ));

				PN_Cassidy_Approach = GetNavigationPoint( 'PN_Cassidy_Approach' );
				PN_Cassidy_Leave = GetNavigationPoint( 'PN_Cassidy_Leave' );

			//===== Cassidy gets up
				ACTION_TriggerEvent( 'Event_SS_Intro_Cassidy_Dismount' );

				ACTION_WaitForEvent( 'Event_SS_Intro_Cassidy_Standing' );
				ACTION_ChangeController( 'Cassidy' , class'Mind' );
				ACTION_ChangeController( 'Cassidy' , class'ScriptedController' );
				ACTION_ChangeScriptedSequenceDirect( AP_Cassidy , 'SS_Intro_Cassidy_02' );
				ACTION_WalkDirect( AP_Cassidy );
				ACTION_MoveToward( AP_Cassidy , PN_Cassidy_Approach , FALSE );

			//===== Wait for dialogue sequence to finish
				ACTION_WaitForEvent( 'Event_SS_Intro_Cassidy_Walk' );
				ACTION_ChangeController( 'Cassidy' , class'Mind' );
				ACTION_ChangeController( 'Cassidy' , class'ScriptedController' );
				ACTION_ChangeScriptedSequenceDirect( AP_Cassidy , 'SS_Intro_Cassidy_03' );
				ACTION_WalkDirect( AP_Cassidy );
					sleep( 0.4 );
				ACTION_MoveToward( AP_Cassidy , PN_Cassidy_Leave , FALSE );
	
		ScriptEnd:
	}
