//=============================================================================
// 	TS_D000230_MG_Manager.
//	Use : Controls recruiting on MG and dismount options
//=============================================================================
class TS_D000230_MG_Manager extends TriggeredScript
	placeable;

state Triggered
	{
		Begin:

			//===== Enable recruiting so German pawn can use MG42
				ACTION_EnableMG42Recruiting( 'MG42Factory_01' , TRUE );

		SLog( "---------**********--------MG42 should be recruiting---------**********--------" );

			//===== Wait to be triggered
				ACTION_WaitForEvent( 'Event_Final_Combat_MG_Disable' );

					GoToState( 'Dismount' );

		ScriptEnd:
	}

state Dismount
	{
		Begin:

			//===== Disable recruiting , boot off gun , so German can flank it up
				//ACTION_ForceTurretDismount( 'MG42Factory_01' );
				ACTION_EnableMG42Recruiting( 'MG42Factory_01' , FALSE );

				/*
				ACTION_OrderMove( 'UNIT_C204' , 'PN_C3_MG_Flank_01' , TRUE );
				ACTION_OrderMove( 'UNIT_C204' , 'PN_C2_04' , TRUE );
				*/
				//ACTION_OrderMove( 'UNIT_C204' , 'PN_C3_MG_Flank_03');

		SLog( "---------**********--------Pawns should no longer be using MG42---------**********--------" );

		ScriptEnd:
	}


