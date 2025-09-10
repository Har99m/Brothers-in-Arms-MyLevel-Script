//=============================================================================
// TS_D10_0800_Midtro_Squibs.
//=============================================================================
class TS_D10_0800_Midtro_Squibs extends TriggeredScript
	placeable;

State Triggered
{
Begin:
	ACTION_TriggerEvent( 'Gun_00' );
	sleep( 7.0 );
	
	//action_DisplayObjectiveString("1", 1.0);
	ACTION_PlaySound( 'Gun_01', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_01' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_02', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_02' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_03', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_03' );

	sleep( 9.0 );
	//action_DisplayObjectiveString("2", 1.0);
	ACTION_PlaySound( 'Gun_04', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_04' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_05', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_05' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_06', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_06' );

	sleep( 4.0 );
	//action_DisplayObjectiveString("3", 1.0);
	ACTION_PlaySound( 'Gun_07', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_07' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_08', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_08' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_09', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_09' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_10', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_10' );

	sleep( 2.0 );
	//action_DisplayObjectiveString("4", 1.0);
	ACTION_PlaySound( 'Gun_11', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_11' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_12', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_12' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_13', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_13' );

	sleep( 6.0 );
	//action_DisplayObjectiveString("5", 1.0);
	ACTION_PlaySound( 'Gun_14', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_14' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_15', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_15' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_16', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_16' );
	sleep( 0.2 );
	ACTION_PlaySound( 'Gun_17', "IMPACTS.BULLET_STONE", 1.0, 1.0, 1.0 );
	ACTION_TriggerEvent( 'Gun_17' );
	
}
