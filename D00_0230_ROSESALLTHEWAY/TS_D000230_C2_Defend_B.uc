//=============================================================================
// TS_D000230_C2_Defend_B.
//=============================================================================
class TS_D000230_C2_Defend_B extends TriggeredScript
	placeable;

state triggered
	{
		Begin:

			//===== Move up fools
				ACTION_OrderMove( 'UNIT_C206' , 'PN_C3_MG_Flank_01' );

					sleep( 25.0 );

				ACTION_OrderMove( 'UNIT_C206' , 'PN_C3_MG_Flank_02' );

					sleep( 15.0 );

				ACTION_OrderAssault( 'UNIT_C206' , 'Unit_Player' );

		ScriptEnd:
	}
