//=============================================================================
// TS_D00_1630_Midtro_Scene_A.
//=============================================================================
class TS_D00_1630_Midtro_Scene_A extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Baker , AP_Corrion , AP_Desola , AP_Allen ;
var ActorLite PN_Dest_01 , PN_Dest_02 , PN_Dest_03 ;
var Actor LT_Midtro_Desola_Corner ;
var GbxPawn GBXP_Desola ;

var bool bReady, bLocked;

state triggered
	{
		function OnTrigger()
		{
				SLog( "**** Locked ****" );

				ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE ); 
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn() , TRUE );

				if ( bReady )
					GoToState( 'Continue' );

				bLocked = TRUE;
		}

		Begin:
				bReady = FALSE;
				bLocked = FALSE;

			//===== Spawn Baker , Desola , Corrion
				ACTION_TriggerEvent( 'CSU_MidtroCharacters' );
				ACTION_TriggerEvent( 'CSU_MidtroCharacters_Corrion' );

			//===== Trigger other script that waits for Corrion to be found
				ACTION_TriggerEvent( 'TS_D00_1630_Midtro_Scene_Corrion' );

			//===== Spawn Germans
				ACTION_TriggerEvent( 'CSG_C3_01' );
					sleep( 0.2 );
				ACTION_OrderMove( 'Unit_DE_C3_01', 'PN_C3_DE01_Move_A' );

			//===== Define Characters
				AP_Allen = AnimPawn( GetPawn( 'Allen' ));
				AP_Baker = AnimPawn( GetPawn( 'Midtro_Baker' ));
				AP_Desola = AnimPawn( GetPawn( 'Midtro_Desola' ));
				AP_Corrion = AnimPawn( GetPawn( 'Midtro_Corrion' ));

				GBXP_Desola = GbxPawn( GetPawn( 'Midtro_Desola' ));

				LT_Midtro_Desola_Corner = GetFirstActor( 'LT_Midtro_Desola_Corner' );

				PN_Dest_01 = GetNavigationPoint( 'PN_Midtro_Baker' );
				PN_Dest_02 = GetNavigationPoint( 'PN_Midtro_Desola' );
				PN_Dest_03 = GetNavigationPoint( 'PN_Midtro_Corrion' );

				ACTION_DisableBattleDialogueForCharacter( 'Midtro_Desola' );
				ACTION_DisableBattleDialogueForCharacter( 'Midtro_Corrion' );
				ACTION_TriggerEvent( 'Event_Midtro_Corrion_Setup' );

					sleep( 0.3 );

			//===== Put characters into God Mode / Repel Bullets
				AP_Baker.Controller.bGodMode = TRUE ;
				AP_Corrion.Controller.bGodMode = TRUE ;
				AP_Desola.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'Midtro_Baker' , TRUE );
				ACTION_SetRepelBullets( 'Midtro_Corrion' , TRUE );
				ACTION_SetRepelBullets( 'Midtro_Desola' , TRUE );
		
		//===== MOVE BAKER AND DESOLA TO COVER
				ACTION_BlockNavPoint( 'PN_Midtro_Desola' );
				ACTION_BlockNavPoint( 'PN_Midtro_Baker' );

				ACTION_MoveToward( AP_Desola , PN_Dest_02 , FALSE , LT_Midtro_Desola_Corner );
					sleep( 0.8 );
				ACTION_MoveToward( AP_Baker , PN_Dest_01 , FALSE );

				SLog( "**** Waiting for Baker ****" );
				while ( !PawnIsAtDestination( AP_Baker, PN_Dest_01 ) )
				{
					sleep( 0.5 );
				}

				// ACTION_WaitForEvent( 'Event_Midtro_Baker_At_Destination' );

			//===== Initiate

					sleep( 2.0 );

		//========== START DIALOGUE

				ACTION_TriggerEvent( 'Event_Midtro_Baker_Red' );
				ACTION_SetLookAtTargetDirect( AP_Baker , GetLocalPlayerPawn() , TRUE );
				AP_Baker.bDoHeadTurn = TRUE ;

	if ( bLocked )
		GoToState( 'Continue' );

				ACTION_PlayLipSyncSoundDirect( AP_Baker , "D00_1630.BAKER_G", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_G" ) , 2.0 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.00 /-----BAKER_G="Baker: Red!  Get over here!"

	bReady = TRUE;
}

state Continue
{
	function OnTrigger()
	{
		// Nothing sandwich
	}

	Begin:
			//===== Move away player's squads for BUG 16642 , cry me a river
				ACTION_OrderFallout( 'Unit_US_Ass' );
				ACTION_OrderFallout( 'Unit_US_Base' );
				ACTION_OrderMove( 'Unit_US_Ass' , 'PN_Midtro_Cover_Ass' );
				ACTION_OrderMove( 'Unit_US_Base' , 'PN_Midtro_Cover_Base' );

				ACTION_OrderTarget( 'Unit_DE_C3_01' , 'Unit_US_Midtro_A' );

					i = 1.0;

					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i );

				ACTION_ChangeScriptedSequenceDirect( AP_Baker , 'SS_Baker_Near' );
				ACTION_TriggerEvent( 'Event_Midtro_Baker_Hot' );
				ACTION_PlayLipSyncSoundDirect( AP_Baker , "D00_1630.BAKER_H", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_H" ) , 4.4 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 4.45 /-----BAKER_H="Baker: This area's pretty hot.  Corrion went inside but never came back out."

					WaitForAbsoluteTime( i += 4.9 );

				ACTION_PlayLipSyncSoundDirect( AP_Desola , "D00_1630.DESOLA_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "DESOLA_A1" ) , 1.5 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.50 /-----DESOLA_A1="Desola: He's still alive."
					WaitForAbsoluteTime( i += 1.6 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "DESOLA_A2" ) , 1.6 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.62 /-----DESOLA_A2="Desola: It's Corrion."

					WaitForAbsoluteTime( i += 2.1 );

				ACTION_TriggerEvent( 'Event_Midtro_Baker_Fair' );
				ACTION_PlayLipSyncSoundDirect( AP_Baker , "D00_1630.BAKER_I", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_I1" ) , 4.2 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 4.25 /-----BAKER_I1="Baker: Fair enough... but there are Germans all around that damn convoy."
					WaitForAbsoluteTime( i += 4.3 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_I2" ) , 5.2 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 5.25 /-----BAKER_I2="Baker: Red.  We'll lay down fire from here. Get inside that farmhouse and get corrion out."
					WaitForAbsoluteTime( i += 5.3 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_I3" ) , 3.7 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 3.75 /-----BAKER_I3="Baker: Then flank the trucks. Got it? Go!"

					WaitForAbsoluteTime( i += 4.1 );

				ACTION_ClearLookAtTargetDirect( AP_Baker );
				ACTION_TriggerEvent( 'Event_Midtro_Desola_Dismount' );
				ACTION_PlayLipSyncSoundDirect( AP_Desola , "D00_1630.DESOLA_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "DESOLA_B" ) , 1.4 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.37 /-----DESOLA_B="Desola: Covering fire!"

					WaitForAbsoluteTime( i += 0.5 );

		//========== CHECKPOINT
				ACTION_TriggerEvent( 'TS_CheckPointSave_03' );

				ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE );
				ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn() , FALSE );

				//=====Unblock nodes; allow squad to pass
				ACTION_UnBlockNavPoint( 'PN_Midtro_Covering_Fire' );
				ACTION_UnBlockNavPoint( 'PN_Unblock_Combat2' );

				ACTION_TriggerEvent( 'Event_Baker_Midtro_Dismount' );

				ACTION_WaitForEvent( 'Event_Midtro_Desola_done' );
				GBXP_Desola.Acceleration = vect(0, 0, 24000);
				GBXP_Desola.SetPhysics( PHYS_Falling );	
				GBXP_Desola.SetBase( None );

				ACTION_UnBlockNavPoint( 'PN_Midtro_Desola' );
				ACTION_UnBlockNavPoint( 'PN_Midtro_Baker' );
				AP_Desola.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'Midtro_Desola' , TRUE );
				//ACTION_WaitForEvent( 'Event_Midtro_Baker_Done' );
				ACTION_ChangeController ( 'Midtro_Baker', Class 'gbxAI.Mind');
				AP_Baker.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'Midtro_Baker' , TRUE );
				ACTION_OrderMove( 'Unit_US_Midtro_A' , 'PN_Midtro_Covering_Fire' );
				ACTION_OrderTarget( 'Unit_US_Midtro_A' , 'Unit_DE_C2_01' );
					WaitForAbsoluteTime( i += 2.0 );

				ACTION_EnableBattleDialogueForCharacter( 'Midtro_Desola' );

					StopAbsoluteTime();

				ACTION_WaitForEvent( 'Event_SS_Destroy_BakerSquad' );
				ACTION_DestroyActor( 'Midtro_Baker' );
				ACTION_DestroyActor( 'Midtro_Corrion' );
				ACTION_DestroyActor( 'Midtro_Desola' );

		ScriptEnd:
	}



