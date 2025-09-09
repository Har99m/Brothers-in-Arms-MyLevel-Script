//=============================================================================
// TS_D08_1030_HouseExplosion.
//=============================================================================
class TS_D08_1030_HouseExplosion extends TriggeredScript
	placeable;

var AnimPawn AnimPawn_HouseCollapse;

state Default
	{
	Begin:

	AnimPawn_HouseCollapse = AnimPawn(GetPawn('AnimPawn_HouseCollapse'));
	ACTION_SetAnimSet( 'AnimPawn_HouseCollapse', "k_prop.cq_house_pieces" );
	
}

state Triggered
	{
	Begin:

	ACTION_PlayAnim( 'AnimPawn_HouseCollapse', 'cq_house_2_explode', 0.2, 2 );
	ACTION_BlockNavPoints('PathNode_BLOCK_HOUSE_EXPLODE');

}
