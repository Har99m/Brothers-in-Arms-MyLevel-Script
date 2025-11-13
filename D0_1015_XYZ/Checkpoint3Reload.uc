//=============================================================================
// Checkpoint3Reload.
//=============================================================================
class Checkpoint3Reload extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );

	//Checkpoint 1 actors.
	ACTION_DestroyActor('Crow1');
	ACTION_DestroyActor('Crow2');
	ACTION_DestroyActor('Crow3');

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

	//Checkpoint 2 actors.
	ACTION_DestroyActor('SpawnCheckpoint1');
	ACTION_DestroyActor('trigger_Combat1Script');
	ACTION_DestroyActor('C1_Position_Barn');
	ACTION_DestroyActor('C1_PositionLeft');
	ACTION_DestroyActor('C1_PositionRight');
	ACTION_DestroyActor('Combat1Death');
	ACTION_DestroyActor('SpawnGermanSquad02');
	ACTION_DestroyActor('SpawnGermanSquad01');
	ACTION_DestroyActor('GermanSquad01');
	ACTION_DestroyActor('GermanSquad02');
	ACTION_DestroyActor('trigger_01BurtSpeakScript');
	ACTION_DestroyActor('Trigger_Combat2Script');
	ACTION_DestroyActor('trigger_SpawnMGGunner');
	ACTION_DestroyActor('trigger_OverBagsScript');
	ACTION_DestroyActor('trigger_MGSequence');
	ACTION_DestroyActor('Combat2Death');
	ACTION_DestroyActor('SpawnGermanGunner01');
	ACTION_DestroyActor('GermanGunner01');
	ACTION_DestroyActor('SpawnMGSequenceSquad');
	ACTION_DestroyActor('SpawnGermanSquad03');
	ACTION_DestroyActor('MGSequenceSquad');
	ACTION_DestroyActor('GermanSquad03');
	ACTION_DestroyActor('trigger_GermanSquad05Script');
	ACTION_DestroyActor('SpawnGermanSquad04');
	ACTION_DestroyActor('SpawnGermanSquad04');
	ACTION_DestroyActor('GermanSquad04');
	ACTION_DestroyActor('SpawnGermanSquad06');
	ACTION_DestroyActor('GermanSquad06');
	ACTION_DestroyActor('SpawnGermanSquad05');
	ACTION_DestroyActor('GermanSquad05');
	ACTION_DestroyActor('trigger_Checkpoint1Script');
	ACTION_DestroyActor('trigger_OverBagsScript');

	//Checkpoint 3 actors.
	ACTION_DestroyActor('SpawnCheckpoint2');
	ACTION_DestroyActor('trigger_Checkpoint2Script');
	ACTION_DestroyActor('trigger_PlayerLeft02Script');
	ACTION_DestroyActor('trigger_PlayerLeftScript');
	ACTION_DestroyActor('trigger_PlayerRight02Script');
	ACTION_DestroyActor('trigger_PlayerBackScript');
	ACTION_DestroyActor('SpawnGermanSquad12');
	ACTION_DestroyActor('GermanSquad12');
	ACTION_DestroyActor('SpawnGermanSquad08');
	ACTION_DestroyActor('GermanSquad08');
	ACTION_DestroyActor('trigger_PlayerBack02Script');
	ACTION_DestroyActor('SpawnGermanSquad09');
	ACTION_DestroyActor('GermanSquad09');
	ACTION_DestroyActor('SpawnGermanSquad10');
	ACTION_DestroyActor('GermanSquad10');
	ACTION_DestroyActor('trigger_Combat3Script');
	ACTION_DestroyActor('trigger_Checkpoint1Script');

	//Spawn new characters.
	ACTION_BlockNavPoints('BlockMacEndSpawn' );
	ACTION_TriggerEvent( 'SpawnCheckpoint3' );
		sleep(2.0);
    ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
	ACTION_TriggerEvent( 'BackAlleyScript' );

		sleep(1.0);

	ScriptEnd:
	}
