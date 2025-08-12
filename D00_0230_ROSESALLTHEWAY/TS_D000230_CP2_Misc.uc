//=============================================================================
// TS_D000230_CP2_Misc.
//=============================================================================
class TS_D000230_CP2_Misc extends TriggeredScript
	placeable;

var AnimPawn AP_Doyle , AP_Paddock ;

State Triggered
	{
		Begin:
				AP_Doyle = AnimPawn( GetPawn( 'AP_Doyle' ));
				AP_Paddock = AnimPawn( GetPawn( 'AP_Paddock' ));

			//===== UN-Lock the player
				ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE ); 
				ACTION_UnLockPlayerMovement( GetLocalPlayerPawn() );

			//===== Update objectives
				getFirstActor( 'TS_Objectives' ).goToState( 'Objective1' );

			//===== Change to mind
				ACTION_ChangeControllerDirect( AP_Doyle ,class'Mind' );
				ACTION_ChangeControllerDirect( AP_Paddock ,class'Mind' );
				ACTION_AttachUnitToSuperUnit( 'Unit_US_Assault' , 'UNIT_Player' );

			//===== Misc functions
				ACTION_UnblockNavPoints( 'PN_TrainingBlock' );
				ACTION_UnBlockNavPoint( 'PN_Gate_Exit' );
				ACTION_UnblockNavPoints( 'PN_PeanutBlock' );
				ACTION_UnblockNavPoints('PN_FlankBlock');
				ACTION_UnBlockNavPoint( 'PN_Paddock_Approach' );
				ACTION_UnBlockNavPoints( 'PN_Training_Block_Exit' );
				ACTION_UnBlockNavPoints( 'PN_AA_Block' );

				ACTION_UnBlockActionKeys( -1 );
				ACTION_BlockActionKeys( KEY_ACTION_SA_VIEW );

				GetLocalPlayerController().bTargetOrderEnabled = true;
				GetLocalPlayerController().bAssaultOrderEnabled = true;
				GetLocalPlayerController().bMoveOrderEnabled = true;

				ACTION_BlockNavPoint( 'PN_Tree_Crouch_Entrance' );
				ACTION_BlockNavPoints( 'PN_Doyle_Crouch_Pre' );

			//===== If training is on , block paths
				if ( !ACTION_IsTrainingDisabled() )
					{
						GetLocalPlayerController().bGodMode = TRUE ;
						ACTION_SetRepelBullets( 'AP_Doyle' , TRUE );
						ACTION_SetRepelBullets( 'AP_Paddock' , TRUE );
						ACTION_BlockNavPoints( 'PN_C1_Flank_Block' );
					}

					sleep( 0.5 );

				ACTION_SetTurretDestroyed( 'FLAKKA' );

			if ( !ACTION_IsTrainingDisabled() )
				{
					ACTION_KillPawn( 'AP_Training_Scarecrow' );
				}

		ScriptEnd:
	}
