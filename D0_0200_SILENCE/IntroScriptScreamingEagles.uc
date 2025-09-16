//=============================================================================
// IntroScriptScreamingEagles.
//=============================================================================
class IntroScriptScreamingEagles extends TriggeredScript
	placeable;

var Actor MyPlayer;

var int Monologue ;

state Triggered
	{
		Begin:
				ACTION_SaveMemoryReport( "SILENCE_Intro" );

			//===== Start Crash Site Emitters
				ACTION_TriggerEvent( 'PlaneCrashFire' );

				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers05' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers06' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers07' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers08' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers09' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers10' );

				ACTION_HideHUD( GetLocalPlayerController(), TRUE );
				ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_BlockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_LOOK );

			//===== Set title card to "Silence the Guns"
				ACTION_ChangeMapIntroText	( 
												GetLocalPlayerController(), 
												S_Localize("NewTitle", "D0_0130_EAGLES"), 
												S_Localize("NewTitleDate", "D0_0130_EAGLES"), 
												S_Localize("NewTitleLocation", "D0_0130_EAGLES"), 
												false
											);
					sleep( 1.0 );

			//===== Map name, date, time
				ACTION_MapIntroTextPos( GetLocalPlayerController(), 50, 350 );
				ACTION_MapIntroText( GetLocalPlayerController(), 1, 2.0 );

					sleep( 4.0 );

//=============================================================================

					StartAbsoluteTime();
					ResetAbsoluteTime();

				MyPlayer = GetFirstActor( 'gbxPlayerStart' );   
				Monologue = MyPlayer.PlayMusic( "D00130.VOICEOVER_ZA", 0.0 , FALSE );

					WaitForAbsoluteTime( 0.4 );
				ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_A" ), 5.5 , 5 , 1 , 1 , , TRUE );
						//	"Baker: You really start to notice the quirks a person has when you think he might be dead in a week."
					WaitForAbsoluteTime( 6.0 );
				ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_B" ), 4.1 , 5 , 1 , 1 , , TRUE );
						//	"Baker: I remember the first time I saw Leggett.  It was in the breakfast tent."
					WaitForAbsoluteTime( 10.2 );
				ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_C" ), 5.8 , 5 , 1 , 1 , , TRUE );
						//	"Baker: He was cutting a hard boiled egg into small pieces with a knife... like ham."
					WaitForAbsoluteTime( 16.3 );
				ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_D" ), 6.5 , 8 , 1 , 1 , , TRUE );
						//	"Baker: It occurred to me at this point I had never in my twenty-three years of existence seen a man cut an egg into slices like that."
					WaitForAbsoluteTime( 23.9 );
				ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_E" ),5 , 2 , 1 , 1 , , TRUE );
						//	"Baker: I don't know why I remember that."
					WaitForAbsoluteTime( 30.4 );

					StopAbsoluteTime();
				MyPlayer.StopMusic( Monologue , 0.0 );

//=============================================================================

			//===== Fade out text and fade into game
				ACTION_MapIntroText( GetLocalPlayerController(), 2, 2.0 );
				ACTION_UnblockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_LOOK );
					sleep( 2.0 );

				MyPlayer.PlayMusic( "D00130_SOUNDS.AMB_WIND_MG" , 0.0 );
				ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );

			//===== Spawn Mac, Leggett, and Cole 
				ACTION_TriggerEvent( 'Spawn_USA_Intro_Mac' );
				ACTION_TriggerEvent( 'Spawn_USA_Intro_Leggett' );
				ACTION_AttachStaticMesh( GetPawn( 'Legget' ) , StaticMesh's_military_us.equipment.us_radio_field_pack' , 'radio_bone' ); 
				ACTION_TriggerEvent( 'Spawn_USA_Intro_Cole' );
				ACTION_TriggerEvent( 'FlakLow' );

				ACTION_SetRepelBullets( 'Mac' , TRUE );
				ACTION_SetRepelBullets( 'Legget' , TRUE );
				ACTION_SetRepelBullets( 'Cole' , TRUE );
				GetPawn( 'Mac' ).controller.bDemiGod = true;
				GetPawn( 'Legget' ).controller.bDemiGod = true;
				GetPawn( 'Cole' ).controller.bDemiGod = true;

			//===== Mac idle
				ACTION_ClearPawnIdleQueue( 'Mac' );
				ACTION_AddAnimToPawnIdleQueue( 'Mac', 'standing_idle_relaxed_4' );
				ACTION_AddAnimToPawnIdleQueue( 'Mac', 'standing_idle_relaxed_2' );
				ACTION_AddAnimToPawnIdleQueue( 'Mac', 'standing_idle_relaxed_3' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Mac', False );

			//===== Legget idle
				ACTION_ClearPawnIdleQueue( 'Legget' );
				ACTION_AddAnimToPawnIdleQueue( 'Legget', 'standing_idle_relaxed_2' );
				ACTION_AddAnimToPawnIdleQueue( 'Legget', 'standing_idle_relaxed_3' );
				ACTION_AddAnimToPawnIdleQueue( 'Legget', 'standing_idle_relaxed_4' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Legget', False );

			//===== Cole idle
				ACTION_ClearPawnIdleQueue( 'Cole' );
				ACTION_AddAnimToPawnIdleQueue( 'Cole', 'standing_idle_relaxed_3' );
				ACTION_AddAnimToPawnIdleQueue( 'Cole', 'standing_idle_relaxed_4' );
				ACTION_AddAnimToPawnIdleQueue( 'Cole', 'standing_idle_relaxed_2' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Cole', False );

			//===== Start the french house sequence!
				ACTION_TriggerEvent( 'FrenchHouse_Script' );

			//===== Wait for player to trip trigger at start wall to change beacon position
				ACTION_WaitForEvent( 'Trigger_Beacon_Start' );
				ACTION_SetObjectiveBeaconState( 'gbxWaypointBeacon', FALSE, FALSE, FALSE);
				ACTION_SetObjectiveBeaconState( 'macbeacon', TRUE , TRUE, TRUE);
	}
