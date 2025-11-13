//=============================================================================
// Checkpoint4Script.
//=============================================================================
class Checkpoint4Script extends TriggeredScript
	placeable;

var Actor GarnettEndScript;

State Triggered
{
Begin:

	GarnettEndScript = GetFirstActor( 'GarnettEndScript' );

	ACTION_FlushAnimQueue( 'GarnettEnd' ); 
	ACTION_FlushAnimQueue( 'AllenEnd' );

	GarnettEndScript.goToState( 'Outro' );

	ACTION_OrderFallOut( 'Hartsock' );
	ACTION_OrderMove( 'Hartsock', 'C3_Hartsock_Position' );

	getPawn('AllenEnd').controller.bGodmode = true;
	getPawn('GarnettEnd').controller.bGodMode = true;

ScriptEnd:
}
