//=============================================================================
// NBS_USGuysTracker. -Nathan Overman-
//=============================================================================
class NBS_USGuysTracker extends TriggeredScript
	placeable;

var Pawn Hartsock, Zanovich, Corrion, McCreary, Courtland, Mac;
var AnimPawn AP_Mac_Pre, AP_Hooper_Pre, DummyDudeA, DummyDudeB, DummyDudeC;

var bool bHartsockDead, bZanovichDead, bCorrionDead, bMcCrearyDead, bCourtlandDead;
var bool bHartsockSpawned, bZanovichSpawned, bCorrionSpawned, bMcCrearySpawned, bCourtlandSpawned, bMacSpawned;

var int iRand;
var float i;

var NBS_Hill30Moment_Before Hill30Pre_Ref;

function PostBeginPlay()
{
	bHartsockDead = False;
	bZanovichDead = False;
	bCorrionDead = False;
	bMcCrearyDead = False;
	bCourtlandDead = False;

	bHartsockSpawned = False;
	bCorrionSpawned = False;
	bZanovichSpawned = False;
	bMcCrearySpawned = False;
	bCourtlandSpawned = False;
	bMacSpawned = False;

	Hill30Pre_Ref = NBS_Hill30Moment_Before( GetFirstActor( 'NBS_Hill30Moment_Before' ) );

}

state Triggered
{
	function OnTrigger() { GotoState( 'MacCallsBaker', 'Begin' ); }
	Begin:

	AP_Mac_Pre = AnimPawn( GetPawn( 'AP_Mac1' ) );
	AP_Mac_Pre.bNoTurnBody = true;
	AP_Mac_Pre.Controller.bGodmode = true;
	ACTION_TriggerEvent( 'MacFunnelVolumes' );	//===== Turn off collision on these blocking volumes
	ACTION_AttachStaticMesh( AP_Mac_Pre, StaticMesh's_npc_weapon_us.us_thompson', 'rifle_hold' );
	ACTION_TriggerEvent( 'MacFunnelVolumes' );	//===== Turn on collision on these blocking volumes

	AP_Hooper_Pre = AnimPawn( GetPawn( 'AP_Hooper1' ) );
	AP_Hooper_Pre.bNoTurnBody = true;
	AP_Hooper_Pre.Controller.bGodmode = true;
	ACTION_AttachStaticMesh( AP_Hooper_Pre, StaticMesh's_npc_weapon_us.us_m1', 'rifle_hold' );

	DummyDudeA = AnimPawn( GetPawn( 'AP_PreHill30Dude_A ') );
	DummyDudeA.bNoTurnBody = true;
	DummyDudeA.Controller.bGodmode = true;
	ACTION_AttachStaticMesh( DummyDudeA, StaticMesh's_npc_weapon_us.us_m1', 'rifle_hold' );

	DummyDudeB = AnimPawn( GetPawn( 'AP_PreHill30Dude_B' ) );
	DummyDudeB.bNoTurnBody = true;
	DummyDudeB.Controller.bGodmode = true;
	ACTION_AttachStaticMesh( DummyDudeB, StaticMesh's_npc_weapon_us.us_m1', 'rifle_hold' );

	DummyDudeC = AnimPawn( GetPawn( 'AP_PreHill30Dude_C' ) );
	DummyDudeC.bNoTurnBody = true;
	DummyDudeC.Controller.bGodmode = true;
	ACTION_AttachStaticMesh( DummyDudeC, StaticMesh's_npc_weapon_us.us_m1', 'rifle_hold' );

		bHartsockDead = true;
		bZanovichDead = true;
		bCorrionDead = true;
		bMcCrearyDead = true;
		bCourtlandDead = true;

		// Guys that spawn for the outro
		Hartsock = GetPawn( 'hartsockfgt' );
		Zanovich = GetPawn( 'Zanovich' );
		Corrion = GetPawn( 'Corrion' );
		McCreary = GetPawn( 'Mccreary' );
		Courtland = GetPawn( 'Courtland' );
		Mac = GetPawn( 'mac' );

		ACTION_SetAnimSet( 'AP_Mac1', "a_ev_all.a_ev_corrion" );
		ACTION_ClearPawnIdleQueue( 'AP_Mac1' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Mac1', 'standing_idle_combat_1' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Mac1', 'standing_idle_combat_2' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Mac1', 'standing_idle_combat_4' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Mac1', 'standing_idle_combat_5' );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Mac1', FALSE );

		ACTION_SetAnimSet( 'AP_Hooper1', "a_cin_d7_No_Better_Spot.a_cin_d7_No_better_spot_to_die" );
		ACTION_SetAnimSet( 'AP_Hooper1', "a_ev_all.a_ev_corrion" );
		ACTION_ClearPawnIdleQueue( 'AP_Hooper1' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Hooper1', 'Wheaton_combat_1' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Hooper1', 'Wheaton_combat_4' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Hooper1', 'Wheaton_combat_2' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Hooper1', 'Wheaton_combat_4' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_Hooper1', 'Wheaton_combat_3' );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_Hooper1', FALSE );

		ACTION_SetAnimSet( 'AP_PreHill30Dude_A', "a_cin_d7_No_Better_Spot.a_cin_d7_No_better_spot_to_die" );
		ACTION_ClearPawnIdleQueue( 'AP_PreHill30Dude_A' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_A', 'Wheaton_combat_1' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_A', 'Wheaton_combat_4' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_A', 'Wheaton_combat_2' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_A', 'Wheaton_combat_4' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_A', 'Wheaton_combat_3' );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_PreHill30Dude_A', FALSE );

		ACTION_SetAnimSet( 'AP_PreHill30Dude_B', "a_cin_d7_No_Better_Spot.a_cin_d7_No_better_spot_to_die" );
		ACTION_ClearPawnIdleQueue( 'AP_PreHill30Dude_B' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_B', 'Wheaton_combat_3' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_B', 'Wheaton_combat_1' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_B', 'Wheaton_combat_2' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_B', 'Wheaton_combat_3' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_B', 'Wheaton_combat_4' );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_PreHill30Dude_B', FALSE );

		ACTION_SetAnimSet( 'AP_PreHill30Dude_C', "a_cin_d7_No_Better_Spot.a_cin_d7_No_better_spot_to_die" );
		ACTION_ClearPawnIdleQueue( 'AP_PreHill30Dude_C' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_C', 'Wheaton_combat_4' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_C', 'Wheaton_combat_1' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_C', 'Wheaton_combat_4' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_C', 'Wheaton_combat_2' );
		ACTION_AddAnimToPawnIdleQueue( 'AP_PreHill30Dude_C', 'Wheaton_combat_3' );
		ACTION_PlayAnimFromPawnIdleQueue( 'AP_PreHill30Dude_C', FALSE );

		if ( Hartsock != None && Hartsock.Health > 0 )
			bHartsockDead = false;

		if ( Zanovich != None && Zanovich.Health > 0 )
			bZanovichDead = false;

		if ( Corrion != None && Corrion.Health > 0 )
			bCorrionDead = false;

		if ( McCreary != None && McCreary.Health > 0 )
			bMcCrearyDead = false;

		if ( Courtland != None && Courtland.Health > 0 )
			bCourtlandDead = false;

		ACTION_SetHiddenDirect( AP_Mac_Pre, False );
		ACTION_SetHiddenDirect( AP_Hooper_Pre, False );
		ACTION_SetHiddenDirect( DummyDudeA, False );
		ACTION_SetHiddenDirect( DummyDudeB, False );
		ACTION_SetHiddenDirect( DummyDudeC, False );

	ScriptEnd:
}

state MacCallsBaker
{
	function OnTrigger() { GotoState( 'NullState', 'Begin' ); }
	Begin:

		// Move remaining squad to trench
		ACTION_DisableBattleDialogue();
		ACTION_OrderMove( 'Base', 'MoveRemainingSquadHere01' );
		ACTION_OrderMove( 'Fire', 'MoveRemainingSquadHere02' );

		// Initialize time
		i = 1.0;
		StartAbsoluteTime();
		ResetAbsoluteTime();

		i += ACTION_PlayLipSyncSound( 'AP_Mac1', "D71400.MAC_A", 1.0, 1.0, 10240.0, true ) + 0.5;
		ACTION_DisplaySubtitleMessage2( S_Localize("MAC_A"), 2.0, 1, 1, 1 );

		WaitForAbsoluteTime( i );
		i += ACTION_PlayLipSyncSound( 'AP_Mac1', "D71400.MAC_B", 1.0, 1.0, 10240.0, true ) + 3.0;

		WaitForAbsoluteTime( i );
		if ( !bHartsockDead && !Hill30Pre_Ref.bScriptStarted )
		{
			// Hartsock_J ---------- Baker!
			i += ACTION_PlayLipSyncSound( 'hartsockfgt', "D71400.HARTSOCK_J", 1.0, 1.0, 255.0 ) + 0.5;
			ACTION_DisplaySubtitleMessage2( S_Localize("HARTSOCK_G"), 3.0, 1, 1, 1 );
			sleep( 1.0 );

			// Hartsock_K ---------- Mac's callin' ya.
			WaitForAbsoluteTime( i );
			i += ACTION_PlayLipSyncSound( 'hartsockfgt', "D71400.HARTSOCK_K", 1.0, 1.0, 255.0 );
		}

		// Stop time
		WaitForAbsoluteTime( i );
		StopAbsoluteTime();

	ScriptEnd:
}

state NullState
{
	function OnTrigger() { GotoState( 'NullState', 'Begin' ); }
	Begin:
}
