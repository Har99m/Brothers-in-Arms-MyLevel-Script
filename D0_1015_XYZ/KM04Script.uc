//=============================================================================
// KM04Script.
//=============================================================================
class KM04Script extends TriggeredScript
	placeable;

var Pawn MyPawn, Player;

state Triggered
{
Begin:

	sleep(0.5);
	ACTION_SetAnimSet( 'KM04', "a_cin_d0_XYZ.a_cin_d0_XYZ" );
	ACTION_DetachWeapon( Pawn( GetFirstActor( 'KM04' )), '' );
	ACTION_AttachStaticMesh( Pawn( GetFirstActor( 'KM04' )), StaticMesh's_npc_item_us.equipment.canteen', 'canteen' );

	Idle_Loop:

		// GARNETT CRATE IDLE 1 (L = 7.8)
		ACTION_PlayAnim( 'KM04', 'German_eating_1', 0.2, 1.0);
		sleep( 7.0 );

		// GARNETT CRATE IDLE 2 (L = 9.7)
		ACTION_PlayAnim( 'KM04', 'German_eating_2', 0.2, 1.0);
		sleep( 8.4 );

		// GARNETT CRATE IDLE 3 (L = 8.3)
		ACTION_PlayAnim( 'KM04', 'German_eating_3', 0.2, 1.0);
		sleep( 10.1 );

	Goto( 'Idle_Loop' );

}


state Awake
{
Begin:

	sleep(0.5);
	ACTION_SetAnimSet( 'KM04', "a_cin_d0_XYZ.a_cin_d0_XYZ" );

	Idle_Loop:

		// GARNETT CRATE IDLE 1 (L = 7.8)
		ACTION_PlayAnim( 'KM04', 'German_stands_2', 0.2, 1.0);
		Chair03Script(getFirstActor('Chair03Script')).GotoState('Awake');
		ACTION_PlayLipSyncSound( 'KM04', "D_GER_C.SEEENEMY_D", 1.0, 1.0, 80.0 );
		sleep( 1.86 );	

		ACTION_DetachStaticMesh( Pawn( GetFirstActor( 'KM04' )), StaticMesh's_npc_item_us.equipment.canteen', 'canteen' );
		ACTION_ReattachWeapon( Pawn( GetFirstActor( 'KM04' )), '' );

		WargamePawn( GetPawn('KM04')).eWeaponAimedState = WAS_COMBATRELAXED;
		ACTION_ChangeController ( 'KM04', Class 'gbxAI.Mind');
		sleep(0.1);




}
