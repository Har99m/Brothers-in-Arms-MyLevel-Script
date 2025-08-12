//=============================================================================
// TS_D00_0600_Intro_Doyle.
//=============================================================================
class TS_D00_0600_Intro_Doyle extends TriggeredScript
	placeable;

var AnimPawn AP_Doyle ;
var ActorLite PN_Intro_Doyle_Exit ;

State Triggered
	{
		Begin:
			//===== Define
				AP_Doyle = AnimPawn( GetPawn( 'Doyle' ));

				PN_Intro_Doyle_Exit = GetNavigationPoint( 'PN_Intro_Doyle_Exit' );

			//===== Doyle breaks out of his loop
				ACTION_TriggerEvent( 'Event_SS_Intro_Doyle_Finish' );

			//===== Doyle walks off
				ACTION_WaitForEvent( 'Event_SS_Intro_Doyle_Walk' );
				ACTION_ChangeController( 'Doyle' , class'Mind' );
				ACTION_ChangeController( 'Doyle' , class'ScriptedController' );
				AP_Doyle.bDontFrustumCull = FALSE ;
				ACTION_WalkDirect( AP_Doyle );
					sleep( 0.2 );
				ACTION_MoveToward( AP_Doyle , PN_Intro_Doyle_Exit , FALSE );

		ScriptEnd:
	}
