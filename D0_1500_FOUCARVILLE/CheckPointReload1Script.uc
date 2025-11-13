//=============================================================================
// CheckPointReload1Script.
//=============================================================================
class CheckPointReload1Script extends TriggeredScript
	placeable;

var int BellRing;
var Actor ChurchTower;

state Triggered
{
	Begin:
	Sleep( 0.1 );

	ACTION_DestroyActor( 'Crow2' );
	ACTION_DestroyActor( 'Crow1' );

	// Spawn Hartsock, Garnett, Allen
	ACTION_TriggerEvent( 'SpawnUSSquad' );
	ACTION_ChangeController( 'Allen', class'Mind' );
	ACTION_ChangeController( 'Garnett', class'Mind' );
	ACTION_ChangeController( 'Hartsock', class'Mind' );

	ACTION_TriggerEvent( 'SpawnGermanSquad01c' );
	ACTION_SetHidden( 'fencedestroyed' , true );

	ACTION_BlockNavPoints( 'PN_Fence_Road' );
	ACTION_BlockNavPoints( 'PN_Fence_Field' );

	// Display Objectives
	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList_FV' );
	ACTION_DisplayObjective( 0, 'ObjectiveList_FV', 4.0 );
	ACTION_SetObjectiveBeaconState( 'Waypoint_ChurchArea', true, false, true );
	ACTION_TriggerEvent( 'Waypoint_ChurchArea' );

	ACTION_SaveMemoryReport( "foucarville_intro_after" );
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );

	sleep( 5.0 );
	//	ChurchBell
	ChurchTower = GetFirstActor('ChurchTower');
	BellRing = ChurchTower.PlaySound(Sound'D01500_SOUNDS.CHURCHBELL_ST',,80,,12000);
	sleep( 7.5 );
	//	Fade Out Church Bell
	ChurchTower.StopSound(BellRing, 1.5);  // stop sound by fading out over 1.5 seconds;

	EndScript:
}

