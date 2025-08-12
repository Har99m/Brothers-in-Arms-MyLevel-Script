//=============================================================================
// 	TS_D00_0600_C3_Wave.
//	Use: 			Counts dead German soldiers and moves on to next state
//	Triggered by:	[Triggered]		CSG_C3_W1_01 (x3) , CSG_C3_W1_02 (x3) - TriggerOnDeath
//	Triggered by:	[Wave_Two]		CSG_C3_W2_01 (x3) , CSG_C3_W2_02 (x3) , CSG_C3_W2_03 (x3) - TriggerOnDeath
//	Triggered by:	[Wave_Three]	CSG_C3_W3_01 (x3) , CSG_C3_W3_02 (x2) , CSG_C3_W3_03 (x3) - TriggerOnDeath
//=============================================================================

class TS_D00_0600_C3_Wave extends TriggeredScript
	placeable;

var int i, s, BodyCount, BodyCount2, bomb ;
var Unit GermanUnit[ 3 ];
var Unit GermanUnit2[ 4 ];

function GetBodyCount()
	{
		BodyCount = GermanUnit[0].GetNumLivingMembers() + 
		 			GermanUnit[1].GetNumLivingMembers() + 
		 			GermanUnit[2].GetNumLivingMembers();
		// SLog( "---------- BodyCount: " $ BodyCount );
	}

function GetBodyCount2()
	{
		BodyCount2 = GermanUnit2[0].GetNumLivingMembers() + 
		 			GermanUnit2[1].GetNumLivingMembers() +
		 			GermanUnit2[2].GetNumLivingMembers() + 
		 			GermanUnit2[3].GetNumLivingMembers();
		// SLog( "---------- BodyCount: " $ BodyCount );
	}

//=============================================================================

state triggered
	{
			function OnTrigger()
				{
					i ++ ;
				}

		Begin:

			//===== Start off counter at 0

				i = 0;
				s = 0;
				bomb = 0;

				GermanUnit[ 0 ] = Unit( GetFirstActor( 'Unit_DE_C3_W1_01' ));
				GermanUnit[ 1 ] = Unit( GetFirstActor( 'Unit_DE_C3_W1_02' ));
				GermanUnit[ 2 ] = Unit( GetFirstActor( 'Unit_DE_C3_W1_03' ));

				BodyCount = 0;

				ACTION_TriggerEvent( 'GBXWPB_Church' );			//===== Turn off church beacon
				ACTION_TriggerEvent( 'GBXWPB_Wave01' );			//===== Turn on wave 01

			//===== Wait for Germans to trigger script 6 times

				While( i != 6 )
					{
						switch ( bomb )
							{
								case 1:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_A' );
									break;
								case 4:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_B' );
									break;
								case 8:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_C' );
									break;
								case 9:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_D' );
									break;
								case 14:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_E' );
									break;
								case 15:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_F' );
									break;
								case 18:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_G' );
									break;
								case 22:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_H' );
									break;
								case 23:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_I' );
									break;
								case 28:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_J' );
									break;
								case 31:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_K' );
									break;
								case 35:
									ACTION_TriggerEvent( 'gbxET_Wave_01_Bomb_L' );
									break;
								case 35:
									bomb = 0;
									break;
							}

						sleep( 1.0 );
						bomb ++ ;
					}

//=============================================================================

			//===== Start off counter at 0 and reset German units

				s = 0;
				bomb = 0;

				BodyCount = 0 ;

				GermanUnit[ 0 ] = Unit( GetFirstActor( 'Unit_DE_C3_W2_01' ));
				GermanUnit[ 1 ] = Unit( GetFirstActor( 'Unit_DE_C3_W2_02' ));
				GermanUnit[ 2 ] = Unit( GetFirstActor( 'Unit_DE_C3_W2_03' ));

				ACTION_TriggerEvent( 'GBXWPB_Wave01' );			//===== Turn off wave 01
				ACTION_TriggerEvent( 'GBXWPB_Wave02' );			//===== Turn on wave 02

			//===== Spawn wave two germans, knock down fence, and initialize their movements

				ACTION_TriggerEvent( 'CSG_C3_W2_01' );
					sleep( 0.2 );
				ACTION_TriggerEvent( 'CSG_C3_W2_02' );
					sleep( 0.3 );
				ACTION_TriggerEvent( 'CSG_C3_W2_03' );
					sleep( 0.5 );

				ACTION_DisplayObjectiveHint( S_Localize( "HINT_6" ) , 3.0 );

		//===== Move WAVE TWO Germans up ... slowly ...

				GetBodyCount();

				while( BodyCount > 0 )
					{
						switch ( s )
							{
								case 1:
										ACTION_OrderMove( 'Unit_DE_C3_W2_01', 'PN_C3_Wave_02_01_A' );
										ACTION_OrderMove( 'Unit_DE_C3_W2_02', 'PN_C3_Wave_02_02_A' );
										ACTION_OrderMove( 'Unit_DE_C3_W2_03', 'PN_C3_Wave_02_03_A' );
									break;

								case 6:
										ACTION_OrderMove( 'Unit_DE_C3_W2_01', 'PN_C3_Wave_02_01_B', TRUE );
										ACTION_OrderMove( 'Unit_DE_C3_W2_02', 'PN_C3_Wave_02_02_B', TRUE );
										ACTION_OrderMove( 'Unit_DE_C3_W2_03', 'PN_C3_Wave_02_03_B', TRUE );
									break;

								case 12:
										ACTION_OrderMove( 'Unit_DE_C3_W2_01', 'PN_C3_Wave_02_01_C', TRUE );
										ACTION_OrderMove( 'Unit_DE_C3_W2_02', 'PN_C3_Wave_02_02_C', TRUE );
										ACTION_OrderMove( 'Unit_DE_C3_W2_03', 'PN_C3_Wave_02_03_C', TRUE );
									break;

								case 140:
										ACTION_OrderAssault( 'Unit_DE_C3_W2_01', 'Unit_Player' );
									break;

								case 145:
										ACTION_OrderAssault( 'Unit_DE_C3_W2_02', 'Unit_Player' );
									break;

								case 150:
										ACTION_OrderAssault( 'Unit_DE_C3_W2_03', 'Unit_Player' );
									break;
							}

						switch ( bomb )
							{
								case 1:
									ACTION_TriggerEvent( 'gbxET_Wave_02_Bomb_A' );
									break;
								case 4:
									ACTION_TriggerEvent( 'gbxET_Wave_02_Bomb_B' );
									break;
								case 8:
									ACTION_TriggerEvent( 'gbxET_Wave_02_Bomb_C' );
									break;
								case 9:
									ACTION_TriggerEvent( 'gbxET_Wave_02_Bomb_D' );
									break;
								case 14:
									ACTION_TriggerEvent( 'gbxET_Wave_02_Bomb_E' );
									break;
								case 15:
									ACTION_TriggerEvent( 'gbxET_Wave_02_Bomb_F' );
									break;
								case 18:
									ACTION_TriggerEvent( 'gbxET_Wave_02_Bomb_G' );
									break;
								case 35:
									bomb = 0;
									break;
							}

						sleep( 1.0 );
						s++;
						bomb++;

						GetBodyCount();
					}

//=============================================================================

			//===== Start off timer at 0 and reset German units

				s = 0;
				bomb = 0;

				BodyCount2 = 0 ;

				GermanUnit2[ 0 ] = Unit( GetFirstActor( 'Unit_DE_C3_W3_01' ));
				GermanUnit2[ 1 ] = Unit( GetFirstActor( 'Unit_DE_C3_W3_02' ));
				GermanUnit2[ 2 ] = Unit( GetFirstActor( 'Unit_DE_C3_W3_03' ));
				GermanUnit2[ 3 ] = Unit( GetFirstActor( 'Unit_DE_C3_W3_04' ));

				ACTION_TriggerEvent( 'GBXWPB_Wave02' );			//===== Turn off wave 02
				ACTION_TriggerEvent( 'GBXWPB_Wave03A' );		//===== Turn on wave 03A

			//===== Spawn first squad of wave three germans
				ACTION_TriggerEvent( 'CSG_C3_W3_04' );
					sleep( 0.2 );
				ACTION_OrderMove( 'Unit_DE_C3_W3_04', 'PN_C3_Wave_03_04_A' );

//				while( Unit( GetFirstActor( 'Unit_DE_C3_W3_04' )).GetNumLivingMembers() > 1 )
//					{
						sleep( 8.0 );
//					}

		//===== Move WAVE THREE Germans up ...

			//===== Spawn wave three germans, and initialize their movements
				ACTION_TriggerEvent( 'CSG_C3_W3_01' );
					sleep( 0.6 );
				ACTION_TriggerEvent( 'CSG_C3_W3_02' );
					sleep( 0.7 );
				ACTION_TriggerEvent( 'CSG_C3_W3_03' );
					sleep( 0.2 );

				GetBodyCount2();

				ACTION_TriggerEvent( 'GBXWPB_Wave03A' );		//===== Turn off wave 03A
				ACTION_TriggerEvent( 'GBXWPB_Wave03B' );		//===== Turn on wave 03B

				while( BodyCount2 > 0 )
					{
						switch ( s )
							{
								case 1:
										ACTION_OrderMove( 'Unit_DE_C3_W3_01', 'PN_C3_Wave_03_01_A' );
										ACTION_OrderMove( 'Unit_DE_C3_W3_02', 'PN_C3_Wave_03_02_A' );
										ACTION_OrderMove( 'Unit_DE_C3_W3_03', 'PN_C3_Wave_03_03_A' );
									break;

								case 12:
										ACTION_OrderMove( 'Unit_DE_C3_W3_01', 'PN_C3_Wave_03_01_B', TRUE );
										ACTION_OrderMove( 'Unit_DE_C3_W3_02', 'PN_C3_Wave_03_02_B', TRUE );
										ACTION_OrderMove( 'Unit_DE_C3_W3_03', 'PN_C3_Wave_03_03_B', TRUE );
									break;

								case 20:
										ACTION_OrderMove( 'Unit_DE_C3_W3_02', 'PN_C3_Wave_03_02_C', TRUE );
										ACTION_OrderMove( 'Unit_DE_C3_W3_03', 'PN_C3_Wave_03_03_C', TRUE );
									break;

								case 100:
										ACTION_OrderAssault( 'Unit_DE_C3_W3_01', 'Unit_Player' );
									break;

								case 110:
										ACTION_OrderAssault( 'Unit_DE_C3_W3_02', 'Unit_Player' );
									break;

								case 120:
										ACTION_OrderAssault( 'Unit_DE_C3_W3_04', 'Unit_Player' );
									break;

							}

						switch ( bomb )
							{
								case 1:
									ACTION_TriggerEvent( 'gbxET_Wave_03_Bomb_A' );
									break;
								case 4:
									ACTION_TriggerEvent( 'gbxET_Wave_03_Bomb_B' );
									break;
								case 8:
									ACTION_TriggerEvent( 'gbxET_Wave_03_Bomb_C' );
									break;
								case 9:
									ACTION_TriggerEvent( 'gbxET_Wave_03_Bomb_D' );
									break;
								case 14:
									ACTION_TriggerEvent( 'gbxET_Wave_03_Bomb_E' );
									break;
								case 15:
									ACTION_TriggerEvent( 'gbxET_Wave_03_Bomb_F' );
									break;
								case 18:
									ACTION_TriggerEvent( 'gbxET_Wave_03_Bomb_G' );
									break;
								case 35:
									bomb = 0;
									break;
							}

						sleep( 1.0 );
						s++;
						bomb++;

						GetBodyCount2();
					}

		//===== DISPLAY OBJECTIVE
				ACTION_TriggerEvent( 'GBXWPB_Wave03B' );			// OFF
				ACTION_TriggerEvent( 'GBXWPB_ChurchFront' );		// ON
 				ACTION_SetObjectiveStatus( 1 , OI_Complete , 'ObjectiveList' );
				ACTION_DisplayObjective( 1 , 'ObjectiveList' , 3.0 );

					sleep( 3.5 );

			//===== Display final hint
				ACTION_DisplayObjectiveHint( S_Localize( "HINT_4" ) , 3.0 );
					//-----/-----HINT_4="Return to the front of the church."

			//===== TEMP - Enable outro trigger and disable pathnodes for outro guys
				ACTION_TriggerEvent( 'GBXTrig_Midtro_B' );

				ACTION_BlockNavPoint( 'PN_Midtro_Campbell' );
				ACTION_BlockNavPoint( 'PN_Midtro_Paige' );
				ACTION_BlockNavPoint( 'PN_Midtro_McConnel' );

			//===== Remove control of player's squad so they don't try to screw up outro
				ACTION_DetachUnitFromSuperUnit( 'Unit_US_Ass' );
				ACTION_OrderMove( 'Unit_US_Ass' , 'PN_S7_Ass_Setup' );

		ScriptEnd:
	}
