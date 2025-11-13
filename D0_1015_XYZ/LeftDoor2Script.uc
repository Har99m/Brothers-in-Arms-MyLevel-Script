//=============================================================================
// LeftDoor2Script.
//=============================================================================
class LeftDoor2Script extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_TriggerEvent( 'LeftDoor02' );
	ACTION_PlaySound( 'Door02', "IMPACTS.GATE_KICK", 1, 1, 1000 );

	ScriptEnd:
	}
