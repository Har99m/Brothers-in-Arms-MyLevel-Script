//=============================================================================
// TS_D15_1330_TankCommander.
//=============================================================================
class TS_D15_1330_TankCommander extends TriggeredScript
	placeable;

var Tank Sherman;
var AnimPawn Pawn_Tank_Commander;

state triggered
{
Begin:
	//===== Define tank
	Sherman = Tank(GetFirstActor( 'Pawn_Sherman' ));
	Pawn_Tank_Commander = AnimPawn(GetPawn( 'AP_Tank_Commander' ));
		sleep ( 0.5 );
	ACTION_TankEnterScriptedMode( Sherman );

	//===== Define and play animation
	ACTION_SetAnimSet( 'Sherman', "k_vehicle_us.us_tank_sherman" );
		sleep ( 0.5 );

	//=== Hide real tank commander
		ACTION_TankCommanderPlayAnim( Sherman , 'sherman_close_hatch' , 0.5 , 2.0 , , "a_hold_misc.sherman" );
	//=== Open tank hatch
		ACTION_PlayAnimDirect( Sherman, 'hatch_open' , 0.5 , 1.0 );							// ( 0.06 )
	//=== TankCommanderSt
	ACTION_TriggerEvent( 'Event_StartTankCommanderAnims' );

ScriptEnd:
}
