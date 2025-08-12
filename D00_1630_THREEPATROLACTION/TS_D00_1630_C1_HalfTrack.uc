//=============================================================================
// TS_D00_1630_C1_HalfTrack.
//=============================================================================
class TS_D00_1630_C1_HalfTrack extends TriggeredScript
	placeable;

var AnimPawn Pawn_HTGuy01, Pawn_HTGuy02, Pawn_HTGuy03;
var WargamePawn	Pawn_DummyTarget;

state Triggered
{
	function OnTrigger()
	{
		gotoState( 'StepTwo' );
	}

	Begin:

	Pawn_HTGuy01 = AnimPawn( GetPawn( 'Pawn_C1_HalfTrack_01' ) );
	Pawn_HTGuy02 = AnimPawn( GetPawn( 'Pawn_C1_HalfTrack_02' ) );
	Pawn_HTGuy03 = AnimPawn( GetPawn( 'Pawn_C1_HalfTrack_03' ) );

	Pawn_DummyTarget = WargamePawn( GetPawn( 'Pawn_DummyTargetGuy' ) );

	Pawn_HTGuy01.Controller.bGodMode = true;
	Pawn_HTGuy02.Controller.bGodMode = true;
	Pawn_HTGuy03.Controller.bGodMode = true;
	Pawn_HTGuy01.Controller.bDemiGod = true;
	Pawn_HTGuy02.Controller.bDemiGod = true;
	Pawn_HTGuy03.Controller.bDemiGod = true;

	Pawn_DummyTarget.bHidden = true;
	Pawn_DummyTarget.SightRadius = 0.0 ;
	Pawn_DummyTarget.bExcludeFromOracleCam = true;

}

state StepTwo
{
	function OnTrigger()
	{
	}

	Begin:

	Pawn_HTGuy01.Controller.bGodMode = false;
	Pawn_HTGuy02.Controller.bGodMode = false;
	Pawn_HTGuy03.Controller.bGodMode = false;
	Pawn_HTGuy01.Controller.bDemiGod = false;
	Pawn_HTGuy02.Controller.bDemiGod = false;
	Pawn_HTGuy03.Controller.bDemiGod = false;

}
