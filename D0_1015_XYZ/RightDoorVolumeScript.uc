//=============================================================================
// RightDoorVolumeScript.
//=============================================================================
class RightDoorVolumeScript extends TriggeredScript
	placeable;

state Triggered
{
begin:

	ACTION_TriggerEvent( 'Door01' );
	ACTION_TriggerEvent( 'Door02' );
	ACTION_PlaySound( 'Door02', "IMPACTS.GATE_KICK", 1, 1, 3000 );

}
