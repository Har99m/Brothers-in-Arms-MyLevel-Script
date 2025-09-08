//=============================================================================
// TS_D01_1200_DE05Alive.
//=============================================================================
class TS_D01_1200_DE05Alive extends TriggeredScript
	placeable;

var bool bDE05Alive;

state Default
{
	Begin:

	bDE05Alive = false;
}

state Triggered
{
	Begin:

	bDE05Alive = false;
	slog( "***** Unit05 is dead. *****" );
}
