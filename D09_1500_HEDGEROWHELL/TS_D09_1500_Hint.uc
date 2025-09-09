//=============================================================================
// TS_D09_1500_Hint.
//=============================================================================
class TS_D09_1500_Hint extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
		GoToState('TrainingLockPartOne');
	}

	Begin:

	ACTION_TriggerEvent( 'Counter_TS_D09_1500_Hint' );

	sleep( 1.0 );

	// Destroy the 88mm gun
	ACTION_DisplayObjectiveHint( S_Localize("HINT_A"), 4.0 );
	sleep( 4.0 );
}

state TrainingLockPartOne
{
	function OnTrigger()
	{
		GoToState('TrainingLockPartTwo');
	}

	Begin:

	// Display Training
	if ( !ACTION_IsTrainingDisabled() )
	{
		ACTION_DisableBattleDialogue();
		ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
		ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );

		ACTION_BlockActionKeys( -1 );
		ACTION_UnblockActionKeys( KEY_ACTION_LOOK );
		ACTION_UnblockActionKeys( KEY_ACTION_CONTINUE );
		ACTION_UnblockActionKeys( KEY_ACTION_CROUCH );
		sleep( 0.2 );

		// If you encounter an 88mm gun keep your squad behind cover when it fires.  Move when the 88 crew is reloading.
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_F"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

		// You can also distract an 88 crew by using your squad which should give you a window to move in, flank, and kill your enemy.
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_G"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

		// 88mm guns were typically destroyed by detonating TNT at their bases. Hit A to Continue.
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_D"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

		// Walk up to the 88mm gun and %action_use% %icon_use% to plant explosives.
		ACTION_DisplayTrainingMessage( S_Localize("TRAINING_E"), 0.0 );
		ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

		ACTION_DisplayTrainingMessage( "", 0.0 );
		sleep( 0.2 );

		ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE );

		ACTION_UnblockActionKeys( -1 );
		ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );

		ACTION_EnableBattleDialogue();
	}
}

state TrainingLockPartTwo
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	ACTION_DisplayObjectiveHint( "", 0.0 );

	ScriptEnd:
}
