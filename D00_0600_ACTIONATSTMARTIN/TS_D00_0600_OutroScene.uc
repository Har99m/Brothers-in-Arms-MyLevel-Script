//=============================================================================
// TS_D00_0600_OutroScene.
//=============================================================================
class TS_D00_0600_OutroScene extends TriggeredScript
	placeable;

var int i;
var AnimPawn AP_Baker, AP_Leggett, AP_Hartsock, AP_Mac;
var ActorLite Dest_01, Dest_02, Dest_03;

state triggered
	{
		Begin:

				ACTION_DestroyActor( 'DestroyForOutro' );
				GetFirstActor( 'SM_Outro_Tree_01' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Outro_Tree_02' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Outro_Tree_03' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Outro_Tree_04' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Outro_Tree_05' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Outro_Tree_06' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Outro_Tree_07' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Outro_House' ).bHidden = FALSE ;

				GetFirstActor( 'SM_SkyDome' ).Skins[0] = GbxShaderMaterial't_sky.overcast_afternoon.overcast_afternoon_a_side_gs' ;

			//====== Spawn Baker , Leggett , Hartsock , Mac
				ACTION_Triggerevent( 'CSU_OutroCharacters' );

					sleep( 0.3 );

			//====== Define Characters
				AP_Baker = AnimPawn( GetPawn( 'AP_Baker_Outro' ));
				AP_Leggett = AnimPawn( GetPawn( 'AP_Leggett_Outro' ));
				AP_Hartsock = AnimPawn( GetPawn( 'AP_Hartsock_Outro' ));
				AP_Mac = AnimPawn( GetPawn( 'AP_Mac_Outro' ));

				ACTION_SetLookAtTargetDirect( AP_Leggett, AP_Hartsock, False );
				ACTION_SetAnimSetDirect( AP_Leggett , "a_cin_d00_Action_at_StMartin.a_cin_d0_Action_at_StMartin" );

				Dest_01 = GetNavigationPoint( 'PN_Outro_Hartsock' );

					sleep( 0.4 );

			//===== Give Leggett animations so he stands still
				ACTION_ClearPawnIdleQueue( 'AP_Leggett_Outro' );
				ACTION_AddAnimToPawnIdleQueue( 'AP_Leggett_Outro' , 'standing_idle_relaxed_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'AP_Leggett_Outro' , FALSE );

			//===== Hartsock starts moving
				AP_Hartsock.MaxDesiredSpeed = 0.8;
				ACTION_MoveToward( AP_Hartsock , Dest_01 , FALSE );

			//===== Trigger outro sequence #1
				ACTION_TriggerEvent( 'Scene_Outro_Shot_01' );

			//===== Destroy previous characters
				ACTION_DestroyActor( 'Midtro_Campbell' );
				ACTION_DestroyActor( 'Midtro_Doyle' );
				ACTION_DestroyActor( 'Midtro_Paige' );
				ACTION_DestroyActor( 'Midtro_McConnel' );

			//===== Fade in
				ACTION_FadeOverlay( GetLocalPlayerController(), 2 , 2.0 );
				ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
		//========== INITIATE

				i = 1.0;

				ResetAbsoluteTime();
				StartAbsoluteTime();

				WaitForAbsoluteTime( i+=1.0 );


		//========== START DIALOGUE
				ACTION_PlayLocalSound( "D00_0600.MARSHALL_C" );
				ACTION_DisplaySubTitleMessage2( S_Localize( "MARSHALL_C" ) , 5.5 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 5.51 /-----MARSHALL_C="Marshall: So you didn't tell Sgt. Baker any of this when you linked up with him?   Why not?"
					WaitForAbsoluteTime( i += 7.0 );

				ACTION_PlayLocalSound( "D00_0600.HARTSOCK_C" );
				ACTION_DisplaySubTitleMessage2( S_Localize( "HARTSOCK_C" ) , 2.25 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.19 /-----HARTSOCK_C="Hartsock: I told him I'd had a rough morning."
					WaitForAbsoluteTime( i += 2.85 );

				ACTION_PlayLocalSound( "D00_0600.MARSHALL_D" );
				ACTION_DisplaySubTitleMessage2( S_Localize( "MARSHALL_D" ) , 2.5 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 2.21 /-----MARSHALL_D="Marshall: Why didn't you report this all to him?"
					WaitForAbsoluteTime( i += 3.95 );

				ACTION_PlayLocalSound( "D00_0600.HARTSOCK_D" );
				ACTION_DisplaySubTitleMessage2( S_Localize( "HARTSOCK_D" ) , 11.0 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 10.90 /-----HARTSOCK_D="Hartsock: He-   He had this look on his face when I caught up with them. Like anything I said would topple him.    It wasn't the Baker any of us remembered."
					WaitForAbsoluteTime( i += 10.0 );

			//===== Trigger outro sequence #2
				ACTION_TriggerEvent( 'Scene_Outro_Shot_02' );

				ACTION_SetLookAtTargetDirect( AP_Leggett, AP_Hartsock, False );
				ACTION_SetLookAtTargetDirect( AP_Baker, AP_Hartsock, False );

					WaitForAbsoluteTime( i += 7.0 );

				ACTION_PlayAnimWithQueueDirect( AP_Leggett , 'Leggett_says_unless_they_find_us' , 0.1 , 1.0 , , );
				ACTION_PlayLipSyncSoundDirect( AP_Leggett, "D00_0600.LEGGETT_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "LEGGETT_A" ) , 4.5 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 4.45 /-----LEGGETT_A="Leggett: Unless of course they... find us?     Is that Red?"

			//===== Trigger outro sequence #3
				ACTION_TriggerEvent( 'Scene_Outro_Shot_03' );

					WaitForAbsoluteTime( i += 5.5 );

			//===== End map
				ACTION_TriggerEvent( 'TriggeredScriptMapComplete' );

		ScriptEnd:
}
