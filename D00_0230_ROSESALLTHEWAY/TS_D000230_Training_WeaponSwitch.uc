//=============================================================================
// TS_D000230_Training_WeaponSwitch.
//=============================================================================
class TS_D000230_Training_WeaponSwitch extends TriggeredScript
	placeable;

var Pawn aPlayerPawn ;
var Weapon aCurrentWeapon ;

State Triggered
	{
			function OnTrigger()
				{
					GoToState( 'Safely_Exit' );
				}

		Begin:

			aPlayerPawn = GetLocalPlayerPawn() ;
			aCurrentWeapon = aPlayerPawn.Weapon ;

		while( ACTION_NumPlayerWeapons() < 2 )
			{
				sleep( 2.0 );
			}	

		if (!ACTION_IsTrainingDisabled())
			{
				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_WEAPON_SWITCH" ), 4.0 );
					//-----/-----TRAINING_WEAPON_SWITCH="You now have two weapons.  %action_cycle_weapon% %icon_cycle_weapon% to switch weapons"
			}

				sleep( 60.0 );

		if (!ACTION_IsTrainingDisabled())
			{
				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_WEAPON_SWITCH" ), 4.0 );
					//-----/-----TRAINING_WEAPON_SWITCH="You now have two weapons.  %action_cycle_weapon% %icon_cycle_weapon% to switch weapons"
			}

				sleep( 60.0 );

		if (!ACTION_IsTrainingDisabled())
			{
				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_WEAPON_SWITCH" ), 4.0 );
					//-----/-----TRAINING_WEAPON_SWITCH="You now have two weapons.  %action_cycle_weapon% %icon_cycle_weapon% to switch weapons"
			}

		ScriptEnd:
	}

State Safely_Exit
	{
			function OnTrigger()
				{
					//=====
				}

		Begin:


		ScriptEnd:
	}
