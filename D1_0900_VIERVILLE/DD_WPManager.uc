//=============================================================================
// DD_WPManager.
// Triggered by: Sector script
// Referenced by: DD_SectorCheckpoint, DD_SectorScript, DD_2SSectorScript,
// DD_TankScript, DD_FinalBattleScript, DD_SpawnAT, and DD_UberSIScript.
//=============================================================================
class DD_WPManager extends TriggeredScript
	placeable;

var byte bComplete[7];
var byte bDestroyed[7];
var byte bOn[7];
var name WaypointTag[7];
var bool bMapComplete, bTankSpawned, bBusy, bATSpawned;
var int  i, j, k, iCurrent;

var Tank Tank_Risner;

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	bMapComplete = FALSE;
	bTankSpawned = FALSE;	// Set TRUE by DD_TankScript
	bATSpawned = FALSE;	// Set TRUE by DD_SpawnAT
	bBusy = FALSE;

	bOn[0] = 1;
	bOn[1] = 0;
	bOn[2] = 0;
	bOn[3] = 0;
	bOn[4] = 0;
	bOn[5] = 0;
	bOn[6] = 0;

	bComplete[0] = 0;
	bComplete[1] = 0;
	bComplete[2] = 0;
	bComplete[3] = 0;
	bComplete[4] = 0;
	bComplete[5] = 0;
	bComplete[6] = 0;

	bDestroyed[0] = 0;
	bDestroyed[1] = 0;
	bDestroyed[2] = 0;
	bDestroyed[3] = 0;
	bDestroyed[4] = 0;
	bDestroyed[5] = 0;
	bDestroyed[6] = 0;

	WaypointTag[0] = 'Waypoint_Sector1';
	WaypointTag[1] = 'Waypoint_Sector2';
	WaypointTag[2] = 'Waypoint_Sector3';
	WaypointTag[3] = 'Waypoint_Sector4';
	WaypointTag[4] = 'Waypoint_Sector5';
	WaypointTag[5] = 'Waypoint_Sector6';
	WaypointTag[6] = 'Waypoint_Sector7';

	i = 0;
	j = 0;
	k = 0;
}

state Triggered
{
	Begin:

	bBusy = TRUE;

	for ( i = 0; i < 7; i++ )
	{
		if ( bComplete[i] == 1 && bDestroyed[i] == 0 )
		{
			iCurrent = i;
			bDestroyed[i] = 1;
			k++;

			// Turn off
			if ( bOn[i] == 1 )
			{
				bOn[i] = 0;
				ACTION_TriggerEvent( WaypointTag[i] );
			}

			sleep( 1.0 );
			ACTION_DestroyActor( WaypointTag[i] );
		}
	}

	// Find next available waypoint and turn on
	while ( bComplete[j] == 1 && j < 7 )
	{
		j++;

		bOn[j] = 1;
		ACTION_TriggerEvent( WaypointTag[j] );
	}

	// Every two complete objectives save
	if ( k % 2 == 0 )
	{
		sleep( 3.0 );

		ACTION_ClearScriptValues();
		if ( bTankSpawned )
		{
			// SLog( "**** bTankSpawned ****" );
			ACTION_SaveScriptValue( 'TankSpawned', 1 );
		}
		else
			ACTION_SaveScriptValue( 'TankSpawned', 0 );

		if ( bATSpawned )
		{
			// SLog( "**** ATSpawned ****" );
			ACTION_SaveScriptValue( 'ATSpawned', 1 );
		}
		else
			ACTION_SaveScriptValue( 'ATSpawned', 0 );

		ACTION_SaveScriptValue( 'Alive12', GetUnit('GermanUnit12').GetNumLivingMembers() );
		ACTION_SaveScriptValue( 'Alive13', GetUnit('GermanUnit13').GetNumLivingMembers() );

		// SLog( "**** bComplete[0]: " $ bComplete[0] );
		// SLog( "**** bComplete[1]: " $ bComplete[1] );
		// SLog( "**** bComplete[2]: " $ bComplete[2] );
		// SLog( "**** bComplete[3]: " $ bComplete[3] );
		// SLog( "**** bComplete[4]: " $ bComplete[4] );
		// SLog( "**** bComplete[5]: " $ bComplete[5] );

		ACTION_SaveScriptValue( 'Sector01', bComplete[0] );
		ACTION_SaveScriptValue( 'Sector02', bComplete[1] );
		ACTION_SaveScriptValue( 'Sector03', bComplete[2] );
		ACTION_SaveScriptValue( 'Sector04', bComplete[3] );
		ACTION_SaveScriptValue( 'Sector05', bComplete[4] );
		ACTION_SaveScriptValue( 'Sector06', bComplete[5] );

		ACTION_SaveScriptValue( 'j', j );
		ACTION_SaveScriptValue( 'k', k );

		iCurrent += 2;
		// SLog( "**** iCurrent: " $ iCurrent );

		ACTION_SaveMemoryReport( "vierville_checkpoint" $ k/2 $ "_pre" );
		ACTION_CheckPointSave( iCurrent );
		ACTION_SaveMemoryReport( "vierville_checkpoint" $ k/2 $ "_post" );
		sleep( 3.0 );
	}

	// If map complete
	if ( j == 7 )
	{
		// Set Trigger and Waypoint on Risner + Message
		Tank_Risner = Tank( GetFirstActor('USTankUnit01') );
		sleep( 1.0 );

		TankStuart(Tank_Risner).MachineGunRearTrigger.bDisabled = TRUE;
		TankStuart(Tank_Risner).MachineGunTurretTrigger.bDisabled = TRUE;

		TankStuart(Tank_Risner).MachineGunRearTrigger.UnTouch( GetLocalPlayerPawn() );
		TankStuart(Tank_Risner).MachineGunTurretTrigger.UnTouch( GetLocalPlayerPawn() );

		TankStuart(Tank_Risner).MachineGunRearTrigger.Destroy();
		TankStuart(Tank_Risner).MachineGunTurretTrigger.Destroy();

		bMapComplete = TRUE;
		sleep( 1.0 );

		// Display Objective
		ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList01' );
		ACTION_DisplayObjective( 0, 'ObjectiveList01', 4.0 );
		sleep( 4.0 );

		ACTION_DisplayObjectiveHint( S_Localize("OBJECTIVE_HINT_2"), 6.0 );

		// Attach Trigger and Waypoint To Tank
		GetFirstActor('gbxFollowBeacon_Outro').SetLocation( GetFirstActor('USTankUnit01').Location );

		GetFirstActor('USTankUnit01').AttachToBone( GetFirstActor('gbxFollowBeacon_Outro'), 'bow_mg' );
		GetFirstActor('USTankUnit01').AttachToBone( GetFirstActor('Trigger_Outro'), 'bow_mg' );
		GetFirstActor('gbxFollowBeacon_Outro').SetRelativeLocation( vect( -48.0, 56.0, 32.0 ) );
		GetFirstActor('Trigger_Outro').SetRelativeLocation( vect( -48.0, 56.0, 32.0 ) );

		// Enable
		ACTION_TriggerEvent('gbxFollowBeacon_Outro');
		ACTION_TriggerEvent('Trigger_Outro');

		sleep( 4.0 );
		if ( IsPlayerRidingTank(Tank_Risner) )
			ACTION_ForcePlayerDismountTurret();

		sleep( 2.0 );
		ACTION_TankCommanderLookAt( Tank_Risner, GetLocalPlayerPawn() );
	}

	bBusy = FALSE;

	ScriptEnd:
}
