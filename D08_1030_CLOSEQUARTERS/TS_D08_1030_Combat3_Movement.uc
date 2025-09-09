//=============================================================================
// TS_D08_1030_Combat3_Movement.
//=============================================================================
class TS_D08_1030_Combat3_Movement extends TriggeredScript
	placeable;

var AnimPawn AP_Corrion, AP_Baker;
var Tank AP_OutroTank;
var Actor Enemy_LT01, Enemy_LT02, Enemy_LT03, Enemy_LT04, Enemy_LT05, Enemy_LT06, Enemy_LT07, Enemy_LT08, Enemy_LT09;
var Actorlite PN_OutroTank_00, PN_OutroTank_01, PN_OutroTank_02, PN_OutroTank_03, PN_OutroTank_04, PN_US_Baker_Outro;
var bool bFirstTime, bFirstTime2, bPlayerAtWall;
var TS_D08_1030_OutroScene OutroScene_Ref;

state Triggered
{
	function Ontrigger()
	{
	GotoState( 'TankScene' );
	}
Begin:

	ACTION_TriggerEVent( 'BV_BakerOutro' );
	ACTION_TriggerEvent( 'BV_CorrionOutro' );
	ACTION_TriggerEvent( 'BVT_C3_Rushing_Germans' );
	bFirstTime = true;
	bFirstTime2 = true;
	bPlayerAtWall = false;

	OutroScene_Ref = TS_D08_1030_OutroScene( GetFirstActor( 'TS_D08_1030_OutroScene' ) );

	PN_OutroTank_00 = GetNavigationPoint( 'PN_OutroTank_00' );
	PN_OutroTank_01 = GetNavigationPoint( 'PN_OutroTank_01' );
	PN_OutroTank_02 = GetNavigationPoint( 'PN_OutroTank_02' );
	PN_OutroTank_03 = GetNavigationPoint( 'PN_OutroTank_03' );
	PN_OutroTank_04 = GetNavigationPoint( 'PN_OutroTank_04' );
	PN_US_Baker_Outro = GetNavigationPoint( 'PN_US_Baker_Outro2' );

	Enemy_LT01 = GetFirstActor( 'LT_OutroTarget01' );
	Enemy_LT02 = GetFirstActor( 'LT_OutroTarget02' );
	Enemy_LT03 = GetFirstActor( 'LT_OutroTarget03' );
	Enemy_LT04 = GetFirstActor( 'LT_OutroTarget04' );
	Enemy_LT05 = GetFirstActor( 'LT_OutroTarget05' );
	Enemy_LT06 = GetFirstActor( 'LT_OutroTarget06' );
	Enemy_LT07 = GetFirstActor( 'LT_OutroTarget07' );	
	Enemy_LT08 = GetFirstActor( 'LT_OutroTarget08' );
	Enemy_LT09 = GetFirstActor( 'LT_OutroTarget09' );

	ACTION_SetObjectiveBeaconState( 'gbxWaypointBeacon_Baker', false, false, false );
	ACTION_SetObjectiveBeaconState( 'gbxWB_Panzer', true, true, false );


	ACTION_TriggerEvent( 'BV_OutroBakerArea' );
	ACTION_TriggerEvent( 'gbxWB_Orchard' );
	ACTION_SetObjectiveBeaconState( 'gbxWB_Orchard', true, true, false );
	ACTION_SetObjectiveBeaconState( 'gbxWaypointBeacon_MainStreet', false, false, true );
	ACTION_TriggerEvent( 'gbxWaypointBeacon_Baker' );
	ACTION_SetObjectiveBeaconState( 'gbxWaypointBeacon_Baker', false, false, false );
	ACTION_TriggerEvent( 'gbxWB_Panzer' );
	ACTION_SetObjectiveBeaconState( 'gbxWB_Panzer', false, false, false );

	sleep( 1.0 );

	ACTION_TriggerEvent('CSG_C303');
	ACTION_OrderMove('UNIT_DE_C303','PN_DE_C3_U6_01a');
	
	sleep( 1.0 );

	ACTION_TriggerEvent('CSG_C305');
	ACTION_OrderMove('UNIT_DE_C305','PN_DE_C3_U6_01');

	//Changes to midtro script timing happening here.
	//sleep( 20.0 );

	ACTION_TriggerEvent('TS_D08_1030_CrowEnd');

	sleep(5.0);

	ACTION_OrderMove('UNIT_DE_C305','PN_DE_C3_U6_01b');

	//Changes to midtro script timing happening here.
	//sleep( 15.0 );
	sleep(10.0);

	ACTION_SetObjectiveBeaconState( 'gbxWB_Orchard', false, false, false );
//	ACTION_TriggerEvent( 'gbxWaypointBeacon_Baker' );
	ACTION_SetObjectiveBeaconState( 'gbxWaypointBeacon_Baker', true, true, false );
//	ACTION_TriggerEvent( 'gbxWB_Orchard' );
//	ACTION_DestroyActor( 'gbxWB_Orchard' );
	ACTION_TriggerEvent( 'TS_D08_1030_OutroScene' );

	ACTION_WaitForEvent( 'Event_PlayerAtWall' );


	ACTION_TriggerEvent( 'TSG_OutroTank' );
	sleep( 0.15 );
	bPlayerAtWall = true;
	AP_OutroTank = Tank( GetPawn( 'Tank_OutroTank' ));
	ACTION_TankEnterScriptedMode( AP_OutroTank );
	AP_OutroTank.MaxThrust = 50;
	sleep( 1.0 );
	ACTION_TankMoveTo( AP_OutroTank, PN_OutroTank_01 );
	ACTION_TriggerEvent('Emitter_TankEnter_End');
	slog( "***********************TANK MOVE" );
	ACTION_WaitForEvent( 'EVENT_TankATHill' );
	slog( "***********************TANK AT HILL" );
	ACTION_TankSetSpeed( AP_OutroTank, 1.0 );
	ACTION_TankSetEnemy( AP_OutroTank, Enemy_LT03, true );
	while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
	{
		sleep( 0.2 );
	}
	slog( "***********************TANK FIRE AT HILL" );

	sleep(2.0);
	ACTION_TriggerEvent( 'TS_D08_1030_OutroScene' );
	sleep(1.0);

	ACTION_TankFireCannon( AP_OutroTank, true );
		sleep(0.1);
	ACTION_TriggerEvent('Emitter_FirstTankShot');
//	ACTION_OrderMove( 'Unit_US_BakerCorrion', 'PN_US_Baker_Outro' );
	sleep( 2.0 );
	while( !ACTION_TankIsAtDestination( AP_OutroTank, PN_OutroTank_01 ) )
	{
		sleep( 1.0 );
	}
	slog( "***********************TANK AT BOTTOM OF HILL" );
	while( !OutroScene_Ref.bBakerAtOutro )
	{
		sleep( 0.5 );
	}
	slog( "***********************BAKER SAFE AT HOME" );
	ACTION_TankSetEnemy( AP_OutroTank, Enemy_LT01, true );
	while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
	{
		sleep( 0.5 );
	}
	ACTION_TankFireCannon( AP_OutroTank );
	sleep( 0.2 );

	ACTION_PlayLocalSound("EXPLOSIONS.HOUSE_EXT");
	ACTION_TriggerEvent( 'EVENT_TreeExplosion' );
	ACTION_TriggerEvent('PFX_GrenadeBlast');
	ACTION_SetHidden( 'SM_OutroRubble', false );
	ACTION_TriggerEvent( 'BV_OutroBakerArea' );
	sleep( 1.0 );
	ACTION_DestroyActor( 'Baker' );
	ACTION_DestroyActor( 'Corrion' );
	ACTION_SetHidden( 'SM_OutroBodies', False );
	sleep( 2.0 );
	ACTION_SetObjectiveBeaconState( 'gbxWaypointBeacon_Baker', false, false, false );
	ACTION_SetObjectiveBeaconState( 'gbxWB_Panzer', true, true, false );
	ACTION_TankSetEnemy( AP_OutroTank, Enemy_LT04, true );
	sleep( 2.0 );
	while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
	{
		sleep( 0.2 );
	}
	sleep(3.5);
	ACTION_TankFireCannon( AP_OutroTank, true );
	sleep( 0.1 );
	ACTION_TriggerEvent( 'BV_OutroWall' );
	ACTION_UnBlockNavPoints( 'PN_OutroWall' );
	ACTION_TriggerEvent( 'SMAS_BakerWall' );
//	ACTION_SetHidden( 'SM_OutroWall_Dest', false );
//	ACTION_SetHidden( 'SM_OutroWall_Whole', true );
//	GetFirstActor('SM_OutroWall_Whole').SetCollision(False,false,false);
	ACTION_TriggerEvent('EVENT_WallExplosion');
	ACTION_TriggerEvent('gbxExplosionTrigger_WallExplosion');
	ACTION_TriggerEvent('TS_D08_1030_WallExplode_Demo');
	ACTION_TriggerEvent('PFX_GrenadeBlast_OFF');

	ACTION_TriggerEvent('TS_D08_1030_PanzerfaustHint');


			ACTION_OrderMove( 'UNIT_DE_C303', 'PN_DE_C3_U3_01' );
			ACTION_OrderMove( 'UNIT_DE_C305', 'PN_DE_C3_U5_01' );

	sleep( 2.0 );
	ACTION_TankMoveTo( AP_OutroTank, PN_OutroTank_03 );
	ACTION_TankLeaveScriptedMode( AP_OutroTank );

Loop:
	
	ACTION_TankMoveTo( AP_OutroTank, PN_OutroTank_03 );

	while( !ACTION_TankIsAtDestination( AP_OutroTank, PN_OutroTank_03 ) )
	{
		
		if( bFirstTime == True )	//---CHECK FOR FIRST PLAY PASS
		{ 	
			sleep( 2.0 );
			bFirstTime = false;
		}

		

		sleep( 5.0 );
	
	}

	//ACTION_TriggerEvent('TS_D08_1030_TreeExplodeRand');

	ACTION_TankMoveTo( AP_OutroTank, PN_OutroTank_02 );
	while( !ACTION_TankIsAtDestination( AP_OutroTank, PN_OutroTank_02 ) )
	{
		sleep( 5.0 );
	}
	if( bFirstTime2 == True )
	{ bFirstTime2 = false; }
	Goto( 'Loop' );

}
