//=============================================================================
// TS_D000230_CP1_Misc.
//=============================================================================
class TS_D000230_CP1_Misc extends TriggeredScript
	placeable;

state Triggered
	{
		Begin:
				ACTION_SetUnitHiddenOnCompass( 'Unit_US_Assault' , TRUE );

				GetLocalPlayerPawn().bHidden = False;
				ACTION_ChangeController( 'AP_Doyle',class'Mind' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle' );
				ACTION_OrderFallIn( 'Unit_US_Assault' );
				ACTION_BlockActionKeys( KEY_ACTION_ORDER + KEY_ACTION_FALL_OUT + KEY_ACTION_FALL_IN + KEY_ACTION_SA_VIEW + KEY_ACTION_TEAMSELECT );

					sleep( 1.0 );

			if ( !ACTION_IsTrainingDisabled() )
				{
					ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				}

		ScriptEnd:
	}
