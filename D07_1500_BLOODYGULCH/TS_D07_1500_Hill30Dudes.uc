//=============================================================================
// TS_D07_1500_Hill30Dudes.
//=============================================================================
class TS_D07_1500_Hill30Dudes extends TriggeredScript
	placeable;

var TS_D07_1500_CrazyMindChange CleanUp_Ref;
var TS_D07_1500_OutroScene OutroScene_Ref;
var TS_D07_1500_OutroTankBaker OutroTankBaker_Ref;
var Unit GermanUnit[5];
var int iRand, Unit01Loc, Unit02Loc, UnitsAlive, Unit01Alive, Unit02Alive, Unit03Alive, Unit04Alive;
var bool bNoMoreGermans;

function PostBeginPlay()
{
	Super.PostBeginPlay();
	GermanUnit[0] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad01' ));
	GermanUnit[1] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad02' ));
	GermanUnit[2] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad03' ));
	GermanUnit[3] = Unit( GetFirstActor( 'Unit_DE_Hill30Squad04' ));

	bNoMoreGermans = false;
}

function int GetUnit01BodyCount()
{
	return GermanUnit[0].GetNumLivingMembers();
}

function int GetUnit02BodyCount()
{
	return GermanUnit[1].GetNumLivingMembers();
}

function GetUnit01Stats()
{
	if( GermanUnit[0].GetNumLivingMembers() > 0 )
	{
		UnitsAlive++;
		Unit01Alive = 1;
		slog( "UnitsAlive: " $ UnitsAlive );
	}
	else { Unit01Alive = 0; }
}

function GetUnit02Stats()
{
	if( GermanUnit[1].GetNumLivingMembers() > 0 )
	{
		UnitsAlive++;
		Unit02Alive = 1;
		slog( "UnitsAlive: " $ UnitsAlive );
	}
	else { Unit02Alive = 0; }
}

function GetUnit03Stats()
{
	if( GermanUnit[2].GetNumLivingMembers() > 0 )
	{
		UnitsAlive++;
		Unit03Alive = 1;
		slog( "UnitsAlive: " $ UnitsAlive );
	}
	else { Unit03Alive = 0; }
}

function GetUnit04Stats()
{
	if( GermanUnit[3].GetNumLivingMembers() > 0 )
	{
		UnitsAlive++;
		Unit04Alive = 1;
		slog( "UnitsAlive: " $ UnitsAlive );
	}
	else { Unit04Alive = 0; }
}


function SpawnAndMoveUnit01()
{
	if( Unit01Alive == 0 && UnitsAlive < 2 )
	{
		ACTION_TriggerEvent( 'CSG_Hill30Squad01' );
//		sleep( 0.5 );
		ACTION_OrderMove( 'Unit_DE_Hill30Squad01', 'PN_Hill30Dudes1' );
		UnitsAlive++;
		slog( "****----SpawnAndMoveUnit01 UnitsAlive: " $ UnitsAlive );
	}
}	

function SpawnAndMoveUnit02()
{
	if( Unit02Alive == 0 && UnitsAlive < 2 )
	{
		ACTION_TriggerEvent( 'CSG_Hill30Squad02' );
//		sleep( 0.5 );
		ACTION_OrderMove( 'Unit_DE_Hill30Squad02', 'PN_Hill30Dudes2' );
		UnitsAlive++;
		slog( "****----SpawnAndMoveUnit02 UnitsAlive: " $ UnitsAlive );
	}
}	

function SpawnAndMoveUnit03()
{
	if( Unit03Alive == 0 && UnitsAlive < 2 )
	{
		ACTION_TriggerEvent( 'CSG_Hill30Squad03' );
//		sleep( 0.5 );
		ACTION_OrderMove( 'Unit_DE_Hill30Squad03', 'PN_Hill30Dudes2' );
		UnitsAlive++;
		slog( "****----SpawnAndMoveUnit03 UnitsAlive: " $ UnitsAlive );
	}
}

function SpawnAndMoveUnit04()
{
	if( Unit04Alive == 0 && UnitsAlive < 2 )
	{
		ACTION_TriggerEvent( 'CSG_Hill30Squad04' );
//		sleep( 0.5 );
		ACTION_OrderMove( 'Unit_DE_Hill30Squad04', 'PN_Hill30Dudes2' );
		UnitsAlive++;
		slog( "****----SpawnAndMoveUnit04 UnitsAlive: " $ UnitsAlive );
	}
}


state Triggered
{
	Begin:

	CleanUp_Ref = TS_D07_1500_CrazyMindChange( GetFirstActor( 'TS_D07_1500_CrazyMindChange' ) );
	OutroScene_Ref = TS_D07_1500_OutroScene( GetFirstActor( 'TS_D07_1500_OutroScene' ) );
	OutroTankBaker_Ref = TS_D07_1500_OutroTankBaker( GetFirstActor( 'TS_D07_1500_OutroTankBaker' ) );

	sleep( 1.0 );

	ACTION_TriggerEvent( 'CSG_Hill30Squad01' );
	sleep( 1.0 );
	ACTION_OrderMove( 'Unit_DE_Hill30Squad01', 'PN_Hill30Dudes1' );

	Unit01Loc = 1;
	Unit02Loc = 0;

	do
	{
		slog( "********-----------------------INTRO Hill30 DUDES LOOP" );
		UnitsAlive = 0;
		GetUnit01Stats();
		GetUnit02Stats();
		if( UnitsAlive < 2 )
		{
			iRand = Rand( 2 );
			if( iRand == 0 )
			{
				SpawnAndMoveUnit01();
				SpawnAndMoveUnit02();
			}
			else if( iRand == 1 )
			{
				SpawnAndMoveUnit02();
				SpawnAndMoveUnit01();
			}
		}
		else { slog( "***-----------WARNING: TOO MANY UNITS"); }
		sleep( 10.0 );
		} Until( CleanUp_Ref.bStopChargingDudes )
	slog( "********-----------------------INTRO Hill30 DUDES ENDING" );


	if( OutroScene_Ref.bIsAtOutro )
	{
	slog( "********-----------------------OUTRO Hill30 DUDES RUNNING" );
		do
		{
//*****---------BakerTankHeadingToSpot1
			if( OutroTankBaker_Ref.bTankGotoSpot1 )
			{
				do
				{
				slog( "********-----------------------BAKER ON WAY TO SPOT 1" );
				UnitsAlive = 0;
				GetUnit01Stats();
				GetUnit02Stats();
				GetUnit03Stats();
				if( UnitsAlive < 2 )
				{
					iRand = Rand( 3 );
					if( iRand == 0 )
					{
						SpawnAndMoveUnit01();
						SpawnAndMoveUnit02();
						SpawnAndMoveUnit03();
					}
					else if( iRand == 1 )
					{
						SpawnAndMoveUnit02();
						SpawnAndMoveUnit03();
						SpawnAndMoveUnit01();
					}
					else if( iRand == 2 )
					{
						SpawnAndMoveUnit03();
						SpawnAndMoveUnit01();
						SpawnAndMoveUnit02();
					}
				}
				else { slog( "***-----------WARNING: TOO MANY UNITS"); }
				sleep( 10.0 );
				} Until( !OutroTankBaker_Ref.bTankGotoSpot1 )
			}

//*****---------BakerTankHeadingToSpot2
			if( OutroTankBaker_Ref.bTankGotoSpot2 )
			{
				do
				{
				slog( "********-----------------------BAKER ON WAY TO SPOT 2" );
				UnitsAlive = 0;
				GetUnit01Stats();
				GetUnit02Stats();
				GetUnit03Stats();
				if( UnitsAlive < 2 )
				{
					iRand = Rand( 2 );
					if( iRand == 0 )
					{
						SpawnAndMoveUnit02();
						SpawnAndMoveUnit03();
					}
					else if( iRand == 1 )
					{
						SpawnAndMoveUnit03();
						SpawnAndMoveUnit02();
					}
				}
				else { slog( "***-----------WARNING: TOO MANY UNITS"); }
				sleep( 10.0 );
				} Until( !OutroTankBaker_Ref.bTankGotoSpot2 )
			}

//*****---------BakerTankHeadingToSpot3
			if( OutroTankBaker_Ref.bTankGotoSpot3 )
			{
				do
				{
				slog( "********-----------------------BAKER ON WAY TO SPOT 3" );
				UnitsAlive = 0;
				GetUnit01Stats();
				GetUnit02Stats();
				GetUnit03Stats();
				GetUnit04Stats();
				if( UnitsAlive < 2 )
				{
					iRand = Rand( 2 );
					if( iRand == 0 )
					{
						SpawnAndMoveUnit04();
						SpawnAndMoveUnit03();
					}
					else if( iRand == 1 )
					{
						SpawnAndMoveUnit03();
						SpawnAndMoveUnit04();
					}
				}
				else { slog( "***-----------WARNING: TOO MANY UNITS"); }
				sleep( 10.0 );
				} Until( !OutroTankBaker_Ref.bTankGotoSpot3 )
			}

//*****---------BakerTankHeadingToOutro
			if( OutroTankBaker_Ref.bTankGotoEnd )
			{
				bNoMoreGermans = true;
				slog( "********-----------------------NO MORE GERMANS TO SPAWN" );
			}

			sleep( 2.0 );
		} Until( bNoMoreGermans )
	}
	slog( "********-----------------------OUTRO Hill30 DUDES ENDING" );

	ScriptEnd:
}
