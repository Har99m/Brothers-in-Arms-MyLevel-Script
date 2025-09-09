//=============================================================================
// TS_D07_1500_OutroTank.
//=============================================================================
class TS_D07_1500_OutroTank extends TriggeredScript
	placeable;

var Tank AP_OutroTank;
var ActorLite PN_OutroTank_End, PN_OutroTank_P1, PN_OutroTank_P2, PN_OutroTank_P3, PN_OutroTank_Entrance;
var Actor Enemy_LT01, Enemy_LT02, Enemy_LT03, Enemy_LT04, Enemy_LT05, TankTarget,
			Enemy_LT06, Enemy_LT07, Enemy_LT08, Enemy_LT09, Enemy_LT10;
var float i;
var int ranI;

function GetTankTarget()
{
	ranI = rand( 3 );
	if( ranI == 0 )
		{	TankTarget = Enemy_LT01; }
	else if( ranI == 1 )
		{	TankTarget = Enemy_LT09; }
	else if( ranI == 2 )
		{	TankTarget = Enemy_LT10; }

	SLog( "TankTarget : " $ TankTarget );
}

function GetTankTarget2()
{
	ranI = rand( 5 );
	if( ranI == 0 )
		{	TankTarget = Enemy_LT04; }
	else if( ranI == 1 )
		{	TankTarget = Enemy_LT05; }
	else if( ranI == 2 )
		{	TankTarget = Enemy_LT06; }
	else if( ranI == 3 )
		{	TankTarget = Enemy_LT07; }
	else if( ranI == 4 )
		{	TankTarget = Enemy_LT08; }

	SLog( "TankTarget2 : " $ TankTarget );
}

function GetTankTarget3()
{
	ranI = rand( 2 );
	if( ranI == 0 )
		{	TankTarget = Enemy_LT07; }
	else if( ranI == 1 )
		{	TankTarget = Enemy_LT08; }

	SLog( "TankTarget3 : " $ TankTarget );
}


state Triggered
{
	function OnTrigger()
	{
		GotoState( 'Cinematic' );
	}
Begin:

//-------------DEFINE VARIABLES
	i = 1.0;
	AP_OutroTank = Tank( GetPawn('Tank_OutroTank'));

	PN_OutroTank_P1 = GetNavigationPoint( 'PN_OutroTank_P1' );
	PN_OutroTank_P2 = GetNavigationPoint( 'PN_OutroTank_P2' );
	PN_OutroTank_P3 = GetNavigationPoint( 'PN_OutroTank_P3' );
	PN_OutroTank_End = GetNavigationPoint( 'PN_OutroTank_End' );
	PN_OutroTank_Entrance = GetNavigationPoint( 'PN_OutroTank_Entrance' );

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

	ACTION_TankEnterScriptedMode( AP_OutroTank );

	// this rotates the machine gun to face forward...
	AP_OutroTank.SetBoneRotation('50cal_lateral', rot(49152,0,0), 0, 1.0);
	// this adjusts the pitch of the gun so it's mostly level...
	AP_OutroTank.SetBoneRotation('50cal_vertical', rot(0,-2000,0), 0, 1.0);

//--------------Start tank scene

	ACTION_TankMoveTo( AP_OutroTank, PN_OutroTank_P1 );

	ACTION_TankSetEnemy( AP_OutroTank, Enemy_LT10, true );
	while( !PawnIsAtDestination( AP_OutroTank, PN_OutroTank_Entrance ))
		{
			WaitForAbsoluteTime( i+= 2.0 );
		}
	while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
	{
		WaitForAbsoluteTime( i+= 0.5 );
	}
	ACTION_TankFireCannon( AP_OutroTank);

	WaitForAbsoluteTime( i+= 3.5 );

	ACTION_TankSetEnemy( AP_OutroTank , Enemy_LT09, true );
	while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
	{
		WaitForAbsoluteTime( i+= 0.5 );
	}
	ACTION_TankFireCannon( AP_OutroTank);
	ACTION_TankSetEnemy( AP_OutroTank, Enemy_LT01, true );
	WaitForAbsoluteTime( i+= 3.0 );
	while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
	{
		WaitForAbsoluteTime( i+= 3.0 );
	}
	ACTION_TankFireCannon( AP_OutroTank);

//-------------MOVE TO SPOT 1
	while( !PawnIsAtDestination( AP_OutroTank, PN_OutroTank_P1 ))
		{
			GetTankTarget();
			WaitForAbsoluteTime( i+= 2.0 );
			ACTION_TankSetEnemy( AP_OutroTank, TankTarget, true );
			while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
			{
				WaitForAbsoluteTime( i+= 3.0 );
			}
			ACTION_TankFireCannon( AP_OutroTank );
		}

	ACTION_TankFireCannon( AP_OutroTank);
	WaitForAbsoluteTime( i+= 1.0 );
	ACTION_TankSetEnemy( AP_OutroTank, Enemy_LT01, true );
	while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
	{
		WaitForAbsoluteTime( i+= 3.0 );
	}
	ACTION_TankFireCannon( AP_OutroTank);
	WaitForAbsoluteTime( i+= 3.0 );
	ACTION_TankMoveTo( AP_OutroTank, PN_OutroTank_P2 );
	ACTION_TankSetEnemy( AP_OutroTank, Enemy_LT03, true );
	while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
	{
		WaitForAbsoluteTime( i+= 3.0 );
	}
	ACTION_TankFireCannon( AP_OutroTank);

//-------------MOVE TO SPOT 2
	while( !PawnIsAtDestination( AP_OutroTank, PN_OutroTank_P2 ))
		{
			GetTankTarget2();
			WaitForAbsoluteTime( i+= 3.0 );
			ACTION_TankSetEnemy( AP_OutroTank, TankTarget, true );
			while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
			{
				WaitForAbsoluteTime( i+= 3.0 );
			}
			ACTION_TankFireCannon( AP_OutroTank );
		}

	ACTION_TankSetEnemy( AP_OutroTank, Enemy_LT04, true );
	while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
	{
		WaitForAbsoluteTime( i+= 3.0 );
	}
	ACTION_TankFireCannon( AP_OutroTank);
	WaitForAbsoluteTime( i+= 3.0 );
	ACTION_TankMoveTo( AP_OutroTank, PN_OutroTank_P3 );
	ACTION_TankSetEnemy( AP_OutroTank, Enemy_LT06, true );
	while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
	{
		WaitForAbsoluteTime( i+= 3.0 );
	}
	ACTION_TankFireCannon( AP_OutroTank);

//-------------MOVE TO SPOT 3
	while( !PawnIsAtDestination( AP_OutroTank, PN_OutroTank_P3 ))
		{
			GetTankTarget3();
			WaitForAbsoluteTime( i+= 3.0 );
			ACTION_TankSetEnemy( AP_OutroTank, TankTarget, true );
			while( !ACTION_TankIsAimingAtEnemy( AP_OutroTank ) )
			{
				WaitForAbsoluteTime( i+= 3.0 );
			}
			ACTION_TankFireCannon( AP_OutroTank );
		}

	WaitForAbsoluteTime( i+= 4.0 );
	ACTION_TankMoveTo( AP_OutroTank, PN_OutroTank_End );
	WaitForAbsoluteTime( i+= 2.0 );
	ACTION_TankSetEnemy( AP_OutroTank, GetFirstActor( 'LT_BakerTargetReset' ), true );
	WaitForAbsoluteTime( i+= 3.0 );
	ACTION_TankSetNoEnemy( AP_OutroTank, true );

//-------------MOVE TO END
	while( !PawnIsAtDestination( AP_OutroTank, PN_OutroTank_End ))
		{
			WaitForAbsoluteTime( i+= 2.0 );
		}


}

state NullState
{
	function OnTrigger() { GotoState( 'NullState' ); }
	Begin:
}

