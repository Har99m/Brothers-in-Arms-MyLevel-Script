//=============================================================================
// DD_TableMove.
//=============================================================================
class DD_TableMove extends TriggeredScript
	placeable;

var Actor Table;
var Unit GermanUnit;

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
{
	Super.PostBeginPlay();

	Table = GetFirstActor( 'StaticMesh_Table_On' );
	GermanUnit = GetUnit( 'GermanSquad11' );
}

state Triggered
{
	function OnTrigger()
	{
		GoToState( 'Table_Move' );
	}

	Begin:

	if ( GermanUnit.GetNumLivingMembers() > 0 )
	{
		ACTION_UnBlockNavPoint( 'TablePath01' );
		ACTION_UnBlockNavPoint( 'PathNode_Table_Off' );
		ACTION_BlockNavPoints( 'PathNode_Table_On' );

		ACTION_OrderMove( 'GermanSquad11', 'TablePath01' );

		// Enable German Trigger
		ACTION_TriggerEvent( 'Trigger_TableMove' );

		while ( 	GermanUnit.GetNumLivingMembers() > 0 )
			sleep( 1.0 );

		// Disable German Trigger
		ACTION_TriggerEvent( 'Trigger_TableMove' );

		ACTION_BlockNavPoint( 'TablePath01' );
		ACTION_BlockNavPoint( 'PathNode_Table_Off' );
		ACTION_UnblockNavPoints( 'PathNode_Table_On' );
	}
	// else
	//	SLog( "**** GermanSquad11 Member is Dead!!! ****" );
}

state Table_Move
{
	Begin:

	sleep( 0.5 );

	// Turn off collision
	Table.SetCollision( !Table.bCollideActors, !Table.bBlockActors, !Table.bBlockPlayers );

	// Turn on collision
	Table = GetFirstActor( 'StaticMesh_Table_Off' );
	Table.SetCollision( !Table.bCollideActors, !Table.bBlockActors, !Table.bBlockPlayers );

	ACTION_TriggerEvent( 'Mover_Table01' );
	ACTION_PlaySound( 'Mover_Table01', "IMPACTS.GATE_KICK", 1.0, 64.0, 2048.0 );

	ScriptEnd:
}

