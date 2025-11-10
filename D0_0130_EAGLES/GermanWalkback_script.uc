//=============================================================================
// GermanWalkback_script.
//=============================================================================
class GermanWalkback_script extends TriggeredScript
	placeable;

var Pawn P ;
var AnimPawn Pawn_German_01 , Pawn_German_02 ;
var Actor Knife , Mesh_K98 ;
var int randomAnim;
var bool bDone;
var MacMeet_Script German_Check;

state Triggered
	{
		Begin:
				ACTION_TriggerEvent( 'CharacterSpawnerGermanyTree' );
					sleep( 0.5 );
				German_Check = MacMeet_Script( GetFirstActor( 'MacMeet_Script' ));
				Pawn_German_01 = AnimPawn( GetPawn( 'GermanMacKill1' ));
				Pawn_German_02 = AnimPawn( GetPawn( 'GermanMacKill2' ));
				Knife = GetFirstActor( 'Mesh_Knife' );
				Mesh_K98 = GetFirstActor( 'Mesh_K98' );
					sleep( 0.5 );

				ACTION_SetAnimSetDirect( Pawn_German_02 , "a_cin_d0_Screaming_Eagles.a_cin_d0_Screaming_Eagles" );
				ACTION_SetAnimSetDirect( Pawn_German_02 , "a_hold_rifle.a_hold_rifle" );
					sleep( 1.0 );
	
				Pawn_German_02.AttachToBone( Mesh_K98 , 'Bip01 Spine2' );
				Mesh_K98.SetRelativeRotation( rot(0.0, 0.0, 0.0) );
				Mesh_K98.SetRelativeLocation( vect(-23.5, 8.0, -19.5) );
					sleep( 1.0 );

				ACTION_ClearPawnIdleQueue( 'GermanMacKill2' );
				ACTION_AddAnimToPawnIdleQueue( 'GermanMacKill2', 'German_knife_chat_1' );
				ACTION_AddAnimToPawnIdleQueue( 'GermanMacKill2', 'German_knife_threaten' );
				ACTION_PlayAnimFromPawnIdleQueue( 'GermanMacKill2', False );

				Pawn_German_01.setWalking(false);

			//===== Move German to tree
				ACTION_MoveTowardTag('GermanMacKill1','GermanPistol');
				bDone = PawnIsAtDestination( GetPawn('GermanMacKill1'), GetNavigationPoint('GermanPistol'));
				While (!bDone)
					{
							sleep(0.1);
						bDone = PawnIsAtDestination( GetPawn('GermanMacKill1'), GetNavigationPoint('GermanPistol'));
					}

			//===== Hide German_02's K98 and give him the knife
				ACTION_SetHiddenDirect( Knife , False );
				ACTION_DetachWeapon( Pawn_German_02 , '' );
				Pawn_German_02.AttachToBone( Knife , 'rifle_hold' );
				Knife.SetRelativeRotation( rot(0, 16384.0, 0.0) );
				Knife.SetRelativeLocation( vect(1.0, 9.0, 3.0) ); 

				Pawn_German_01.controller.brotatetodesired = true;
				Pawn_German_01.SetMovementPhysics();
	
				Pawn_German_01.controller.focus = getFirstActor('TreeLook');

				ACTION_SetAnimSetDirect( Pawn_German_01 , "a_hold_rifle.a_hold_rifle" );
				ACTION_ClearPawnIdleQueue( 'GermanMacKill1' );
				ACTION_AddAnimToPawnIdleQueue( 'GermanMacKill1', 'standing_idle_relaxed_1' );
				ACTION_AddAnimToPawnIdleQueue( 'GermanMacKill1', 'standing_idle_relaxed_2' );
				ACTION_PlayAnimFromPawnIdleQueue( 'GermanMacKill1', False );
	
			GotoState('GermanTalk');
		ScriptEnd:
	}

State GermanTalk
	{
				function OnTrigger()
					{
						GotoState('GermanTalking');		
					}
		Begin:
	}

State GermanTalking
	{
		Begin:
					//===== German 01 is DemiGod until he is done with his line
						ACTION_DisplaySubtitleMessage2( S_Localize( "GERMAN_1" ), 5.0, 1, 1, 1, TRUE, TRUE );
						sleep( ACTION_PlayLipSyncSound('GermanMacKill2',"D00130.GERMAN1_A", 1.0, 1.0, 1024.0, True ) + 0.5 );	// ( 2.77 )
							//	German Soldier: Ich glaube, um den brauchen wir uns keine Sorgen mehr zu machen.

					//===== German 02 is DemiGod until he is done with his line
						ACTION_DisplaySubtitleMessage2( S_Localize( "GERMAN_2" ), 5.0, 1, 1, 1, TRUE, TRUE );
						sleep( ACTION_PlayLipSyncSound('GermanMacKill1',"D00130.GERMAN2_A", 1.0, 1.0, 1024.0, True ) + 0.1 );	// ( 1.04 )
							//	German Soldier: Ob da noch mehr von ihnen sind?

			//===== Wait for other script to trigger German into mind state
	//			ACTION_WaitForEvent( 'Trigger_German_Mind' );
				While( !German_Check.bGerman_Mind )
					{
						sleep( 0.5 );
					}

				if( Pawn_German_02.Health > 0 )
					{
							sleep( 0.5 );
						ACTION_ClearPawnIdleQueue( 'GermanMacKill1' );
						Pawn_German_02.controller.focus = None;
						ACTION_DetachWeapon( Pawn_German_02, '' );
						ACTION_AttachStaticMesh( Pawn_German_02, StaticMesh's_npc_weapon_de.de_npc_weapons_temp.de_bayonet' , 'rifle_hold' );

						if( Pawn_German_02.Health > 0 )
							{
								ACTION_ClearPawnIdleQueue( 'GermanMacKill2' );
							}

						ACTION_DetachStaticMesh( Pawn_German_02, StaticMesh's_npc_weapon_de.de_npc_weapons_temp.de_bayonet' , 'rifle_hold' );
						ACTION_PlayAnimDirect( Pawn_German_02, 'standing_draw', 0.2, 1.0 );
						ACTION_UnsetAnimSetDirect( Pawn_German_02, "a_cin_d0_Screaming_Eagles.a_cin_d0_Screaming_Eagles" );
							sleep(0.9);
						Knife.bHidden = True;
						Mesh_K98.SetRelativeLocation( vect(0.0, 0.0, 0.0) );
						Pawn_German_02.AttachToBone( Mesh_K98, 'rifle_hold_lefthand' );

						if( Pawn_German_02.health > 0 )
							ACTION_WaitForAnimEnd( Pawn_German_02, 0 );

						ACTION_ReAttachWeapon( Pawn_German_02, 'rifle_hold' );	
						Mesh_K98.bHidden = True;
						ACTION_SetHiddenDirect( Mesh_K98 , TRUE );
						ACTION_DestroyActor( Mesh_K98.Tag );
						ACTION_PlayAnimDirect(Pawn_German_02, 'standing_idle_relaxed_1' , 0.1 , 1.5 , True);

						ACTION_ReattachWeapon( Pawn_German_02, '' );

						if( Pawn_German_02.Health > 0 )
							{
								ACTION_ChangeController( 'GermanMacKill2', class'Mind' );
								ACTION_OrderTarget( 'GermanSquad14' , 'USAFireTeam' );
							}

			//			Pawn_German_02.Controller.bDemiGod = FALSE;

						ACTION_DestroyActor( Knife.Tag );	
					}	
		//===== Destroy and hide K98 in case it wasn't destroyed before
			ACTION_SetHiddenDirect( Mesh_K98 , TRUE );
			Mesh_K98.bHidden = True;
			ACTION_DestroyActor( Mesh_K98.Tag );
	}

