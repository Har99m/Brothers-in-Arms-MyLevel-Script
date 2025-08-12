//=============================================================================
// TS_D000230_German_Runners_Two.
//=============================================================================
class TS_D000230_German_Runners_Two extends TriggeredScript
	placeable;

state triggered
	{
		Begin:

				GetLocalPlayerController().bHideSuppressionIcons = TRUE ;

			//===== Spawn in Germans and 
				ACTION_TriggerEvent( 'TS_D00_0230_German_Drop_One' );
				ACTION_TriggerEvent( 'TS_D00_0230_German_Drop_Two' );
					sleep( 0.2 );
				ACTION_TriggerEvent( 'CSG_Training_Runners' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_German_Run_01' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_German_Run_02' );

			//===== Wait for player to come out of crouch log
				ACTION_WaitForEvent( 'CrouchDone' );

				ACTION_TriggerEvent( 'Event_SS_German_Drop_01_Stand' );
					sleep( 0.2 );
				ACTION_TriggerEvent( 'Event_SS_German_Drop_02_Stand' );
					sleep( 0.3 );
				ACTION_OrderMove( 'UNIT_DE_Train_Fake_02' , 'PN_C3_MG_Flank_01' );

			//===== DROP ONE
				ACTION_TriggerEvent( 'TS_D00_0230_US_Drop_One' );

					sleep( 1.2 );

			//===== DROP TWO
				ACTION_TriggerEvent( 'TS_D00_0230_US_Drop_Two' );

					sleep( 1.0 );

				ACTION_TriggerEvent( 'CSU_Train_Fake' );

					sleep( 0.3 );
				ACTION_OrderTarget( 'UNIT_DE_Train_Fake_02' , 'Unit_US_Fake' );
					sleep( 2.7 );

				ACTION_OrderMove( 'UNIT_DE_Train_Fake_02' , 'PN_Train_Fake' );

					sleep( 11.6 );

		if( vSize( GetPawn( 'AP_Doyle' ).location - GetFirstActor( 'LT_Doyle_Teleport_Training' ).location ) < 1280 )
			{
				ACTION_PlayLipSyncSound( 'AP_Doyle' , "BD_DOYLE.M_POSTMELEE_A", 1.0, 1.0, 1.0 );
					//-----/----- Doyle : Shit!
			}

					sleep( 3.0 );

			//===== DROP THREE
				ACTION_TriggerEvent( 'TS_D00_0230_US_Drop_Three' );

					sleep( 9.1 );

				ACTION_DestroyActor( 'AP_German_Run_01' );
					sleep( 0.2 );
				ACTION_DestroyActor( 'Pawn_DE_Fake_02' );
				ACTION_DestroyActor( 'AP_German_Run_02' );
					sleep( 0.1 );
				ACTION_DestroyActor( 'AP_US_Fake' );

		ScriptEnd:
	}
