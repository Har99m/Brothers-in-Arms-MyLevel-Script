//=============================================================================
// 	TS_D000230_AA_Lock.
//	Script locks the player at the Paddock's AA moment
//=============================================================================
class TS_D000230_AA_Lock extends TriggeredScript
	placeable;

var int p ;
var Volume Volume_AA_Doyle_Teleport ;
var Animpawn AP_Doyle ;

state Triggered
	{

			function OnTrigger()
				{
					p = 1 ;
				}

		Begin:

					p = 0 ;
				AP_Doyle = AnimPawn( GetPawn( 'AP_Doyle' ));
				Volume_AA_Doyle_Teleport = Volume( GetFirstActor( 'Volume_AA_Doyle_Teleport' ));

			//===== Lock the player
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

		//===== If Doyle is too far from scene and player is near scene teleport him in
				ForEach Volume_AA_Doyle_Teleport.TouchingActors( class 'AnimPawn' , AP_Doyle )
					{
						if ( AP_Doyle.Tag == 'AP_Doyle' )
							{
								//===== Found a pawn so teleport
								if ( AP_Doyle != None && AP_Doyle.Health > 0 )
									{
										ACTION_TeleportPawnToActor( AP_Doyle , 'LT_Doyle_Teleport' );
										ACTION_RunDirect( AP_Doyle );
									}
							}

					}

			While( p != 1 )
				{
						sleep( 2.0 );
					ACTION_TriggerEvent( 'Event_SS_Player_At_AA' );
				}

		ScriptEnd:
	}

