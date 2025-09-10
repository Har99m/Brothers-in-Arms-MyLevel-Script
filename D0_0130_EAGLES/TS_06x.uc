//=============================================================================
// TS_06x.
//=============================================================================
class TS_06x extends TriggeredScript
	placeable;

var AnimPawn AnimPawn_06;
enum CounterName
	{
		StartScene,
		Fidget,
		StandUp,
		Hookup,
		EquipmentCheck,
		SoundOff,
		BigBlast,
		Shake1,
		Shake2,
		Shake3,
		Shake4,
		Shake5,
		Dummy08,
		Dummy09,
		Dummy10,
		Dummy11,
		Dummy12,
		Dummy13,
		Dummy14,
		Dummy15
	};

var CounterName Counter;

function OnStart()
	{
		Super.OnStart();

		slog ("OnStart");
		Counter = StartScene;
			AnimPawn_06 = AnimPawn(GetPawn('AP_06'));
			AnimPawn_06.bNoTurnBody = true;

			ACTION_PlayAnimDirect( AnimPawn_06, 'sitting_B_idle_1', 0.1, 1.0, TRUE );
		Counter = Fidget;
	}


state Triggered
	{
		Begin:
			IF (Counter == Fidget)
				{
					Counter = StandUp;
						ACTION_PlayAnimDirect( AnimPawn_06 , 'sitting_B_idle_4', 0.1, 1.0, TRUE );
							sleep(10.0);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'sitting_puke', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_06 , 0);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'sitting_B_idle_1', 0.1, 1.0, TRUE );
				}

			ELSE IF (Counter == StandUp)
				{
					Counter = Hookup;
						ACTION_PlayAnimDirect( AnimPawn_06 , 'sitting_to_standing_left_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_06 , 0);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'standing_B_idle_clip_ready', 0.1, 1.0, TRUE,,,1 );
				}

			ELSE IF (Counter == Hookup)
				{
					Counter = EquipmentCheck;
							sleep(0.6);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'standing_B_hook_up_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_06 , 0);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'standing_B_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == EquipmentCheck)
				{
					Counter = SoundOff;
						ACTION_PlayAnimDirect( AnimPawn_06 , 'standing_equipment_check_B_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_06 , 0);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'standing_B_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == SoundOff)
				{
					Counter = BigBlast;
							sleep(1.8);
						ACTION_PlayLipSyncSound( 'AP_06', "D00130.REDSHIRTC_A", 1.0 , 1.0 , 1024.0 , TRUE);
						ACTION_DisplaySubtitleMessage2( S_Localize( "REDSHIRT_C" ), 1.0, 1, 1, 1, TRUE, TRUE );
							//	Fourteen OK!

							sleep(1.4);
						ACTION_PlayLipSyncSound( 'AP_12', "D00130.REDSHIRTB_A", 1.0 , 1.0 , 1024.0 , TRUE);
						ACTION_DisplaySubtitleMessage2( S_Localize( "REDSHIRT_B" ), 1.0, 1, 1, 1, TRUE, TRUE );
							//	Thirteen OK!

							sleep(1.4);
						ACTION_PlayLipSyncSound( 'AP_05', "D00130.REDSHIRTA_A", 1.0 , 1.0 , 1024.0 , TRUE);
						ACTION_DisplaySubtitleMessage2( S_Localize( "REDSHIRT_A" ), 1.0, 1, 1, 1, TRUE, TRUE );
							//	Twelve OK!
				}

			ELSE IF (Counter == BigBlast)
				{
					Counter = Shake1;
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_boom_B', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_06 , 0);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_idle_3', 0.1, 1.0, true,,,1);
				}

			ELSE IF (Counter == Shake1)
				{
					Counter = Shake2;
							sleep(0.3);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_flak_2', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_06 , 0);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake2)
				{	
					Counter = Shake3;
							sleep(0.2);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_flak_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_06 , 0);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_idle_3', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake3)
				{
					Counter = Shake4;
							sleep(0.4);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_flak_2', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_06 , 0);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_idle_3', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake4)
				{
					Counter = Shake5;
							sleep(0.1);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_flak_2', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_06 , 0);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake5)
				{
					Counter = StartScene;
							sleep(0.6);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_flak_3', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_06 , 0);
						ACTION_PlayAnimDirect( AnimPawn_06 , 'b3_backmarker_idle_1', 0.1, 1.0, true);
				}
	}

