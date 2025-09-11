//=============================================================================
// BridgeRun_Script.
//=============================================================================
class BridgeRun_Script extends TriggeredScript
	placeable;

var ActorLite Dest_01 , Dest_02 , Dest_03 ;

var actor Truck1Pawn;
var actor TruckLight;
var actor TruckEmitter[2];

var AnimPawn Pawn_German_01 , Pawn_German_02 , Pawn_German_03 ;

state Triggered
	{
		Begin:
			//===== Define 
				Dest_01 = GetNavigationPoint( 'Path_Fake_Bridge_01' );
				Dest_02 = GetNavigationPoint( 'Path_Fake_Bridge_02' );
				Dest_03 = GetNavigationPoint( 'Path_Fake_Bridge_03' );

				Truck1Pawn = GetFirstActor( 'StaticMesh_Truck1' );
				TruckLight = GetFirstActor( 'Light_Truck' );
				TruckEmitter[0] = GetFirstActor( 'Emitter_Truck' );
				TruckEmitter[1] = GetFirstActor( 'Emitter_Headlights' );

				Truck1Pawn.bHidden = False;

				TruckLight.SetBase( Truck1Pawn );
				TruckEmitter[0].SetBase( Truck1Pawn );
				TruckEmitter[1].SetBase( Truck1Pawn );

				ACTION_TriggerEvent('Truck1_Scene');
				ACTION_TriggerEvent('Emitter_Truck');

			//===== Germans spawned in
				ACTION_TriggerEvent('SpawnFakeRun1');

			//===== Define 
				Pawn_German_01 = AnimPawn( GetPawn( 'FakeRun1' ));
				Pawn_German_02 = AnimPawn( GetPawn( 'FakeRun2' ));
				Pawn_German_03 = AnimPawn( GetPawn( 'FakeRun3' ));

			//===== Move Germans
				ACTION_MoveToward( Pawn_German_01 , Dest_01 , FALSE );
				ACTION_MoveToward( Pawn_German_02 , Dest_02 , FALSE );
				ACTION_MoveToward( Pawn_German_03 , Dest_03 , FALSE );

			//===== Germans yell
				ACTION_PlaySound( 'FakeRun1', "D_GERMAN_A.G_run_d", 255, 1, 1024);
					sleep( 5.0 );
				ACTION_PlaySound( 'FakeRun2', "D_GERMAN_A.G_Move_right_b", 255, 1, 1024);
					sleep( 15.0 );
				ACTION_PlaySound( 'FakeRun1', "D_GERMAN_A.G_GO!_b", 255, 1, 1024);
					sleep( 5.0 );
				ACTION_PlaySound( 'FakeRun3', "D_GERMAN_A.G_Americans!_b", 255, 1, 1024);

				ACTION_DestroyActor('Emitter_Headlights');
				ACTION_DestroyActor('Emitter_Truck');
				ACTION_DestroyActor('StaticMesh_Truck1');
				ACTION_DestroyActor('Light_Truck');

			//===== Wait for FIRST german to reach his destination and then destroy
				While( !PawnIsAtDestination( Pawn_German_01 , Dest_01 ))
					{
							sleep( 0.5 );
						ACTION_MoveToward( Pawn_German_01 , Dest_01 , FALSE );
					}
						ACTION_DestroyActor( 'FakeRun1' );

			//===== Wait for SECOND german to reach his destination and then destroy
				While( !PawnIsAtDestination( Pawn_German_02 , Dest_02 ))
					{
							sleep( 0.5 );
						ACTION_MoveToward( Pawn_German_02 , Dest_02 , FALSE );
					}
						ACTION_DestroyActor( 'FakeRun2' );

			//===== Wait for THIRD german to reach his destination and then destroy
				While( !PawnIsAtDestination( Pawn_German_03 , Dest_03 ))
					{
							sleep( 0.5 );
						ACTION_MoveToward( Pawn_German_03 , Dest_03 , FALSE );
					}
						ACTION_DestroyActor( 'FakeRun3' );
	}	
