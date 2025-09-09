//=============================================================================
// TS_D08_1030_AlleyExplosion.
//=============================================================================
class TS_D08_1030_AlleyExplosion extends TriggeredScript
	placeable;

var Tank AP_OutroTank;
var Actorlite PN_OutroTank_00;
var Actorlite PN_Tank_00;
var Actor TargetAlley;

state Triggered
	{
	Begin:

	ACTION_WaitForEvent('Death_UNIT_DE_C302');
	//ACTION_WaitForEvent('Death_UNIT_DE_C302');

		sleep(0.2);
	GetFirstActor('StaticMeshActor_RubbleDestroy').bHidden=True;
	ACTION_TriggerEvent('Emitter_RubbleDestroy' );
	ACTION_PlayLocalSound("EXPLOSIONS.HOUSE_EXT");
	ACTION_TriggerEvent('CSG_C304b');

	ACTION_OrderMove('UNIT_DE_C304', 'PN_C304_Queue01',true );
	ACTION_OrderMove('UNIT_DE_C304', 'PN_UNIT_DE_C302_03' );

	TargetAlley = GetFirstActor('TargetAlley');

	PN_OutroTank_00 = GetNavigationPoint( 'PN_TankOutro_A' );
 	PN_Tank_00 = GetNavigationPoint('PN_Tank_00');

	ACTION_TriggerEvent( 'TSG_OutroTank_A' );
		sleep(1.0);
	AP_OutroTank = Tank( GetPawn( 'Tank_OutroTank_A' ));
		sleep(1.0);
	ACTION_TankEnterScriptedMode( AP_OutroTank );
		sleep( 1.0 );

		sleep(1.0);


	ACTION_OrderMove('UNIT_DE_C304b', 'PN_C3_04');
	ACTION_OrderTarget('UNIT_DE_C304b', 'PlayerUnit');

		sleep(0.0);

		ACTION_TankMoveTo( AP_OutroTank, PN_OutroTank_00 );
		while( !ACTION_TankIsAtDestination( AP_OutroTank, PN_OutroTank_00 ) )
			{
			sleep( 1.0 );
			}

		ACTION_DestroyActor('Tank_OutroTank_A');

	ACTION_DestroyActor('StochasticTrigger_AlleyMortar');

	}
