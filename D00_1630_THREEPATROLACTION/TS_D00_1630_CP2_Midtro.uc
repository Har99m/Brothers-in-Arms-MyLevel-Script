//=============================================================================
// TS_D00_1630_CP2_Midtro.
//=============================================================================
class TS_D00_1630_CP2_Midtro extends TriggeredScript
	placeable;

var AnimPawn AP_Baker , AP_Desola ;
var float i;

state Triggered
	{
		Begin:
				//=====Unblock nodes; allow squad to pass
				ACTION_UnBlockNavPoint( 'PN_Midtro_Covering_Fire' );
				ACTION_UnBlockNavPoint( 'PN_Unblock_Combat2' );

				ACTION_UnBlockNavPoint( 'PN_Midtro_Desola' );
				ACTION_UnBlockNavPoint( 'PN_Midtro_Baker' );

			//===== Spawn Baker & Desola
				ACTION_TriggerEvent( 'CSU_CP3_MidtroCharacters' );
				ACTION_TriggerEvent( 'CSU_MidtroCharacters_Corrion' );

			//===== Trigger other script that waits for Corrion to be found
				ACTION_TriggerEvent( 'TS_D00_1630_Midtro_Scene_Corrion' );

			//===== Define variables
				AP_Baker = AnimPawn( GetPawn( 'Midtro_Baker' ));
				AP_Desola = AnimPawn( GetPawn( 'Midtro_Desola' ));

					sleep( 0.2 );

				ACTION_DisableBattleDialogueForCharacter( 'Midtro_Corrion' );

			//===== Spawn Germans
				ACTION_TriggerEvent( 'CSG_C3_01' );
					sleep( 0.2 );
				ACTION_OrderMove( 'Unit_DE_C3_01', 'PN_C3_DE01_Move_A' );

			//===== Set up scene
				ACTION_TriggerEvent( 'Event_CP2_Midtro_Desola_Setup' );
				ACTION_TriggerEvent( 'Event_CP2_Midtro_Baker_Setup' );
				ACTION_TriggerEvent( 'Event_Midtro_Corrion_Setup' );

				ACTION_BlockNavPoint( 'PN_Midtro_Desola' );
				ACTION_BlockNavPoint( 'PN_Midtro_Baker' );

			//===== Put characters into God Mode / Repel Bullets
				AP_Baker.Controller.bGodMode = TRUE ;
				AP_Desola.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'Midtro_Baker' , TRUE );
				ACTION_SetRepelBullets( 'Midtro_Desola' , TRUE );

			//===== Initialize dialogue
					i = 1.0;

					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i );

				ACTION_ClearLookAtTargetDirect( AP_Baker );
				ACTION_PlayLipSyncSoundDirect( AP_Desola , "D00_1630.DESOLA_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "DESOLA_B" ) , 1.4 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.37 /-----DESOLA_B="Desola: Covering fire!"

					WaitForAbsoluteTime( i += 0.5 );

				AP_Desola.Controller.bDemiGod = TRUE ;
				ACTION_SetRepelBullets( 'Midtro_Desola' , TRUE );
				AP_Baker.Controller.bDemiGod = TRUE ;
				ACTION_SetRepelBullets( 'Midtro_Baker' , TRUE );
				ACTION_OrderMove( 'Unit_US_Midtro_A' , 'PN_Midtro_Baker' );
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

