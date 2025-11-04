//=============================================================================
// MacFindsCole.
//=============================================================================
class MacFindsCole extends TriggeredScript
	placeable;

var WarGamePawn Pawn_Mac;

State Triggered
	{
		Begin:
				ACTION_TriggerEvent( 'MacPathTrig4p' );
				ACTION_DestroyActor( 'MacPathTrig4p' );
				ACTION_DestroyActor( 'MacPathTrig4' );

				Pawn_Mac = WarGamePawn( GetPawn( 'Mac' ));
				Pawn_Mac.bDoHeadTurn = FALSE ;

				ACTION_DisplaySubtitleMessage2( S_Localize("COLE_A"), 1.0, 1, 1, 1, TRUE, TRUE );
				sleep(	ACTION_PlayLipSyncSound('Pawn_Cole',"D00130.COLE_A", 1.0, 1.0, 1024.0, TRUE) );
					// Cole: Flash!

					sleep(0.5);
				ACTION_DisplaySubtitleMessage2( S_Localize("MAC_P"), 2.0, 1, 1, 1, TRUE, TRUE );
				sleep(	ACTION_PlayLipSyncSound('Mac',"D00130.MAC_P", 1.0, 1.0, 1024.0, TRUE) );
					// Mac: Thunder! Who's there?

			//===== Start Cole Linkup Seq.
				Pawn_Mac.bDoHeadTurn = TRUE ;
				ACTION_OrderMove('USAFireTeam1','Path_Mac_French_Start',FALSE);
				ACTION_TriggerEvent('reveal');
	}
