//=============================================================================
// Combat1Script.
//=============================================================================
class Combat1Script extends TriggeredScript
	placeable;

var pawn G01;

state Triggered
	{
	Begin:

	G01 = GetPawn( 'G01' );

	SLog( "Combat1Script running..." );	

	ACTION_TriggerEvent( 'Combat1SI' );
	ACTION_TriggerEvent ( 'SpawnGermanSquad01' );
	ACTION_TriggerEvent ( 'SpawnGermanSquad02' );
		sleep(0.2);
	ACTION_OrderMove( 'GermanSquad01b', 'GermanSquad01b_Path01' );
	ACTION_OrderMove( 'GermanSquad02', 'GermanSquad02_Path01' );

		sleep(2.0);

	ACTION_DestroyActor( 'Allen' );
	ACTION_DestroyActor( 'Garnett' );
	ACTION_DestroyActor( 'Mac' );
	ACTION_DestroyActor( 'Leggett01' );

	ScriptEnd:

}

