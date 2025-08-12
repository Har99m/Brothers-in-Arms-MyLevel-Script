//=============================================================================
// TS_D00_1630_MortarScript.
//=============================================================================
class TS_D00_1630_MortarScript extends TriggeredScript
	placeable;

var int RandomDistance;
var bool bFirstTimeFire;

state Default
{
	Begin:

	bFirstTimeFire = True;
}

state Triggered
{
	Begin:

	if( bFirstTimeFire )
		{
			sleep( 3.0 );
			bFirstTimeFire = False;
			slog( "***** Firing Mortar for the first time. *****" );
		}

		slog( "***** Mortar firing. *****" );

	//===== Mortars target the player with slightly random timing & distance
	RandomDistance = Rand( 2000 );

	ACTION_SetMortarTargetPlayer( 'TheMortar', MortarFire_Marching, 5, 6, 4000 + RandomDistance );

	ACTION_WaitForEvent( 'MortarStoppedFiring' );

	gotoState( 'Triggered', 'Begin' );

	ScriptEnd:
}
