//=============================================================================
// CrowScript.
//=============================================================================
class CrowScript extends TriggeredScript
	placeable;

state default
{
Begin:

	ACTION_SetAnimSet( 'Crow1', "k_animal.crow_c_anim" );
	ACTION_PlayAnim( 'Crow1', 'crow_flying', 0.1, 1.0, true);

	ACTION_SetAnimSet( 'Crow2', "k_animal.crow_c_anim" );
	ACTION_PlayAnim( 'Crow2', 'crow_flying', 0.1, 1.0, true);

}

state Triggered
{
Begin:

	ACTION_DisableBattleDialogue();

	ACTION_TriggerEvent( 'IntroCrow1' );
	sleep( 0.1 );
	ACTION_TriggerEvent( 'IntroCrow2' );
	sleep( 3.5 );
	ACTION_PlayAnim( 'Crow1', 'crow_gliding', 0.3, 1.0, true);
	sleep( 1.15 );
	ACTION_PlayAnim( 'Crow1', 'crow_flying', 0.3, 1.0, true);
	sleep( 0.85 );
	ACTION_PlayAnim( 'Crow2', 'crow_gliding', 0.3, 1.0, true);
	sleep( 1.0 );
	ACTION_PlayAnim( 'Crow1', 'crow_gliding', 0.3, 1.0, true);
	sleep( 0.65 );
	ACTION_PlayAnim( 'Crow2', 'crow_flying', 0.3, 1.0, true);
	sleep( 0.75 );
	ACTION_PlayAnim( 'Crow1', 'crow_flying', 0.3, 1.0, true);
	sleep( 0.75 );

	ACTION_WaitForEvent( 'IntroCrow2Done' );
	ACTION_DestroyActor( 'Crow2' );

	ACTION_WaitForEvent( 'IntroCrow1Done' );
	ACTION_DestroyActor( 'Crow1' );

	ACTION_EnableBattleDialogue();
}
