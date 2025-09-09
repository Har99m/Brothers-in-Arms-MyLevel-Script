//=============================================================================
// TS_D07_1500_CheckPoint04_Setup.
//=============================================================================
class TS_D07_1500_CheckPoint04_Setup extends TriggeredScript
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

    bCheckpointLoaded = true;
	ACTION_TriggerEvent( 'TS_D07_1500_FadeDistance' );	// Trigger this once to set it to the right state
	ACTION_TriggerEvent( 'TS_D07_1500_FadeDistance' );	// Trigger this again to set the fade distance

	ACTION_BlockNavPoints( 'PN_CP2_Blocked' );

	ACTION_AttachUnitToSuperUnit( 'Unit_US_Base', 'Unit_Player' );
	ACTION_AttachUnitToSuperUnit( 'Unit_US_Ass', 'Unit_Player' );

	ACTION_DestroyActor( 'DestroyBush' );

	ScriptEnd:
}
