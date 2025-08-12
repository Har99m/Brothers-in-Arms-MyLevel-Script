//=============================================================================
// TS_D000230_CP3_Misc.
//=============================================================================
class TS_D000230_CP3_Misc extends TriggeredScript
	placeable;

var AnimPawn AP_Outro_Convoy_01_Horse , AP_Outro_Convoy_02_Horse , AP_Outro_Convoy_03_Horse , AP_Outro_Convoy_04_Horse , AP_Outro_Convoy_06_Horse , AP_Outro_Convoy_07_Horse ;
var AnimPawn AP_Outro_Convoy_01_Wagon , AP_Outro_Convoy_02_Wagon , AP_Outro_Convoy_03_Wagon , AP_Outro_Convoy_04_Wagon , AP_Outro_Convoy_06_Wagon , AP_Outro_Convoy_07_Wagon ;
var Actor SM_Convoy_Cargo_01 , SM_Convoy_Cargo_02 , SM_Convoy_Cargo_03 , SM_Convoy_Cargo_04 , SM_HorseCart_01 , SM_HorseCart_02 ;

State Triggered
	{
		Begin:

				AP_Outro_Convoy_02_Horse = AnimPawn( GetPawn( 'AP_Outro_Convoy_02_Horse' ));
				AP_Outro_Convoy_03_Horse = AnimPawn( GetPawn( 'AP_Outro_Convoy_03_Horse' ));
				AP_Outro_Convoy_04_Horse = AnimPawn( GetPawn( 'AP_Outro_Convoy_04_Horse' ));
				AP_Outro_Convoy_06_Horse = AnimPawn( GetPawn( 'AP_Outro_Convoy_06_Horse' ));
				AP_Outro_Convoy_07_Horse = AnimPawn( GetPawn( 'AP_Outro_Convoy_07_Horse' ));

				AP_Outro_Convoy_01_Horse.Health = 150 ;
				AP_Outro_Convoy_02_Horse.Health = 150 ;
				AP_Outro_Convoy_03_Horse.Health = 150 ;
				AP_Outro_Convoy_04_Horse.Health = 150 ;
				AP_Outro_Convoy_06_Horse.Health = 150 ;
				AP_Outro_Convoy_07_Horse.Health = 150 ;

				AP_Outro_Convoy_01_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_01_Wagon' ));
				AP_Outro_Convoy_02_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_02_Wagon' ));
				AP_Outro_Convoy_03_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_03_Wagon' ));
				AP_Outro_Convoy_04_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_04_Wagon' ));
				AP_Outro_Convoy_06_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_06_Wagon' ));
				AP_Outro_Convoy_07_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_07_Wagon' ));
				HorseCarriage( GetPawn( 'AP_Outro_Convoy_06_Wagon' )).PlayDeathAnim();

				SM_Convoy_Cargo_01 = GetFirstActor( 'SM_Convoy_Cargo_01' );
				SM_Convoy_Cargo_02 = GetFirstActor( 'SM_Convoy_Cargo_02' );
				SM_Convoy_Cargo_03 = GetFirstActor( 'SM_Convoy_Cargo_03' );
				SM_Convoy_Cargo_04 = GetFirstActor( 'SM_Convoy_Cargo_04' );

				SM_HorseCart_01 = GetFirstActor( 'SM_HorseCart_01' );
				SM_HorseCart_02 = GetFirstActor( 'SM_HorseCart_02' );

				ACTION_ChangeScriptedSequenceDirect( AP_Outro_Convoy_01_Wagon , 'SS_CP3_Run_Carriage' );
				ACTION_TriggerEvent( 'Event_SS_CP3_Horse_Setup' );

				ACTION_DisableTalkToMessageForCharacter( 'AP_Campbell' );

			//===== Update objectives
				getFirstActor( 'TS_Objectives' ).goToState( 'Objective2' );

			//===== Change to mind
				ACTION_ChangeController( 'AP_Cole' , class'Mind' );
				ACTION_ChangeController( 'AP_Doyle' , class'Mind' );
				ACTION_ChangeController( 'AP_Paddock' , class'Mind' );
				GetPawn( 'AP_Cole' ).Controller.bGodMode = TRUE ;
				GetPawn( 'AP_AP_Boyd' ).Controller.bGodMode = TRUE ;
				GetPawn( 'AP_Campbell' ).Controller.bGodMode = TRUE ;

			//===== Misc functions
				ACTION_UnblockNavPoints( 'PN_TrainingBlock' );
				ACTION_UnBlockNavPoint( 'PN_Gate_Exit' );
				ACTION_UnBlockNavPoint( 'PN_Paddock_Approach' );
				ACTION_UnblockNavPoints( 'PN_PeanutBlock' );
				ACTION_UnblockNavPoints('PN_FlankBlock');
				ACTION_UnBlockNavPoints( 'PN_Cole_Squad_Blocker' );
				ACTION_UnBlockNavPoints( 'PN_Training_Block_Exit' );
				ACTION_UnBlockNavPoints( 'PN_AA_Block' );

				ACTION_BlockNavPoint( 'PN_Tree_Crouch_Entrance' );
				ACTION_BlockNavPoints( 'PN_Doyle_Crouch_Pre' );

				ACTION_SetTurretDestroyed( 'FLAKKA' );

				ACTION_SetRepelBullets( 'AP_Cassidy' , TRUE );

			//==== Unhide horsecarts
				AP_Outro_Convoy_02_Horse.bHidden = FALSE ;
				AP_Outro_Convoy_03_Horse.bHidden = FALSE ;
				AP_Outro_Convoy_04_Horse.bHidden = FALSE ;
				AP_Outro_Convoy_06_Horse.bHidden = FALSE ;
				AP_Outro_Convoy_07_Horse.bHidden = FALSE ;

				AP_Outro_Convoy_01_Wagon.bHidden = FALSE ;
				AP_Outro_Convoy_02_Wagon.bHidden = FALSE ;
				AP_Outro_Convoy_03_Wagon.bHidden = FALSE ;
				AP_Outro_Convoy_04_Wagon.bHidden = FALSE ;
				AP_Outro_Convoy_06_Wagon.bHidden = FALSE ;
				AP_Outro_Convoy_07_Wagon.bHidden = FALSE ;

				SM_Convoy_Cargo_01.bHidden = FALSE ;
				SM_Convoy_Cargo_02.bHidden = FALSE ;
				SM_Convoy_Cargo_03.bHidden = FALSE ;
				SM_Convoy_Cargo_04.bHidden = FALSE ;

				SM_HorseCart_01.bHidden = FALSE ;
				SM_HorseCart_02.bHidden = FALSE ;

				AP_Outro_Convoy_02_Wagon.AttachToBone( SM_Convoy_Cargo_01 , 'cargo' );
				AP_Outro_Convoy_04_Wagon.AttachToBone( SM_Convoy_Cargo_04 , 'cargo' );
				AP_Outro_Convoy_06_Wagon.AttachToBone( SM_Convoy_Cargo_03 , 'cargo' );

			if ( !ACTION_IsTrainingDisabled() )
				{
					ACTION_KillPawn( 'AP_Training_Scarecrow' );
				}

				ACTION_TriggerEvent( 'TS_D000230_Training_Reload' );
				ACTION_TriggerEvent( 'TS_D000230_Training_Reload_Check' );

				ACTION_WaitForEvent( 'Event_Final_Combat_Complete' );

				sleep( 0.2 );

		//===== Combat is complete , set up objectives + outro
			ACTION_TriggerEvent( 'WP_obj2' );
			ACTION_SetObjectiveStatus( 2, OI_Complete, 'ObjectiveList' );
				sleep( 2.0 );

			ACTION_TriggerEvent('TS_Objectives');
			ACTION_TriggerEvent('TS_D000230_Outro');

		ScriptEnd:
	}
