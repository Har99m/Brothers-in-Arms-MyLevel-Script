//=============================================================================
// TS_D00_1630_BossHalfTrack.
//=============================================================================
class TS_D00_1630_BossHalfTrack extends TriggeredScript
	placeable;

var gbxSVehicle MyVehicle;
var array<name> VehiclePathOneTags;
var array<name> VehiclePathTwoTags;
var array<name> VehiclePathThreeTags;
var array<name> VehiclePathFourTags;
var bool bTriggerTwo, bTriggerThree;
var AnimPawn AP_DE_Halftrack_01 , AP_DE_Halftrack_02 , AP_DE_Halftrack_03 ;

var TS_D00_1630_SetupHT_CP HTCP_Ref;

state Triggered
	{
			function OnTrigger()
				{
					if( !bTriggerTwo )
						{
							Log( "Halftrack trigger #2" );
							bTriggerTwo = true;

							return;
						}

					if( !bTriggerThree )
						{
							Log( "Halftrack trigger #3" );
							bTriggerThree = true;

							return;
						}
    			}

		Begin:

			//=====Spawn Germans and Halftrack

				HTCP_Ref = TS_D00_1630_SetupHT_CP( GetFirstActor( 'TS_D00_1630_SetupHT_CP' ) );

				if( !HTCP_Ref.bCheckpointLoaded )
				{
					ACTION_TriggerEvent( 'CSG_C4_HT' );
						sleep( 0.2 );
					ACTION_TriggerEvent( 'HTS_BossHalfTrack' );

					AP_DE_Halftrack_01 = AnimPawn( GetPawn( 'Pawn_German_C4_HT_01' ));
					AP_DE_Halftrack_02 = AnimPawn( GetPawn( 'Pawn_German_C4_HT_02' ));
					AP_DE_Halftrack_03 = AnimPawn( GetPawn( 'Pawn_German_C4_HT_03' ));

					MyVehicle = gbxSVehicle(GetFirstActor( 'HalfTrack02' ) );
				}

				if( HTCP_Ref.bCheckpointLoaded )
				{
					ACTION_TriggerEvent( 'CSG_Checkpoint_HT' );
						sleep( 0.2 );
					ACTION_TriggerEvent( 'HTS_CheckpointHalfTrack' );

					AP_DE_Halftrack_01 = AnimPawn( GetPawn( 'Pawn_German_Checkpoint_HT_01' ));
					AP_DE_Halftrack_02 = AnimPawn( GetPawn( 'Pawn_German_Checkpoint_HT_02' ));
					AP_DE_Halftrack_03 = AnimPawn( GetPawn( 'Pawn_German_Checkpoint_HT_03' ));

					MyVehicle = gbxSVehicle(GetFirstActor( 'HalfTrack02_Checkpoint' ) );
				}

					sleep( 1.0 );


				AP_DE_Halftrack_01.Controller.bDemiGod = TRUE ;
				AP_DE_Halftrack_02.Controller.bDemiGod = TRUE ;
				AP_DE_Halftrack_03.Controller.bDemiGod = TRUE ;

				Halftrack( MyVehicle ).MaxThrust = 75.0; 

			//===== Path 1
				if( !HTCP_Ref.bCheckpointLoaded )
				{
					VehiclePathOneTags[0]='BossPathNode01';
					VehiclePathOneTags[1]='BossPathNode02';
					VehiclePathOneTags[2]='BossPathNode03';
					VehiclePathOneTags[3]='BossPathNode04';
					VehiclePathOneTags[4]='BossPathNode05';
				}
				if( HTCP_Ref.bCheckpointLoaded )
				{
					VehiclePathOneTags[0]='BossPathNode05';
				}

					sleep( 0.2 );

				ACTION_VehicleFollowPath( MyVehicle, VehiclePathOneTags );


				while ( !VehicleIsAtDestination( MyVehicle ) )
					{
						sleep( 0.5 );
					}


			Log( "*****Vehicle has reached destination One.*****" );

				while( !bTriggerTwo )  // wait for trigger #2
					{
						sleep( 0.1 );
					} 

					Halftrack( MyVehicle ).MaxThrust = 70.0; 

			//===== Path 2
					VehiclePathTwoTags[0]='BossPathNode05';
					VehiclePathTwoTags[1]='BossPathNode19';
					VehiclePathTwoTags[2]='BossPathNode20';
					VehiclePathTwoTags[3]='BossPathNode27';
					VehiclePathTwoTags[4]='BossPathNode28';
					VehiclePathTwoTags[5]='BossPathNode29';
					VehiclePathTwoTags[6]='BossPathNode30';
					VehiclePathTwoTags[7]='BossPathNode31';
					VehiclePathTwoTags[8]='BossPathNode32';
					VehiclePathTwoTags[9]='BossPathNode33';
					VehiclePathTwoTags[10]='BossPathNode34';
					VehiclePathTwoTags[11]='BossPathNode35';
					VehiclePathTwoTags[12]='BossPathNode36';
					VehiclePathTwoTags[13]='BossPathNode37';
					VehiclePathTwoTags[14]='BossPathNode38';
					VehiclePathTwoTags[15]='BossPathNode39';

						sleep( 0.2 );

					ACTION_VehicleFollowPath( MyVehicle, VehiclePathTwoTags );

					while ( !VehicleIsAtDestination( MyVehicle ) )
						{
							sleep( 5.0 );
						}

					Halftrack( MyVehicle ).MaxThrust = 35.0; 

					VehiclePathThreeTags[0]='BossPathNode39';
					VehiclePathThreeTags[1]='BossPathNode40';
					VehiclePathThreeTags[2]='BossPathNode41';
					VehiclePathThreeTags[3]='BossPathNode42';
					VehiclePathThreeTags[4]='BossPathNode43';
					VehiclePathThreeTags[5]='BossPathNode44';
					VehiclePathThreeTags[6]='BossPathNode45';
					VehiclePathThreeTags[7]='BossPathNode46';
					VehiclePathThreeTags[8]='BossPathNode47';
					VehiclePathThreeTags[9]='BossPathNode48';
					VehiclePathThreeTags[10]='BossPathNode49';
					VehiclePathThreeTags[11]='BossPathNode50';

						sleep( 0.2 );

					ACTION_VehicleFollowPath( MyVehicle, VehiclePathThreeTags );

					while ( !VehicleIsAtDestination( MyVehicle ) )
						{
							sleep( 5.0 );
						}

				Log( "*****Vehicle has reached destination Two.*****" );

					while( !bTriggerThree )  // wait for trigger #3
						{
							sleep( 0.1 );
						} 

				//===== Path 3
					VehiclePathFourTags[0]='BossPathNode50';
					VehiclePathFourTags[1]='BossPathNode51';
					VehiclePathFourTags[2]='BossPathNode44';
					VehiclePathFourTags[3]='BossPathNode45';
					VehiclePathFourTags[4]='BossPathNode46';
					VehiclePathFourTags[5]='BossPathNode47';
					VehiclePathFourTags[6]='BossPathNode48';
					VehiclePathFourTags[7]='BossPathNode52';
					VehiclePathFourTags[8]='BossPathNode53';
					VehiclePathFourTags[9]='BossPathNode54';
					VehiclePathFourTags[10]='BossPathNode55';
					VehiclePathFourTags[11]='BossPathNode56';
					VehiclePathFourTags[12]='BossPathNode57';
					VehiclePathFourTags[13]='BossPathNode58';
					VehiclePathFourTags[14]='BossPathNode59';
					VehiclePathFourTags[15]='BossPathNode60';
					VehiclePathFourTags[16]='BossPathNode61';
					VehiclePathFourTags[17]='BossPathNode62';
					VehiclePathFourTags[18]='BossPathNode63';
					VehiclePathFourTags[19]='BossPathNode64';
					VehiclePathFourTags[20]='BossPathNode65';
					VehiclePathFourTags[21]='BossPathNode66';
					VehiclePathFourTags[22]='BossPathNode67';

						sleep( 0.2 );

					ACTION_VehicleFollowPath( MyVehicle, VehiclePathFourTags );

					while ( !VehicleIsAtDestination( MyVehicle ) )
						{
							sleep( 2.0 );
						}

				Log( "*****Vehicle has reached destination Three.*****" );

				AP_DE_Halftrack_01.Controller.bDemiGod = FALSE ;
				AP_DE_Halftrack_02.Controller.bDemiGod = FALSE ;
				AP_DE_Halftrack_03.Controller.bDemiGod = FALSE ;


		ScriptEnd:
	}
