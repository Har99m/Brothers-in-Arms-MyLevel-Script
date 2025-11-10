//=============================================================================
// firstgunScript.
//=============================================================================
class firstgunScript extends TriggeredScript
	placeable;

var AnimPawn AP_Mac;
var AnimPawn German_01 , German_02 ;

var int MacTrigCount;

var vector MoveToLocation;  // the location in front of the player where Mac runs to
var Vector NewVect;			// The New Vector For Mac to Run too

var MacMeetShoot_Script MSS_Ref;

var bool bGerman_Mind;
var bool shotsFired;
var bool readyToDismount;
var bool MacFireNow;
var bool PlayerWantsPistol;

var actor Mac45 , Mesh_K98 , Knife ;
var actor MacMap ;
var actorLite MacNode, LeggettNode, ColeNode, FreeNode;
var ActorLite Dest_Walk , Dest_Corner;
var bool PlayerNear;
var float DistanceMe;

state triggered
	{
		Begin:
	


	AP_Mac = AnimPawn( GetPawn( 'mac' ) );



	German_01 = AnimPawn( getPawn( 'GermanMacKill1' ));
	German_02 = AnimPawn( getPawn( 'GermanMacKill2' ));

	bGerman_Mind = TRUE;

				Dest_Walk = GetNavigationPoint( 'Path_Slow_Mac' );
				Dest_Corner = GetNavigationPoint( 'MacMeet02' );

					sleep( 0.5 );

			//===== Move Mac to walk path
				ACTION_MoveToward( AP_Mac , Dest_Walk , FALSE );
					While( !PawnIsAtDestination( AP_Mac , Dest_Walk ))
						{
								sleep( 0.5 );
						}

			//===== Make Mac walk to corner path
				ACTION_Walk( 'Mac' );
				ACTION_MoveToward( AP_Mac , Dest_Corner , FALSE );
					While( !PawnIsAtDestination( AP_Mac , Dest_Corner ))
						{
								sleep( 0.5 );
							ACTION_MoveToward( AP_Mac , Dest_Corner , FALSE );
						}
 
					sleep( 0.2 );

			//===== Mac is at corner, Rotate
				AP_Mac.Controller.Focus = GetFirstActor( 'Look_Mac_Corner' );
				ACTION_WaitForPawnRotateToward( AP_Mac );

			//===== Animate
				ACTION_PlayAnimDirect( AP_Mac , 'standing_wall_lean_right_mount_from_standing' , 0.5 , 1.0 , , , , 1 );
					ACTION_WaitForAnimEnd( AP_Mac , 0 );
				AP_Mac.bNoTurnBody = TRUE ;
				AP_Mac.m_fDispositionAnimPlaying = TRUE ;
				ACTION_PlayAnimDirect( AP_Mac , 'standing_wall_lean_right_idle' , 0.5 , 1.0 , TRUE , , , 2 );

		ScriptEnd:
	}
