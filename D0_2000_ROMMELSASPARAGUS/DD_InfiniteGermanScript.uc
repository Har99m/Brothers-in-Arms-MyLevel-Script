//=============================================================================
// DD_InfiniteGermanScript.
// Author: Dorian Gorski
// Triggered by: DD_FieldScript
//=============================================================================

class DD_InfiniteGermanScript extends TriggeredScript
	placeable;

var() name WaypointTag[2];
var() name UnitTag;
var() name GermanSpawnerTag[2];
var() DD_CombatSI.ScriptState m_eLocation[2];

var int  iTime;
var Unit GermanSquad, Unit_US;
var DD_CombatSI ScriptRef;

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
{
	iTime = 0;

	GermanSquad = GetUnit( UnitTag );
	Unit_US = GetUnit( 'Unit01' );

	ScriptRef = DD_CombatSI( GetFirstActor('DD_CombatSI') );
}

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
				vSize(Unit_US.UnitCentroid - Location) > 3000.0 )
			{
				iTime++;

				if ( iTime > 19 )
				{
					// SLog( "** Spawned **" );
					iTime = 0;

					ACTION_TriggerEvent( GermanSpawnerTag[0] );
					ACTION_TriggerEvent( GermanSpawnerTag[1] );

					sleep( 1.0 );
					ACTION_OrderMove( UnitTag, WaypointTag[0], TRUE );
					ACTION_OrderMove( UnitTag, WaypointTag[1], TRUE );
				}
			}
			else
			{
				// SLog( "** Timer Reset **" );
				iTime = 0;
			}		
		}
	} until ( ScriptRef.ObjectiveComplete );

	// SLog( "IGS01: Ended" );

	ScriptEnd:
}


