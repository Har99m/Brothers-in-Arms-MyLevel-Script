//=============================================================================
// PlayerFindsCole.
//=============================================================================
class PlayerFindsCole extends TriggeredScript
	placeable;

State Triggered
	{
		Begin:
			//===== Player has won the race to french house..
				ACTION_TriggerEvent( 'MacPathTrig4' );
				ACTION_DestroyActor( 'MacPathTrig4' );
				ACTION_DestroyActor( 'MacPathTrig4p' );

			//===== Start Cole Linkup Seq.
				ACTION_TriggerEvent('reveal');
				ACTION_OrderMove('USAFireTeam1','Path_Mac_French_Start',FALSE);
	}
