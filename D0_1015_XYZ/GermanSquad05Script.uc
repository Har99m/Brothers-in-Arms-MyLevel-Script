//=============================================================================
// GermanSquad05Script.
//=============================================================================
class GermanSquad05Script extends TriggeredScript
	placeable;

state Triggered
{
Begin:

ACTION_TriggerEvent( 'trigger_OverBagsScript' );
ACTION_OrderMove( 'GermanSquad04', 'GermanSquad04_Path04' );

ACTION_DestroyActor( 'Mac' );
ACTION_DestroyActor( 'Legget' );
ACTION_DestroyActor( 'allen' );
ACTION_DestroyActor( 'garnett' );
ACTION_OrderMove( 'GermanSquad05', 'GermanSquad05_Path01' );
	sleep(15.0);
//ACTION_OrderMove( 'GermanSquad05', 'GermanSquad05_Path02' );

ScriptEnd:
}
