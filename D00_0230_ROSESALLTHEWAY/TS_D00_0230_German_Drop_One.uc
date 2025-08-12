//=============================================================================
// TS_D00_0230_German_Drop_One.
//=============================================================================
class TS_D00_0230_German_Drop_One extends TriggeredScript
	placeable;

var WarGamePawn WGP_Fake_01 ;
var AnimPawn DE_Fake_01 ;
var ActorLite PN_DE_Fake_01_One , PN_Train_Fake_02 ;
var Actor LT_Drop_01_Target , LT_Drop_02_Target ;

State Triggered
	{
		Begin:

			//===== Spawn and define variables
				ACTION_TriggerEvent( 'CSG_Drop_One' );
				ACTION_DisableBattleDialogueForCharacter( 'Pawn_DE_Fake_01' );

				PN_DE_Fake_01_One = GetNavigationPoint( 'PN_DE_Fake_01_One' );
				PN_Train_Fake_02 = GetNavigationPoint( 'PN_Train_Fake_02' );

				DE_Fake_01 = AnimPawn( GetPawn( 'Pawn_DE_Fake_01' ));
				WGP_Fake_01 = WarGamePawn( GetPawn( 'Pawn_DE_Fake_01' ));

				LT_Drop_01_Target = GetFirstActor( 'LT_Drop_01_Target' );
				LT_Drop_02_Target = GetFirstActor( 'LT_Drop_02_Target' );

			//===== Set up animations
				ACTION_TriggerEvent( 'Event_SS_German_Drop_01_Setup' );

				ACTION_WaitForEvent( 'Event_SS_German_Drop_01_Change' );

				ACTION_ChangeControllerDirect( DE_Fake_01 , Class 'Mind' );
				ACTION_ChangeControllerDirect( DE_Fake_01 , Class 'ScriptedController' );
				ACTION_ChangeScriptedSequenceDirect( DE_Fake_01 , 'SS_German_Drop_01_Fire' );

				ACTION_MoveToward( DE_Fake_01 , PN_DE_Fake_01_One , FALSE , LT_Drop_01_Target );
				ACTION_PlayLipSyncSoundDirect( DE_Fake_01 , "BD_SP_GER_D.M_MOVING_A" , 1.0 , 1.0 , 1.0 );

			//===== Fire at drop 1
				ACTION_WaitForEvent( 'Event_SS_German_Drop_01_Fire_Now' );
					sleep( 0.1 );
				ACTION_PawnFireAtTargetDirect( WGP_Fake_01 , LT_Drop_01_Target );
					sleep( 0.4 );
				ACTION_PawnFireAtTargetDirect( WGP_Fake_01 , LT_Drop_01_Target );
					sleep( 0.3 );
				ACTION_PawnFireAtTargetDirect( WGP_Fake_01 , LT_Drop_01_Target );

				ACTION_WaitForEvent( 'Event_SS_German_Drop_01_Fire_Change' );
				ACTION_ClearPawnFireAtTargetDirect( WGP_Fake_01 );

				ACTION_ChangeControllerDirect( DE_Fake_01 , Class 'Mind' );
				ACTION_ChangeControllerDirect( DE_Fake_01 , Class 'ScriptedController' );

				De_Fake_01.Controller.Focus = LT_Drop_02_Target ;
				ACTION_WaitForPawnRotateToward( De_Fake_01 );
					sleep( 1.0 );
				ACTION_PlayLipSyncSoundDirect( DE_Fake_01 , "BD_SP_GER_D.M_SEEENEMYMOVE_D" , 1.0 , 1.0 , 1.0 );
					sleep( 3.0 );
				ACTION_ChangeScriptedSequenceDirect( DE_Fake_01 , 'SS_German_Drop_01_Fire_Two' );
				ACTION_TriggerEvent( 'Event_SS_German_Drop_01_Fire_Two_Setup' );
				ACTION_BlockNavPoint( 'PN_DE_Fake_01_One' );

			//===== Fire at drop 2
				ACTION_WaitForEvent( 'Event_SS_German_Drop_01_Fire_Two_Now' );
					sleep( 0.1 );
				ACTION_PawnFireAtTargetDirect( WGP_Fake_01 , LT_Drop_02_Target );
					sleep( 0.1 );
				ACTION_TriggerEvent( 'gbxET_Drop_02_Shot' );
					sleep( 0.3 );
				ACTION_PawnFireAtTargetDirect( WGP_Fake_01 , LT_Drop_02_Target );
					sleep( 0.1 );
				ACTION_TriggerEvent( 'gbxET_Drop_02_Shot_B' );

				ACTION_WaitForEvent( 'Event_SS_German_Drop_01_Fire_Two_Change' );
				ACTION_ClearPawnFireAtTargetDirect( WGP_Fake_01 );
				ACTION_ChangeControllerDirect( DE_Fake_01 , Class 'Mind' );
				ACTION_ChangeControllerDirect( DE_Fake_01 , Class 'ScriptedController' );

			//===== Move away and destroy
				ACTION_MoveToward( DE_Fake_01 , PN_Train_Fake_02 , FALSE );
				While( !PawnIsAtDestination( DE_Fake_01 , PN_Train_Fake_02 ))
					{
						sleep( 4.0 );
					}

				ACTION_DestroyActor( 'Pawn_DE_Fake_01' );
				ACTION_DestroyActor( 'Pawn_DE_Fake_02' );
				GetLocalPlayerController().bHideSuppressionIcons = FALSE ;
				ACTION_UnBlockNavPoint( 'PN_DE_Fake_01_One' );

		ScriptEnd:
	}
