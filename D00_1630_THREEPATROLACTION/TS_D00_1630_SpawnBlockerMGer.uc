//=============================================================================
// TS_D00_1630_SpawnBlockerMGer.
//=============================================================================
class TS_D00_1630_SpawnBlockerMGer extends TriggeredScript
	placeable;

var AnimPawn Pawn_HTGuy01;

state Triggered
{
Begin:

	ACTION_TriggerEvent( 'CSG_Checkclear_HT_MG' );

	sleep( 1.0 );

	Pawn_HTGuy01 = AnimPawn( GetPawn( 'Pawn_C1_HalfTrack_01' ) );

	Pawn_HTGuy01.Controller.bGodMode = true;
	Pawn_HTGuy01.Controller.bDemiGod = true;

}
