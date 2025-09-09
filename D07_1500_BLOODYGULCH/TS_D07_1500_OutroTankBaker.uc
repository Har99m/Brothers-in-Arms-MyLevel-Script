//=============================================================================
// TS_D07_1500_OutroTankBaker.
//=============================================================================
class TS_D07_1500_OutroTankBaker extends TriggeredScript
	placeable;

var Tank AP_BakerTank;
var ActorLite PN_BakerTank_End, PN_BakerTank_P1, PN_BakerTank_P2, PN_BakerTank_P3,
			PN_BakerTankNewTarget, PN_BakerTank_P4;
var Actor Enemy_LT01, Enemy_LT02, Enemy_LT03, Enemy_LT04, Enemy_LT05, BakerTarget,
			Enemy_LT06, Enemy_LT07, Enemy_LT08, Enemy_LT09, Enemy_LT10;
var Animpawn AP_Baker;
var float i;
var int ranI;
var TS_D07_1500_CrazyMindChange CleanUp_Ref;
var TS_D07_1500_OutroScene OutroScene_Ref;
var TS_D07_1500_Hill30Dudes Hill30Dudes_Ref;
var bool bTankGotoSpot1, bTankGotoSpot2, bTankGotoSpot3, bTankGotoEnd;
var Unit GermanUnit[5];

function PostBeginPlay()
{
	Super.PostBeginPlay();

	CleanUp_Ref = TS_D07_1500_CrazyMindChange( GetFirstActor( 'TS_D07_1500_CrazyMindChange' ) );
	OutroScene_Ref = TS_D07_1500_OutroScene( GetFirstActor( 'TS_D07_1500_OutroScene' ) );
	Hill30Dudes_Ref = TS_D07_1500_Hill30Dudes( GetFirstActor( 'TS_D07_1500_Hill30Dudes' ) );

	GermanUnit[0] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad01' ));
	GermanUnit[1] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad02' ));
	GermanUnit[2] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad03' ));
	GermanUnit[3] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad04' ));

	bTankGotoSpot1 = false;
	bTankGotoSpot2 = false;
	bTankGotoSpot3 = false;
	bTankGotoEnd = false;

	PN_BakerTank_P1 = GetNavigationPoint( 'PN_BakerTank_P1' );
	PN_BakerTank_P2 = GetNavigationPoint( 'PN_BakerTank_P2' );
	PN_BakerTank_P3 = GetNavigationPoint( 'PN_BakerTank_P3' );
	PN_BakerTank_P4 = GetNavigationPoint( 'PN_BakerTank_P4' );
	PN_BakerTank_End = GetNavigationPoint( 'PN_BakerTank_End' );
	PN_BakerTankNewTarget = GetNavigationPoint( 'PN_BakerTankNewTarget' );

	Enemy_LT01 = GetFirstActor( 'LT_BakerTarget01' );		//----Point1
	Enemy_LT02 = GetFirstActor( 'LT_BakerTarget02' );		//----Point2
	Enemy_LT03 = GetFirstActor( 'LT_BakerTarget03' );		//----Point3
	Enemy_LT04 = GetFirstActor( 'LT_BakerTarget04' );		//----Point4
	Enemy_LT05 = GetFirstActor( 'LT_BakerTarget05' );		//----Point5
	Enemy_LT06 = GetFirstActor( 'LT_BakerTarget06' );		//----Point6
	Enemy_LT07 = GetFirstActor( 'LT_BakerTarget07' );		//----Point7
	Enemy_LT08 = GetFirstActor( 'LT_BakerTarget08' );		//----Point8
	Enemy_LT09 = GetFirstActor( 'LT_BakerTargetRock' );		//----Behind Rock
	Enemy_LT10 = GetFirstActor( 'LT_BakerTargetTree' );		//----Behind Tree

}

function GetBakerTarget()
{
	ranI = rand( 5 );
	if( ranI == 0 )
		{	BakerTarget = Enemy_LT01; }
	else if( ranI == 1 )
		{	BakerTarget = Enemy_LT02; }
	else if( ranI == 2 )
		{	BakerTarget = Enemy_LT03; }
	else if( ranI == 3 )
		{	BakerTarget = Enemy_LT04; }
	else if( ranI == 4 )
		{	BakerTarget = Enemy_LT05; }

	SLog( "BakerTarget : " $ BakerTarget );
}

function GetBakerTarget2()
{
	ranI = rand( 5 );
	if( ranI == 0 )
		{	BakerTarget = Enemy_LT04; }
	else if( ranI == 1 )
		{	BakerTarget = Enemy_LT05; }
	else if( ranI == 2 )
		{	BakerTarget = Enemy_LT06; }
	else if( ranI == 3 )
		{	BakerTarget = Enemy_LT07; }
	else if( ranI == 4 )
		{	BakerTarget = Enemy_LT08; }

	SLog( "BakerTarget2 : " $ BakerTarget );
}

function GetBakerTarget3()
{
	ranI = rand( 2 );
	if( ranI == 0 )
		{	BakerTarget = Enemy_LT07; }
	else if( ranI == 1 )
		{	BakerTarget = Enemy_LT08; }

	SLog( "BakerTarget3 : " $ BakerTarget );
}

state Triggered
{
	function OnTrigger()
	{
		GotoState( 'Cinematic' );
	}
Begin:

	// Turn off beacon
	ACTION_TriggerEvent( 'Beacon_Trench' );

	ACTION_TriggerEvent( 'Tank_USA_Baker' );

//-------------DEFINE VARIABLES
	i = 1.0;

	sleep( 2.0 );

	AP_Baker = AnimPawn(GetPawn('AP_Baker_Outro'));
	AP_BakerTank = Tank( GetPawn('Tank_BakerTank'));
	sleep( 0.1 );

	ACTION_TankEnterScriptedMode( AP_BakerTank );

	// this rotates the machine gun to face forward...
	AP_BakerTank.SetBoneRotation('50cal_lateral', rot(49152,0,0), 0, 1.0);
	// this adjusts the pitch of the gun so it's mostly level...
	AP_BakerTank.SetBoneRotation('50cal_vertical', rot(0,-2000,0), 0, 1.0);

//-------------ATTACH BAKER TO TANK
	AP_BakerTank.AttachToBone( AP_Baker, 'chassis' );

	AP_Baker.SetRelativeRotation( rot( -16384.0, 0.0, -16384.0) );
	AP_Baker.SetRelativeLocation( vect(183, -130, -32.0 ) );  // , -forward/back, +down/up, -right/left

//	AP_Baker.SetPhysics( PHYS_None );

	sleep( 0.5 );

	bTankGotoSpot1 = true;
	CleanUp_Ref.bStopChargingDudes = True;
	ACTION_TriggerEvent( 'Event_StartOutroBakerAnim' );

//--------------Start tank scene

	ResetAbsoluteTime();
	StartAbsoluteTime();

	WaitForAbsoluteTime( i+= 1.0 );

	ACTION_TankMoveTo( AP_BakerTank, PN_BakerTank_P1 );
	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad01' );
	ACTION_TriggerEvent( 'TS_D07_1500_OutroTank' );

	ACTION_TankSetEnemy( AP_BakerTank, Enemy_LT01, true );
	WaitForAbsoluteTime( i+= 9.0 );
	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad02' );
	ACTION_TankFireCannon( AP_BakerTank );
	ACTION_TankSetEnemy( AP_BakerTank, Enemy_LT02, true );
	while( !ACTION_TankIsAimingAtEnemy( AP_BakerTank ) )
	{
		WaitForAbsoluteTime( i+= 0.2 );
	}
	ACTION_TankFireCannon( AP_BakerTank );
	ACTION_TankSetEnemy( AP_BakerTank, Enemy_LT03, true );
	WaitForAbsoluteTime( i+= 3.5 );
	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad01' );
	while( !ACTION_TankIsAimingAtEnemy( AP_BakerTank ) )
	{
		WaitForAbsoluteTime( i+= 0.2 );
	}
	ACTION_TankFireCannon( AP_BakerTank );

//-------------MOVE TO SPOT 1
	while( !PawnIsAtDestination( AP_BakerTank, PN_BakerTank_P1 ))
		{
			GetBakerTarget();
			WaitForAbsoluteTime( i+= 2.0 );
			ACTION_TankSetEnemy( AP_BakerTank, BakerTarget, true );
			while( !ACTION_TankIsAimingAtEnemy( AP_BakerTank ) )
			{
				WaitForAbsoluteTime( i+= 3.0 );
			}
			ACTION_TankFireCannon( AP_BakerTank );
		}

	ACTION_OrderTarget( 'Unit_US_MacSquad', 'Unit_DE_Hill30Squad02' );
	bTankGotoSpot2 = true;
	bTankGotoSpot1 = false;
	CleanUp_Ref.bHideStaticGermans = True;
	WaitForAbsoluteTime( i+= 3.0 );

//	ACTION_TriggerEvent( 'Emitter_TracerHell_R' );		//===== Tracers Right
	ACTION_TankSetEnemy( AP_BakerTank, Enemy_LT07, true );
	while( !ACTION_TankIsAimingAtEnemy( AP_BakerTank ) )
	{
		WaitForAbsoluteTime( i+= 1.0 );
	}
	ACTION_TankFireCannon( AP_BakerTank );

	WaitForAbsoluteTime( i+= 2.0 );

	ACTION_TankMoveTo( AP_BakerTank, PN_BakerTank_P2 );
	ACTION_TankSetEnemy( AP_BakerTank, Enemy_LT05, true );
	WaitForAbsoluteTime( i+= 2.0 );
	while( !ACTION_TankIsAimingAtEnemy( AP_BakerTank ) )
	{
		WaitForAbsoluteTime( i+= 1.0 );
	}
	ACTION_TankFireCannon( AP_BakerTank );

//-------------MOVE TO SPOT 2
	while( !PawnIsAtDestination( AP_BakerTank, PN_BakerTank_P2 ))
		{
			GetBakerTarget2();
			WaitForAbsoluteTime( i+= 2.0 );
			ACTION_TankSetEnemy( AP_BakerTank, BakerTarget, true );
			while( !ACTION_TankIsAimingAtEnemy( AP_BakerTank ) )
			{
				WaitForAbsoluteTime( i+= 3.0 );
			}
			ACTION_TankFireCannon( AP_BakerTank );
		}
	CleanUp_Ref.bStopSquibs = True;
//	ACTION_TriggerEvent( 'Emitter_TracerHell' );
	WaitForAbsoluteTime( i+= 3.0 );
	bTankGotoSpot3 = true;
	bTankGotoSpot2 = false;
	ACTION_TankMoveTo( AP_Bake
rTank, PN_BakerTank_P3 );
	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_TriggerEvent( 'Event_FadeoutHill30AMB' );		//===== Tracers Left
//-------------MOVE TO SPOT 3
	while( !PawnIsAtDestination( AP_BakerTank, PN_BakerTank_P3 ))
		{
			GetBakerTarget3();
			WaitForAbsoluteTime( i+= 2.0 );
			ACTION_TankSetEnemy( AP_BakerTank, BakerTarget, true );
			while( !ACTION_TankIsAimingAtEnemy( AP_BakerTank ) )
			{
				WaitForAbsoluteTime( i+= 3.0 );
			}
			ACTION_TankFireCannon( AP_BakerTank );
		}
	ACTION_TankSetEnemy( AP_BakerTank, GetFirstActor( 'LT_BakerTargetReset' ), true );
	WaitForAbsoluteTime( i+= 3.0 );
	bTankGotoEnd = true;
	bTankGotoSpot3 = false;
	ACTION_OrderMove( 'Unit_DE_Hill30Squad01', 'PN_Hill30Dudes2' );
	ACTION_OrderMove( 'Unit_DE_Hill30Squad02', 'PN_Hill30Dudes2' );
	ACTION_OrderMove( 'Unit_DE_Hill30Squad03', 'PN_Hill30Dudes1' );
	ACTION_OrderMove( 'Unit_DE_Hill30Squad04', 'PN_Hill30Dudes1' );
	ACTION_TankMoveTo( AP_BakerTank, PN_BakerTank_P4 );

	ACTION_TankSetNoEnemy( AP_BakerTank, true );
	while( !PawnIsAtDestination( AP_BakerTank, PN_BakerTank_P4 ))
		{
			WaitForAbsoluteTime( i+= 4.0 );
		}

	ACTION_TankSetEnemy( AP_BakerTank, Enemy_LT09 );
	while( !ACTION_TankIsAimingAtEnemy( AP_BakerTank ) )
		{
			WaitForAbsoluteTime( i+= 0.5 );
		}

	while( GermanUnit[2].GetNumLivingMembers() + GermanUnit[3].GetNumLivingMembers() > 0 )
		{
			ACTION_TankFireCannon( AP_BakerTank );
			WaitForAbsoluteTime( i+= 4.0 );
		}

	ACTION_TankSetEnemy( AP_BakerTank, Enemy_LT10 );
	while( !ACTION_TankIsAimingAtEnemy( AP_BakerTank ) )
		{
			WaitForAbsoluteTime( i+= 0.5 );
		}

	while( GermanUnit[0].GetNumLivingMembers() + GermanUnit[1].GetNumLivingMembers() > 0 )
		{	
			ACTION_TankFireCannon( AP_BakerTank );
			WaitForAbsoluteTime( i+= 4.0 );
		}

	ACTION_TankSetNoEnemy( AP_BakerTank, true );
	ACTION_TankMoveTo( AP_BakerTank, PN_BakerTank_End );

	StopAbsoluteTime();
	ACTION_WaitForEvent( 'Event_BakerTankAtEnd' );
	ACTION_TankHalt( AP_BakerTank );
	ACTION_TriggerEvent( 'Event_BakerDismountTank' );
	AP_Baker.SetPhysics( PHYS_None );


	ACTION_WaitForEvent( 'Event_BakerSittingAtTank' );

	ResetAbsoluteTime();
	StartAbsoluteTime();

	i = 0.0;

	ACTION_PlayLipSyncSoundDirect( AP_Baker, "D07_1500.BAKER_A", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_A" ), 4.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i+= 3.0 );

	ACTION_TriggerEvent( 'TriggeredScriptMapComplete' );

}

state NullState
{
	function OnTrigger() { GotoState( 'NullState' ); }
	Begin:
}

