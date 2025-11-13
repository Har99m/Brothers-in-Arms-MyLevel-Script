//=============================================================================
// ShootKitchenMassacreScript.
//=============================================================================
class ShootKitchenMassacreScript extends TriggeredScript
	placeable;

state Triggered
{
Begin:

ACTION_TriggerEvent( 'trigger_MoveFromTableScript' );

KM01Script(getFirstActor('KM01Script')).GotoState('Awake');
KM04Script(getFirstActor('KM04Script')).GotoState('Awake');
KM05Script(getFirstActor('KM05Script')).GotoState('Awake');
KM06Script(getFirstActor('KM06Script')).GotoState('Awake');




ScriptEnd:

}
