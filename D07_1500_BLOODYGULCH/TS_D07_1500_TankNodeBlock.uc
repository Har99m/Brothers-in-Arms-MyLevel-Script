//=============================================================================
// TS_D07_1500_TankNodeBlock.
//=============================================================================
class TS_D07_1500_TankNodeBlock extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
		gotostate( 'Block', 'Begin' );
	}

	Begin:

	// Unblock so that the tank can pass
	ACTION_UnBlockNavPoint( 'PN_BlockUnBlock' );

}

state Block
{
	function OnTrigger(){}
	Begin:

	// Block so that the US squads can't pass
	ACTION_BlockNavPoints( 'PN_BlockUnBlock' );

}
