//=============================================================================
// SpawnKitchenMassacreScript.
//=============================================================================
class SpawnKitchenMassacreScript extends TriggeredScript
	placeable;

var pawn KM01;
var pawn KM06;
var pawn KM05;
var pawn KM04;

state Triggered
{
Begin:

	//spawns the germans at the table
	ACTION_TriggerEvent( 'SpawnKitchenMassacre01' );
	ACTION_TriggerEvent( 'SpawnKitchenMassacre02' );

	//begins individual script to have germans sitting at the table
	ACTION_TriggerEvent( 'KM01Script' );
	ACTION_TriggerEvent( 'KM02Script' );
	ACTION_TriggerEvent( 'KM03Script' );
	ACTION_TriggerEvent( 'KM04Script' );
	ACTION_TriggerEvent( 'KM05Script' );
	ACTION_TriggerEvent( 'KM06Script' );
		sleep(0.4);

	ACTION_TriggerEvent( 'Chair01Script' );
	ACTION_TriggerEvent( 'Chair02Script' );
	ACTION_TriggerEvent( 'Chair03Script' );
	ACTION_TriggerEvent( 'Chair04Script' );
		sleep(0.25);

	KM01 = GetPawn('KM01');
	KM06 = GetPawn('KM06');
	KM05 = GetPawn('KM05');
	KM04 = GetPawn('KM04');
		sleep(0.25);

	KM01.Health = 1;
	KM06.Health = 1;
	KM05.Health = 1;
	KM04.Health = 1;

ScriptEnd:
}
