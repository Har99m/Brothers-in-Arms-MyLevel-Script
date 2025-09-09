//=============================================================================
// TS_D08_1030_StreetExplosion.
//=============================================================================
class TS_D08_1030_StreetExplosion extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_TriggerEvent('Emitter_CeilingDebris');


	ACTION_BlockNavPoints( 'PN_Checkpoint2Alley' );
	ACTION_TriggerEvent('emitter_street_explosion');
	ACTION_PlayLocalSound("EXPLOSIONS.HOUSE_EXT");
	ACTION_DestroyActor('gbxTrigger_emitter_street_explosion');
	ACTION_DestroyActor('gbxTriggerb_emitter_street_explosion');
	ACTION_TriggerEvent('TS_D08_1030_HouseExplosion');

		sleep(0.5);
	ACTION_TriggerEvent('StochasticTrigger_MortarMainStreet');


	}
