//=============================================================================
// TS_D08_1030_Checkpoint1Scene.
//=============================================================================
class TS_D08_1030_Checkpoint1Scene extends TriggeredScript
	placeable;

var AnimPawn AP_McCreary;

State Triggered
{
Begin:

	AP_McCreary = AnimPawn( GetPawn( 'AP_McCrearyIntro' ));

//sets up the 'scene' for checkpoint 1
	ACTION_BlockNavPoints( 'PN_OutroWall' );
	ACTION_BlockNavPoints( 'PN_BLOCK_C3' );
	ACTION_BlockNavPoints( 'PN_BLOCK_C2' );

	ACTION_ChangeScriptedSequence( 'AP_MacIntro', 'SS_Mac_Checkpoint' );
	ACTION_ChangeScriptedSequence( 'AP_McCrearyIntro', 'SS_McCreary_Checkpoint' );

	ACTION_TriggerEvent( 'Event_StartCheckpointAnims' );

	ACTION_GivePlayerWeapon( AP_McCreary, "gbxInventory.WeapUSM1_" );
	ACTION_ReattachWeapon( AP_McCreary, '');
}

