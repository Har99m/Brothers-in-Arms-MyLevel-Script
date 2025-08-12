//=============================================================================
// TS_D000230_Training_Weapon_Check.
//=============================================================================
class TS_D000230_Training_Weapon_Check extends TriggeredScript
	placeable;

var PlayerController LPC ;

State Triggered
	{
		Begin:

			LPC = GetLocalPlayerController();

			ACTION_ClearInterceptedActionKeys();
			ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CYCLE_WEAPON , , , TRUE );

			if ( LPC.KEY_ACTION_CYCLE_WEAPON != 0)  
				{
					ACTION_TriggerEvent( 'TS_D000230_Training_WeaponSwitch' );
				}

			//===== Whut
				ACTION_DisplayTrainingMessage( "" , 0.0 );

		ScriptEnd:
	}

