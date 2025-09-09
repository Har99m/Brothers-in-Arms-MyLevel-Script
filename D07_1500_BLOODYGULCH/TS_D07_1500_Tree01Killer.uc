//=============================================================================
// TS_D07_1500_Tree01Killer.
//=============================================================================
class TS_D07_1500_Tree01Killer extends TriggeredScript
	placeable;

var Tank Tank_Tank02;
var Actor Tree01;
var Animpawn AP_Tree_01;
var ActorLite PN_TankMove_02;

state Triggered
{
	Begin:

	Tank_Tank02 = Tank( GetPawn( 'Pawn_Panzer02' ) );
	Tree01 = GetFirstActor( 'InvisibleTree01' );
	PN_TankMove_02 = GetNavigationPoint( 'PN_TankMoveHere_02' );
	AP_Tree_01 = AnimPawn( GetPawn( 'AP_SplodingTree_01' ) );

	AP_Tree_01.controller.bGodmode = True;

	ACTION_TankEnterScriptedMode( Tank_Tank02 );

	ACTION_TankMoveTo( Tank_Tank02, PN_TankMove_02 );

	ACTION_TankSetEnemy( Tank_Tank02, Tree01, true );
	sleep( 5.0 );

	ACTION_TankFireCannon( Tank_Tank02 );
	sleep( 0.1 );
	ACTION_TriggerEvent( 'Event_TreeSplode_01' );
	ACTION_DestroyActor( 'SM_Tree01' );
	ACTION_TriggerEvent( 'gbxSplode_Tree01' );
	ACTION_TriggerEvent( 'LeafPoof01' );
	ACTION_PlayLocalSound( "D71400_SOUNDS.TREE_EXPLODE" );

	sleep( 5.0 );

	ACTION_TankLeaveScriptedMode( Tank_Tank02 );
	sleep( 1.0 );

	ACTION_OrderMove( 'Unit_DE_Tank02', 'PN_TankMoveHere_02' );

}
