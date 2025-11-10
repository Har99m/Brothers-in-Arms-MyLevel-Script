//=============================================================================
// Combat4Script.
//=============================================================================
class Combat4Script extends TriggeredScript
	placeable;

var Unit GermanUnit[4];

state triggered
{
begin:
	ACTION_DisableFlankingDialogue();

	ACTION_TriggerEvent( 'TS_GS01x' );
	ACTION_TriggerEvent( 'TS_GS02x' );
	ACTION_TriggerEvent( 'TS_GS03x' );
	ACTION_TriggerEvent( 'TS_GS04x' );

	GermanUnit[0] = Unit( GetFirstActor( 'C4_GS01' ));
	GermanUnit[1] = Unit( GetFirstActor( 'C4_GS02' ));
	GermanUnit[2] = Unit( GetFirstActor( 'C4_GS03' ));
	GermanUnit[3] = Unit( GetFirstActor( 'C4_GS04' ));

	ACTION_WaitForEvent( 'Combat4_FinalSpawn' );
	slog( "SPAWNING FINAL UNIT, DESTROYING SPAWNERS NOW MOTHERBITCHES" );
	ACTION_DestroyActor( 'Spawn_C4_GS01');
	ACTION_DestroyActor( 'Spawn_C4_GS02');
	ACTION_DestroyActor( 'Spawn_C4_GS03');
	ACTION_DestroyActor( 'Spawn_C4_GS04');

	ACTION_TriggerEvent( 'BeachBombs' );
	
	while(	(GermanUnit[0].GetNumLivingMembers() != 0) ||
			(GermanUnit[1].GetNumLivingMembers() != 0) ||
			(GermanUnit[2].GetNumLivingMembers() != 0) || 
			(GermanUnit[3].GetNumLivingMembers() != 0)	)
		{
			sleep(1.0);
		}
	slog( "COMBAT FINISHED NOW" );

	sleep(2.0);
	ACTION_TriggerEvent( 'OutroScript' );
}
