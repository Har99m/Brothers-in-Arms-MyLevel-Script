//=============================================================================
// TS_D01_1200_DE03Death.
//=============================================================================
class TS_D01_1200_DE03Death extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	sleep( 1.0 );

	ACTION_TriggerEvent( 'Counter_MasterDeath' );
	ACTION_TriggerEvent( 'CSG_Squad_Assault_03' );
	ACTION_OrderMove( 'Unit_DE_Assault_03' , 'PN_Charge_02', true );
	ACTION_OrderMove( 'Unit_DE_Assault_03' , 'PN_Charge_05', true );

	sleep( 30.0 );

	ACTION_OrderAssault( 'Unit_DE_Assault_03', 'Unit_Player' );

}
