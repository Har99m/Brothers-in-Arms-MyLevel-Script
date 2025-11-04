//=============================================================================
// SearchBeams.
//=============================================================================
class SearchBeams extends TriggeredScript
	placeable;

state triggered
	{
		Begin:
				sleep( 3.0 );
			ACTION_TriggerEvent( 'SearchBeamsStagger' );
	}
