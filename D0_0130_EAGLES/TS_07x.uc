//=============================================================================
// TS_07x.
//=============================================================================
class TS_07x extends TriggeredScript
	placeable;

var AnimPawn AnimPawn_07;

enum CounterName
	{
		StartScene,
		Fidget,
		CorrionStandUp,
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
			AnimPawn_07 = AnimPawn(GetPawn('AP_07'));
			AnimPawn_07.bNoTurnBody = true;

			ACTION_PlayAnimDirect( AnimPawn_07 , 'sitting_A_idle_1', 0.1, 1.0, TRUE );
		Counter = Fidget;
	}

state Triggered
	{
		Begin:
			switch ( Counter )
				{
					case Fidget:
							Counter = CorrionStandUp;
								ACTION_PlayAnimDirect( AnimPawn_07 , 'sitting_A_idle_8', 0.1, 1.0, TRUE );
						break;

					case CorrionStandUp:
							Counter = StandUp;
								ACTION_PlayAnimDirect( AnimPawn_07 , 'sitting_A_look_at_corrion', 0.4, 1.0);
								ACTION_WaitForAnimEnd( AnimPawn_07 , 0);
								ACTION_PlayAnimDirect( AnimPawn_07 , 'sitting_A_idle_1', 0.1, 1.0, TRUE);
						break;

					case StandUp:
							Counter = Hookup;
								ACTION_PlayAnimDirect( AnimPawn_07 , 'sitting_to_standing_right_1', 0.4, 1.0);
								ACTION_WaitForAnimEnd( AnimPawn_07 , 0);
								ACTION_PlayAnimDirect( AnimPawn_07, 'standing_A_idle_clip_ready', 0.1, 1.0, TRUE,,,1 );
						break;

					case Hookup:
							Counter = EquipmentCheck;
									sleep(0.1);
								ACTION_PlayAnimDirect( AnimPawn_07 , 'standing_A_hook_up_1', 0.2, 1.0);
								ACTION_WaitForAnimEnd( AnimPawn_07 , 0);
								ACTION_PlayAnimDirect( AnimPawn_07 , 'standing_A_idle_10', 0.1, 1.0, true);
						break;

					case EquipmentCheck:
							Counter = SoundOff;
								ACTION_PlayAnimDirect( AnimPawn_07 , 'standing_equipment_check_himself', 0.2, 1.0);
								ACTION_WaitForAnimEnd( AnimPawn_07 , 0);
								ACTION_PlayAnimDirect( AnimPawn_07 , 'standing_A_idle_4', 0.1, 1.0, true);
						break;

					case SoundOff:
							Counter = BigBlast;
								ACTION_PlayAnimDirect( AnimPawn_07 , 'standing_A_idle_4', 0.4, 1.0);
								ACTION_WaitForAnimEnd( AnimPawn_07 , 0);
								ACTION_PlayAnimDirect( AnimPawn_07 , 'standing_A_idle_10', 0.4, 1.0, true);
						break;

					case BigBlast:
							Counter = Shake1;
								ACTION_PlayAnimDirect( AnimPawn_07 , 'b3_blowndown_1', 0.2, 1.0);
								ACTION_WaitForAnimEnd( AnimPawn_07 , 0);
								ACTION_PlayAnimDirect( AnimPawn_07 , 'b3_blowndown_1_idle1', 0.1, 1.0, true,,,1);
						break;

					case Shake1:
							Counter = Shake2;
						break;

					case Shake2:
							Counter = Shake3;
						break;

					case Shake3:
							Counter = Shake4;
						break;

					case Shake4:
							Counter = Shake5;
						break;

					case Shake5:
							Counter = StartScene;
						break;

					default:
						break;
				}
	}
