//=============================================================================
// TS_D10_0800_Tank01Script.
//=============================================================================
class TS_D10_0800_Tank01Script extends TriggeredScript
	placeable;

/*
	ACTION_TankLeaveScriptedMode( AP_OutroTank );

	ACTION_TankMoveTo( AP_OutroTank, PN_OutroTank_03 );

	while( !ACTION_TankIsAtDestination( AP_OutroTank, PN_OutroTank_03 ) )
	{
		
		if( bFirstTime == True )	//---CHECK FOR FIRST PLAY PASS
		{ 	
			ACTION_TriggerEvent( 'CSG_C305' );
			ACTION_TriggerEvent( 'CSG_C303' );

			sleep( 2.0 );

			ACTION_OrderMove( 'UNIT_DE_C303', 'PN_DE_C3_U3_01' );
			ACTION_OrderMove( 'UNIT_DE_C305', 'PN_DE_C3_U5_02' );
			bFirstTime = false;
		}

		sleep( 5.0 );
	
	}
	
		if( bFirstTime2 == True )	//---CHECK FOR FIRST PLAY PASS
		{ 	ACTION_TriggerEvent( 'TS_D08_1030_OutroScene' ); }

	ACTION_TankMoveTo( AP_OutroTank, PN_OutroTank_02 );
	while( !ACTION_TankIsAtDestination( AP_OutroTank, PN_OutroTank_02 ) )
	{
		sleep( 5.0 );
	}
	if( bFirstTime2 == True )
	{ bFirstTime2 = false; }
	Goto( 'Loop' );
	*/
