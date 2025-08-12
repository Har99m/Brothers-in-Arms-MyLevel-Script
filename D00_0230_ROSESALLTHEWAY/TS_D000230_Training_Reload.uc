//=============================================================================
// TS_D000230_Training_Reload.
//=============================================================================
class TS_D000230_Training_Reload extends TriggeredScript
	placeable;

var WargamePlayerController LPC ;
var Pawn aPlayerPawn ;

State Triggered
	{
		Begin:

			LPC = GetLocalPlayerController();
			aPlayerPawn = GetLocalPlayerPawn() ;

			While( ( LPC != None) && ( aPlayerPawn.Weapon.ClipAmt > 0 ) )
				{
     				sleep( 0.1 );
				}

		if (!ACTION_IsTrainingDisabled())
			{
				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_WEAPON_RELOAD" ), 4.0 );
					//-----/-----TRAINING_WEAPON_RELOAD="Remember to %action_reload% %icon_reload% to reload your weapon."
			}

				sleep( 60.0 );

		if (!ACTION_IsTrainingDisabled())
			{
				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_WEAPON_RELOAD" ), 4.0 );
					//-----/-----TRAINING_WEAPON_RELOAD="Remember to %action_reload% %icon_reload% to reload your weapon."
			}

				sleep( 60.0 );

		if (!ACTION_IsTrainingDisabled())
			{
				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_WEAPON_RELOAD" ), 4.0 );
					//-----/-----TRAINING_WEAPON_RELOAD="Remember to %action_reload% %icon_reload% to reload your weapon."
			}

		ScriptEnd:
	}

State Safely_Exit
	{
		Begin:

		ScriptEnd:
	}
