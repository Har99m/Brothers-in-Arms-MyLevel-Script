//=============================================================================
// TS_02x.
//=============================================================================
class TS_02x extends TriggeredScript
	placeable;

var AnimPawn AnimPawn_02;
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
		AnimPawn_02 = AnimPawn(GetPawn('AP_02'));
		AnimPawn_02.bNoTurnBody = true;

		ACTION_PlayAnimDirect( AnimPawn_02 , 'sitting_A_idle_8', 0.1, 1.0, TRUE );
		Counter = Fidget;
	}

state Triggered
	{
		Begin:

			IF (Counter == Fidget)
				{
					Counter = StandUp;
						ACTION_PlayAnimDirect( AnimPawn_02 , 'sitting_A_idle_1', 0.1, 1.0, TRUE );
				}

			ELSE IF (Counter == StandUp)
				{
					Counter = Hookup;
						ACTION_PlayAnimDirect( AnimPawn_02 , 'sitting_to_standing_left_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_02 , 0);
						ACTION_PlayAnimDirect( AnimPawn_02 , 'standing_A_idle_clip_ready', 0.1, 1.0, TRUE,,,1 );
				}

			ELSE IF (Counter == Hookup)
				{
					Counter = EquipmentCheck;
							sleep(0.1);
						ACTION_PlayAnimDirect( AnimPawn_02 , 'standing_A_hook_up_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_02 , 0);
						ACTION_PlayAnimDirect( AnimPawn_02 , 'standing_A_idle_10', 0.1, 1.0, true);
				}

			ELSE IF (Counter == EquipmentCheck)
				{
					Counter = SoundOff;
						ACTION_PlayAnimDirect( AnimPawn_02 , 'standing_equipment_check_A_1', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_02 , 0);
						ACTION_PlayAnimDirect( AnimPawn_02 , 'standing_A_idle_10', 0.1, 1.0, true);
				}

			ELSE IF (Counter == SoundOff)
				{
					Counter = BigBlast;
				}

			ELSE IF (Counter == BigBlast)
				{
					Counter = Shake1;
						ACTION_PlayAnimDirect( AnimPawn_02 , 'b3_blowndown_4', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_02 , 0);
						ACTION_PlayAnimDirect( AnimPawn_02 , 'b3_blowndown_4_idle', 0.1, 1.0, true,,,1);
				}

			ELSE IF (Counter == Shake1)
				{
					Counter = Shake2;
//						ACTION_PlayAnim( 'AP_02', 'standing_A_flak_reaction_1', 0.2, 1.0);
//						ACTION_WaitForAnimEnd( AnimPawn_02, 0);
//						ACTION_PlayAnim( 'AP_02', 'standing_A_idle_1', 0.1, 1.0, true,,,true);
				}

			ELSE IF (Counter == Shake2)
				{
					Counter = Shake3;
//						ACTION_PlayAnim( 'AP_02', 'standing_A_flak_reaction_2', 0.2, 1.0);
//						ACTION_WaitForAnimEnd( AnimPawn_02, 0);
//						ACTION_PlayAnim( 'AP_02', 'standing_A_idle_1', 0.1, 1.0, true,,,true);
				}

			ELSE IF (Counter == Shake3)
				{
					Counter = Shake4;
//						ACTION_PlayAnim( 'AP_02', 'standing_A_flak_reaction_3', 0.2, 1.0);
//						ACTION_WaitForAnimEnd( AnimPawn_02, 0);
//						ACTION_PlayAnim( 'AP_02', 'standing_A_idle_1', 0.1, 1.0, true,,,true);
				}

			ELSE IF (Counter == Shake4)
				{
					Counter = Shake5;
//						ACTION_PlayAnim( 'AP_02', 'standing_A_flak_reaction_4', 0.2, 1.0);
//						ACTION_WaitForAnimEnd( AnimPawn_02, 0);
//						ACTION_PlayAnim( 'AP_02', 'standing_A_idle_1', 0.1, 1.0, true,,,true);
				}

			ELSE IF (Counter == Shake5)
				{
					Counter = StartScene;
//						ACTION_PlayAnim( 'AP_02', 'standing_A_flak_reaction_5', 0.2, 1.0);
//						ACTION_WaitForAnimEnd( AnimPawn_02, 0);
//						ACTION_PlayAnim( 'AP_02', 'standing_A_idle_1', 0.1, 1.0, true,,,true);
				}
	}
