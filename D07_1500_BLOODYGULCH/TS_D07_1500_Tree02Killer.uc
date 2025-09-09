//=============================================================================
// TS_D07_1500_Tree02Killer.
//=============================================================================
class TS_D07_1500_Tree02Killer extends TriggeredScript
	placeable;

var Tank Tank_Tank02;
var Actor Tree02;
var Animpawn AP_Tree_02;
var ActorLite PN_TankMove_02;

state Triggered
{
	Begin:

	Tank_Tank02 = Tank( GetPawn( 'Pawn_Panzer02' ) );
	Tree02 = GetFirstActor( 'InvisibleTree02' );
	PN_TankMove_02 = GetNavigationPoint( 'PN_TankMoveHere_01' );
	AP_Tree_02 = AnimPawn( GetPawn( 'AP_SplodingTree_02' ) );

	AP_Tree_02.controller.bGodmode = True;

	ACTION_TankEnterScriptedMode( Tank_Tank02 );

	ACTION_TankSetEnemy( Tank_Tank02, Tree02, true );
	sleep( 3.0 );

	ACTION_TankFireCannon( Tank_Tank02 );
	sleep( 0.1 );
	ACTION_TriggerEvent( 'Event_TreeSplode_02' );
	ACTION_DestroyActor( 'SM_Tree01' );
	ACTION_TriggerEvent( 'gbxSplode_Tree02' );
	ACTION_TriggerEvent( 'LeafPoof02' );
	ACTION_PlayLocalSound( "D71400_SOUNDS.TREE_EXPLODE" );

	ACTION_TankLeaveScriptedMode( Tank_Tank02 );
	sleep( 0.5 );
	ACTION_TankMoveTo( Tank_Tank02, PN_TankMove_02 );

}
