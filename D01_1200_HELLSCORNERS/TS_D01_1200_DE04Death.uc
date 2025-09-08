//=============================================================================
// TS_D01_1200_DE04Death.
//=============================================================================
class TS_D01_1200_DE04Death extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	sleep( 1.0 );

	ACTION_TriggerEvent( 'Counter_MasterDeath' );
	ACTION_TriggerEvent( 'CSG_Squad_Assault_04' );
	ACTION_OrderMove( 'Unit_DE_Assault_04' , 'PN_Charge_03', true );
	ACTION_OrderMove( 'Unit_DE_Assault_04' , 'PN_Charge_05', true );

	sleep( 60.0 );

	ACTION_OrderAssault( 'Unit_DE_Assault_04', 'Unit_Player' );

}
