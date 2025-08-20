//=============================================================================
// TS_D01_1200_DE02Death.	
//=============================================================================
class TS_D01_1200_DE02Death extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	sleep( 1.0 );

	ACTION_TriggerEvent( 'Counter_MasterDeath' );
	ACTION_TriggerEvent( 'CSG_Squad_Assault_02' );
	ACTION_OrderMove( 'Unit_DE_Assault_02' , 'PN_Charge_04', true );
	ACTION_OrderMove( 'Unit_DE_Assault_02' , 'PN_Charge_06', true );

	sleep( 30.0 );

	ACTION_OrderAssault( 'Unit_DE_Assault_02', 'Unit_Player' );

}
