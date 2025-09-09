//=============================================================================
// TS_D08_1030_Combat3Assault.
//=============================================================================
class TS_D08_1030_Combat3Assault extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_OrderAssault( 'UNIT_DE_C301', 'Player_Unit' );
	ACTION_OrderAssault( 'UNIT_DE_C302', 'Player_Unit' );
	ACTION_OrderAssault( 'UNIT_DE_C303', 'Player_Unit' );
	ACTION_OrderAssault( 'UNIT_DE_C304', 'Player_Unit' );
	ACTION_OrderAssault( 'UNIT_DE_C304a', 'Player_Unit' );
	ACTION_OrderAssault( 'UNIT_DE_C304b', 'Player_Unit' );
	ACTION_OrderAssault( 'UNIT_DE_C304c', 'Player_Unit' );
	ACTION_OrderAssault( 'UNIT_DE_C305', 'Player_Unit' );
	ACTION_OrderAssault( 'UNIT_DE_C306', 'Player_Unit' );
	ACTION_OrderAssault( 'Unit_C1_MG42_1', 'Player_Unit' );

	ScriptEnd:
	}
