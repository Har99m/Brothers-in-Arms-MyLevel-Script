//=============================================================================
// TS_D00_0600_CP1_Misc.
//=============================================================================
class TS_D00_0600_CP1_Misc extends TriggeredScript
	placeable;

state triggered
	{
		Begin:

				gbxWaypointBeacon( GetFirstActor( 'GBXWPB_PreChurch01' ) ).bEnabled = true;

				GetPawn( 'AP_CP_Cassidy' ).bHidden = FALSE ;

		//===== DISPLAY OBJECTIVE
 				ACTION_SetObjectiveStatus( 0 , OI_Active , 'ObjectiveList' );
				ACTION_DisplayObjective( 0 , 'ObjectiveList' , 3.0 );

			//===== 
				ACTION_TriggerEvent( 'TS_D00_0600_Coffee' );

		ScriptEnd:
	}
