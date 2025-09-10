//=============================================================================
// TS_04x.
//=============================================================================
class TS_04x extends TriggeredScript
	placeable;

var AnimPawn AnimPawn_04;
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
		AnimPawn_04 = AnimPawn(GetPawn('AP_04'));
		AnimPawn_04.bNoTurnBody = true;

		ACTION_PlayAnimDirect( AnimPawn_04 , 'sitting_B_idle_1', 0.1, 1.0, TRUE );
		Counter = Fidget;
	}


state Triggered
	{
		Begin:
			IF (Counter == Fidget)
				{
					Counter = StandUp;
						ACTION_PlayAnimDirect( AnimPawn_04 , 'sitting_B_idle_1', 0.1, 1.0, TRUE );
				}

			ELSE IF (Counter == StandUp)
				{
					Counter = Hookup;
						ACTION_PlayAnimDirect( AnimPawn_04 , 'sitting_to_standing_left_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_04 , 0);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'standing_B_idle_clip_ready', 0.1, 1.0, TRUE,,,1 );
				}

			ELSE IF (Counter == Hookup)
				{
					Counter = EquipmentCheck;
							sleep(0.2);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'standing_B_hook_up_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_04 , 0);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'standing_B_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == EquipmentCheck)
				{
					Counter = SoundOff;
						ACTION_PlayAnimDirect( AnimPawn_04 , 'standing_equipment_check_B_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_04 , 0);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'standing_B_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == SoundOff)
				{
					Counter = BigBlast;
				}

			ELSE IF (Counter == BigBlast)
				{
					Counter = Shake1;
						ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_boom_B', 0.2, 1.2);
						ACTION_WaitForAnimEnd( AnimPawn_04 , 0);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_idle_2', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake1)
				{
					Counter = Shake2;
						sleep(0.2);
					ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_flak_3', 0.2, 1.0);
					ACTION_WaitForAnimEnd( AnimPawn_04 , 0);
					ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake2)
				{
					Counter = Shake3;
							sleep(0.6);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_flak_3', 0.2, 0.8);
						ACTION_WaitForAnimEnd( AnimPawn_04 , 0);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_idle_2', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake3)
				{
					Counter = Shake4;
							sleep(0.4);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_flak_1', 0.2, 1.2);
						ACTION_WaitForAnimEnd( AnimPawn_04 , 0);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_idle_3', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake4)
				{
					Counter = Shake5;
							sleep(0.2);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_flak_1', 0.2, 1.4);
						ACTION_WaitForAnimEnd( AnimPawn_04 , 0);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_idle_2', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake5)
				{
					Counter = StartScene;
							sleep(0.1);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_flak_2', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_04 , 0);
						ACTION_PlayAnimDirect( AnimPawn_04 , 'b3_backmarker_idle_2', 0.1, 1.0, true);
				}
	}
