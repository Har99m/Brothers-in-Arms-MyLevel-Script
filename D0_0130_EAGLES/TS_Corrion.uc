//=============================================================================
// TS_Corrion.
//=============================================================================
class TS_Corrion extends TriggeredScript
	placeable;

var AnimPawn AnimPawn_Corrion;

enum CounterName
	{
		StartScene,
		Fidget,
		CorrionStandUp,
		CorrionStandUpDialogue,
		CorrionHookUpDialogue,
		CorrionEquipmentCheckDialogue,
		CorrionFindBakerDialogue,
		SoundOff,
		BigBlast,
		BakerStandInDoor,
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
			AnimPawn_Corrion = AnimPawn( GetPawn('AP_Corrion'));
			AnimPawn_Corrion.bNoTurnBody = true;
			ACTION_SetAnimSetDirect( AnimPawn_Corrion , "a_ev_corrion.a_ev_corrion" );
			ACTION_PlayAnimDirect( AnimPawn_Corrion , 'sitting_A_idle_1', 0.1, 1.0, TRUE );
		Counter = Fidget;
	}


state Triggered
	{
		Begin:
			IF (Counter == Fidget)
				{
					Counter = CorrionStandUp;
						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'sitting_A_idle_1', 0.1, 1.0, TRUE );
				}

			ELSE IF (Counter == CorrionStandUp)
				{
					Counter = CorrionStandUpDialogue;
						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_Stands', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_Corrion , 0);
						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_standing_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == CorrionStandUpDialogue)
				{
					Counter = CorrionHookUpDialogue;

						ACTION_PlayLipSyncSound( 'AP_Corrion', "D00130.Mac_a", 1.0, 1.0, 1024.0, TRUE );	
						ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_A" ), 3.0, 1, 1, 1, TRUE, TRUE );
							//	Mac: Stand up!

						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_dialogue_stand_up', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_Corrion , 0);
						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_standing_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == CorrionHookUpDialogue)
				{
					Counter = CorrionEquipmentCheckDialogue;

						ACTION_PlayLipSyncSound( 'AP_Corrion', "D00130.Mac_b", 1.0, 1.0, 1024.0, TRUE );	
						ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_B" ), 3.0, 1, 1, 1, TRUE, TRUE );
							//	Mac: Hook up!

						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_dialogue_hook_up', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_Corrion , 0);
						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_standing_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == CorrionEquipmentCheckDialogue)
				{
					Counter = CorrionFindBakerDialogue;

						ACTION_PlayLipSyncSound( 'AP_Corrion', "D00130.Mac_c", 1.0, 1.0, 1024.0, TRUE );	
						ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_C" ), 3.0, 1, 1, 1, TRUE, TRUE );	
							//	Mac: Check your equipment!

						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_dialogue_equipment_check', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_Corrion , 0);
						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_standing_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == CorrionFindBakerDialogue)
				{
					Counter = SoundOff;
			
						ACTION_PlayLipSyncSound( 'AP_Corrion', "D00130.Mac_d", 1.0, 1.0, 1024.0, TRUE );
						ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_D" ), 6.0, 1, 1, 1, TRUE, TRUE );
							//	Mac: Remember!  This squad sticks together!  Once you hit the ground, find Baker!

							sleep(0.8);
						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_dialogue_find_Baker', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_Corrion , 0);
						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_standing_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == SoundOff)
				{
					Counter = BigBlast;
						ACTION_PlayLipSyncSound( 'AP_Corrion', "D00130.Mac_e", 1.0, 1.0, 1024.0, TRUE );	
						ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_E" ), 3.0, 1, 1, 1, TRUE, TRUE );		
							//	Mac: Sound Off!
				}

			ELSE IF (Counter == BigBlast)
				{
					Counter = BakerStandInDoor;
						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_hit_by_flak', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_Corrion , 0);
						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'b3_corrion_idle_1', 0.1, 1.0, true);
				}

			ELSE IF (Counter == BakerStandInDoor)
				{
					Counter = StartScene;
						ACTION_PlayLipSyncSound( 'AP_Corrion', "D00130.Mac_g", 1.0, 1.0, 1024.0, TRUE );	
						ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_G" ), 5.0, 1, 1, 1, TRUE, TRUE );
							//	Mac: Baker!  Stand in the door!

						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'Corrion_dialogue_Baker_get_in_door', 0.2, 1.0);
						ACTION_WaitForAnimEnd( AnimPawn_Corrion , 0);
						ACTION_PlayAnimDirect( AnimPawn_Corrion , 'b3_corrion_idle_2', 0.1, 1.0, true);
				}
	}
