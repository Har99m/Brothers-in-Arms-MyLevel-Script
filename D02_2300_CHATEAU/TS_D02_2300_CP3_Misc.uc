//=============================================================================
// TS_D02_2300_CP3_Misc.
//	Performs miscellaneous functions when Checkpoint_03 loads
//=============================================================================
class TS_D02_2300_CP3_Misc extends TriggeredScript
	placeable;

var bool bCP3_Loaded ;

state Triggered
	{
		Begin:
				ACTION_TriggerEvent( 'BVT_Outro');
				//ACTION_TriggerEVent('BVT_C3_Wall');
				bCP3_Loaded = TRUE ;

			//===== Move units so they don't run away

				ACTION_AttachUnitToSuperUnit( 'UNIT_US_Base', 'UNIT_Player' );

			//=====

		ScriptEnd:
	}

