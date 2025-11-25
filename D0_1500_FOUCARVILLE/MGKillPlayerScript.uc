//=============================================================================
// MGKillPlayerScript.
//=============================================================================
class MGKillPlayerScript extends TriggeredScript
	placeable;

state Triggered 
{ 
Begin: 

	ACTION_OrderTarget( 'GermanSquad02', 'PlayerUnit' );
	sleep( 2.0 );
		while( GetLocalPlayerPawn().Health > 0 )
		{
			ACTION_KillPawn( 'gbxPlayerPawn', vect( 0.0002, -0.0002, -0.0002 ) );
			sleep( 1.0 );
		}


ScriptEnd: 
} 
