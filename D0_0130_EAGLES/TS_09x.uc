//=============================================================================
// TS_09x.
//=============================================================================
class TS_09x extends TriggeredScript
	placeable;

var AnimPawn AnimPawn_09;
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
			AnimPawn_09 = AnimPawn(GetPawn('AP_09'));
			AnimPawn_09.bNoTurnBody = true;

			ACTION_PlayAnimDirect( AnimPawn_09 , 'sitting_B_idle_1', 0.1, 1.0, TRUE );
		Counter = Fidget;
	}

state Triggered
	{
		Begin:
			IF (Counter == Fidget)
				{
					Counter = StandUp;
						ACTION_PlayAnimDirect( AnimPawn_09, 'sitting_B_idle_4', 0.1, 1.0, TRUE );
				}

			ELSE IF (Counter == StandUp)
				{
					Counter = Hookup;
						ACTION_PlayAnimDirect( AnimPawn_09 , 'sitting_to_standing_right_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_09 , 0);
						ACTION_PlayAnimDirect( AnimPawn_09 , 'standing_B_idle_clip_ready', 0.1, 1.0, TRUE,,,1 );
				}

			ELSE IF (Counter == Hookup)
				{
					Counter = EquipmentCheck;
							sleep(0.35);
						ACTION_PlayAnimDirect( AnimPawn_09 , 'standing_B_hook_up_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_09 , 0);
						ACTION_PlayAnimDirect( AnimPawn_09 , 'standing_B_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == EquipmentCheck)
				{
					Counter = SoundOff;
						ACTION_PlayAnimDirect( AnimPawn_09 , 'standing_equipment_check_B_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_09 , 0);
						ACTION_PlayAnimDirect( AnimPawn_09 , 'standing_B_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == SoundOff)
				{
					Counter = BigBlast;
				}

			ELSE IF (Counter == BigBlast)
				{
					Counter = Shake1;
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_boom_B', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_09 , 0);
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_idle_2', 0.1, 1.0, true,,,1);
				}

			ELSE IF (Counter == Shake1)
				{
					Counter = Shake2;
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_flak_2', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_09 , 0);
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_idle_2', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake2)
				{
					Counter = Shake3;
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_flak_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_09 , 0);
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_idle_3', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake3)
				{
					Counter = Shake4;
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_flak_3', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_09 , 0);
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake4)
				{
					Counter = Shake5;
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_flak_3', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_09 , 0);
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == Shake5)
				{
					Counter = StartScene;
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_flak_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_09 , 0);
						ACTION_PlayAnimDirect( AnimPawn_09 , 'b3_backmarker_idle_3', 0.1, 1.0, true);
				}
	}
