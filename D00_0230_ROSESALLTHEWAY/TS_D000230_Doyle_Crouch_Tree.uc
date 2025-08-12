//=============================================================================
// TS_D000230_Doyle_Crouch_Tree.
//=============================================================================
class TS_D000230_Doyle_Crouch_Tree extends TriggeredScript
	placeable;

var ActorLite PN_Tree_Crouch_Entrance , PN_Crouch_Exit , PN_Intro_Doyle_Jump ;
var AnimPawn AP_Doyle ;
var int d ;

State Triggered
	{

			function OnTrigger()
				{
					 d = 1 ;
				}

		Begin:

				d = 0 ;

				PN_Tree_Crouch_Entrance = GetNavigationPoint( 'PN_Tree_Crouch_Entrance' );
				PN_Crouch_Exit = GetNavigationPoint( 'PN_Crouch_Exit' );
				PN_Intro_Doyle_Jump = GetNavigationPoint( 'PN_Intro_Doyle_Jump' );

				AP_Doyle = AnimPawn( GetPawn( 'AP_Doyle' ));

			//===== Move Doyle to tree and set up animations
				ACTION_ChangeController( 'AP_Doyle' , class' ScriptedController ' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle ');
				ACTION_ChangeScriptedSequenceDirect( AP_Doyle , 'SS_Doyle_TreeJump' );
				ACTION_MoveToward( AP_Doyle , PN_Intro_Doyle_Jump , FALSE , GetFirstActor( 'LT_Tree_Jump' ));
			While( !PawnIsAtDestination( AP_Doyle , PN_Intro_Doyle_Jump ))
				{
						sleep( 0.5 );
					ACTION_MoveToward( AP_Doyle , PN_Intro_Doyle_Jump , FALSE , GetFirstActor( 'LT_Tree_Jump' ));
				}

				ACTION_WaitForEvent( 'Event_SS_Doyle_Tree_Jumped' );

				AP_Doyle.bDontFrustumCull = FALSE ;
				ACTION_ChangeController( 'AP_Doyle' , class' Mind ' );
				ACTION_ChangeController( 'AP_Doyle' , class' ScriptedController ' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle ');

	Slog( "-------------*******-------------DOYLE HAS JUMPED OVER LOG-------------*******-------------" );

		//===== Move Doyle to start of tree	and wait
				ACTION_MoveToward( AP_Doyle , PN_Tree_Crouch_Entrance , FALSE );
			While( !PawnIsAtDestination( AP_Doyle , PN_Tree_Crouch_Entrance ))
				{
						sleep( 0.5 );
					ACTION_MoveToward( AP_Doyle , PN_Tree_Crouch_Entrance , FALSE );
				}

			//===== Doyle at tree, crouch
				ACTION_CrouchDirect( AP_Doyle );
					sleep( 0.4 );
				ACTION_MoveToward( AP_Doyle , PN_Crouch_Exit , FALSE );
			While( !PawnIsAtDestination( AP_Doyle , PN_Crouch_Exit ))
				{
						sleep( 0.5 );
					ACTION_MoveToward( AP_Doyle , PN_Crouch_Exit , FALSE );
				}

			//===== Wait for Doyle at other side of tree
				ACTION_BlockNavPoint( 'PN_Tree_Crouch_Entrance' );
				ACTION_BlockNavPoints( 'PN_Doyle_Crouch_Pre' );
					sleep( 0.4 );
				ACTION_ChangeController( 'AP_Doyle' , class'Mind' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle ');
				ACTION_OrderMove( 'Unit_US_Assault' , 'PN_Crouch_Exit_02' );

			//===== Doyle stands up
				ACTION_RunDirect( AP_Doyle );

		ScriptEnd:
	}

State Exit_Zone
	{
		Begin:

		ScriptEnd:
	}
