//=============================================================================
// TS_D090800_ChurchRespawner.
//=============================================================================
class TS_D090800_ChurchRespawner extends TriggeredScript
	placeable;

var Unit GermanUnit[2];
var TriggeredScriptCombat TSC_Ref;

var int numSpawnCount;

CONST MAXRESPAWN = 8;

function PostBeginPlay()
{
	Super.PostBeginPlay();

	GermanUnit[0] = GetUnit('Unit_DE_306');
	GermanUnit[1] = GetUnit('Unit_DE_307');

	TSC_Ref = TriggeredScriptCombat(GetFirstActor('TS_C3_ExtendFinal'));

	numSpawnCount = 0;
}

State Triggered 
{
	function Trigger( Actor Other, Pawn EventInstigator )
	{
		// SLog( "**** Actor Other ****" $ Other );
		// SLog( "**** Pawn EventInstigator ****" $ EventInstigator );

		Super.Trigger( Other, EventInstigator );

		if ( EventInstigator != None && EventInstigator.IsA('InfantryGermany') )
		{
			SLog( "**** Checking for respawn ****" );

			if ( GermanUnit[0].GetNumLivingMembers() <= 0 && numSpawnCount < MAXRESPAWN )
			{
				ACTION_TriggerEvent( 'CSG_306b' );
				++numSpawnCount;
			}

			if ( GermanUnit[1].GetNumLivingMembers() <= 0 && numSpawnCount < MAXRESPAWN )
			{
				if ( RAND(2) == 0 )
					ACTION_TriggerEvent( 'CSG_307' );
				else
					ACTION_TriggerEvent( 'CSG_307b' );

				numSpawnCount += 2;
			}
		}
		else if ( Other != None && Other.Tag == 'gbxTTrig_NearChurch' )
			GoToState( 'CheckComplete' );
	}

	function OnTrigger()
	{
		// Do nothing
	}

	Begin:

	// Spawn Initial Germans
	ACTION_TriggerEvent( 'CSG_306' );
	sleep( 1.0 );

	ACTION_TriggerEvent( 'CSG_307' );
	ACTION_OrderMove( 'Unit_DE_307', 'PN_C3_307_FrontRight' );
}

State CheckComplete
{
	function OnTrigger()
	{
		if ( GermanUnit[0].GetNumLivingMembers() <= 0 && GermanUnit[1].GetNumLivingMembers() <= 0 && !TSC_Ref.bActive && TSC_Ref.GetStateName() == 'ReTriggered' )
			GoToState( 'CompleteWaitForPlayer' );
	}

	Begin:

	ACTION_TriggerEvent( Event );

	// Check if already complete
	OnTrigger();
}

State CompleteWaitForPlayer
{
	function OnTrigger()
	{
		GoToState( 'Complete' );
	}
	
	Begin:

	ACTION_DisplayObjectiveHint( "", 0.0 );

	ACTION_TriggerEvent( 'TrigVol_Trig_PlayerAtChurch' );

	sleep( 15.0 );
	do
	{
		ACTION_DisplayObjectiveHint( S_Localize("HINT_E"), 4.0 );
		sleep( 29.0 );
	} until ( FALSE );
}

state Complete
{
	function OnTrigger()
	{
		// Do nothing
	}

	Begin:

	ACTION_DisplayObjectiveHint( "", 0.0 );
	sleep( 2.0 );

	// Save
	ACTION_TriggerEvent( 'TS_Checkpoint3Save' );
	sleep( 4.5 );

	// Prepare C4
	ACTION_TriggerEvent( 'TS_C4_Blockers' );
	ACTION_TriggerEvent( 'TrigVol_C4' );

	// Off
	ACTION_TriggerEvent( 'gbxWB_Obj1' );
	// On
	ACTION_TriggerEvent( 'gbxWB_Obj2' );

	ScriptEnd:
}
