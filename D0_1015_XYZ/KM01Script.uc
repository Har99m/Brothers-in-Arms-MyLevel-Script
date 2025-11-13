//=============================================================================
// KM01Script.
//=============================================================================
class KM01Script extends TriggeredScript
	placeable;

var Pawn MyPawn, Player;

state Triggered
{
Begin:


	sleep(0.5);
	ACTION_SetAnimSet( 'KM06', "a_cin_d0_XYZ.a_cin_d0_XYZ" );
	ACTION_DetachWeapon( Pawn( GetFirstActor( 'KM06' )), '' );
	ACTION_AttachStaticMesh( Pawn( GetFirstActor( 'KM06' )), StaticMesh's_npc_item_us.equipment.canteen', 'canteen' );

	Idle_Loop:

		ACTION_PlayAnim( 'KM06', 'German_eating_2', 0.2, 1.0);
		sleep( 8.4 );

		ACTION_PlayAnim( 'KM06', 'German_eating_1', 0.2, 1.0);
		sleep( 7.0 );

		ACTION_PlayAnim( 'KM06', 'German_eating_3', 0.2, 1.0);
		sleep( 10.1 );

	Goto( 'Idle_Loop' );

}

state Awake
{
Begin:

	sleep(0.5);
	ACTION_SetAnimSet( 'KM06', "a_cin_d0_XYZ.a_cin_d0_XYZ" );

		ACTION_PlayLipSyncSound( 'KM05', "D_GERMAN_A.G_run_d", 150, 1, 1000, true );
		ACTION_PlayAnim( 'KM06', 'German_eating_reacts', 0.2, 1.0);
		sleep( 0.77 );
		ACTION_PlayLipSyncSound( 'KM05', "D_GER_A.SEEENEMY_F", 1.0, 1.0, 80.0 );
		sleep(1.0);

		ACTION_PlayAnim( 'KM06', 'German_stands_2', 0.2, 1.0);
		Chair01Script(getFirstActor('Chair01Script')).GotoState('Awake');
		sleep( 1.86 );	

		ACTION_DetachStaticMesh( Pawn( GetFirstActor( 'KM06' )), StaticMesh's_npc_item_us.equipment.canteen', 'canteen' );
		ACTION_ReattachWeapon( Pawn( GetFirstActor( 'KM06' )), '' );

		WargamePawn( GetPawn('KM06')).eWeaponAimedState = WAS_COMBATRELAXED;
		ACTION_ChangeController ( 'KM06', Class 'gbxAI.Mind');
		sleep(0.1);
	
}

