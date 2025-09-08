//=============================================================================
// TS_D01_1200_OutroAPDemi.
//=============================================================================
class TS_D01_1200_OutroAPDemi extends TriggeredScript
	placeable;

State Triggered
{
Begin:
	GetPawn('German_Outro_01x').Controller.bDemiGod = True;
	GetPawn('German_Outro_01').Controller.bDemiGod = True;
	GetPawn('German_Outro_02').Controller.bDemiGod = True;
	GetPawn('German_Outro_03').Controller.bDemiGod = True;
}
