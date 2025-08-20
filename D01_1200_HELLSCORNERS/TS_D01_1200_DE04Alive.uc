//=============================================================================
// TS_D01_1200_DE04Alive.
//=============================================================================
class TS_D01_1200_DE04Alive extends TriggeredScript
	placeable;

var bool bDE04Alive;

state Default
{
	Begin:

	bDE04Alive = false;
}

state Triggered
{
	Begin:

	bDE04Alive = false;
	slog( "***** Unit04 is dead. *****" );
}
