//=============================================================================
// CheckPoint_1_Init.
//=============================================================================
class CheckPoint_1_Init extends TriggeredScript
	placeable;

var bool bDemo , bCheckPointLoaded;

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
	{
		Super.PostBeginPlay();		

		bCheckPointLoaded = FALSE;
		bDemo = FALSE;
	}

State Triggered
	{
		Begin:
				bCheckPointLoaded = TRUE ;

			//===== Set title card to "Silence the Guns"
				ACTION_ChangeMapIntroText	( 
												GetLocalPlayerController(), 
												S_Localize("NewTitle", "D0_0130_EAGLES"), 
												S_Localize("NewTitleDate", "D0_0130_EAGLES"), 
												S_Localize("NewTitleLocation", "D0_0130_EAGLES"), 
												false
											);

			//===== Spawn Mac & Leggett and move them
				ACTION_DisableBattleDialogue();
				ACTION_TriggerEvent( 'Spawn_USA_CP1_Mac' );
				ACTION_TriggerEvent( 'Spawn_USA_CP1_Leggett' );
				ACTION_AttachStaticMesh( GetPawn( 'Legget' ) , StaticMesh's_military_us.equipment.us_radio_field_pack' , 'radio_bone' ); 
				ACTION_OrderMove( 'USAFireTeam1' , 'CornerPoint1Mac' );
				ACTION_OrderMove( 'USAFireTeam1linkup' , 'CornerPoint1Leggett' );
				ACTION_EnableBattleDialogue();

				ACTION_SetRepelBullets( 'Mac' , TRUE );
				ACTION_SetRepelBullets( 'Legget' , TRUE );
				GetPawn( 'Mac' ).controller.bDemiGod = true;
				GetPawn( 'Legget' ).controller.bDemiGod = true;

				ACTION_TriggerEvent('SearchBeams');
				ACTION_TriggerEvent('SearchBeams2');

			//===== Pre-Burning plane destruction
				ACTION_DestroyActor( 'TS_SATraining_Trigger' );
				ACTION_DestroyActor( 'Spawn_USA_Intro_Leggett' );
				ACTION_DestroyActor( 'Spawn_USA_Intro_Mac' );
				ACTION_DestroyActor( 'HalftrackPlayerHasShot' );
				ACTION_DestroyActor( 'MacPathTrigpreflank' );
				ACTION_DestroyActor( 'CornerPoint1Maclook' );
				ACTION_DestroyActor( 'CornerPoint1Leggettlook' );
				ACTION_DestroyActor( 'Spawn_USA_Intro_Cole' );
				ACTION_DestroyActor( 'Unit_USA_Cole' );

				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers05' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers06' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers07' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers08' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers09' );
				ACTION_RemoveHorizonTracerTarget( 'HorizonTracers10' );

				ACTION_SetHidden( 'ChuteInTree', FALSE );

				GetFirstActor( 'FrenchHouse_Script' ).GoToState( 'Jail' );

				gbxFollowBeacon(getFirstActor('macbeacon')).m_anOwner = GetPawn('Mac');

				AnimPawn(GetPawn('GateBashAnim')).controller.bGodMode = True;
				AnimPawn(GetPawn('GateBash2Anim')).controller.bGodMode = True;
				AnimPawn(GetPawn('GateBash3Anim')).controller.bGodMode = True;
				ACTION_SaveMemoryReport( "SILENCE_CheckPoint01_After" );

			//===== Start Crash Site Emitters
				ACTION_TriggerEvent( 'PlaneCrashFire' );

			//===== Spawn Germans for SA training and set their sight radius very low
				ACTION_TriggerEvent( 'CharacterSpawnerGermanyField' );

				ACTION_FadeOverlay( GetLocalPlayerController(), 2, 3.0 );

				ACTION_HideHUD( GetLocalPlayerController(), False );
				ACTION_LimitPlayerInput( GetLocalPlayerController(), False );
				ACTION_UnLockPlayerMovement( GetLocalPlayerPawn() );

			//===== Update objectives (Beacon and OBJ)
				ACTION_TriggerEvent( 'macbeacon' );
				gbxFollowBeacon(getFirstActor('macbeacon')).m_anOwner = GetPawn('Mac');
				ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
				ACTION_SetObjectiveStatus( 1, OI_Active, 'ObjectiveList' );

			//===== Start combat!
				ACTION_TriggerEvent( 'HalftrackEvasionSI' );
	}
