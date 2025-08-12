//=============================================================================
// TS_D00_1630_IntroHalfTrack.
//=============================================================================
class TS_D00_1630_IntroHalfTrack extends TriggeredScript
	placeable;

var gbxSVehicle MyVehicle;
var array<name> VehiclePathOneTags;

state Triggered
	{
		Begin:
					sleep( 34.0 );

				ACTION_TriggerEvent( 'HTS_IntroHalfTrack' );

					sleep( 2.0 );

				MyVehicle = gbxSVehicle( GetPawn( 'HalfTrack01' ) );

				Halftrack(MyVehicle).MaxThrust = 100.0; 

				VehiclePathOneTags[0]='PathNode01';
				VehiclePathOneTags[1]='PathNode02';
				VehiclePathOneTags[2]='PathNode03';
				VehiclePathOneTags[3]='PathNode04';
				VehiclePathOneTags[4]='PathNode05';
				VehiclePathOneTags[5]='PathNode06';
				VehiclePathOneTags[6]='PathNode07';
				VehiclePathOneTags[7]='PathNode08';
				VehiclePathOneTags[8]='PathNode09';
				VehiclePathOneTags[9]='PathNode10';
				VehiclePathOneTags[10]='PathNode11';
				VehiclePathOneTags[11]='PathNode12';
				VehiclePathOneTags[12]='PathNode13';
				VehiclePathOneTags[13]='PathNode14';
				VehiclePathOneTags[14]='PathNode15';
				VehiclePathOneTags[15]='PathNode16';
				VehiclePathOneTags[16]='PathNode17';
				VehiclePathOneTags[17]='PathNode18';
				VehiclePathOneTags[18]='PathNode19';

				ACTION_VehicleFollowPath( MyVehicle, VehiclePathOneTags );

				while ( !VehicleIsAtDestination( MyVehicle ) )
					{
						sleep( 0.5 );
					}

				MyVehicle.bDontFrustumCull = FALSE ;
				ACTION_DestroyActor( 'HalfTrack01' );

			//	Log( "*****Vehicle has reached destination One.*****" );
	}

