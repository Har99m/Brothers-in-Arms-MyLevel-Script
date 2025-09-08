//=============================================================================
// TS_D02_2300_TankZoom.
//=============================================================================
class TS_D02_2300_TankZoom extends TriggeredScript
	placeable;

State Triggered
	{
		Begin:
			While ( !GetLocalPlayerPawn().Weapon.IsA( 'WeapUSUsableMachineGun' ))
				{
					sleep( 2.0 );
				}

			ACTION_DisplayTrainingMessage( S_Localize("TRAINING_I"), 0.0 );
				//-----/-----TRAINING_D="This tank also features a turret mounted machine gun that you can use!  
				//-----/-----%action_use% %icon_use% at the rear of the tank to mount the machine gun.%newline%%newline%%icon_continue% to Continue."
			ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );
			ACTION_DisplayTrainingMessage( "", 0.1 );
	}
