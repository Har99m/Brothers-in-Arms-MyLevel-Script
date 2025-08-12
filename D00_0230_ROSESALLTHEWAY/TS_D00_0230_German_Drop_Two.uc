//=============================================================================
// TS_D00_0230_German_Drop_Two.
//=============================================================================
class TS_D00_0230_German_Drop_Two extends TriggeredScript
	placeable;

var AnimPawn Pawn_DE_Fake_02 ;
var ActorLite PN_DE_Fake_02_One , PN_Train_Fake_02A , PN_C3_Cole_Flank_03 ;
var Actor LT_Drop_01_Target , LT_Drop_02_Target ;
var WarGamePawn WGP_Fake_02 ;

State Triggered
	{
		Begin:

			//===== Spawn and define
				ACTION_TriggerEvent( 'CSG_Drop_Two' );
				ACTION_DisableBattleDialogueForCharacter( 'Pawn_DE_Fake_02' );

				Pawn_DE_Fake_02 = AnimPawn( GetPawn( 'Pawn_DE_Fake_02' ));

				WGP_Fake_02 = WarGamePawn( GetPawn( 'Pawn_DE_Fake_02' ));

				PN_DE_Fake_02_One = GetNavigationPoint( 'PN_DE_Fake_02_One' );
				PN_Train_Fake_02A = GetNavigationPoint( 'PN_Train_Fake_02A' );
				PN_C3_Cole_Flank_03 = GetNavigationPoint( 'PN_C3_Cole_Flank_03' );

				LT_Drop_01_Target = GetFirstActor( 'LT_Drop_01_Target' );
				LT_Drop_02_Target = GetFirstActor( 'LT_Drop_02_Target' );

			//===== Set up animations
				ACTION_TriggerEvent( 'Event_SS_German_Drop_02_Setup' );

				ACTION_WaitForEvent( 'Event_SS_German_Drop_02_Change' );
				ACTION_ChangeControllerDirect( Pawn_DE_Fake_02 , Class 'Mind' );
				ACTION_ChangeControllerDirect( Pawn_DE_Fake_02 , Class 'ScriptedController' );
				ACTION_ChangeScriptedSequenceDirect( Pawn_DE_Fake_02 , 'SS_German_Drop_02_Fire' );

			//===== Fire at drop 1
				ACTION_MoveToward( Pawn_DE_Fake_02 , PN_DE_Fake_02_One , FALSE , LT_Drop_01_Target );
				ACTION_WaitForEvent( 'Event_SS_German_Drop_02_Fire_Now' );
					sleep( 0.1 );
				ACTION_PawnFireAtTargetDirect( WGP_Fake_02 , LT_Drop_01_Target );
					sleep( 0.3 );
				ACTION_PawnFireAtTargetDirect( WGP_Fake_02 , LT_Drop_01_Target );
					sleep( 0.1 );

			//===== Run away
				ACTION_WaitForEvent( 'Event_SS_German_Drop_02_Fire_Change' );
				ACTION_ChangeControllerDirect( Pawn_DE_Fake_02 , Class 'Mind' );
				ACTION_ChangeControllerDirect( Pawn_DE_Fake_02 , Class 'ScriptedController' );
				ACTION_MoveToward( Pawn_DE_Fake_02 , PN_C3_Cole_Flank_03 , FALSE );
					sleep( 4.0 );
				ACTION_MoveToward( Pawn_DE_Fake_02 , PN_Train_Fake_02A , FALSE );

		ScriptEnd:
	}
