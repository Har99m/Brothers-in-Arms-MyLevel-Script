//=============================================================================
// TS_D00_0600_CP2_Misc.
//=============================================================================
class TS_D00_0600_CP2_Misc extends TriggeredScript
	placeable;

state triggered
	{
		Begin:

				ACTION_UnBlockNavPoints( 'PN_C2_BlockedNodes' );

				gbxWaypointBeacon( GetFirstActor( 'GBXWPB_Church' ) ).bNoDirectionArrow = False;

		//===== DISPLAY OBJECTIVE
 				ACTION_SetObjectiveStatus( 0 , OI_Active , 'ObjectiveList' );
				ACTION_DisplayObjective( 0 , 'ObjectiveList' , 3.0 );

				ACTION_OrderMove( 'Unit_DE_S4_04' , 'PN_Sector_04_10' );

		ScriptEnd:
	}
