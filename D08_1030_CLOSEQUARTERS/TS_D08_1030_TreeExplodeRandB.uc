//=============================================================================
// TS_D08_1030_TreeExplodeRandB.
//=============================================================================
class TS_D08_1030_TreeExplodeRandB extends TriggeredScript
	placeable;

var AnimPawn AnimPawn_TreeExplode;

state Default
	{
	Begin:

	AnimPawn_TreeExplode = AnimPawn(GetPawn('AnimPawn_TreeExplode2'));
	ACTION_SetAnimSet( 'AnimPawn_TreeExplode2', "k_prop.cq_house_pieces" );

	}

state Triggered
	{
	Begin:

	ACTION_TriggerEvent('BlockingVolumeToggleable_TreeOne');
	ACTION_PlayAnim( 'AnimPawn_TreeExplode2', 'Fall', 0.2, 0.5 );
	ACTION_PlayLocalSound( "D71400_SOUNDS.TREE_EXPLODE" );
	ACTION_TriggerEvent('Emitter_TreeExplode2');
	ACTION_DestroyActor('Trigger_Shoot2');

	}
