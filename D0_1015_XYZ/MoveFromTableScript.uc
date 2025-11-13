//=============================================================================
// MoveFromTableScript.
//=============================================================================
class MoveFromTableScript extends TriggeredScript
	placeable;

state Triggered
{
Begin:

ACTION_DestroyActor( 'trigger_MoveFromTableScript' );
ACTION_DestroyActor( 'gbxTriggerNade' );
ACTION_DestroyActor( 'gbxTriggerShoot' );

ACTION_TriggerEvent( 'trigger_ShootKitchenMassacre' );

ACTION_TriggerEvent( 'SpawnAllenGarnettEnd' );
ACTION_TriggerEvent( 'GarnettEndScript' );

KM01Script(getFirstActor('KM01Script')).GotoState('Awake');
KM04Script(getFirstActor('KM04Script')).GotoState('Awake');
KM05Script(getFirstActor('KM05Script')).GotoState('Awake');
KM06Script(getFirstActor('KM06Script')).GotoState('Awake');
	sleep(0.3);



ScriptEnd:
}
