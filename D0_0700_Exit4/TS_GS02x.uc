//=============================================================================
// TS_GS02x.
//=============================================================================
class TS_GS02x extends TriggeredScript
	placeable;

state Triggered
{
begin:
//	SPAWN PLUS FIRST DESTINATION-----------------------------------------------
	slog( "TS_GS02x JUST GOT TRIGGERED MOTHERFUCKER!" );
	ACTION_TriggerEvent( 'Counter_MasterDeath' );
	ACTION_TriggerEvent( 'Spawn_C4_GS02' );
	ACTION_OrderMove( 'C4_GS02' , 'PN_C4_GS01a' );

//	ADD 'WAIT FOR ARRIVAL' LOGIC HERE, THEN SLEEP LESS TIME

	sleep(30.0);
	ACTION_OrderMove( 'C4_GS02' , 'PN_C4_GS01b' );
}

