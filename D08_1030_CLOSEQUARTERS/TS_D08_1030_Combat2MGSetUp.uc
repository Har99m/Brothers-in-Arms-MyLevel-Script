//=============================================================================
// TS_D08_1030_Combat2MGSetUp.
//=============================================================================
class TS_D08_1030_Combat2MGSetUp extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	ACTION_ForceTurretDismount( 'C1_MG42_1' );
	ACTION_TriggerEvent( 'Spawn_C3_MG42_1' );

	sleep( 2.0 );

	ACTION_DestroyActor( 'C1_MG42_1a' );


}
