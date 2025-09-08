//=============================================================================
// TS_D01_1200_SupplyDrop.
//=============================================================================
class TS_D01_1200_SupplyDrop extends TriggeredScript
	placeable;

var TS_D01_1200_SupplyDrop01Script Drop1Script_Ref;
var TS_D01_1200_SupplyDrop02Script Drop2Script_Ref;
var TS_D01_1200_SupplyDrop03Script Drop3Script_Ref;

var gbxWaypointBeacon WP01, WP02, WP03;
var Actor BarnDoor;

state Default
{
	Begin:
	Drop1Script_Ref = TS_D01_1200_SupplyDrop01Script( GetFirstActor( 'TS_D01_1200_SupplyDrop01Script' ) );
	Drop2Script_Ref = TS_D01_1200_SupplyDrop02Script( GetFirstActor( 'TS_D01_1200_SupplyDrop02Script' ) );
	Drop3Script_Ref = TS_D01_1200_SupplyDrop03Script( GetFirstActor( 'TS_D01_1200_SupplyDrop03Script' ) );

	WP01 = gbxWaypointBeacon( GetFirstActor( 'WB_SupplyDrop_01' ) );
	WP02 = gbxWaypointBeacon( GetFirstActor( 'WB_SupplyDrop_02' ) );
	WP03 = gbxWaypointBeacon( GetFirstActor( 'WB_SupplyDrop_03' ) );

	BarnDoor = GetFirstActor( 'Hide_BarnDoor' );

}

state Triggered
{
	function OnTrigger()
	{
		gotoState( 'ManageDrops', 'Begin' );
	}

	Begin:

	Drop1Script_Ref = TS_D01_1200_SupplyDrop01Script( GetFirstActor( 'TS_D01_1200_SupplyDrop01Script' ) );
	Drop2Script_Ref = TS_D01_1200_SupplyDrop02Script( GetFirstActor( 'TS_D01_1200_SupplyDrop02Script' ) );
	Drop3Script_Ref = TS_D01_1200_SupplyDrop03Script( GetFirstActor( 'TS_D01_1200_SupplyDrop03Script' ) );

	WP01 = gbxWaypointBeacon( GetFirstActor( 'WB_SupplyDrop_01' ) );
	WP02 = gbxWaypointBeacon( GetFirstActor( 'WB_SupplyDrop_02' ) );
	WP03 = gbxWaypointBeacon( GetFirstActor( 'WB_SupplyDrop_03' ) );

	BarnDoor = GetFirstActor( 'Hide_BarnDoor' );

	ACTION_TriggerEvent('WB_SupplyDrop_01');
	WP01.bEnabled = True;	// On
	WP02.bEnabled = False;	// Off
	WP03.bEnabled = False;	// Off
	ACTION_DisplayObjectiveHint( S_Localize( "HINT_C" ), 4.0 );
	sleep( 4.0 );

	slog( "***** State Triggered: Display drop 1. *****" );

}

state ManageDrops
{
	function OnTrigger()
	{
		gotoState( 'ManageDrops', 'Begin' );
	}

	Begin:

	if( Drop1Script_Ref.bDrop1Marked )
	{
		if( !Drop2Script_Ref.bDrop2Marked )
		{
			ACTION_TriggerEvent('WB_SupplyDrop_02');
			WP01.bEnabled = False;	// Off
			WP02.bEnabled = True;	// On
			WP03.bEnabled = False;	// Off
			ACTION_DisplayObjectiveHint( S_Localize( "HINT_D" ), 4.0 );
			sleep( 4.0 );
		}

		else if( !Drop3Script_Ref.bDrop3Marked )
		{
			ACTION_TriggerEvent('WB_SupplyDrop_03');
			WP01.bEnabled = False;	// Off
			WP02.bEnabled = False;	// Off
			WP03.bEnabled = True;	// On
			ACTION_DisplayObjectiveHint( S_Localize( "HINT_E" ), 4.0 );
			sleep( 4.0 );
		}

		else
		{
			WP01.bEnabled = False;	// Off
			WP02.bEnabled = False;	// Off
			WP03.bEnabled = False;	// Off

			ACTION_TriggerEvent( 'WB_House' );	// On
			ACTION_TriggerEvent( 'TV_CheckPoint2' );	// Turn on CheckPoint volume
			ACTION_DestroyActor( 'Trigger_BarnBlock' );
			ACTION_UnBlockNavPoints('PN_CP2'); //enable pathnodes
			ACTION_TriggerEvent( 'Toggle_On_BarnDoor' );
			BarnDoor.bHidden = true;

			ACTION_DisplayObjectiveHint( "", 0.1 );

			ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
			ACTION_DisplayObjectiveString( S_Localize( "OBJCOMP" ), 4.0 );
			sleep( 4.0 );

			ACTION_SetObjectiveStatus( 1, OI_ACTIVE, 'ObjectiveList' );
			ACTION_DisplayObjective( 1, 'ObjectiveList', 4.0 );
			sleep( 4.0 );
		}
	}

	else if( Drop2Script_Ref.bDrop2Marked && !Drop1Script_Ref.bDrop1Marked )
	{
		ACTION_TriggerEvent('WB_SupplyDrop_01');
		WP01.bEnabled = True;		// On
		WP02.bEnabled = False;		// Off
		WP03.bEnabled = False;		// Off
		ACTION_DisplayObjectiveHint( S_Localize( "HINT_C" ), 4.0 );
		sleep( 4.0 );
	}

	else if( Drop3Script_Ref.bDrop3Marked && !Drop1Script_Ref.bDrop1Marked )
	{
		ACTION_TriggerEvent('WB_SupplyDrop_01');
		WP01.bEnabled = True;		// On
		WP02.bEnabled = False;		// Off
		WP03.bEnabled = False;		// Off
		ACTION_DisplayObjectiveHint( S_Localize( "HINT_C" ), 4.0 );
		sleep( 4.0 );
	}

}

