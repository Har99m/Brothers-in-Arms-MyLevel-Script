//=============================================================================
// SA_WayPoint_Manager.
//=============================================================================
class SA_WayPoint_Manager extends TriggeredScript
	placeable;

var AnimPawn AP_Mac;
var name Current_Waypoint;
var name Waypoint_to_Set;
var bool bWayManagerComplete;

function PostBeginPlay()
	{
		Super.PostBeginPlay();		
		bWayManagerComplete = false;
		Current_Waypoint = 'Waypoint_None';
		Waypoint_to_Set = 'Waypoint_None';
	}

//=============================================================================

state Triggered
	{
		Begin:
				ACTION_TriggerEvent( 'Waypoint_Start_01' );

			ACTION_WaitForEvent( 'Update_01' );
				ACTION_TriggerEvent( 'Waypoint_Start_01' );			// OFF
				ACTION_TriggerEvent( 'Waypoint_Start_02' );			// ON

			ACTION_WaitForEvent( 'Update_02' );
				ACTION_TriggerEvent( 'Waypoint_Start_02' );			// OFF
				ACTION_TriggerEvent( 'Waypoint_Start_03' );			// ON

			ACTION_WaitForEvent( 'Update_03' );
				ACTION_TriggerEvent( 'Waypoint_Start_03' );			// OFF
				ACTION_TriggerEvent( 'beacon_crossroad_dyn' );	// OFF
	
			SLog( "---------- Objective beacon SI should be terminated ----------" );	
				ACTION_TriggerEvent( 'Waypoint_Start_01' );
				ACTION_TriggerEvent( 'Waypoint_Start_02' );
				ACTION_TriggerEvent( 'Waypoint_Start_03' );

				ACTION_SetObjectiveBeaconState( 'Waypoint_Start_01', FALSE , FALSE , FALSE );
				ACTION_SetObjectiveBeaconState( 'Waypoint_Start_02', FALSE , FALSE , FALSE );
				ACTION_SetObjectiveBeaconState( 'Waypoint_Start_03', FALSE , FALSE , FALSE );
				ACTION_SetObjectiveBeaconState( 'beacon_crossroad_dyn', FALSE , FALSE , FALSE );
					sleep( 0.1 );

				ACTION_DestroyActor( 'Waypoint_Start_01' );
				ACTION_DestroyActor( 'Waypoint_Start_02' );
				ACTION_DestroyActor( 'Waypoint_Start_03' );
				ACTION_DestroyActor( 'Beacon_Crossroad_dyn' );
				ACTION_DestroyActor( 'Beacon_Crossroad' );

				ACTION_DestroyActor( 'MSG_Waypoint_To_Start' );
				ACTION_DestroyActor( 'MSG_Waypoint_To_Log_Jump' );
				ACTION_DestroyActor( 'MSG_Waypoint_To_Log_Crouch' );
				ACTION_DestroyActor( 'MSG_Waypoint_To_Mac' );
				ACTION_DestroyActor( 'MSG_Waypoint_End' );

			//===== Change beacon to follow Mac
				AP_Mac = AnimPawn( GetPawn( 'mac' ) );
				ACTION_TriggerEvent( 'MacBeacon' );
				gbxFollowBeacon( getFirstActor( 'macbeacon' ) ).m_anOwner = AP_Mac;

		ScriptEnd:
	}

