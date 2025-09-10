//=============================================================================
// TS_D10_0800_TankBomberMonitor.
//=============================================================================
class TS_D10_0800_TankBomberMonitor extends TriggeredScript
	placeable;

var Actor MyPlayer;
var int BIGPLANE_B, BIGPLANE_C;

state Triggered
{
	Begin:

	MyPlayer = GetLocalPlayerPawn();


	BIGPLANE_C = ACTION_PlaySoundReturnHandleDirect( MyPlayer, "M_DARKNESS.BIGPLANE_C", 1.0, 1.0, 512.0 );
	sleep(5.0);

	BIGPLANE_B = ACTION_PlaySoundReturnHandleDirect( MyPlayer, "M_DARKNESS.BIGPLANE_B", 1.0, 1.0, 512.0 );
	sleep(8.0);

	ACTION_WaitForEvent( 'EVENT_FadePlaneSounds' );

	ACTION_StopSoundDirect( MyPlayer, BIGPLANE_C, 0.5 );
	ACTION_StopSoundDirect( MyPlayer, BIGPLANE_B, 0.5 );

}
