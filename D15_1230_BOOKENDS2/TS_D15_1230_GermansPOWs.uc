//=============================================================================
// TS_D15_1230_GermansPOWs.
//=============================================================================
class TS_D15_1230_GermansPOWs extends TriggeredScript
	placeable;

var AnimPawn Walker01, Walker02, Walker03, Walker04, Walker05, Walker06;
var Actorlite PN_Walker01, PN_Walker02, PN_Walker03, PN_Walker04, PN_Walker06;

state Triggered
{
Begin:

	Walker01 = AnimPawn( GetPawn( 'Walker01' ));
	Walker02 = AnimPawn( GetPawn( 'Walker02' ));
	Walker03 = AnimPawn( GetPawn( 'Walker03' ));
	Walker04 = AnimPawn( GetPawn( 'Walker04' ));

	ACTION_Walk( 'Walker01' );
	ACTION_Walk( 'Walker02' );
	ACTION_Walk( 'Walker03' );
	ACTION_Walk( 'Walker04' );

	ACTION_SetDesiredSpeed( 'Walker01', 0.145 );
	ACTION_SetDesiredSpeed( 'Walker02', 0.15 );
	ACTION_SetDesiredSpeed( 'Walker03', 0.15 );
	ACTION_SetDesiredSpeed( 'Walker04', 0.15 );

	PN_Walker01 = GetNavigationPoint( 'PN_Walker01b' );
	PN_Walker02 = GetNavigationPoint( 'PN_Walker02b' );
	PN_Walker03 = GetNavigationPoint( 'PN_Walker03b' );
	PN_Walker04 = GetNavigationPoint( 'PN_Walker04b' );

	ACTION_MoveToward( Walker04, PN_Walker04 );
	sleep( 1.0 );
	ACTION_MoveToward( Walker01, PN_Walker01 );
	ACTION_MoveToward( Walker02, PN_Walker02 );
	ACTION_TriggerEvent( 'Event_StartGermanWalkerAnims' );
	sleep( 0.1 );
	ACTION_MoveToward( Walker03, PN_Walker03 ); 

}

