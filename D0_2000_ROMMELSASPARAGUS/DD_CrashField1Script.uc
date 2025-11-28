//=============================================================================
// DD_CrashField1Script.
//=============================================================================
class DD_CrashField1Script extends TriggeredScript
	placeable;

var AnimPawn Pawn_Doe;

state Triggered
{
	Begin:

	ACTION_PlaySound( 'Pawn_Doe01', "D02000_SOUNDS.GLIDERCRASH", 1.0, 64.0, 1024 );

	ACTION_PlayAnim( 'Pawn_Doe01', 'pilot_idle_dead', 0.1, 1.0, TRUE );
	ACTION_PlayAnimWithQueue( 'GliderMesh01', 'glider_1_lands_idle', 0.0, 1.0, TRUE );

	Pawn_Doe = AnimPawn( GetPawn('Pawn_Doe01') );

	Pawn_Doe.bPawnBlinks = FALSE;
	Pawn_Doe.EyeMaxDeltaDown = 0;
	Pawn_Doe.EyeMaxDeltaInside = 0;
	Pawn_Doe.EyeMaxDeltaOutside = 0;
	Pawn_Doe.EyeMaxDeltaUp = 0;
	Pawn_Doe.bDoHeadTurn = FALSE;

	ScriptEnd:
}
