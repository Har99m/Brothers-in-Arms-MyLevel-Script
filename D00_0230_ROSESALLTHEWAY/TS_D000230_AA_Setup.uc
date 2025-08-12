//=============================================================================
//	TS_D000230_AA_Setup.
//	Sets up the first AA gun to recruit and designate a target
//=============================================================================
class TS_D000230_AA_Setup extends TriggeredScript
	placeable;

var AnimPawn AP_Flak1 , AP_Flak2 , AP_Flak3 ;
var int g , RandomTarget ;

state Triggered
	{
			function OnTrigger()
				{
					g ++ ;
				}
		Begin:

			//===== Define variables
				g = 4 ;
				RandomTarget = Rand(3); 

				AP_Flak1 = AnimPawn( GetPawn( 'AP_Flak1' ));
				AP_Flak2 = AnimPawn( GetPawn( 'AP_Flak2' ));
				AP_Flak3 = AnimPawn( GetPawn( 'AP_Flak3' ));
				GetLocalPlayerController().bHideSuppressionIcons = TRUE ;

			//==== Make Doyle fall in and restrict commands
				ACTION_OrderFallIn( 'Unit_US_Assault' );
				ACTION_BlockActionKeys( KEY_ACTION_ORDER + KEY_ACTION_FALL_OUT + KEY_ACTION_FALL_IN );

			//===== Recruiting = ENABLED
				ACTION_EnableFlakvierlingRecruiting( 'FLAKKA' , TRUE );

					sleep( 2.0 );

			//===== Spawn in Germans and set up a target
				ACTION_TriggerEvent( 'CSG_Flak' );
				AP_Flak1.Controller.bGodMode = TRUE ;
				AP_Flak1.Controller.bGodMode = TRUE ;
				AP_Flak1.Controller.bGodMode = TRUE ;

				AP_Flak1.PawnTeam = TEAM_None;
				AP_Flak2.PawnTeam = TEAM_None;
				AP_Flak3.PawnTeam = TEAM_None;

					sleep( 1.0 );

			//===== While the Germans are still alive, randomly choose targets
				While( g != 3 )
					{
							switch ( RandomTarget ) 
								{ 
									Case 0: 
										ACTION_SetFlakvierlingTarget( 'FLAKKA', 'LT_Flak_Left' );
											break; 
									Case 1: 
										ACTION_SetFlakvierlingTarget( 'FLAKKA', 'LT_Flak_Center' );
											break; 
									Case 1: 
										ACTION_SetFlakvierlingTarget( 'FLAKKA', 'LT_Flak_Right' );
											break; 
								} 

						//===== AA gun has chosen a random target, wait 4 seconds then set null target to "reload"
								sleep( 8.0 );
							ACTION_SetFlakvierlingTarget( 'FLAKKA', 'None' );
								sleep( 2.0 );
					}

	Slog( "-----/----------/-----FLAK GERMANS DEAD-----/----------/-----" );

			GetLocalPlayerController().bHideSuppressionIcons = FALSE ;
				GoToState( 'Germans_Dead' );

		ScriptEnd:
	}

state Germans_Dead
	{
		Begin:
			//===== Germans are dead so disable recruiting to save memory / performance
				ACTION_EnableFlakvierlingRecruiting( 'FLAKKA' , FALSE );
				GetLocalPlayerController().bHideSuppressionIcons = FALSE ;
		ScriptEnd:
	}
