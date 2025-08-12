//=============================================================================
// TS_D00_0600_Intro_Friar.
//=============================================================================
class TS_D00_0600_Intro_Friar extends TriggeredScript
	placeable;

var AnimPawn AP_Friar ;
var ActorLite PN_Intro_Friar ;

State Triggered
	{
		Begin:
			//===== Define
				AP_Friar = AnimPawn( GetPawn( 'Friar' ));

				PN_Intro_Friar = GetNavigationPoint( 'PN_Intro_Friar' );

			//===== Friar gets up
				ACTION_TriggerEvent( 'Event_SS_Intro_Friar_Dismount' );

			//===== Friar walks off
				ACTION_WaitForEvent( 'Event_SS_Intro_Friar_Walk' );
				ACTION_ChangeController( 'Friar' , class'Mind' );
				ACTION_ChangeController( 'Friar' , class'ScriptedController' );
				ACTION_WalkDirect( AP_Friar );
					sleep( 1.2 );
				ACTION_MoveToward( AP_Friar , PN_Intro_Friar , FALSE );

			//===== Friar is done
				ACTION_WaitForEvent( 'Event_SS_Intro_Friar_Leave' );
				ACTION_ChangeController( 'Friar' , class'Mind' );
		//		ACTION_AssignToUnit( 'Friar' , 'Unit_US_Ass' );

			//===== Wait for Paddock to finish
				ACTION_WaitForEvent( 'Event_SS_Intro_Paddock_Exit' );

		//		ACTION_AssignToUnit( 'Friar' , '' );

				ACTION_ChangeController( 'Paddock' , class'Mind' );
				ACTION_AssignToUnit( 'Paddock' , 'Unit_US_Ass' );
				ACTION_AssignToUnit( 'Friar' , 'Unit_US_Ass' );
				ACTION_AttachUnitToSuperUnit( 'Unit_US_Ass' , 'Unit_Player' );

		ScriptEnd:
	}
