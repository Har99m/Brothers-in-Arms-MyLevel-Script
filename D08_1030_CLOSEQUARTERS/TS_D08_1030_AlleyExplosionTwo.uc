//=============================================================================
// TS_D08_1030_AlleyExplosionTwo.
//=============================================================================
class TS_D08_1030_AlleyExplosionTwo extends TriggeredScript
	placeable;

state Triggered
	{

Begin:

	ACTION_TriggerEvent('CSG_C304a');
	ACTION_TriggerEvent('Emitter_DustBlow_Extre');
	ACTION_OrderMove('UNIT_DE_C304a', 'PN_UNIT_DE_C302_03' );
	ACTION_OrderMove('UNIT_DE_C304b', 'PN_C3_04');

	ACTION_WaitForEvent('CSG_Wave1_Death');
	ACTION_WaitForEvent('CSG_Wave1_Death');
	ACTION_WaitForEvent('CSG_Wave1_Death');
	ACTION_WaitForEvent('CSG_Wave1_Death');

	//ACTION_BlockNavPoints('PN_GN_WALL_BLOCK');
	//ACTION_BlockNavPoints('PN_UNIT_DE_C304_01a');
	//ACTION_TriggerEvent('CSG_C304');
	ACTION_OrderMove('UNIT_DE_C304b', 'PN_UNIT_DE_C302_03' );

	ACTION_TriggerEvent('CSG_C304c');
	ACTION_OrderMove('UNIT_DE_C304c', 'PN_UNIT_DE_C302_03' );

	ACTION_WaitForEvent('CSG_Wave1_Death');
	ACTION_WaitForEvent('CSG_Wave1_Death');
	ACTION_WaitForEvent('CSG_Wave1_Death');

	ACTION_DestroyActor('CSG_C304');
	ACTION_DestroyActor('CSG_C304a');
	ACTION_DestroyActor('CSG_C304b');
	ACTION_DestroyActor('CSG_C304c');

	}
