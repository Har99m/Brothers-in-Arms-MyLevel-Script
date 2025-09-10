//=============================================================================
// TS_D10_0800_BOMBS.
//=============================================================================
class TS_D10_0800_BOMBS extends TriggeredScript
	placeable;

var int randBomb;
var int cheapStep;
var int timeOut;
var int lastRand;

State Triggered
{
Begin:
	ACTION_TriggerEvent('END_SMOKE5');
	ACTION_TriggerEvent('END_SMOKE2');

	ACTION_PlayLocalSound( "EXPLOSIONS.WHISTLE" );
	sleep( 4.0 );
	ACTION_PlayLocalSound( "EXPLOSIONS.ARTILLERY_IMPACT" );
	ACTION_TriggerEvent('END_EXP2');
	sleep( 2.0 );
	ACTION_PlayLocalSound( "EXPLOSIONS.ARTILLERY_IMPACT" );
	ACTION_TriggerEvent('END_EXP3');
	ACTION_TriggerEvent('END_SMOKE4');
	sleep( 3.0 );
	ACTION_PlayLocalSound( "EXPLOSIONS.ARTILLERY_IMPACT" );
	ACTION_TriggerEvent('END_EXP1');

	ACTION_TriggerEvent( 'PFX_RANDBOMBERS' );

	GotoState('RandomBombing');
}

State RandomBombing
{
	Function OnTrigger()
	{
		GotoState('EndBombs');
	}
Begin:
//this state does the random explosion trigger selection

	cheapStep = 0;

	ACTION_PlayLocalSound( "EXPLOSIONS.WHISTLE_A" );

	sleep( 6.0 );

PostBegin:
	cheapStep = cheapStep+timeOut;
	randBomb = rand(8);
	
	If ( randBomb == lastRand )
	{
		randBomb = randBomb + 1;
		If ( randBomb > 7 )
		{
			randBomb = 0;
		}
	}

	Switch ( randBomb )
	{
		Case 0:
			ACTION_TriggerEvent('END_REXP1');
			break;
		Case 1:
			ACTION_TriggerEvent('END_REXP2');
			break;
		Case 2:
			ACTION_TriggerEvent('END_REXP3');
			break;
		Case 3:
			ACTION_TriggerEvent('END_REXP4');
			break;
		Case 4:
			ACTION_TriggerEvent('END_REXP5');
			break;
		Case 5:
			ACTION_TriggerEvent('END_REXP6');
			break;
		Case 6:
			ACTION_TriggerEvent('END_REXP7');
			break;
		Case 7:
			ACTION_TriggerEvent('END_REXP8');
			break;
	}
	ACTION_PlayLocalSound( "EXPLOSIONS.ARTILLERY_IMPACT" );
	lastRand = randBomb;
	timeOut = 2 + rand( 2 );	
	sleep( timeOut );

	If ( cheapStep >= 16 )
	{
		Goto('Begin');
	}

	Goto('PostBegin');
}

State EndBombs
{
	Function OnTrigger()
	{
		//
	}
Begin:
//No more bombs
}

