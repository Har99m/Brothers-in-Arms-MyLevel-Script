//=============================================================================
// DD_InfiniteGerman02Script.
//=============================================================================
class DD_InfiniteGerman02Script extends DD_InfiniteGermanScript
	placeable;

state Triggered
{
	Begin:
	
	do
	{
		sleep( 1.0 );

		if ( GermanSquad.GetNumLivingMembers() == 0 )
		{
			// SLog( "** iTime " $ iTime );
			// SLog( "** ScriptRef.PlayerPosition " $ ScriptRef.PlayerPosition );
			// SLog( "** m_eLocation[0] " $ m_eLocation[0] );
			// SLog( "** ScriptRef.Squad Distance " $ vSize(Unit_US.UnitCentroid - Location) );

			if (	ScriptRef.PlayerPosition != m_eLocation[0] &&
				ScriptRef.PlayerPosition != Position_F2BotmSand &&
				ScriptRef.PlayerPosition != Position_F2Botm04 &&
				ScriptRef.PlayerPosition != Position_F2Botm01 &&
				ScriptRef.PlayerPosition != Position_F2BotmCrack &&
				vSize(Unit_US.UnitCentroid - Location) > 5500.0 )
			{
				iTime++;

				if ( iTime > 19 )
				{
					// SLog( "** Spawned **" );
					iTime = 0;

					ACTION_TriggerEvent( GermanSpawnerTag[0] );
					ACTION_TriggerEvent( GermanSpawnerTag[1] );

					sleep( 1.0 );
					// ACTION_OrderMove( UnitTag, WaypointTag[0], TRUE );
					// sleep( 6.0 );
					// ACTION_OrderMove( UnitTag, 'F2BotmPeanutPath', TRUE );
					// sleep( 8.0 );
					ACTION_OrderMove( UnitTag, WaypointTag[1], TRUE );
				}
			}
			else
			{
				// SLog( "** Timer Reset **" );
				iTime = 0;
			}				
		}
	} until ( ScriptRef.ObjectiveComplete2 );

	ScriptEnd:
}


