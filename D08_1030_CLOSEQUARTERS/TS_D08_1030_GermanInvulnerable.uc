//=============================================================================
// TS_D08_1030_GermanInvulnerable.
//=============================================================================
class TS_D08_1030_GermanInvulnerable extends TriggeredScript
	placeable;

var pawn DE_C202_1, DE_C202_2;

state Triggered
	{
	Begin:

	ACTION_TriggerEvent( 'TS_D08_1030_GermanInvulnerable_' );
	ACTION_DestroyActor( 'TS_D08_1030_GermanInvulnerable' );

	ScriptEnd:
	}
