//=============================================================================
// PlayerWallAssault.
//=============================================================================
class PlayerWallAssault extends TriggeredScript
	placeable;

state Triggered
{
Begin:

ACTION_DestroyActor( 'MoveSquad11Script' );

ACTION_OrderMove('GermanSquad11b', 'GermanSquad11_Path01' );

ACTION_OrderMove( 'GermanSquad11', 'GermanSquad11_Path03' );

	ACTION_OrderMove( 'GermanSquad09', 'GermanChase02' );
	ACTION_OrderMove( 'GermanSquad10', 'GermanChase02' );


	sleep(15.0);

ACTION_DestroyActor( 'PlayerFlank' );

ACTION_OrderMove('GermanSquad11', 'GermanSquad11_Flank' );
	sleep(3.0);
ACTION_OrderMove( 'GermanSquad11', 'GermanSquad11_FlankFinish' );

ScriptEnd:

}
