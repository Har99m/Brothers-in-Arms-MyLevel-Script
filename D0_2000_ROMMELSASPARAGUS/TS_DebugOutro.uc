//=============================================================================
// TS_DebugOutro.
//=============================================================================
class TS_DebugOutro extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
	sleep (1.0); 

	ACTION_TriggerEvent( 'DD_EndField2Script' );
	ACTION_TriggerEvent( 'DD_GliderLandingScript02' );

	ScriptEnd:
}
