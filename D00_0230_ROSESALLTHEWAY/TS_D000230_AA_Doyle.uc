//=============================================================================
// TS_D000230_AA_Doyle.
//=============================================================================
class TS_D000230_AA_Doyle extends TriggeredScript
	placeable;

var Animpawn AP_Doyle ;
var ActorLite PN_Doyle_Watch ;
var Actor LT_AA_Moment_01 ;
var int s ;


state Triggered
	{
		Begin:
			//===== Define
				AP_Doyle = AnimPawn( GetPawn( 'AP_Doyle' ));

				PN_Doyle_Watch = GetNavigationPoint( 'PN_Doyle_Watch' );

				LT_AA_Moment_01 = GetFirstActor( 'LT_AA_Moment_01' );

							sleep( 0.2 );

				ACTION_WaitForEvent( 'Event_SS_Paddock_AA_01_Dismount' );

			//===== Change Doyle to Scripted
				ACTION_ChangeControllerDirect( AP_Doyle , class'ScriptedController' );
				AP_Doyle.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'AP_Doyle' , TRUE );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle' );
				ACTION_SetAnimSetDirect( AP_Doyle , "a_hold_rifle.a_hold_rifle" );
				ACTION_RunDirect( AP_Doyle );

				ACTION_ClearPawnIdleQueue( 'AP_Doyle' );
				ACTION_AddAnimToPawnIdleQueue( 'AP_Doyle', 'standing_chatting_1' );
				ACTION_AddAnimToPawnIdleQueue( 'AP_Doyle', 'standing_chatting_2' );
				ACTION_AddAnimToPawnIdleQueue( 'AP_Doyle', 'standing_chatting_3' );

					sleep( 0.4 );

			//===== Move Doyle and wait for him to reach destination 1
				s = 0 ;
				ACTION_MoveToward( AP_Doyle , PN_Doyle_Watch , TRUE );
				While( !PawnIsAtDestination( AP_Doyle , PN_Doyle_Watch ) && s < 225 )
					{
							sleep( 0.2 );
						s ++ ;
					}

				AP_Doyle.Controller.Focus = LT_AA_Moment_01 ;
				ACTION_WaitForPawnRotateToward( AP_Doyle );

				ACTION_PlayAnimFromPawnIdleQueue( 'AP_Doyle', FALSE );

		ScriptEnd:
	}

state Doyle_Exit
	{
		Begin:
		ScriptEnd:
	}

