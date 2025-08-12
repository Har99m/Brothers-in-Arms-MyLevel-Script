//=============================================================================
// 	TS_D000230_C2_Defend_A.
//	I hate to make a script for combat related stuff, but whatever
//=============================================================================
class TS_D000230_C2_Defend_A extends TriggeredScript
	placeable;

state triggered
	{
		Begin:

			if ( !ACTION_IsTrainingDisabled() )
				{
					if( vSize( GetLocalPlayerPawn().location - GetFirstActor( 'LT_MG_Hint_Check' ).location ) < 1536.0 )
						{
							ACTION_DisplayObjectiveHint( S_Localize( "HINT_E" ), 4.0 );
								//-----/-----HINT_E="Use the MG42 nearby to quickly eliminate multiple enemies."
						}
				}

			//===== Move up fools
				ACTION_OrderMove( 'UNIT_C205' , 'PN_C2_B_Bound_01' );

					sleep( 4.0 );
				ACTION_DisplayObjectiveHint( "" , 4.0 );
					sleep( 21.0 );

				ACTION_OrderMove( 'UNIT_C205' , 'PN_C2_B_Bound_02' );

					sleep( 5.0 );


				ACTION_OrderAssault( 'UNIT_C205' , 'Unit_Player' );

		ScriptEnd:
	}
