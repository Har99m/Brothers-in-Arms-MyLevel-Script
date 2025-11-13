//=============================================================================
// KM05Script.
//=============================================================================
class KM05Script extends TriggeredScript
	placeable;

var Pawn MyPawn, Player;

state Triggered
{
Begin:

	sleep(0.5);
	ACTION_SetAnimSet( 'KM05', "a_cin_d0_XYZ.a_cin_d0_XYZ" );
	ACTION_DetachWeapon( Pawn( GetFirstActor( 'KM05' )), '' );
	ACTION_AttachStaticMesh( Pawn( GetFirstActor( 'KM05' )), StaticMesh's_npc_item_us.equipment.canteen', 'canteen' );


	Idle_Loop:

		// GARNETT CRATE IDLE 1 (L = 7.8)
		ACTION_PlayAnim( 'KM05', 'German_eating_3', 0.2, 1.0);
		sleep( 10.1 );

		// GARNETT CRATE IDLE 2 (L = 9.7)
		ACTION_PlayAnim( 'KM05', 'German_eating_1', 0.2, 1.0);
		sleep( 7.0 );

		// GARNETT CRATE IDLE 3 (L = 8.3)
		ACTION_PlayAnim( 'KM05', 'German_eating_2', 0.2, 1.0);
		sleep( 8.4 );

	Goto( 'Idle_Loop' );
}


state Awake
{
Begin:

	sleep(0.5);
	ACTION_SetAnimSet( 'KM05', "a_cin_d0_XYZ.a_cin_d0_XYZ" );

	Idle_Loop:

		// GARNETT CRATE IDLE 1 (L = 7.8)
		ACTION_PlayAnim( 'KM05', 'German_stands_1', 0.2, 1.0);
		Chair02Script(getFirstActor('Chair02Script')).GotoState('Awake');
		sleep( 1.77 );	

		ACTION_DetachStaticMesh( Pawn( GetFirstActor( 'KM05' )), StaticMesh's_npc_item_us.equipment.canteen', 'canteen' );
		ACTION_ReattachWeapon( Pawn( GetFirstActor( 'KM05' )), '' );

		WargamePawn( GetPawn('KM05')).eWeaponAimedState = WAS_COMBATRELAXED;
		ACTION_ChangeController ( 'KM05', Class 'gbxAI.Mind');
		sleep(0.1);





}
