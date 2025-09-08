//=============================================================================
// TS_D01_1200_DE05Death.
//=============================================================================
class TS_D01_1200_DE05Death extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	sleep( 1.0 );

	ACTION_TriggerEvent( 'Counter_MasterDeath' );
	ACTION_TriggerEvent( 'CSG_Squad_Assault_05' );
	ACTION_OrderMove( 'Unit_DE_Assault_05', 'PN_Charge_02', true );

	sleep( 30.0 );

	ACTION_OrderMove( 'Unit_DE_Assault_05', 'PN_Charge_05', true );

	sleep( 30.0 );

	ACTION_OrderAssault( 'Unit_DE_Assault_05', 'Unit_Player' );
}
