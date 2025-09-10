//=============================================================================
// TS_D10_0800_CP3_Misc.
//=============================================================================
class TS_D10_0800_CP3_Misc extends TriggeredScript
	placeable;

var Animpawn AP_Doyle , AP_Paige ;

state Triggered
	{

		Begin:

			//===== Set Flak 88's as destroyed
				ACTION_SetTurretDestroyed( 'Flak_88_A' );
				ACTION_SetTurretDestroyed( 'Flak_88_B' );

			ACTION_TriggerEvent('CSG_UNIT_DE_C4_02');

				GbxWaypointBeacon(GetFirstActor('Beacon_Doyle')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_END')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_88')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_TANKS')).bEnabled = TRUE;

				//ACTION_SetObjectiveStatus( 1 , OI_Complete , 'ObjectiveList' );
 				ACTION_SetObjectiveStatus( 0 , OI_Active , 'ObjectiveList' );
				ACTION_DisplayObjective( 0 , 'ObjectiveList' , 3.0 );

			//===== Define and set up AnimPawns
				ACTION_TriggerEvent( 'Event_SS_CP3_Explode_Setup' );
				AP_Doyle = AnimPawn( GetPawn( 'AP_CP3_Doyle_Explode' ));
				AP_Paige = AnimPawn( GetPawn( 'AP_CP3_Paige' ));
				AP_Doyle.bHidden = FALSE ;
				AP_Paige.bHidden = FALSE ;
				ACTION_UnBlockNavpoints( 'PN_Midtro_Blocker' );
				GetFirstActor( 'SM_Doyle_Cloth' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Doyle_Patch' ).bHidden = FALSE ;

			//===== Give OrderMoves to German tanks so they don't run away

				ACTION_OrderMove('UNIT_DE_C4_02', 'PN_UNIT_DE_C4_02_01' );

				//ACTION_OrderMove( 'UNIT_DE_Tank_Combat4_02'  , 'PN_Tank_Fire_02' );
					sleep( 0.1 );
				ACTION_OrderMove( 'Unit_DE_C3_Tank_02'  , 'PN_MoveTank1_Outro_2B' );
					sleep( 0.1 );
				ACTION_OrderMove( 'Unit_DE_C3_Tank_03'  , 'PN_MoveTank1_Outro_3B' );
					sleep( 0.2 );
				ACTION_TriggerEvent( 'TS_D10_0800_NewBombs' );

				sleep(5.0);

				ACTION_DisplayObjectiveHint( S_Localize("HINT_A"), 4 );
				ACTION_TriggerEvent('TS_D10_0800_PanzerfaustHint');
				ACTION_TriggerEvent('gbxWaypointBeacon_Panzerfaust_Stash');

				sleep(4);
				ACTION_OrderMove( 'UNIT_DE_Tank_Combat4_02'  , 'PN_Tank_Fire_02' );
					sleep( 1 );
				ACTION_OrderMove( 'UNIT_DE_Tank_Combat4_02'  , 'PN_Tank_Fire_02' );

		ScriptEnd:
	}

