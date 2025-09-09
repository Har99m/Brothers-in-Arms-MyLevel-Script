//=============================================================================
// TS_D08_1030_GermanInvulnerable_.
//=============================================================================
class TS_D08_1030_GermanInvulnerable_ extends TriggeredScript
	placeable;

var pawn DE_C202_1, DE_C202_2;

state Triggered
	{
	Begin:

	DE_C202_1 = GetPawn( 'DE_C202_1' );
	DE_C202_2 = GetPawn( 'DE_C202_2' );

	DE_C202_1.controller.bdemigod = TRUE;
	DE_C202_2.controller.bdemigod = TRUE;

	ACTION_SetRepelBullets('DE_C202_1', TRUE);
	ACTION_SetRepelBullets('DE_C202_2', TRUE);

	ACTION_WaitForEvent( 'DE_C202_1_AtDestination' );

	SLOG("********************************WORKING****************************");

		sleep(1.0);
	ACTION_TriggerEvent( 'TV_GBXMsgSI_C2_03' );
	ACTION_TriggerEvent( 'TV_GBXMsgSI_C2_02' );
		sleep(4.0);

	DE_C202_1.controller.bdemigod = FALSE;
	DE_C202_2.controller.bdemigod = FALSE;

	ACTION_SetRepelBullets('DE_C202_1', FALSE);
	ACTION_SetRepelBullets('DE_C202_2', FALSE);

	ScriptEnd:
	}
