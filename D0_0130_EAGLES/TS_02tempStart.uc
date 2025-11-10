//=============================================================================
// TS_02tempStart.
//=============================================================================
class TS_02tempStart extends tempStartMap
	placeable;

State Triggered
{
	Begin:

	// For Demo stuff.... obviously
	SLog( "**** bDemo " $ bDemo );

	if ( bDemo )
	{
		SM_Hedge = GetFirstActor('StaticMesh_Hedge');
		SM_Hedge.bHidden = FALSE;
		SM_Hedge.SetCollision( !SM_Hedge.bCollideActors, !SM_Hedge.bBlockActors, !SM_Hedge.bBlockPlayers );

		GetFirstActor( 'StaticMeshActor_C47Crash' ).bHidden = TRUE;

		HalftrackEvasionSI( GetFirstActor('HalftrackEvasionSI') ).bDemo = TRUE;
		MacState( GetFirstActor('MacState') ).bDemo = TRUE;
		InteriorSceneScript( GetFirstActor('InteriorSceneScript') ).bDemo = TRUE;
	}
	else
		ACTION_DestroyActor( 'LineOfSightTrigger_PlaneCrash' );

	SLog( "**** MacState( GetFirstActor('MacState') ).bDemo " $ MacState( GetFirstActor('MacState') ).bDemo );
	SLog( "**** HalftrackEvasionSI( GetFirstActor('HalftrackEvasionSI') ).bDemo " $ HalftrackEvasionSI( GetFirstActor('HalftrackEvasionSI') ).bDemo );

	// Spawn Mac
	ACTION_TriggerEvent('Macspawn02');

	// Set Beacon on Mac
	ACTION_TriggerEvent('macbeacon');
	gbxFollowBeacon(getFirstActor('macbeacon')).m_anOwner = GetPawn('Mac');

	// Initialize FrenchHouse_Script
	ACTION_TriggerEvent('FrenchHouse_Script');

	sleep(2.0);
	ACTION_SetHidden( 'ChuteInTree', FALSE );
	
	ACTION_OrderMove( 'USAFireTeam1', 'MacPath4' );

	ScriptEnd:
}
