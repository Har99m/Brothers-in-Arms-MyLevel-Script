//=============================================================================
// TS_D10_0800_CP4_Misc.
//=============================================================================
class TS_D10_0800_CP4_Misc extends TriggeredScript
	placeable;

var Animpawn AP_Doyle , AP_Paige ;

state Triggered
	{
	Begin:

		ACTION_TriggerEvent('Emitter_BombingRun_A');
		GetFirstActor('StaticMeshActor_RubbleDestroy_C5').bHidden=true;
		ACTION_TriggerEvent('Emitter_BombingRun_C5');
		ACTION_TriggerEvent('BlockingVolumeToggleable_C5');

				GbxWaypointBeacon(GetFirstActor('Beacon_Doyle')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_TANKS')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_88')).bEnabled = FALSE;
				GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_END')).bEnabled = TRUE;

			//===== Define and set up AnimPawns
				ACTION_TriggerEvent( 'Event_SS_CP3_Explode_Setup' );
				AP_Doyle = AnimPawn( GetPawn( 'AP_CP3_Doyle_Explode' ));
				AP_Paige = AnimPawn( GetPawn( 'AP_CP3_Paige' ));
				AP_Doyle.bHidden = FALSE ;
				AP_Paige.bHidden = FALSE ;
				ACTION_UnBlockNavpoints( 'PN_Midtro_Blocker' );
				GetFirstActor( 'SM_Doyle_Cloth' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Doyle_Patch' ).bHidden = FALSE ;

			ACTION_TriggerEvent( 'TS_D10_0800_TankBomberMonitor' );

	}
