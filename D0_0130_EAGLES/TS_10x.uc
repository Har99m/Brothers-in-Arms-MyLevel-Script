//=============================================================================
// TS_10x.
//=============================================================================
class TS_10x extends TriggeredScript
	placeable;

var AnimPawn AnimPawn_10;
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
			AnimPawn_10 = AnimPawn(GetPawn('AP_10'));
			AnimPawn_10.bNoTurnBody = true;

			ACTION_PlayAnimDirect( AnimPawn_10 , 'sitting_C_idle_1', 0.1, 1.0, TRUE );
		Counter = Fidget;
	}

state Triggered
	{
		Begin:
			IF (Counter == Fidget)
				{
					Counter = StandUp;
						ACTION_PlayAnimDirect( AnimPawn_10 , 'sitting_C_idle_14', 0.1, 1.0, TRUE );
				}

			ELSE IF (Counter == StandUp)
				{
					Counter = Hookup;
						ACTION_PlayAnimDirect( AnimPawn_10 , 'sitting_to_standing_right_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_10 , 0);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'standing_C_idle_clip_ready', 0.1, 1.0, TRUE,,,1 );
				}

			ELSE IF (Counter == Hookup)
				{
					Counter = EquipmentCheck;
							sleep(0.47);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'standing_C_hook_up_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_10 , 0);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'standing_C_idle_2', 0.1, 1.0, true);
				}

			ELSE IF (Counter == EquipmentCheck)
				{
					Counter = SoundOff;
						ACTION_PlayAnimDirect( AnimPawn_10 , 'standing_equipment_check_C_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_10 , 0);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'standing_C_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == SoundOff)
				{
					Counter = BigBlast;
				}

			ELSE IF (Counter == BigBlast)
				{
					Counter = Shake1;
						ACTION_PlayAnimDirect( AnimPawn_10 , 'b3_backmarker_boom_C', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_10 , 0);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'b3_backmarker_idle_1', 0.1, 1.0, true,,,1);
				}

			ELSE IF (Counter == Shake1)
				{
					Counter = Shake2;
							sleep(0.2);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'b3_backmarker_flak_1', 0.2, 1.3);
						ACTION_WaitForAnimEnd( AnimPawn_10 , 0);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'b3_backmarker_idle_1', 0.1, 1.0, true,,,1);
				}

			ELSE IF (Counter == Shake2)
				{
					Counter = Shake3;
							sleep(0.3);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'b3_backmarker_flak_1', 0.2, 1.1);
						ACTION_WaitForAnimEnd( AnimPawn_10 , 0);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'standing_C_idle_1', 0.1, 1.0, true,,,1);
				}

			ELSE IF (Counter == Shake3)
				{
					Counter = Shake4;
							sleep(0.5);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'b3_backmarker_flak_1', 0.2, 0.9);
						ACTION_WaitForAnimEnd( AnimPawn_10 , 0);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'b3_backmarker_idle_1', 0.1, 1.0, true,,,1);
				}

			ELSE IF (Counter == Shake4)
				{
					Counter = Shake5;
							sleep(0.4);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'b3_backmarker_flak_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_10 , 0);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'b3_backmarker_idle_1', 0.1, 1.0, true,,,1);
				}

			ELSE IF (Counter == Shake5)
				{
					Counter = StartScene;
							sleep(0.5);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'b3_backmarker_flak_1', 0.2, 1.2);
						ACTION_WaitForAnimEnd( AnimPawn_10 , 0);
						ACTION_PlayAnimDirect( AnimPawn_10 , 'b3_backmarker_idle_1', 0.1, 1.0, true,,,1);
				}
	}

