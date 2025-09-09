//=============================================================================
// TS_D09_0800_GermanTank.
//=============================================================================
class TS_D09_0800_GermanTank extends TriggeredScript
	placeable;

var Tank TP_DETank, TP_USTank;

var int i;

state Triggered
{
	function OnTrigger()
	{
		GoToState( 'PlayerReady' );
	}

	Begin:

	TP_DETank = Tank( GetFirstActor('TG_403_01') );
	TP_USTank = Tank( GetFirstActor('TP_Outro') );

	ACTION_TriggerEvent( Event );

	if ( TP_DETank == None || TP_USTank == None )
	{
		SLog( "*** Error didn't find tank ****" );
		GoToState( 'PlayerReady', 'ScriptEnd' );
	}

	ACTION_TankEnterScriptedMode( TP_DETank );
	TP_DETank.Controller.bDemiGod = TRUE;

	ACTION_TankEnterScriptedMode( TP_USTank );
	TP_USTank.Controller.bDemiGod = TRUE;
}

state PlayerReady
{
	function OnTrigger()
	{
		GoToState( 'USTankReady' );
	}

	Begin:

	// Set target
	ACTION_TankSetEnemy( TP_DETank, TP_USTank, TRUE );

	ACTION_TankEnterScriptedMode( TP_USTank );
	TP_USTank.Controller.bDemiGod = TRUE;

	// Wait for US tank
	ACTION_TriggerEvent( 'Trigger_US_Tank_Death' );

	while ( TRUE )
	{
		ACTION_TankMoveTo( TP_USTank, GetNavigationPoint('PN_US_TankStart') );
		sleep( 18.0 );
	}
}

state USTankReady
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	TP_USTank.Controller.bDemiGod = FALSE;
	ACTION_TankSetEnemy( TP_USTank, TP_DETank, TRUE );
	sleep( 0.5 );
	ACTION_BlockNavPoint( 'PN_US_TankStart' );

	// Wait for cannon to be set
	i = 0;
	while ( !ACTION_TankIsAimingAtEnemy(TP_DETank) && i < 10 )
	{
		sleep( 0.5 );
		i++;
	}

	// Shoot it!
	ACTION_TankFireCannon( TP_DETank );
	sleep( 0.5 );

	TP_USTank.Health = 1;
	TP_USTank.TakeDamage( 500, None, TP_USTank.Location, vect(0,0,0), class'DamageGammonBomb' );
	TP_USTank.MyCornerPoints[2].bLevelDesignBlocked = TRUE;
	TP_USTank.MyCornerPoints[3].bLevelDesignBlocked = TRUE;
	TP_USTank.MyCornerPoints[4].bLevelDesignBlocked = TRUE;
	TP_USTank.MyCornerPoints[7].bLevelDesignBlocked = TRUE;

	// Go mind
	ACTION_TankLeaveScriptedMode( TP_DETank );
	TP_DETank.Controller.bDemiGod = FALSE;

	ScriptEnd:
}
