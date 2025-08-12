//=============================================================================
// TS_D00_0600_CP3_Misc.
//=============================================================================
class TS_D00_0600_CP3_Misc extends TriggeredScript
	placeable;

state triggered
	{
		Begin:

				ACTION_TriggerEvent( 'E_Smoke01' );
				ACTION_TriggerEvent( 'E_Smoke02' );

				ACTION_TriggerEvent( 'BVT_Wire_01' );				//===== Turn off blocking volume togglable
				ACTION_DestroyActor( 'SM_Wire01' );					//===== KIll wire roadblock
				GetFirstActor( 'SM_Wire02' ).bHidden = False;		//===== Unhide wire roadblock
				ACTION_UnBlockNavPoint( 'PN_C3_Wave_01_01_B' );	//===== Unblock
				ACTION_UnBlockNavPoint( 'PN_Blocked' );				//===== Unblock

		//===== DISPLAY OBJECTIVE
 				ACTION_SetObjectiveStatus( 0 , OI_Complete , 'ObjectiveList' );
 				ACTION_SetObjectiveStatus( 1 , OI_Active , 'ObjectiveList' );
				ACTION_DisplayObjective( 1 , 'ObjectiveList' , 3.0 );

					sleep( 4.0 );

				ACTION_DisplayObjectiveHint( S_Localize( "HINT_3" ) , 4.0 );
					//-----/-----HINT_3="Use the Church walls to defend against the German counter-attack."

					sleep( 4.0 );

				ACTION_DisplayObjectiveHint( S_Localize( "HINT_5" ) , 4.0 );
					//-----/-----HINT_5="Man the MG42 to defend the church."

		ScriptEnd:
	}
