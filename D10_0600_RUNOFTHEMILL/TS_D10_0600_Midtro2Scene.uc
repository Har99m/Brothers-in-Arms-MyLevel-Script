//=============================================================================
// TS_D10_0600_Midtro2Scene.
//=============================================================================
class TS_D10_0600_Midtro2Scene extends TriggeredScript
	placeable;

var AnimPawn AP_Doyle;
var ActorLite PN_Doyle;
var TriggeredScriptCombat TSC_Ref;
var TS_PleaseFire TSP_Ref;

var int i;

state Triggered
{
	function OnTrigger()
	{
		GoToState( 'Skipped' );
	}

	Begin:

	// Define Characters as AnimPawn Actors
	i = 0;
	AP_Doyle = AnimPawn( GetPawn('Doyle_Midtro1') );
	PN_Doyle = GetNavigationPoint('PN_Doyle_Midtro2_Doyle');
	TSP_Ref = TS_PleaseFire( GetFirstActor('TS_PleaseFire') );

	ACTION_ChangeControllerDirect( AP_Doyle, class'ScriptedController' );

	AP_Doyle.Controller.bGodMode = TRUE;
	ACTION_SetLookAtTargetDirect( AP_Doyle, GetLocalPlayerPawn(), TRUE );

	WargamePawn(AP_Doyle).SetWeaponAimedState( WAS_Relaxed );
	ACTION_MoveToward( AP_Doyle, PN_Doyle, TRUE, GetLocalPlayerPawn() );

	SLog( "**** Waiting for Doyle ****" );
	while ( !PawnIsAtDestination( AP_Doyle, PN_Doyle ) && i < 15 )
	{
		sleep( 0.5 );
		ACTION_MoveToward( AP_Doyle, PN_Doyle, TRUE, GetLocalPlayerPawn() );
		i++;
	}

	// If the player moved/moves ahead this will cause the script to move on
	ACTION_TriggerEvent( 'Counter_Midtro02' );
	sleep( 0.5 );

	// Turn on trigger
	SLog( "**** Waiting for player ****" );
	ACTION_TriggerEvent( 'TrigVol_PlayerInPosition' );
	while ( !TSP_Ref.bSet )
		sleep( 0.5 );

	// Start Dialogue
	// "Doyle: We're just now getting these tanks off the damn road.  Push on to the mill, we're right behind you."
	ACTION_PlayLipSyncSound( 'Doyle_Midtro1', "D10_0500.DOYLE_E", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize("Doyle_e"), 6.0, 1, 1, 1, TRUE, TRUE );
	sleep( 7.0 );

	GoToState( 'Skipped' );
}

state Skipped
{
	function OnTrigger()
	{
		// Do nothing
	}

	Begin:

	SLog( "**** Second midtro done, finish up ****" );

	ACTION_ChangeControllerDirect( AP_Doyle, class'Mind' );
	AP_Doyle.Controller.bDemiGod = TRUE;

	// This is in a seperate actor to prevent multiple triggers
	ACTION_TriggerEvent( 'TS_C_UpdateBeacons' );

	TSC_Ref = 	TriggeredScriptCombat( GetFirstActor('TSCombat3_01') );
	sleep( 2.0 );
	if ( TSC_Ref.GetStateName() == 'Retriggered' && !TSC_Ref.bActive )
	{
		SLog( "**** Outro Started before Midtro Finished ****" );
		ACTION_OrderMove( 'Unit_US_Doyle', 'PN_MoveMarsh_Outro_1' );
		ACTION_OrderMove('UNIT_OUTRODOYLE','PN_Outro_01' );
	}
	else
		ACTION_OrderMove( 'Unit_US_Doyle', 'PN_GermanMovement_13' );

	ScriptEnd:
}
