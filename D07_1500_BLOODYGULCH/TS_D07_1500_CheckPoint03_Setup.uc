//=============================================================================
// TS_D07_1500_CheckPoint03_Setup.
//=============================================================================
class TS_D07_1500_CheckPoint03_Setup extends TriggeredScript
	placeable;

var bool bCheckpointLoaded;

state default
{
    Begin:

    bCheckpointLoaded = false;

}

state Triggered
{
	Begin:

	ACTION_UnBlockNavPoints( 'PN_CP3_BlockedPaths' );

	// Set Distance Fade Values to the defaults
	ZoneInfo( GetFirstActor( 'ZoneInfo' )).DistanceFade.Max = 15000;
	ZoneInfo( GetFirstActor( 'ZoneInfo' )).DistanceFade.Min = 13000;
	ParallaxSkyZoneInfo( GetFirstActor( 'ParallaxSkyZoneInfo' )).DistanceFadeInverse.Max = 15000;
	ParallaxSkyZoneInfo( GetFirstActor( 'ParallaxSkyZoneInfo' )).DistanceFadeInverse.Min = 13000;

    bCheckpointLoaded = true;
	ACTION_TriggerEvent( 'TS_D07_1500_FadeDistance' );	// Trigger this once to set it to the right state

	ACTION_AttachUnitToSuperUnit( 'Unit_US_Base', 'Unit_Player' );
	ACTION_AttachUnitToSuperUnit( 'Unit_US_Ass', 'Unit_Player' );

	ScriptEnd:
}
