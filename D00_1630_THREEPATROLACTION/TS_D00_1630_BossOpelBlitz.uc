//=============================================================================
// TS_D00_1630_BossOpelBlitz.
//=============================================================================
class TS_D00_1630_BossOpelBlitz extends TriggeredScript
	placeable;

//var gbxSVehicle MyVehicle;
//var array<name> VehiclePathOneTags;

var Unit GermanUnit;

state Triggered
	{
		Begin:

//				MyVehicle = gbxSVehicle(GetFirstActor( 'BossOpelBlitz' ) );

				//===== Turn on these nodes
				ACTION_UnBlockNavPoint( 'OpelPathNode04' );
				ACTION_UnBlockNavPoint( 'OpelPathNode03' );
/*
				TruckOpelBlitz(MyVehicle).GroundSpeed = 25.0;

				VehiclePathOneTags[0]='OpelPathNode01';
				VehiclePathOneTags[1]='OpelPathNode02';
				VehiclePathOneTags[2]='OpelPathNode03';
				VehiclePathOneTags[3]='OpelPathNode04';
				VehiclePathOneTags[4]='OpelPathNode05';
				VehiclePathOneTags[5]='OpelPathNode06';
				VehiclePathOneTags[6]='OpelPathNode07';
				VehiclePathOneTags[7]='OpelPathNode08';
				VehiclePathOneTags[8]='OpelPathNode09';
				VehiclePathOneTags[9]='OpelPathNode10';
				VehiclePathOneTags[10]='OpelPathNode11';
				VehiclePathOneTags[11]='OpelPathNode12';

				ACTION_VehicleFollowPath( MyVehicle, VehiclePathOneTags );

				while ( !VehicleIsAtDestination( MyVehicle ) )
					{
						sleep( 0.5 );
					}

				Log( "*****Vehicle has reached destination One.*****" );

				ACTION_TriggerEvent( 'BossOpelBlitz' );
					sleep( 1.0 );
				ACTION_OrderMove( 'Unit_DE_C4_OpelGuys' , 'PN_C1_DE03_Move_B' );
					sleep( 1.0 );
*/
				GermanUnit = Unit( GetFirstActor( 'Unit_DE_C4_LastSquad' ) );

				while( GermanUnit.GetNumLivingMembers() != 0 )
					{
						sleep( 2.0 );
					}

				ACTION_TriggerEvent( 'Trigger_LastWaypoint' );
	}
