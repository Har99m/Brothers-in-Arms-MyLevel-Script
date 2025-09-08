//=============================================================================
// 	TS_D02_2300_CP2_Misc.
//	Performs miscellaneous functions when Checkpoint_02 loads
//=============================================================================
class TS_D02_2300_CP2_Misc extends TriggeredScript
	placeable;

state Triggered
	{
		Begin:
		ACTION_TriggerEvent( 'BVT_Outro');
			//===== Move units so they don't run away
				ACTION_AttachUnitToSuperUnit( 'UNIT_US_Base', 'UNIT_Player' );

				ACTION_TriggerEvent( 'WP_obj1' );

			//===== 

		ScriptEnd:
	}
