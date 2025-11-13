//=============================================================================
// EndCombatDeathScript_Rep.
//=============================================================================
class EndCombatDeathScript_Rep extends TriggeredScript
	placeable;

var Pawn LeggettEnd;
var Pawn MacEnd;

state Triggered
{
Begin:

	ACTION_UnBlockNavPoints('BlockMacEndSpawn' );
		sleep(0.5);
	ACTION_TriggerEvent( 'SpawnOutroChar' );

	LeggettEnd = GetPawn( 'LeggettEnd' );
	MacEnd = GetPawn( 'MacEnd' );

	LeggettEnd.controller.bGodMode = true;
	MacEnd.controller.bGodMode = true;

	ACTION_AttachStaticMesh( LeggettEnd , StaticMesh's_military_us.equipment.us_radio_field_pack', 'radio_bone' );

	ACTION_OrderMove( 'OutroCharUnit', 'OutroChar_Path02' );

		ACTION_SetRepelBullets( 'LeggettEnd', true );
		ACTION_SetRepelBullets( 'MacEnd', true );
		ACTION_SetRepelBullets( 'AllenEnd', true );
		ACTION_SetRepelBullets( 'GarnettEnd', true );

	ACTION_TriggerEvent( 'SpawnGermanFireSquad02_1' );
	ACTION_OrderMove( 'GermanFireSquad02_1', 'GermanFireSquad03_Path01' );
		sleep(25.0);
	ACTION_OrderMove( 'OutroCharUnit', 'OutroChar_Path02' );

	ACTION_OrderMove( 'GermanFireSauad02_1', 'GermanFireSquad02_1_Path01' );
		sleep(25.0);
	ACTION_OrderMove( 'GermanFireSquad02_1', 'GermanFireSquad02_Path02' );

}
