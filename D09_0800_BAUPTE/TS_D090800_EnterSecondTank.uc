//=============================================================================
// TS_D090800_EnterSecondTank.
//=============================================================================
class TS_D090800_EnterSecondTank extends TriggeredScript
	placeable;

var Tank TP_DETank;

var ActorLite AL_Path;

state Triggered
{
	function OnTrigger()
	{
		GoToState( 'Arrived' );
	}

	Begin:

	SLog( "**** EnterSecondTank script started ****" );

	TP_DETank = Tank( GetPawn('TG_403_02') );
	AL_Path = GetNavigationPoint('PN_C4_OutTank');

	// Go scripted and demigod
	ACTION_TankEnterScriptedMode( TP_DETank );
	TP_DETank.Controller.bDemiGod = TRUE;

	// Turn on trigger and wait for the tank to arrive
	ACTION_TriggerEvent( 'Trigger_DE_EnterSecondTank' );

	SLog( "**** Waiting for the tank to arrive ****" );
	TP_DETank.MaxThrust = 150;

	while ( TRUE )
	{
		ACTION_TankMoveTo( TP_DETank, AL_Path );
		sleep( 20.0 );
	}
}

state Arrived
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	SLog( "**** The tank has arrived ****" );

	// Go mind
	ACTION_TankLeaveScriptedMode( TP_DETank );
	TP_DETank.Controller.bDemiGod = FALSE;
	sleep( 1.0 );

	// Order move
	ACTION_OrderMove( 'Unit_DE_403', 'PN_C4_OutTank' );
	sleep( 6.0 );

	ACTION_OrderMove( 'Unit_DE_403', 'PN_C4_403_SubAttackWave2' );
	sleep( 6.0 );

	ACTION_OrderMove( 'Unit_DE_403', 'PN_C4_403_AttackWave2' );

	ScriptEnd:
}
