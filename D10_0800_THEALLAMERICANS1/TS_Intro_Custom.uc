//=============================================================================
// TS_Intro_Custom.
//=============================================================================
class TS_Intro_Custom extends TriggeredScriptIntro
	placeable;

state Triggered
	{
			function OnTrigger()
				{
					GoToState( 'Intro_End' );
				}

		Begin:

			ACTION_SaveMemoryReport( Level.LocalizationFilename $ "_start" );

			ACTION_TriggerEvent( nmPreFadeEvent );

			WGPC_Ref = GetLocalPlayerController();
			WGP_Ref = GetLocalPlayerPawn();

			ACTION_DisableBattleDialogue();
			ACTION_HideHUD( WGPC_Ref, TRUE );

			if ( bStartCrouched )
			WGP_Ref.StartGoingToCrouch( TRUE );

		//===== Limit input
			ACTION_BlockActionKeys( -1 );
			ACTION_UnblockActionKeys( KEY_ACTION_SHOW_MENU );
			ACTION_LimitPlayerInput( WGPC_Ref, TRUE );

			ACTION_LockPlayerMovement( WGP_Ref );

		//===== Map name, date, time
			Level.Title = Localize( "LevelInfo" , "Title", Level.GetLevelFileName() );
			Level.TitleDate = Localize( "LevelInfo" , "TitleDay", Level.GetLevelFileName() ) @ Localize( "LevelInfo" , "TitleDate", Level.GetLevelFileName() );
			Level.TitleLocation = Localize( "LevelInfo" , "TitleLocation", Level.GetLevelFileName() );
			ACTION_MapIntroTextPos( WGPC_Ref, 50, 350 );
			ACTION_MapIntroText( WGPC_Ref, 1, 2.0 );

		//===== Begin monologue music, and voice over
			if ( nmPlayerTag != '' )
				A_Player = GetFirstActor( nmPlayerTag );
			else
				SLog( "**** Error empty nmPlayerTag ****" );

			monologueDelay = 0;

		//===== Start monologue sounds
			if ( A_Player != None )
				{
					if ( szMusicSoundFile != "" )
						numMusicID = A_Player.PlayMusic( szMusicSoundFile, 0.0 );
					else
						SLog( "**** Empty szMusicSoundFile string ****" );

						sleep( fDelayVO );

					for ( i = 0; i < m_Monologue.Length; ++i )
						{
							if ( m_Monologue[i].sMonologueSound != "" )
								{
									Slog( "@#$%^ Play Dialogue - " $ m_Monologue[i].sMonologueSound );
									numVOID = A_Player.PlayMusic( m_Monologue[i].sMonologueSound, 0.0, monologueDuration );
									Slog( "@#$%^ Dialogue Duration - " $ monologueDuration );
									ResetAbsoluteTime();
									StartAbsoluteTime();

					for ( j=0; j<m_Monologue[i].aSubtitle.Length; ++j )
						{
									Slog( "@#$%^ Display Subtitle - " $ m_Monologue[i].aSubtitle[j].sSubtitleTag );
										if ( m_Monologue[i].aSubtitle[j].sSubtitleTag != "" )
											ACTION_DisplaySubTitleMessage2( S_Localize(m_Monologue[i].aSubtitle[j].sSubtitleTag), m_Monologue[i].aSubtitle[j].fSubtitleTime, 1, 1, 1, TRUE, TRUE );

											Slog( "@#$%^ Subtitle Delay - " $ m_Monologue[i].aSubtitle[j].fSubtitleDelay );
											sleep( m_Monologue[i].aSubtitle[j].fSubtitleDelay );
						}

						Slog( "@#$%^ Absolute Time - " $ GetAbsoluteTime() );
						monologueDelay = m_Monologue[i].fMonologueDelay + monologueDuration + 0.25 - GetAbsoluteTime();	// +0.25 to keep the next sound from immediately starting after the previous
						Slog( "@#$%^ Monologue Delay - " $ monologueDelay );
							if( monologueDelay > 0 )
								sleep( monologueDelay );

								StopAbsoluteTime();
								A_Player.StopMusic( numVOID, 1.5 );
								}
							else
								{
									SLog( "@#$%^ Could not find sound - " $ m_Monologue[i].sMonologueSound );
								}
						}
				}
		else
			{
				SLog( "**** Error no matching actor nmPlayerTag found: " $ nmPlayerTag $ " ****" );
			}


		//===== Stop monologue sounds
			if ( A_Player != None )
				{
					//if ( szVOSoundFile != "" )
					//	A_Player.StopMusic( numVOID, 1.5 );

					if ( szMusicSoundFile != "" )
						A_Player.StopMusic( numMusicID, 1.5 );
				}

				sleep( 1.0 );

		//===== Fade out text
			ACTION_MapIntroText( WGPC_Ref, 2, 2.0 );
				sleep( 2.5 );

		//===== Change chapter title to "Part 2" momentarily and display it
			ACTION_ChangeMapIntroText( GetLocalPlayerController() , 
										S_Localize("NEW_TITLE_A", "D10_0800_THEALLAMERICANS1") , 
										S_Localize("NEW_TITLE_Blank" , "D10_0800_THEALLAMERICANS1") , 
										S_Localize("NEW_TITLE_Blank", "D10_0800_THEALLAMERICANS1") , false);

			ACTION_MapIntroText( WGPC_Ref, 1, 2.0 );
				sleep( 4.0 );
			ACTION_MapIntroText( WGPC_Ref, 2, 2.0 );
				sleep( 2.0 );

		//===== Reset Map name, date, time
			Level.Title = Localize( "LevelInfo" , "Title", Level.GetLevelFileName() );
			Level.TitleDate = Localize( "LevelInfo" , "TitleDay", Level.GetLevelFileName() ) @ Localize( "LevelInfo" , "TitleDate", Level.GetLevelFileName() );
			Level.TitleLocation = Localize( "LevelInfo" , "TitleLocation", Level.GetLevelFileName() );

		//===== Fade into game
			ACTION_FadeOverlay( WGPC_Ref, 2, 6.0 );
				sleep( 0.5 );
			ACTION_UnblockActionKeys( -1 );
			ACTION_BlockActionKeys( KEY_ACTION_CROUCH );
				sleep( 0.5 );

		// ACTION_PlaySoundReturnHandle( nmPlayerTag, szAmbientSoundFile, 1.0, 1.0, 10000 );

		//===== Trigger map specific intro moment script
			ACTION_TriggerEvent( Event );
	}

state Intro_End
	{
			function  OnTrigger()
				{
					SLog( "Error Multiple Triggers" );
				}

		Begin:

			ACTION_SaveMemoryReport( Level.LocalizationFilename $ "_checkpoint_intro_pre" );
			ACTION_CheckPointSave( 1 );
			ACTION_SaveMemoryReport( Level.LocalizationFilename $ "_checkpoint_intro_post" );

			ACTION_UnBlockActionKeys( KEY_ACTION_CROUCH  );

				if ( bStartCrouched )
					WGP_Ref.ForceUnCrouch();

			ACTION_HideHUD( WGPC_Ref, FALSE );
			ACTION_EnableBattleDialogue();
			ACTION_UnlockPlayerMovement( WGP_Ref );
			ACTION_LimitPlayerInput( WGPC_Ref, FALSE );
				sleep( 3.5 );

		//===== Display Objective
			ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
			ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 );

		ScriptEnd:
	}
