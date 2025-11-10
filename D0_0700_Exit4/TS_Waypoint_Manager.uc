//=============================================================================
// TS_Waypoint_Manager.
//=============================================================================
class TS_Waypoint_Manager extends TriggeredScript
	placeable;

var name Current_Waypoint;
var name Waypoint_to_Set;
var bool bWayManagerComplete;

function PostBeginPlay()
{
	Super.PostBeginPlay();		
	bWayManagerComplete = false;
}

// Process incoming UserData
function bool ReceiveGBXMessage( gbxMessage msg )
{
	local bool bResult; 

	bResult = Super.ReceiveGBXMessage( msg );

	if ( msg.UserData != 0 )
	{
		slog ( "Receiving GBXMessage " $ msg );
		slog ( "UserData=" $ msg.UserData );

		switch ( msg.UserData )
		{
			case 150:
				Waypoint_to_Set = 'Waypoint_AfterTraining';
				break;
			case 151:
				Waypoint_to_Set = 'Waypoint_Combat1';
				break;
			case 152:
				Waypoint_to_Set = 'Waypoint_Combat2';
				break;
			case 153:
				Waypoint_to_Set = 'Waypoint_Mortar';
				break;
			case 154:
				Waypoint_to_Set = 'Waypoint_Downhill';
				break;
			case 155:
				Waypoint_to_Set = 'Waypoint_AandG';
				break;
			case 156:
				Waypoint_to_Set = 'Waypoint_MG';
				break;
			case 157:
				Waypoint_to_Set = 'Waypoint_Final';
				break;
			case 199:
				// Kill the waypoint manager and set the final waypoint
				bWayManagerComplete = true;
				break;
		}
	}
	return bResult; 
}

state Triggered
{
Begin:

	do
	{
		sleep( 1.0 );

		if( Waypoint_to_Set != Current_Waypoint )
		{
			// Turn off the current waypoint
			switch( Current_Waypoint )
			{
				case 'Waypoint_AfterTraining':
					ACTION_TriggerEvent( 'Waypoint_AfterTraining' );
					break;
				case 'Waypoint_Combat1':
					ACTION_TriggerEvent( 'Waypoint_Combat1' );
					break;
				case 'Waypoint_Combat2':
					ACTION_TriggerEvent( 'Waypoint_Combat2' );
					break;
				case 'Waypoint_Mortar':
					ACTION_TriggerEvent( 'Waypoint_Mortar' );
					break;
				case 'Waypoint_Downhill':
					ACTION_TriggerEvent( 'Waypoint_Downhill' );
					break;
				case 'Waypoint_AandG':
					ACTION_TriggerEvent( 'Waypoint_AandG' );
					break;
				case 'Waypoint_MG':
					ACTION_TriggerEvent( 'Waypoint_MG' );
					break;
				case 'Waypoint_Final':
					ACTION_TriggerEvent( 'Waypoint_Final' );
					break;
			}

			// Turn on the next waypoint
			switch( Waypoint_to_Set )
			{
				case 'Waypoint_AfterTraining':
					ACTION_TriggerEvent( 'Waypoint_AfterTraining' );
					break;
				case 'Waypoint_Combat1':
					ACTION_TriggerEvent( 'Waypoint_Combat1' );
					break;
				case 'Waypoint_Combat2':
					ACTION_TriggerEvent( 'Waypoint_Combat2' );
					break;
				case 'Waypoint_Mortar':
					ACTION_TriggerEvent( 'Waypoint_Mortar' );
					break;
				case 'Waypoint_Downhill':
					ACTION_TriggerEvent( 'Waypoint_Downhill' );
					break;
				case 'Waypoint_AandG':
					ACTION_TriggerEvent( 'Waypoint_AandG' );
					break;
				case 'Waypoint_MG':
					ACTION_TriggerEvent( 'Waypoint_MG' );
					break;
				case 'Waypoint_Final':
					ACTION_TriggerEvent( 'Waypoint_Final' );
					break;
			}

			// Set the new current waypoint
			Current_Waypoint = Waypoint_to_Set;

		}
	} until( bWayManagerComplete == true );

ScriptEnd:

	// Turn off the swamp waypoint
	ACTION_TriggerEvent( 'Waypoint_MG' );

	// Turn on the gate waypoint
	ACTION_TriggerEvent( 'Waypoint_Final' );

}
