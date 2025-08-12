//=============================================================================
// TS_Objectives.
//=============================================================================
class TS_Objectives extends TriggeredScript
	placeable;

var bool bBeaconDisabled ;

State Triggered
	{
		Begin:

			GotoState('Objective0');	
	}

State Objective0
	{
			Function OnTrigger()
				{
					GotoState('Objective1');
				}
		Begin:
			//==== OBJECTIVE 0 - Find leg bag to retrieve your rifle. =====

			//===== Update objectives
	//			ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
	//			ACTION_DisplayObjective( 0, 'ObjectiveList', 3.5 );
				ACTION_TriggerEvent( 'WP_obj0' );

			//===== Waits for trigger when player picks up weapon
				ACTION_WaitForEvent( 'Event_Weapon_Found' );	
				ACTION_BlockActionKeys( KEY_ACTION_ZOOM + KEY_ACTION_FIRE );
				ACTION_GivePlayerWeapon( GetLocalPlayerPawn() , "gbxInventory.WeapUSM1Carbine" );
				ACTION_SetPawnWeaponAmmo( GetLocalPlayerPawn() , class'gbxInventory.WeapUSM1Carbine' , 0 );
				ACTION_DestroyActor( 'PickupWeapUSM1Carbine' );
				ACTION_DestroyActor( 'SM_Intro_LegBag' );

				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

					sleep( 1.0 );
				ACTION_TriggerEvent( 'WP_obj0' );
				bBeaconDisabled = TRUE ;
				ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
				ACTION_DisplayObjective( 0, 'ObjectiveList', 3.5 );
					sleep( 3.5 );
	}

State Objective1
	{
			Function OnTrigger()
				{
					GotoState('Objective2');
				}
		Begin:
			//==== OBJECTIVE 1 - Get to the farmhouse =====

			//===== Update objectives
				ACTION_SetObjectiveStatus( 1, OI_Active, 'ObjectiveList' );
				ACTION_TriggerEvent( 'WP_obj1' );
				ACTION_DisplayObjective( 1, 'ObjectiveList', 4.0 );
	}

State Objective2
	{
			Function OnTrigger()
				{
					GotoState('Objective3');
				}
		Begin:
			//==== OBJECTIVE 2 - Take out the convoy =====

			//===== Update objectives
				ACTION_SetObjectiveStatus( 1, OI_Complete, 'ObjectiveList' );
				ACTION_SetObjectiveStatus( 2, OI_Active, 'ObjectiveList' );
				ACTION_TriggerEvent( 'WP_obj2' );
				ACTION_DisplayObjective( 2, 'ObjectiveList', 4.0 );
	}

State Objective3
	{
			Function OnTrigger()
				{
					// Nothing ?
				}
		Begin:
			//==== OBJECTIVE 3 - Meet with Cassidy =====

			//===== Update objectives
				GetFirstActor( 'TS_D000230_Training_Reload' ).GoToState( 'Safely_Exit' );
				ACTION_SetObjectiveStatus( 2, OI_Complete, 'ObjectiveList' );
				ACTION_DisplayObjective( 2, 'ObjectiveList', 3.0 );
					sleep( 3.5 );
				ACTION_TriggerEvent( 'WP_obj3' );
				ACTION_DisplayObjectiveHint( S_Localize( "HINT_F" ), 4.0 );
					//-----/-----HINT_F="Meet up with Lieutenant Colonel Cassidy."
	}
