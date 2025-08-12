//=============================================================================
// NBS_MortarScript.
//=============================================================================
class NBS_MortarScript extends TriggeredScript
	placeable;

var NBS_Hill30UberScene Hill30Uber_Ref;
var int i;

state Triggered
{
	Begin:

	Hill30Uber_Ref = NBS_Hill30UberScene( GetFirstActor( 'NBS_Hill30UberScene' ) );

	do{

		i = Rand( 10 );

		switch ( i )
		{
			Case 0:
				ACTION_TriggerEvent( 'Hill30Mortar1' );
				Sleep( 4.0 );
				break;
			Case 1:
				ACTION_TriggerEvent( 'Hill30Mortar2' );
				Sleep( 3.0 );
				break;
			Case 2:
				ACTION_TriggerEvent( 'Hill30Mortar3' );
				Sleep( 2.0 );
				break;
			Case 3:
				ACTION_TriggerEvent( 'Hill30Mortar4' );
				Sleep( 5.0 );
				break;
			Case 4:
				ACTION_TriggerEvent( 'Hill30Mortar5' );
				Sleep( 6.0 );
				break;
			Case 5:
				ACTION_TriggerEvent( 'Hill30Mortar6' );
				Sleep( 4.5 );
				break;
			Case 6:
				ACTION_TriggerEvent( 'Hill30Mortar7' );
				Sleep( 3.5 );
				break;
			Case 7:
				ACTION_TriggerEvent( 'Hill30Mortar8' );
				Sleep( 4.5 );
				break;
			Case 8:
				ACTION_TriggerEvent( 'Hill30Mortar9' );
				Sleep( 2.5 );
				break;
			Case 9:
				ACTION_TriggerEvent( 'Hill30Mortar10' );
				Sleep( 5.0 );
				break;
			default:
				SLog( "Error: No mortars falling." );
				break;
		}

	}until( Hill30Uber_Ref.bStopMortars )
	
}
