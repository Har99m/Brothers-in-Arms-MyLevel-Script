//=============================================================================
// germansrun2_script.
//=============================================================================
class germansrun2_script extends TriggeredScript
	placeable;

var Animpawn Pawn_Fake_01 , Pawn_Fake_02 ;
var Actorlite Dest_01 , Dest_02 ;

state Triggered
	{
		Begin:

		Slog( "------------ GERMAN RUN TWO SCRIPT TRIGGERED --------------" );

		//===== Define
			ACTION_TriggerEvent( 'SpawnFakeRun2' );
			Pawn_Fake_01 = AnimPawn( GetPawn( 'FakeRun21' ));
			Pawn_Fake_02 = AnimPawn( GetPawn( 'FakeRun22' ));
			Dest_01 = GetNavigationPoint( 'Path_Fake_Run_01' );
			Dest_02 = GetNavigationPoint( 'Path_Fake_Run_02' );

				sleep( 1.0 );

			ACTION_TriggerEvent( 'EndGame' );

			ACTION_PlaySound( 'FakeRun21', "D_GERMAN_A.G_run_c", 255, 1, 1024 );
	
		//===== Move Germans
			ACTION_MoveToward( Pawn_Fake_01 , Dest_01 , FALSE );
				sleep( 0.5 );
			ACTION_MoveToward( Pawn_Fake_02 , Dest_02 , FALSE );
	
				sleep( 3.0 );
			ACTION_PlaySound( 'FakeRun22', "D_GERMAN_A.G_Move_right_c", 255, 1, 1024 );

				sleep( 7.0 );
			ACTION_PlaySound( 'FakeRun21', "D_GERMAN_A.G_GO!_a", 255, 1, 1024 );

		//===== Wait for pawns to reach destinations before destroying them
			While( !PawnIsAtDestination( Pawn_Fake_01 , Dest_01 ))
				{
						sleep( 0.5 );
					ACTION_MoveToward( Pawn_Fake_01 , Dest_01 , FALSE );
				}

					ACTION_DestroyActor( 'FakeRun21' );

			While( !PawnIsAtDestination( Pawn_Fake_02 , Dest_02 ))
				{
						sleep( 0.5 );
					ACTION_MoveToward( Pawn_Fake_02 , Dest_02 , FALSE );
				}

					ACTION_DestroyActor( 'FakeRun22' );
	}
