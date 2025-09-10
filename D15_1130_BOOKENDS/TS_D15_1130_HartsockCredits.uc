//=============================================================================
// TS_D15_1130_HartsockCredits.
//=============================================================================
class TS_D15_1130_HartsockCredits extends TriggeredScript
	placeable;

var Animpawn AP_Hartsock;
var ActorLite PN_Hartsock_Credits_End;
var float i;

state Triggered
{
Begin:

	ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );

	AP_Hartsock = AnimPawn( GetPawn( 'AP_Hartsock_Credits' ));
	PN_Hartsock_Credits_End = GetNavigationPoint( 'PN_Hartsock_Credits_End' );

	ACTION_WalkDirect( AP_Hartsock );
	AP_Hartsock.MaxDesiredSpeed = 0.15;
	ACTION_MoveToward( AP_Hartsock, PN_Hartsock_Credits_End );

	ACTION_TriggerEvent( 'Scene_Credits' );

	i = 0;

	Loop:
	sleep( 0.25 );
	i += 0.25;
	slog( "i = " $ i );
	Goto( 'Loop' );

}
