//=============================================================================
// TS_D07_1500_CheckPoint02_Setup.
//=============================================================================
class TS_D07_1500_CheckPoint02_Setup extends TriggeredScript
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

	ACTION_AttachUnitToSuperUnit( 'Unit_US_Base', 'Unit_Player' );
	ACTION_AttachUnitToSuperUnit( 'Unit_US_Ass', 'Unit_Player' );

	ScriptEnd:
}
