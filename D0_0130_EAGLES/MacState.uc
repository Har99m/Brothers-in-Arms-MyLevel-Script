//=============================================================================
// MacState.
//=============================================================================
class MacState extends TriggeredScript
	placeable;

var bool bDemo;
var bool bDone1;
var bool bDone2;
var bool FirstFlankClear;
var bool OkGoGoGo;

var float DistanceBaker, DistanceMac;

var MacMeet_Script MMS_Ref;

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
	{
		Super.PostBeginPlay();		
		bDemo = FALSE;
	}

State Triggered
	{		
		Begin:

			GotoState( 'Mac01' );
	}

State Mac01
	{
			function OnTrigger()
				{ }

		Begin:

				DistanceBaker = vSize( getLocalPlayerPawn().location - getPawn('Legget').location);
				DistanceMac = vSize( getPawn('Mac').location - getPawn('Legget').location);

							sleep( 0.2 );

					if ( DistanceBaker > DistanceMac )
						{
							ACTION_SetLookAtTarget( 'Mac', GetLocalPlayerPawn(), TRUE );
							sleep(	ACTION_PlayLipSyncSound('Mac',"D00130.MAC_N", 1.0, 1.0, 1024.0, TRUE) - 2.0);
							ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_N" ), 2.5, 1, 1, 1, TRUE, TRUE );			//	( 0.91 )
								//	 Mac: I'll cross first!

								sleep ( 1.1 );

							ACTION_PlayLipSyncSound('Mac',"D00130.MAC_O", 1.0, 1.0, 1024.0, TRUE);
							ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_O" ), 2.0, 1, 1, 1, TRUE, TRUE );	//	( 0.44 )
								//	Mac: Cover me!
							ACTION_ClearLookAtTarget( 'Mac' );

							MMS_Ref = MacMeet_Script( GetFirstActor( 'MacMeet_Script' ) );

								do	{
										SLog( "--------- Waiting on MMS_Ref.MacTrigCount: ---------" $ MMS_Ref.MacTrigCount );
											sleep( 1.0 );
									} until ( MMS_Ref.MacTrigCount > 3 );

							ACTION_OrderMove( 'USAFireTeam1', 'MacPath4', FALSE );
							sleep( 12.0 );

							if ( FrenchHouse_Script( GetFirstActor('FrenchHouse_Script') ).Pawn_Cole == None )
								ACTION_OrderMove( 'USAFireTeam1', 'MacPath4', FALSE );
							else
								SLog( "--------- Backup failed ---------" );
						}

					else
						{
							ACTION_OrderMove('USAFireTeam1','MacPath4b',False);
						}
	}

State Mac04pre
	{
			function OnTrigger()
				{
					GotoState( 'Mac04' );
				}
		Begin:
			//===== Nothing
	}

State Mac04
	{
			function OnTrigger()
				{
					GotoState( 'Mac05' );
				}
		Begin:
			//===== Nothing
	}

State Mac05
	{
			function OnTrigger()
				{
					GotoState( 'Mac06' );
				}
		Begin:
				While ( !OkGoGoGo )
					{
						sleep(0.1);
					}
							ACTION_DestroyActor('CharacterSpawnerGermanyMacAttack');
							ACTION_DestroyActor('CharacterSpawnerGermanyRevenge');
							ACTION_DestroyActor('GermanMacKill1');
							ACTION_DestroyActor('GermanMacKill2');
							ACTION_DestroyActor('GermanRPawn');

						//ACTION_OrderMove('USAFireTeam1','MacPath6',False);
							ACTION_MoveTowardTag( 'Cole', 'PN_ColeExit' );
								sleep(2.0);
	}

State Mac06
	{
				function OnTrigger()
					{
						//===== Nothing
					}
		Begin:

				ACTION_DestroyActor( 'Cole' );

			//we are at the clearing ready to attack
	
				getpawn('FieldGerman1').Health=100;
				getpawn('FieldGerman2').Health=100;
				getpawn('FieldGerman1').controller.bDemiGod=True;
				getpawn('FieldGerman2').controller.bDemiGod=True;
	}

State Mac07pre
	{
				function OnTrigger()
					{
						GotoState( 'Mac07' );
					}
		Begin:
			//===== Nothing
	}

State Mac07
	{
		Begin:
			ACTION_DestroyActor('GermanSquad13');
			ACTION_DestroyActor('CharacterSpawnerGermanyField');
	}
