//=============================================================================
// TS_D08_1030_TreeExplodeRand.
//=============================================================================
class TS_D08_1030_TreeExplodeRand extends TriggeredScript
	placeable;

var Tank AP_OutroTank;
var Actor Target_For_Tank;

var AnimPawn AnimPawn_TreeExplode;

state Default
	{
	Begin:

	AnimPawn_TreeExplode = AnimPawn(GetPawn('AnimPawn_TreeExplode'));
	ACTION_SetAnimSet( 'AnimPawn_TreeExplode', "k_prop.cq_house_pieces" );

	}

state Triggered
	{
	Begin:

	ACTION_DestroyActor('Trigger_Shoot1');

	Target_For_Tank = GetFirstActor( 'Target_For_Tank' );
	AP_OutroTank = Tank( GetPawn( 'Tank_OutroTank' ));

	ACTION_TankEnterScriptedMode( AP_OutroTank );

	ACTION_TankSetEnemy( AP_OutroTank, Target_For_Tank, true );	

	while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
	{
		sleep( 0.2 );
	}

	ACTION_TankFireCannon( AP_OutroTank, true );
		sleep(0.2);
	ACTION_TankLeaveScriptedMode( AP_OutroTank );

	ACTION_TriggerEvent('BlockingVolumeToggleable_TreeTwo');
	ACTION_PlayAnim( 'AnimPawn_TreeExplode', 'Fall', 0.2, 0.5 );
	ACTION_PlayLocalSound( "D71400_SOUNDS.TREE_EXPLODE" );
	ACTION_TriggerEvent('Emitter_TreeExplode');
	ACTION_DestroyActor('Trigger_Shoot1');
	}
