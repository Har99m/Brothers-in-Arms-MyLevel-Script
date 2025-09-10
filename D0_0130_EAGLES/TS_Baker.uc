//=============================================================================
// TS_Baker.
//=============================================================================
class TS_Baker extends TriggeredScript
	placeable;

var AnimPawn AnimPawn_Baker;

enum CounterName
	{
		StartScene,
		Fidget,
		LookUp,
		CorrionStandUp,
		StandUp,
		BigBlast,
		BakerStandInDoor,
		WingBlast,
		Dummy03,
		Dummy04,
		Dummy05,
		Dummy06,
		Dummy07,
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
		AnimPawn_Baker = AnimPawn(GetPawn('AP_Baker'));
		AnimPawn_Baker.bNoTurnBody = true;

		ACTION_PlayAnim( 'AP_Baker', 'sitting_A_idle_1', 0.1, 1.0, TRUE );
		Counter = Fidget;
	}

state Triggered
	{
		Begin:
			switch ( Counter )
				{
					case Fidget:
							Counter = LookUp;
							ACTION_PlayAnimDirect( AnimPawn_Baker , 'sitting_A_idle_1', 0.1, 1.0, TRUE );
								sleep(2.0);
							ACTION_PlayLocalSound ("D00130.VOICEOVER_A");
							ACTION_DisplaySubtitleMessage2( S_Localize( "VOICEOVER_A" ), 4.0, 1, 1, 1, TRUE, TRUE );
								//	Baker: I never asked to be squad leader, but I had no choice.

								sleep(4.5);
							ACTION_DisplaySubtitleMessage2( S_Localize( "VOICEOVER_B" ), 3.0, 1, 1, 1, TRUE, TRUE );
								//	Baker: Now I've got thirteen soldiers under my command.

								sleep(3.3);
							ACTION_DisplaySubtitleMessage2( S_Localize( "VOICEOVER_C" ), 4.9, 1, 1, 1, TRUE, TRUE );
								//	Baker: Thirteen men depending on me to make the right decisions and not get them killed.

								sleep(5.5);
							ACTION_DisplaySubtitleMessage2( S_Localize( "VOICEOVER_D" ), 4.9, 1, 1, 1, TRUE, TRUE );
								//	Baker: Thirteen families relying on me to bring their husbands and sons home.

								sleep(5.8);
							ACTION_DisplaySubtitleMessage2( S_Localize( "VOICEOVER_E" ), 2.0, 1, 1, 1, TRUE, TRUE );
								//	Baker: Thirteen.
						break;

					case LookUp:
							Counter = CorrionStandUp;
							slog ("Baker LookUp");
							ACTION_PlayAnimDirect( AnimPawn_Baker , 'Baker_looks_up', 0.1, 1.0);

								sleep ( 1.5 );
							ACTION_PlayLocalSound ("D00130.VOICEOVER_B");
							ACTION_DisplaySubtitleMessage2( S_Localize( "VOICEOVER_F" ), 3.4, 1, 1, 1, TRUE, TRUE );
								//	Baker: Thirteen is not a lucky number.

							ACTION_WaitForAnimEnd( AnimPawn_Baker, 0);
							ACTION_PlayAnimDirect( AnimPawn_Baker , 'baker_sitting_idle', 0.1, 1.0, true);
						break;

					case CorrionStandUp:
							Counter = StandUp;
							slog ("********************************************Baker WATCHING CORRION STAND UP");
							ACTION_PlayAnimDirect( AnimPawn_Baker , 'Baker_sitting_watch_Corrion', 0.1, 1.0);
							ACTION_WaitForAnimEnd( AnimPawn_Baker, 0);
						break;

					case StandUp:
							Counter = BigBlast;

							AnimPawn_Baker.RemoveExtendedAttachment('Head', 'baker');
							AnimPawn_Baker.AddExtendedAttachment('legbag', 'View');

							//ACTION_ChangePlayerFOV( 20.0, 0.5);

							slog ("Baker StandUp");
							ACTION_PlayAnimDirect( AnimPawn_Baker , 'Baker_stands', 0.5, 1.0);
							ACTION_WaitForAnimEnd( AnimPawn_Baker, 0);
							ACTION_PlayAnimDirect( AnimPawn_Baker , 'Baker_standing_idle', 0.2, 1.0, true,,,1);
						break;

					case BigBlast:
							Counter = BakerStandInDoor;
							ACTION_PlayAnimDirect( AnimPawn_Baker , 'baker_flak_reaction', 0.4, 1.0);
							ACTION_WaitForAnimEnd( AnimPawn_Baker, 0);
							ACTION_PlayAnimDirect( AnimPawn_Baker , 'Baker_standing_idle', 0.4, 1.0, true,,,1);
						break;

					case BakerStandInDoor:
							Counter = WingBlast;
							ACTION_PlayAnimDirect( AnimPawn_Baker , 'Baker_walks_to_door', 0.1, 1.0);
							ACTION_WaitForAnimEnd( AnimPawn_Baker , 0);
							ACTION_PlayAnimDirect( AnimPawn_Baker , 'Baker_standing_in_door', 0.1, 1.0, true,,,1);
						break;
					case WingBlast:
							Counter = StartScene;
							slog ("Baker Fallnow");
							ACTION_PlayLocalSound ("D00130.VOICEOVER_C");
								sleep(1.2);
							ACTION_DisplaySubtitleMessage2( S_Localize( "VOICEOVER_G" ), 2.4, 1, 1, 1, TRUE, TRUE );
							//	Baker: I never asked to be squad leader.
								sleep(6.0);
						break;

					default:
							SLog( "**** WTF Error in Counter ****" $ Counter );
						break;
				}
	}

