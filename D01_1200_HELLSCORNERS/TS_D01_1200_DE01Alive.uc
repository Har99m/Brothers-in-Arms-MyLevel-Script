//=============================================================================
// TS_D01_1200_DE01Alive.
//=============================================================================
class TS_D01_1200_DE01Alive extends TriggeredScript
	placeable;

var bool bDE01Alive;

state Default
{
	Begin:

	bDE01Alive = false;
}

state Triggered
{
	Begin:

	bDE01Alive = false;
	slog( "***** Unit01 is dead. *****" );
}
