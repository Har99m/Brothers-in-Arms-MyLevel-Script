//=============================================================================
// NBS_Hill30Squibs.
//=============================================================================
class NBS_Hill30Squibs extends TriggeredScript
	placeable;

var NBS_Hill30UberScene Hill30Uber_Ref;

state Triggered
{
	Begin:

	Hill30Uber_Ref = NBS_Hill30UberScene( GetFirstActor( 'NBS_Hill30UberScene' ) );

	do{
		ACTION_TriggerEvent( 'GrassPoof01' );
		sleep( 0.5 );
		ACTION_TriggerEvent( 'DirtPoof15' );
		sleep( 0.7 );
		ACTION_TriggerEvent( 'GrassPoof02' );
		sleep( 0.3 );
		ACTION_TriggerEvent( 'DirtPoof21' );
		sleep( 0.8 );
		ACTION_TriggerEvent( 'GrassPoof03' );
		sleep( 0.7 );
		ACTION_TriggerEvent( 'DirtPoof20' );
		sleep( 0.4 );
		ACTION_TriggerEvent( 'GrassPoof04' );
		sleep( 0.8 );
		ACTION_TriggerEvent( 'DirtPoof17' );
		sleep( 0.2 );
		ACTION_TriggerEvent( 'GrassPoof05' );
		sleep( 0.2 );
		ACTION_TriggerEvent( 'DirtPoof24' );
		sleep( 0.5 );
		ACTION_TriggerEvent( 'GrassPoof06' );
		sleep( 0.3 );
		ACTION_TriggerEvent( 'DirtPoof13' );
		sleep( 0.5 );
		ACTION_TriggerEvent( 'GrassPoof07' );
		sleep( 0.5 );
		ACTION_TriggerEvent( 'DirtPoof23' );
		sleep( 0.4 );
		ACTION_TriggerEvent( 'GrassPoof08' );
		sleep( 0.4 );
		ACTION_TriggerEvent( 'DirtPoof22' );
		sleep( 0.3 );
		ACTION_TriggerEvent( 'GrassPoof09' );
		sleep( 0.8 );
		ACTION_TriggerEvent( 'DirtPoof18' );
		sleep( 0.3 );
		ACTION_TriggerEvent( 'GrassPoof10' );
		sleep( 0.3 );
		ACTION_TriggerEvent( 'DirtPoof19' );
		sleep( 0.5 );
		ACTION_TriggerEvent( 'GrassPoof11' );
		sleep( 0.4 );
		ACTION_TriggerEvent( 'DirtPoof14' );
		sleep( 0.3 );
		ACTION_TriggerEvent( 'GrassPoof12' );
		sleep( 0.2 );
		ACTION_TriggerEvent( 'DirtPoof16' );
		sleep( 0.8 );
		ACTION_TriggerEvent( 'GrassPoof18' );
		sleep( 0.3 );
		ACTION_TriggerEvent( 'DirtPoof01' );
		sleep( 0.8 );
		ACTION_TriggerEvent( 'GrassPoof24' );
		sleep( 0.2 );
		ACTION_TriggerEvent( 'DirtPoof02' );
		sleep( 0.5 );
		ACTION_TriggerEvent( 'GrassPoof14' );
		sleep( 0.3 );
		ACTION_TriggerEvent( 'DirtPoof03' );
		sleep( 0.3 );
		ACTION_TriggerEvent( 'GrassPoof15' );
		sleep( 0.7 );
		ACTION_TriggerEvent( 'DirtPoof04' );
		sleep( 0.5 );
		ACTION_TriggerEvent( 'GrassPoof21' );
		sleep( 0.8 );
		ACTION_TriggerEvent( 'DirtPoof05' );
		sleep( 0.7 );
		ACTION_TriggerEvent( 'GrassPoof22' );
		sleep( 0.3 );
		ACTION_TriggerEvent( 'DirtPoof06' );
		sleep( 0.2 );
		ACTION_TriggerEvent( 'GrassPoof23' );
		sleep( 0.4 );
		ACTION_TriggerEvent( 'DirtPoof07' );
		sleep( 0.4 );
		ACTION_TriggerEvent( 'GrassPoof13' );
		sleep( 0.5 );
		ACTION_TriggerEvent( 'DirtPoof08' );
		sleep( 0.7 );
		ACTION_TriggerEvent( 'GrassPoof19' );
		sleep( 0.5 );
		ACTION_TriggerEvent( 'DirtPoof09' );
		sleep( 0.1 );
		ACTION_TriggerEvent( 'GrassPoof20' );
		sleep( 0.4 );
		ACTION_TriggerEvent( 'DirtPoof10' );
		sleep( 0.5 );
		ACTION_TriggerEvent( 'GrassPoof16' );
		sleep( 0.8 );
		ACTION_TriggerEvent( 'DirtPoof11' );
		sleep( 0.3 );
		ACTION_TriggerEvent( 'GrassPoof17' );
		sleep( 0.2 );
		ACTION_TriggerEvent( 'DirtPoof12' );
		sleep( 1.0 );

	} Until( Hill30Uber_Ref.bStopSquibs )

	ScriptEnd:
}
