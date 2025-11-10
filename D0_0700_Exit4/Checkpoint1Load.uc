//=============================================================================
// Checkpoint1Load.
//=============================================================================
class Checkpoint1Load extends TriggeredScript
	placeable;

state Triggered
{
begin:
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
	ACTION_TriggerEvent( 'Hartsock_Checkpoint1' );
	ACTION_OrderMove( 'USAFireTeam1','PN_HartsockCheckpoint1StayHere' );

	ACTION_TriggerEvent( 'Checkpoint1Script' );
}


