//=============================================================================
// TS_D01_1200_BarnBlock.
//=============================================================================
class TS_D01_1200_BarnBlock extends TriggeredScript
	placeable;

State Triggered
	{
		Begin:

				ACTION_DisplayObjectiveHint( S_Localize( "HINT_G" ), 4.0 );
					//-----/-----HINT_G="You need to mark all supply drops!"
	}
