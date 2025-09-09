//=============================================================================
// TS_D09_1500_TreeExplode.
//=============================================================================
class TS_D09_1500_TreeExplode extends TriggeredScript
	placeable;

var(Events) edfindable Pawn Pawn_Tree, Pawn_Tree_Skybox;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	ACTION_UnBlockNavPoints( 'PN_C1_Blocked' );

	ACTION_PlayAnimDirect( Pawn_Tree, 'explode_b', 0.0, 0.6, FALSE );
	ACTION_PlayAnimDirect( Pawn_Tree_Skybox, 'explode_b', 0.0, 0.6, FALSE );

	ACTION_TriggerEvent( 'BVT_TreeExplosion' );

	ScriptEnd:
}
