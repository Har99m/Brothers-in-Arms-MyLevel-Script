//=============================================================================
// TS_GS03x.
//=============================================================================
class TS_GS03x extends TriggeredScript
	placeable;

state Triggered
{
begin:
//	SPAWN PLUS FIRST DESTINATION-----------------------------------------------
	slog( "TS_GS03x JUST GOT TRIGGERED MOTHERFUCKER!" );
	ACTION_TriggerEvent( 'Counter_MasterDeath' );
	ACTION_TriggerEvent( 'Spawn_C4_GS03' );
	ACTION_OrderMove( 'C4_GS03' , 'PN_C4_GS04a' );

//	ADD 'WAIT FOR ARRIVAL' LOGIC HERE, THEN SLEEP LESS TIME
}

