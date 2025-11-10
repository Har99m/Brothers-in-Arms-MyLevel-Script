//=============================================================================
// TS_MortarATeam.
//=============================================================================
class TS_MortarATeam extends TriggeredScript
	placeable;


state Triggered
{
begin:

	ACTION_EnableMortarRecruiting( 'MortarA' , true );
	ACTION_TriggerEvent( 'MortarATeam' );
	ACTION_WaitForEvent( 'MortarAMounted' );
	ACTION_SetMortarTargetByName( 'MortarA', 'MortarATarget', MortarFire_Effect, 7, 2.0, 1200.0 );

LoopStart:
	ACTION_WaitForEvent( 'MortarAFinished' );
	ACTION_SetMortarTargetByName( 'MortarA', 'MortarATarget', MortarFire_Effect, 7, 2.0, 1200.0 );
	goto ( 'LoopStart' );
}
