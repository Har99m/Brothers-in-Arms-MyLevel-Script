//=============================================================================
// TS_D08_1000_Obj1Tracker.
//=============================================================================
class TS_D08_1000_Obj1Tracker extends TriggeredScript
	placeable;

var Unit GermanUnit[3];

function PostBeginPlay()
{
	Super.PostBeginPlay();
	GermanUnit[0] = Unit( GetFirstActor( 'Unit_DE_C3_01' ));
	GermanUnit[1] = Unit( GetFirstActor( 'Unit_DE_C3_02' ));
	GermanUnit[2] = Unit( GetFirstActor( 'Unit_DE_C3_03' ));
}

State Triggered
{
Begin:
	Do 
	{
		sleep(1.0);
	} Until ( ( GermanUnit[0].GetNumLivingMembers() + GermanUnit[1].GetNumLivingMembers() + GermanUnit[2].GetNumLivingMembers() ) <= 0 );
	GotoState('ObjComplete');
}

State ObjComplete
{
	Function OnTrigger()
	{
		//nothing
	}
Begin:
	//ACTION_TriggerEvent('WP_obj1');
	//ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
	sleep(3.0);
	ACTION_TriggerEvent('TS_Checkpoint2Save');
	sleep(2.0);
	//ACTION_SetObjectiveStatus( 2, OI_Active, 'ObjectiveList' );
	//ACTION_DisplayObjective( 2, 'ObjectiveList', 4.0 );
	//ACTION_TriggerEvent('WP_obj2');
}
