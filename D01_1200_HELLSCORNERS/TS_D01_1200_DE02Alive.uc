//=============================================================================
// TS_D01_1200_DE02Alive.
//=============================================================================
class TS_D01_1200_DE02Alive extends TriggeredScript
	placeable;

var bool bDE02Alive;

state Default
{
	Begin:

	bDE02Alive = false;
}

state Triggered
{
	Begin:

	bDE02Alive = false;
	slog( "***** Unit02 is dead. *****" );
}
