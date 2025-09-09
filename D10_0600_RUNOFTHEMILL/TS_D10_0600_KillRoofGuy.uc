//=============================================================================
// TS_D10_0600_KillRoofGuy.
//=============================================================================
class TS_D10_0600_KillRoofGuy extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
	}

	Begin:

	ACTION_KillPawn( 'IG_21_01' );

	ScriptEnd:
}
