//=============================================================================
// TS_D10_0800_Outro.
//=============================================================================
class TS_D10_0800_Outro extends TriggeredScript
	placeable;

var float i;
var Actor MyPlayer;
var int OutroMusic;
var PhysicsVolume WarSoundVolume;

function DestroyAllGrenades()
{
	local gbxGrenade A;

	foreach AllActors( class'gbxGrenade', A )
		A.Destroy();
}

state triggered
	{
		Begin:

		WarSoundVolume = PhysicsVolume( GetFirstActor( 'WarSounds' ) );
		Pak88Factory(GetFirstActor('PAK88_END')).Gun.MyTNTTrigger.bDisabled = true;

			sleep(10.0);

		//========== TANKS ARE DEAD - START OUTRO SEQUENCE
			GetLocalPlayerPawn().bHidden = TRUE ;
			ACTION_LimitPlayerInput( GetLocalPlayerController(), true ); 
			ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
			ACTION_TriggerEvent( 'Event_SS_Outro_Filler' );

			GetLocalPlayerController().bGodMode = TRUE;
			ACTION_EnablePlayerHeavyTrauma( FALSE );
			DestroyAllGrenades();

			ACTION_StopRain();

			ACTION_FadeOverlay( GetLocalPlayerController(), 1, 3.0 );	// Fade out
			sleep( 3.0 );

			// Turn off war sounds
			ACTION_TriggerEvent( 'TankSpawner_US_Outro_C' );
			Tank( GetPawn( 'AP_Tank_US_Outro_C' )).MaxThrust = 32 ;
			ACTION_TriggerEvent( 'EVENT_FadePlaneSounds' );

			if ( WarSoundVolume != None )
			{
				WarSoundVolume.StopCurrentStereoAmbientSound();
				WarSoundVolume.AmbientSound = None;
			}
			else
			{
				slog( "*****Bullet sounds are still playing!*****" );
			}

		//===== Set up misc functions
			ACTION_TriggerEvent('PFX_OUTRO_01');
			ACTION_TriggerEvent('PFX_OUTRO_02');
			ACTION_TriggerEvent('PFX_OUTRO_03');
			ACTION_TriggerEvent('PFX_OUTRO_04');
			ACTION_TriggerEvent('PFX_OUTRO_05');
			ACTION_TriggerEvent('PFX_OUTRO_06');
			ACTION_TriggerEvent('PFX_OUTRO_07');

	ACTION_TriggerEvent( 'PFX_PAIGE_Mouth' );
	ACTION_DestroyActor( 'PFX_PAIGE_Mouth' );

			ACTION_SetTurretDestroyed( 'Flak_88_A' );

			//-------CARL ADDITIONS TO DESTROY LIST------//

			ACTION_DestroyActor('StochasticTrigger_END');
			ACTION_DestroyActor('Emitter_Smoke_End_01');
			ACTION_DestroyActor('Emitter_Smoke_End_02');
			ACTION_DestroyActor('Emitter_Smoke_End_03');

			//-------------------------------------------//

			ACTION_DestroyActor( 'AP_Marsh' );
			ACTION_DestroyActor( 'AP_Campbell' );
			ACTION_DestroyActor( 'AP_Paddock' );
			ACTION_DestroyActor( 'AP_Friar' );
			ACTION_DestroyActor( 'AP_McConnel' );

			ACTION_DestroyActor( 'ET_Flare' );
			ACTION_DestroyActor( 'Emitter' );
			ACTION_DestroyActor( 'Emitter_Explosion_01' );
			ACTION_DestroyActor( 'Emitter_Explosion_02' );
			ACTION_DestroyActor( 'Emitter_Explosion_03' );
			ACTION_DestroyActor( 'Emitter_Explosion_04' );
			ACTION_DestroyActor( 'Emitter_Explosion_05' );
			ACTION_DestroyActor( 'Emitter_EndSmoke' );
			ACTION_DestroyActor( 'emitter_alley_explosion' );
			ACTION_DestroyActor( 'Emitter_Explosion_Midtro' );
			ACTION_DestroyActor( 'pfx_Doyle_Explode' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_02' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_03' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_04' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_05' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_06' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_07' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_08' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_09' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_10' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_11' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_12' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_13' );
			ACTION_DestroyActor( 'pfx_Doyle_Gibs_14' );

			GetFirstActor( 'SM_Doyle_Patch_Outro' ).bHidden = FALSE ;
			GetFirstActor( 'SM_Doyle_Patch' ).bHidden = FALSE ;
			GetFirstActor( 'SM_Doyle_Cloth' ).bHidden = TRUE ;
			GetFirstActor( 'SM_Doyle_Cloth_Outro' ).bHidden = FALSE ;
			ACTION_WideScreenOverlay( GetLocalPlayerController() , 4 );
			ACTION_FadeOverlay( GetLocalPlayerController(), 2, 3.0 );	// Fade in
			ACTION_OrderMove( 'Unit_US_Outro_Fake_01' , 'PN_S5_02' );
			ACTION_OrderMove( 'Unit_US_Outro_Fake_01' , 'PN_UNIT_DE_C3_01_02' , TRUE );
			ACTION_OrderMove( 'Unit_US_Outro_Fake_01' , 'PN_S5_02' , TRUE );

			ACTION_OrderMove( 'Unit_US_Outro_Fake_02' , 'PN_UNIT_DE_C3_01_02' );
			ACTION_OrderMove( 'Unit_US_Outro_Fake_02' , 'PN_UNIT_DE_C3_02_04' , TRUE );
			ACTION_OrderMove( 'Unit_US_Outro_Fake_02' , 'PN_UNIT_DE_C3_01_02' , TRUE );

			ACTION_TriggerEvent( 'Scene_Temp_Outro_01' );

			MyPlayer = GetFirstACtor( 'PlayerSTart' );
			OutroMusic = MyPlayer.PlayMusic( "D10_0800_SOUNDS.OUTRO_MUSIC", 4.0,, false );


			//===== Start Dialogue
				i = 0.0;

				ResetAbsoluteTime();
				StartAbsoluteTime();

				WaitForAbsoluteTime( i );
				WaitForAbsoluteTime( i+= 3.0 );

					//-----/ 2.58 /-----HARTSOCK_MM="Hartsock: It’s amazing how quickly that situation became uncontrollable."
			ACTION_PlayLocalSound( "D10_0800.HARTSOCK_MM" );
			ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_MM" ), 2.6, 1 , 1 , 1 , , TRUE );

				WaitForAbsoluteTime( i+= 3.3 );

					//-----/ 2.00 /-----MARSHALL_KK_1="Marshall: You did well Sergeant."
			ACTION_PlayLocalSound( "D10_0800.MARSHALL_KK" );
			ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_KK_1" ), 2.0 , 1 , 1 , 1 , , TRUE );
			ACTION_OrderMove( 'Unit_US_Outro_Fake_03' , 'PN_S6_MG_Loader' );
			ACTION_OrderMove( 'Unit_US_Outro_Fake_04' , 'PN_Outro_Run_04' );
				WaitForAbsoluteTime( i+= 2.35 );

			ACTION_TeleportPawnToActor( AnimPawn( GetPawn( 'AP_US_Fake_01_A' )) , 'LT_Inf_Teleport_01_A' );
			ACTION_TeleportPawnToActor( AnimPawn( GetPawn( 'AP_US_Fake_01_B' )) , 'LT_Inf_Teleport_01_B' );
			ACTION_TeleportPawnToActor( AnimPawn( GetPawn( 'AP_US_Fake_01_C' )) , 'LT_Inf_Teleport_01_C' );

					//-----/ 3.50 /-----MARSHALL_KK_2="Marshall: You helped accomplish a very important objective."
			ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_KK_2" ), 3.5 , 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime( i+= 3.85 );

			ACTION_TriggerEvent( 'Event_SS_Wave_Tanks' );
			ACTION_OrderMove( 'Unit_US_Tank_Outro_C' , 'PN_Outro_Tank_C' );

					//-----/ 6.18 /-----MARSHALL_KK_3="Marshall: If the 82nd had failed in taking St. Saveur, getting Cherbourg would have been a pipe dream."
			ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_KK_3" ), 6.1 , 1 , 1 , 1 , , TRUE );

				WaitForAbsoluteTime( i+= 8.2 );

			ACTION_TriggerEvent('PFX_OUTRO_DEADPAIGEPAN');
			ACTION_StopScene( 'Scene_Temp_Outro_01' , '' );
			ACTION_TriggerEvent( 'Scene_Temp_Outro_02' );

				WaitForAbsoluteTime( i+= 1.0 );

					//-----/ 1.07 /-----MARSHALL_LL="Marshall: Something wrong Sergeant?"
			ACTION_PlayLocalSound( "D10_0800.MARSHALL_LL" );
			ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_LL" ), 2.0 , 1 , 1 , 1 , , TRUE );

				WaitForAbsoluteTime( i+= 3.3 );

					//-----/ 5.25 /-----HARTSOCK_NN_1="Hartsock: Well, it’s just that I believed I could succeed where I thought Baker had failed."
			ACTION_PlayLocalSound( "D10_0800.HARTSOCK_NN" );
			ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_NN_1" ), 5.2 , 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime( i+= 6.0 );
					//-----/ 2.75 /-----HARTSOCK_NN_2="Hartsock: But I couldn’t..."
			ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_NN_2" ), 2.0 , 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime( i+= 2.6 );
					//-----/ 1.29 /-----HARTSOCK_NN_3="Hartsock: I failed Doyle."
			ACTION_DisplaySubtitleMessage2(S_Localize("HARTSOCK_NN_3" ), 1.3 , 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime( i+= 2.9 );
			ACTION_TriggerEvent('PFX_OUTRO_ZOOMDOWN');
			ACTION_StopScene( 'Scene_Temp_Outro_02' , '' );
			ACTION_TriggerEvent( 'Scene_Temp_Outro_03' );

				WaitForAbsoluteTime( i+= 1.5 );

					//-----/ 1.50 /-----MARSHALL_MM_1="Marshall: No you didn’t son."
			ACTION_PlayLocalSound( "D10_0800.MARSHALL_MM" );
			ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_MM_1" ), 1.5 , 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime( i+= 2.0 );
					//-----/ 3.25 /-----MARSHALL_MM_2="Marshall: You did exactly what needed to be done."
			ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_MM_2" ), 3.2 , 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime( i+= 4.0 );
					//-----/ 2.50 /-----MARSHALL_MM_3="Marshall: Exactly."
			ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_MM_3" ), 2.5, 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime( i+= 2.1 );
					//-----/ 2.50 /-----MARSHALL_MM_4="Marshall: -and so did Sergeant Doyle."
			ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_MM_4" ), 2.5 , 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime( i+= 3.4 );
					//-----/ 3.20 /-----MARSHALL_MM_5="Marshall: That’s something to be proud of."
			ACTION_DisplaySubtitleMessage2(S_Localize("MARSHALL_MM_5" ), 2.9 , 1 , 1 , 1 , , TRUE );
				WaitForAbsoluteTime( i+= 11.0 );
				StopAbsoluteTime();

			ACTION_TriggerEvent('TriggeredScriptMapComplete');

		ScriptEnd:
	}
