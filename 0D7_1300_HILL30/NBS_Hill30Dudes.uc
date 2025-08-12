//=============================================================================
// NBS_Hill30Dudes.
//=============================================================================
class NBS_Hill30Dudes extends TriggeredScript
	placeable;

var NBS_Hill30UberScene Hill30Uber_Ref;
var Unit GermanUnit02, GermanUnit03;
var int Unit02Loc, Unit03Loc;

function int GetUnit02BodyCount()
{
	return GermanUnit02.GetNumLivingMembers();
}

function int GetUnit03BodyCount()
{
	return GermanUnit03.GetNumLivingMembers();
}

state Triggered
{
	Begin:

	Hill30Uber_Ref = NBS_Hill30UberScene( GetFirstActor( 'NBS_Hill30UberScene' ) );

	GermanUnit02 = GetUnit( 'Hill30Squad02' );
	GermanUnit03 = GetUnit( 'Hill30Squad03' );

	sleep( 10.0 );

	ACTION_TriggerEvent( 'Hill30Squad03Spawn' );
	sleep( 1.0 );
	ACTION_OrderMove( 'Hill30Squad03', 'PN_Hill30Dudes1' );

	Unit03Loc = 1;
	Unit02Loc = 0;

	do
	{
		if( GetUnit03BodyCount() < 1 )
		{
			Unit03Loc = 0;
		}

		if( GetUnit02BodyCount() < 1 )
		{
			Unit02Loc = 0;
		}

		if( Unit03Loc > 0 && Unit02Loc > 0 )	// Both alive, break
		{
			if( Unit03Loc == 1 )
			{
				ACTION_OrderMove( 'Hill30Squad03', 'GermanRetreat' );
				sleep( 8.0 );
				ACTION_OrderMove( 'Hill30Squad03', 'PN_Hill30Dudes1' );
				sleep( 8.0 );
			}
		}
		else if( Unit03Loc == 0 && Unit02Loc == 0 )	// Both Units dead, respawn Unit03
		{
			ACTION_TriggerEvent( 'Hill30Squad03Spawn' );
			sleep( 1.0 );
			ACTION_OrderMove( 'Hill30Squad03', 'PN_Hill30Dudes1' );

			Unit03Loc = 1;
			Unit02Loc = 0;
		}
		else
		{
			if( Unit03Loc > 0 )	// Unit03 alive, Unit02 dead
			{
				if( Unit03Loc == 1 )
				{
					ACTION_TriggerEvent( 'Hill30Squad02Spawn' );
					sleep( 0.5 );
					ACTION_OrderMove( 'Hill30Squad02', 'PN_Hill30Dudes1' );
					ACTION_OrderMove( 'Hill30Squad03', 'PN_Hill30Dudes2' );
					Unit02Loc = 1;
					Unit03Loc = 2;
				}
				else
				{
					ACTION_TriggerEvent( 'Hill30Squad02Spawn' );
					sleep( 0.5 );
					ACTION_OrderMove( 'Hill30Squad02', 'PN_Hill30Dudes2' );
					ACTION_OrderMove( 'Hill30Squad03', 'PN_Hill30Dudes1' );
					Unit03Loc = 1;
					Unit02Loc = 2;
				}
			}
			else
			{
				if( Unit02Loc == 1 )
				{
					ACTION_TriggerEvent( 'Hill30Squad03Spawn' );
					sleep( 0.5 );
					ACTION_OrderMove( 'Hill30Squad02', 'PN_Hill30Dudes2' );
					ACTION_OrderMove( 'Hill30Squad03', 'PN_Hill30Dudes1' );
					Unit02Loc = 2;
					Unit03Loc = 1;
				}
				else
				{
					ACTION_TriggerEvent( 'Hill30Squad03Spawn' );
					sleep( 0.5 );
					ACTION_OrderMove( 'Hill30Squad02', 'PN_Hill30Dudes1' );
					ACTION_OrderMove( 'Hill30Squad03', 'PN_Hill30Dudes2' );
					Unit03Loc = 2;
					Unit02Loc = 1;
				}
			}
		}

		sleep( 2.0 );

	} Until( Hill30Uber_Ref.bStopChargingDudes )

	ScriptEnd:
}
