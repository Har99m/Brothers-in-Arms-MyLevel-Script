//=============================================================================
// BeaconFieldScript.
//=============================================================================
class BeaconFieldScript extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	//An autosave point has been reached.

	/*	
	ACTION_DestroyActor( 'G05' );
	ACTION_DestroyActor( 'G06' );
	ACTION_DestroyActor( 'G07' );
	ACTION_DestroyActor( 'G08' );
	ACTION_DestroyActor( 'G09' );
	ACTION_DestroyActor( 'G10' );
	*/
	ACTION_DestroyActor( 'RightFieldScript' );
	ACTION_DestroyActor( 'LeftFieldScript' );
	ACTION_DestroyActor( 'CenterFieldScript' );
	ACTION_DestroyActor( 'trigger_RightFieldScript' );
	ACTION_DestroyActor( 'trigger_LeftFieldScript' );
	ACTION_DestroyActor( 'trigger_CenterFieldScript' );
	ACTION_DestroyActor( 'HillPattern01' );
	ACTION_DestroyActor( 'HillPattern02' );
	ACTION_DestroyActor( 'HillPattern03' );
	ACTION_DestroyActor( 'mortar2' );
	ACTION_DestroyActor( 'trigger_Combat3Script' );
	ACTION_TriggerEvent( 'Combat3Script' );

ScriptEnd:

}
