//=============================================================================
// TS_D00_0600_Coffee.
//=============================================================================
class TS_D00_0600_Coffee extends TriggeredScript
	placeable;

var AnimPawn AP_Coffee_German;
var float i;

state Triggered
{
	function OnTrigger()
	{
		//
	}
Begin:
//===== Define	


	ACTION_TriggerEvent( 'CSG_Coffee' );
	ACTION_TriggerEvent( 'CSG_C1_S01' );
	sleep( 0.2 );
	AP_Coffee_German = AnimPawn( GetPawn( 'Pawn_German_Coffee' ));
	
	ACTION_SetAnimSet( 'Pawn_German_Coffee', "a_cin_d00_Action_at_StMartin.a_cin_d0_Action_at_StMartin" );

	ACTION_ClearPawnIdleQueue( 'Pawn_German_Coffee' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_German_Coffee', 'german_coffee_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_German_Coffee', 'german_coffee_idle_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_German_Coffee', 'german_coffee_idle_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_German_Coffee', 'german_coffee_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_German_Coffee', 'german_coffee_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_German_Coffee', 'german_coffee_idle_2' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_German_Coffee', 'german_coffee_idle_1' );
	ACTION_AddAnimToPawnIdleQueue( 'Pawn_German_Coffee', 'german_coffee_idle_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'Pawn_German_Coffee', TRUE );

	ACTION_DetachWeapon( AP_Coffee_German, '' );

	ACTION_ReattachWeapon( AP_Coffee_German, 'rifle_hold_lefthand' );
	
	AP_Coffee_German.AttachToBone( getFirstActor('SMESH_HOTCOFFEE'), 'Bip01 R Hand' );
	AP_Coffee_German.AttachToBone( getFirstActor('PFX_HOTCOFFEE'), 'Bip01 R Hand' );

	getFirstActor('SMESH_HOTCOFFEE').SetRelativeLocation( vect(7.5,-5.0,3.2) );
	getFirstActor('SMESH_HOTCOFFEE').SetRelativeRotation( rot(0,16389,-5461) );

	//ACTION_AttachStaticMesh( AP_Coffee_German, staticmesh's_npc_item_de.equipment.de_cup', 'rifle_hold' );

	//AP_Coffee_German.bRotateToDesired = False;
	//AP_Coffee_German.bNoTurnBody = True;

	AP_Coffee_German.Controller.Focus = getfirstActor( 'LT_RUNTARGET' );

	GotoState( 'GermanDrink' );
}

State GermanDrink
{
	function OnTrigger()
	{
		ACTION_DestroyActor('SHOOTTRIGCOFFEE');
		ACTION_DestroyActor('gbxTrig_Coffee');
		GotoState( 'GermanScare' );
	}
Begin:

	ACTION_WaitForInterceptedActionKeys( KEY_ACTION_FIRE, False, , True );
	If ( vSize( GetLocalPlayerPawn().Location - getFirstActor('LT_RUNTARGET').location ) <= 4100 )
	{
		ACTION_DestroyActor('SHOOTTRIGCOFFEE');
		ACTION_DestroyActor('gbxTrig_Coffee');
		GotoState( 'GermanScare', 'PlayerShot' );
	}
	sleep(0.2);
	Goto('Begin');
}

State GermanScare
{
	function OnTrigger()
	{
		//
	}
Begin:
	If ( vSize( GetLocalPlayerPawn().Location - getFirstActor('LT_RUNTARGET').location ) <= 2600 )
	{
		ACTION_PlaySoundDirect( getLocalPlayerPawn(), "W_COLT.DRYFIRE", 1.0, 1.5, 2048.0 );
	}
	sleep( 0.1 );




PlayerShot:
	ACTION_ChangeController( 'Pawn_German_C1_Coffee_02', class'Mind' );
	ACTION_PlayAnimDirect( AP_Coffee_German, 'german_coffee_react', 0.2, 1.0, False, , ,1);
	ACTION_OrderTarget( 'Unit_C1_S01', 'Unit_Player' );
	sleep(0.1 );
	ACTION_PlayLipsyncSound( 'Pawn_German_Coffee', "BD_SP_GER_A.M_HEARDNOISE_B", 1.0, 1.0, 1.0 );
	sleep( 0.6 );
//	ACTION_PlayLipsyncSound( 'Pawn_German_Coffee', "BD_SP_GER_A.M_MELEE_A", 1.0, 1.0, 1.0 );

	ACTION_TriggerEvent( 'TSCombat_C1_A' );
	ACTION_TriggerEvent( 'PFX_HOTCOFFEE' );

	AP_Coffee_German.DetachFromBone( getFirstActor('PFX_HOTCOFFEE') );
	AP_Coffee_German.DetachFromBone( getFirstActor('SMESH_HOTCOFFEE') );
	getFirstActor('SMESH_HOTCOFFEE').bHidden = TRUE;

	ACTION_PlayLipsyncSound( 'Pawn_German_Coffee', "BD_SP_GER_A.M_SEEENEMY_E", 1.0, 1.0, 1.0 );

	ACTION_ClearPawnIdleQueue( 'Pawn_German_Coffee' );

	ACTION_WaitForAnimEnd( AP_Coffee_German, 0 );



	ACTION_DetachWeapon( AP_Coffee_German, '' );
	ACTION_ReattachWeapon( AP_Coffee_German, 'rifle_hold' );

	ACTION_PlayAnimDirect( AP_Coffee_German, 'standing_hop_over_wall_96', 0.0, 1.0, False, , ,1 );

	

	ACTION_WaitForAnimEnd( AP_Coffee_German, 0 );

	ACTION_PlayAnimDirect( AP_Coffee_German, 'Standing_run', 0.0, 1.0, False, , ,1 );
	ACTION_WaitForAnimEnd( AP_Coffee_German, 0 );
	ACTION_PlayAnimDirect( AP_Coffee_German, 'Standing_run', 0.0, 1.0, False, , ,1 );
	ACTION_WaitForAnimEnd( AP_Coffee_German, 0 );
	ACTION_PlayAnimDirect( AP_Coffee_German, 'Standing_run', 0.0, 1.0, False, , ,1 );
	ACTION_WaitForAnimEnd( AP_Coffee_German, 0 );
	ACTION_PlayAnimDirect( AP_Coffee_German, 'Standing_run', 0.0, 1.0, False, , ,1 );
	ACTION_WaitForAnimEnd( AP_Coffee_German, 0 );
	ACTION_PlayAnimDirect( AP_Coffee_German, 'Standing_run', 0.0, 1.0, False, , ,1 );
	ACTION_WaitForAnimEnd( AP_Coffee_German, 0 );
	ACTION_PlayAnimDirect( AP_Coffee_German, 'Standing_idle_relaxed_1', 0.0, 1.0, True, , ,1 );
	ACTION_ChangeController( 'PAWN_GERMAN_COFFEE', class'Mind' );

	ACTION_AssignToUnit( 'PAWN_German_Coffee', 'Unit_C1_S01' );
	
	
	//ACTION_MoveTowardTag( 'Pawn_german_Coffee', 'PN_C1_DE01_A', False );
//
	//ACTION_PlayAnimDirect( AP_Coffee_German, 'Standing_idle_relaxed_1', 0.2, 1.0, True, );

}

