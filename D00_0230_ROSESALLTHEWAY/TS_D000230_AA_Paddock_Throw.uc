//=============================================================================
// TS_D000230_AA_Paddock_Throw.
//=============================================================================
class TS_D000230_AA_Paddock_Throw extends TriggeredScript
	placeable;

var AnimPawn AP_Paddock , AP_Doyle ;
var ActorLite PN_Paddock_Grenade , PN_Paddock_Approach ;

state Triggered
	{
		Begin:
			//===== Define variables
				AP_Paddock = AnimPawn( GetPawn( 'AP_Paddock' ));
				AP_Doyle = AnimPawn( GetPawn( 'AP_Doyle' ));
				PN_Paddock_Grenade = GetNavigationPoint( 'PN_Paddock_Grenade' );
				PN_Paddock_Approach = GetNavigationPoint( 'PN_Paddock_Approach' );
				AP_Paddock.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'AP_Paddock' , TRUE );
				AP_Paddock.AttachToBone( GetFirstActor( 'pfx_Grenade_Toss' ) , 'Bip01 R Hand' );

					sleep( 0.6 );

			//===== Trigger ScriptedSequence to start
				ACTION_TriggerEvent( 'Event_SS_Paddock_AA_01_Start' );

				ACTION_WaitForEvent( 'Event_SS_Paddock_AA_01_Dismount' );
				ACTION_ChangeControllerDirect( AP_Paddock ,class'Mind' );
				ACTION_ChangeControllerDirect( AP_Paddock ,class'ScriptedController' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Paddock' );

			//===== Move Paddock to approach the incoming player
				ACTION_MoveToward( AP_Paddock , PN_Paddock_Approach , TRUE , GetFirstActor( 'LT_AA_Moment_Center' ));
				ACTION_WaitForEvent( 'Event_AA_Paddock_Approach' );

			if( AP_Doyle.Health > 0 && vSize( AP_Doyle.location - AP_Paddock.location ) < 1024.0 )
				{
					ACTION_ChangeScriptedSequenceDirect( AP_Paddock , 'SS_AA_Paddock_Doyle_Present' );
					ACTION_TriggerEvent( 'Event_SS_Paddock_Doyle_Present_Setup' );
				}
			else
				{
					ACTION_ChangeScriptedSequenceDirect( AP_Paddock , 'SS_AA_Paddock_Doyle_Absent' );
					ACTION_TriggerEvent( 'Event_SS_Paddock_Doyle_Absent_Setup' );
				}

			//===== Paddock to mind and join player
				ACTION_WaitForEvent( 'Event_SS_Paddock_Doyle_Exit' );
				AP_Paddock.bDontFrustumCull = FALSE ;
				AP_Paddock.Controller.bGodMode = FALSE ;
				ACTION_SetRepelBullets( 'AP_Paddock' , FALSE );
				ACTION_UnBlockNavPoint( 'PN_Paddock_Approach' );

		ScriptEnd:
	}
