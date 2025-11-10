//=============================================================================
// TS_GS01x.
//=============================================================================
class TS_GS01x extends TriggeredScript
	placeable;

state Triggered
{
begin:
//	SPAWN PLUS FIRST DESTINATION-----------------------------------------------
	slog( "TS_GS01x JUST GOT TRIGGERED MOTHERFUCKER!" );
	ACTION_TriggerEvent( 'Counter_MasterDeath' );

	ACTION_TriggerEvent( 'Spawn_C4_GS01' );
	ACTION_OrderMove( 'C4_GS01' , 'PN_C4_GS01a' );
	
	sleep(30.0);
	ACTION_OrderMove( 'C4_GS01' , 'PN_C4_GS01b' );
}
