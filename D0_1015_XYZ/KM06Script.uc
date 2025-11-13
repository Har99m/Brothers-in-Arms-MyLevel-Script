//=============================================================================
// KM06Script.
//=============================================================================
class KM06Script extends TriggeredScript
	placeable;

var Pawn MyPawn, Player;

state Triggered
{
Begin:

	sleep(0.5);
	ACTION_SetAnimSet( 'KM01', "a_cin_d0_XYZ.a_cin_d0_XYZ" );
	ACTION_DetachWeapon( Pawn( GetFirstActor( 'KM01' )), '' );
	ACTION_AttachStaticMesh( Pawn( GetFirstActor( 'KM01' )), StaticMesh's_npc_item_us.equipment.canteen', 'canteen' );


	Idle_Loop:

		// GARNETT CRATE IDLE 1 (L = 7.8)
		ACTION_PlayAnim( 'KM01', 'German_eating_4', 0.2, 1.0);
		sleep( 4.2 );

		// GARNETT CRATE IDLE 2 (L = 9.7)
		ACTION_PlayAnim( 'KM01', 'German_eating_3', 0.2, 1.0);
		sleep( 10.1 );

		// GARNETT CRATE IDLE 3 (L = 8.3)
		ACTION_PlayAnim( 'KM01', 'German_eating_1', 0.2, 1.0);
		sleep( 7.0 );

	Goto( 'Idle_Loop' );

}

state Awake
{
Begin:

	sleep(0.5);
	ACTION_SetAnimSet( 'KM01', "a_cin_d0_XYZ.a_cin_d0_XYZ" );


		// GARNETT CRATE IDLE 1 (L = 7.8)
		ACTION_PlayAnim( 'KM01', 'German_stands_2', 0.2, 1.0);
		Chair04Script(getFirstActor('Chair04Script')).GotoState('Awake');
		ACTION_PlayLipSyncSound( 'KM06', "D_GER_A.SEEENEMY_D", 1.0, 1.0, 80.0 );
		sleep( 1.86 );	

		ACTION_DetachStaticMesh( Pawn( GetFirstActor( 'KM01' )), StaticMesh's_npc_item_us.equipment.canteen', 'canteen' );
		ACTION_ReattachWeapon( Pawn( GetFirstActor( 'KM01' )), '' );

		WargamePawn( GetPawn('KM01')).eWeaponAimedState = WAS_COMBATRELAXED;
		ACTION_ChangeController ( 'KM01', Class 'gbxAI.Mind');
		sleep(0.1);





}
