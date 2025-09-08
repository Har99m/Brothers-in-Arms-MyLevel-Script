//=============================================================================
// TS_D01_1200_GermanMortarDeath.
//=============================================================================
class TS_D01_1200_GermanMortarDeath extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	ACTION_KillPawn( 'DEDie01' , vect( 0.001, -0.0025, -0.001 ), 'bip01 head' );
	ACTION_KillPawn( 'DEDie02' , vect( 0.001, -0.0025, -0.001 ), 'bip01 head' );

}
