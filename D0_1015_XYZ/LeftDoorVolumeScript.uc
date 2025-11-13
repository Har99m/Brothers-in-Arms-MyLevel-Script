//=============================================================================
// LeftDoorVolumeScript.
//=============================================================================
class LeftDoorVolumeScript extends TriggeredScript
	placeable;

state Triggered
{
begin:

	ACTION_TriggerEvent( 'LargeDoorLeft' );
	ACTION_TriggerEvent( 'LargeDoorRight' );
	ACTION_PlaySound( 'LargeDoorLeft', "IMPACTS.GATE_KICK", 1, 1, 3000 );

}
