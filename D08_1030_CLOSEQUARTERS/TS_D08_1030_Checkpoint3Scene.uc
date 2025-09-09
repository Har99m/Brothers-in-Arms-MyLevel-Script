//=============================================================================
// TS_D08_1030_Checkpoint3Scene.
//=============================================================================
class TS_D08_1030_Checkpoint3Scene extends TriggeredScript
	placeable;

var AnimPawn AP_McCreary;

State Triggered
{
Begin:
//sets up the 'scene' for checkpoint 3
	GetFirstActor('StaticMeshActor_RubbleDestroy').bHidden=True;
	ACTION_BlockNavPoints( 'PN_OutroWall' );

	ACTION_ChangeScriptedSequence( 'AP_MacIntro', 'SS_Mac_Checkpoint' );
	ACTION_ChangeScriptedSequence( 'AP_McCrearyIntro', 'SS_McCreary_Checkpoint' );

	ACTION_TriggerEvent( 'Event_StartCheckpointAnims' );

	AP_McCreary = AnimPawn(GetPawn('AP_McCrearyIntro'));

	ACTION_GivePlayerWeapon( AP_McCreary, "gbxInventory.WeapUSM1_" ); 
	ACTION_ReattachWeapon( AP_McCreary, ''); 

	ACTION_DestroyActor('gbxTrigger_PlaneFlyBy');
	ACTION_DestroyACtor('gbxTrigger_PlaneFlyByB');

}
