//=============================================================================
// TS_D01_1200_DE03Alive.
//=============================================================================
class TS_D01_1200_DE03Alive extends TriggeredScript
	placeable;

var bool bDE03Alive;

state Default
{
	Begin:

	bDE03Alive = false;
}

state Triggered
{
	Begin:

	bDE03Alive = false;
	slog( "***** Unit03 is dead. *****" );
}
