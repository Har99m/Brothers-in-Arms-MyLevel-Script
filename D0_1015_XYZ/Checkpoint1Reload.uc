//=============================================================================
// Checkpoint1Reload.
//=============================================================================
class Checkpoint1Reload extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );

	ACTION_DestroyActor('Crow1');
	ACTION_DestroyActor('IntroScript');
	ACTION_DestroyActor('LookTarget1');
	ACTION_DestroyActor('LookTarget2');
	ACTION_DestroyActor('LookTarget3');
	ACTION_DestroyActor('LookTarget4');
	ACTION_DestroyActor('LookTarget5');
	ACTION_DestroyActor('LookTarget6');
	ACTION_DestroyActor('LookTarget4_Feet');
	ACTION_DestroyActor('IntroAnimRide');
	ACTION_DestroyActor('MacIntroScript');
	ACTION_DestroyActor('HartsockIntroScript');
	ACTION_DestroyActor('GarnettIntroScript');
	ACTION_DestroyActor('AllenIntroScript');
	ACTION_DestroyActor('LeggettIntroScript');
	ACTION_DestroyActor('SpawnIntroCharacters');
	ACTION_DestroyActor('USAFireTeamb');
	ACTION_DestroyActor('USAFireTeam');

	//Spawn new characters.
	ACTION_BlockNavPoints('BlockMacEndSpawn' );
	ACTION_TriggerEvent('SpawnCheckpoint1');
	ACTION_TriggerEvent('SpawnGermanGunner01');
		sleep(2.0);
    ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
		sleep (1.0);

	ScriptEnd:
	}
