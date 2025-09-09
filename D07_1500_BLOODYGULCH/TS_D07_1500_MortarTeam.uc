//=============================================================================
// TS_D07_1500_MortarTeam.
//=============================================================================
class TS_D07_1500_MortarTeam extends TriggeredScript
	placeable;

var int RandomTimer, RandomDistance;
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

	RandomTimer = Rand( 2 );
	RandomDistance = Rand( 2000 );

	ACTION_SetMortarTargetPlayer( 'TheMortar', MortarFire_Marching, 3, 1.6 + RandomTimer, 4000 + RandomDistance );

	ACTION_WaitForEvent( 'MortarStoppedFiring' );

	gotoState( 'Triggered', 'Begin' );

	ScriptEnd:
}

