//=============================================================================
// TS_Tank.
//=============================================================================
class TS_Tank extends TriggeredScript
	placeable;

var Tank Tank_Drivable;

state Triggered
{
	Begin:

	Tank_Drivable = Tank( GetPawn('TP_DeadTank') );

	if ( Tank_Drivable == None )
	{
		Tank_Drivable = Tank( GetPawn('Tank1Midtro') );
	}

	if ( Tank_Drivable != None )
	{
		Tank_Drivable.Health = 100;
		Tank_Drivable.Driver = None;
		Tank_Drivable.bNonHumanControl = FALSE;
	}

	ScriptEnd:
}
