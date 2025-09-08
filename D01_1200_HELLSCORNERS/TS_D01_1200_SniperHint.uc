//=============================================================================
// TS_D01_1200_SniperHint.
//=============================================================================
class TS_D01_1200_SniperHint extends TriggeredScript
	placeable;

state Triggered
{
	Being:

	ACTION_DisplayObjectiveHint( S_Localize( "HINT_I" ), 4.0 );

}
