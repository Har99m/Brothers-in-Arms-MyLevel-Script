//=============================================================================
// TS_D02_2300_TankTraining.
//=============================================================================
class TS_D02_2300_TankTraining extends TriggeredScript
	placeable;

State Triggered
	{
		Begin:
		ACTION_BlockNavPoints('PN_TRUCK_BLOCKS');
				sleep(5.0);
			If ( !ACTION_IsTrainingDisabled() && GetLocalPlayerPawn().CanGrenadeTank() && GetPawn( 'Tank_Blake' ).Health > 0 )
				{

					ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_E" ), 4.0 );
						//-----TRAINING_E="Grenades cannot be used to destroy an enemy tank if the commander has buttoned up the hatch."

						sleep( 4.5 );

					ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_F" ), 4.0 );
						//-----TRAINING_F="If the hatch is open walk up behind the tank and  %action_use% %icon_use% to blow it up with a grenade."

				}

			sleep(6.0);
			ACTION_TriggerEvent('TS_D02_2300_HintCrate');
	}
