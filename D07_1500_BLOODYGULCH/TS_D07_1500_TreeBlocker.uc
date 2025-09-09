//=============================================================================
// TS_D07_1500_TreeBlocker.
//=============================================================================
class TS_D07_1500_TreeBlocker extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	sleep( 1.0 );

	ACTION_TriggerEvent( 'gbxSplode_TreeBlocker' );
	ACTION_TriggerEvent( 'Mover_TreeBlocker' );
	ACTION_TriggerEvent( 'BV_IntroPath' );

	ACTION_SetRepelBullets( 'gbxPlayerPawn', false );
	ACTION_SetRepelBullets( 'Pawn_Friar', false );
	ACTION_SetRepelBullets( 'Pawn_Corrion', false );
	ACTION_SetRepelBullets( 'Pawn_Paddock', false );
	ACTION_SetRepelBullets( 'Pawn_Marsh', false );
	ACTION_SetRepelBullets( 'Pawn_Campbell', false );

	ACTION_AttachUnitToSuperUnit( 'Unit_US_Base', 'Unit_Player' );
	ACTION_AttachUnitToSuperUnit( 'Unit_US_Ass', 'Unit_Player' );

	sleep( 2.0 );

	ACTION_TriggerEvent( 'TS_D07_1500_CrazyMindChange' );

}
