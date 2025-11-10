//=============================================================================
// TS_MortarADismount.
//=============================================================================
class TS_MortarADismount extends TriggeredScript
	placeable;


state Triggered
{
begin:
	ACTION_ForceTurretDismount( 'MortarA' );
//	ACTION_OrderMove( 'GermanSquadMortar', 'Combat3FinalStand' );

}
