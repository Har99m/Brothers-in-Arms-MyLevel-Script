//=============================================================================
// TS_OutroScene.
//=============================================================================
class TS_OutroScene extends TriggeredScript
	placeable;

var int OutroAmbient;


state triggered
{
begin:
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), true);

	//Turn mac to face the player
	GetPawn('End_Mac').Controller.Focus = GetLocalPlayerPawn(); 
	GetPawn('End_Mac').bRotateToDesired = TRUE; 
	sleep( 0.1 ); 
	ACTION_WaitForPawnRotateToward( GetPawn('End_Mac') );

//	"Mac: Baker, glad you're ok."
	ACTION_PlayLipSyncSound( 'End_Mac', "D00600.MAC_ZZA", 255.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize( "MAC_LINE_H", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE);
	sleep(3.0);

	ACTION_OrderMove( 'Outro_4IDUnitB' , 'PN_4ID_EndPointB' );

//	"Mac: We have to secure the area around the wall down there."
	ACTION_PlayLipSyncSound( 'End_Mac', "D00600.MAC_ZZB", 255.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize( "MAC_LINE_I", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE);
	sleep(3.0);

//	"Mac: We have to secure the area around the wall down there."
	ACTION_PlayLipSyncSound( 'End_Mac', "D00600.MAC_ZZC", 255.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize( "MAC_LINE_J", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE);
	sleep(4.5);

//	"Mac: We have to secure the area around the wall down there."
	ACTION_PlayLipSyncSound( 'End_Mac', "D00600.MAC_ZZD", 255.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize( "MAC_LINE_K", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE);
	sleep(4.5);

//	"Mac: We have to secure the area around the wall down there."
	ACTION_PlayLipSyncSound( 'End_Mac', "D00600.MAC_ZZE", 255.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize( "MAC_LINE_L", "D0_0700_EXIT4" ), 4.0 , 1 , 1 , 1, , TRUE);
	sleep(3.0);

//	Fade Out
	ACTION_FadeOverlay( GetLocalPlayerController(), 1, 2.0 );
	sleep(2.0);	

	ACTION_WideScreenOverlay( GetLocalPlayerController(), 4 );
	ACTION_TriggerEvent( 'Outro_ShotOne' );
	GetLocalPlayerPawn().bHidden = TRUE;

	ACTION_DestroyActor( 'Allen' );
	ACTION_DestroyActor( 'Garnett' );
	ACTION_DestroyActor( 'Hartsock' );
	ACTION_DestroyActor( 'End_Mac' );
	ACTION_DestroyActor( 'End_Leggett' );

	ACTION_TriggerEvent( 'HideBeachTestScript' );

	ACTION_TriggerEvent( 'Outro_MacSpawn' );
	ACTION_TriggerEvent( 'Outro_LeggettSpawn' );
	ACTION_TriggerEvent( 'Outro_BakerSpawn' );
	ACTION_TriggerEvent( 'Outro_AllenSpawn' );

	ACTION_SetAnimSet( 'Outro_Allen', "a_cin_d0_exit4.a_cin_d0_exit4" );
	ACTION_SetAnimSet( 'Outro_Baker', "a_cin_d0_exit4.a_cin_d0_exit4" );
	ACTION_SetAnimSet( 'Outro_Leggett', "a_cin_d0_exit4.a_cin_d0_exit4" );
//	ACTION_SetAnimSet( 'Outro_Mac', "a_hold_misc.unarmed"  );

	ACTION_SetAnimSet( 'Outro_Allen', "a_ev_baker.a_ev_baker" );
	ACTION_SetAnimSet( 'Outro_Baker', "a_ev_baker.a_ev_baker" );
	ACTION_SetAnimSet( 'Outro_Leggett', "a_ev_leggett.a_ev_leggett" );
	ACTION_SetAnimSet( 'Outro_Mac', "a_ev_baker.a_ev_baker"  );

	sleep(0.1);

	ACTION_FlushAnimQueue( 'Outro_Allen' );
	ACTION_FlushAnimQueue( 'Outro_Baker' );
	ACTION_FlushAnimQueue( 'Outro_Leggett' );
	ACTION_FlushAnimQueue( 'Outro_Mac' );

	ACTION_PlayAnim( 'Outro_Allen',	'sitting_on_crate_idle_3', 0.1, 0.8, true);
	ACTION_PlayAnim( 'Outro_Baker',	'Baker_looking_at_beach_idle', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Leggett', 'Leggett_looking_at_beach_idle', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Mac', 'standing_idle_relaxed_3', 0.1, 1.0, true);

//	ACTION_SetAnimSet( 'Outro_DudesGroup01', "k_prop.exit4_beach" );
//	ACTION_SetAnimSet( 'Outro_DudesGroup02', "k_prop.exit4_beach" );
//	ACTION_SetAnimSet( 'Outro_DudesGroup03', "k_prop.exit4_beach" );
//	ACTION_SetAnimSet( 'Outro_DudesGroup04', "k_prop.exit4_beach" );

//	Fade In
	PlayMusic("D00600_SOUNDS.AMB_BEACH", 0.0);
//	OutroAmbient = GetLocalPlayerPawn().PlayOwnedSound(sound'D00600_SOUNDS.AMB_BEACH');

	ACTION_PawnSetHeadTurnMult( 'Outro_Leggett', 0.02 );
	ACTION_PawnSetHeadTurnMult( 'Outro_Mac', 0.02 );
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 2.0 );
	ACTION_SetLookAtTarget( 'Outro_Leggett', GetFirstActor('LT_Leggett01'), TRUE );
	sleep(2.0);
	ACTION_SetLookAtTarget( 'Outro_Leggett', GetFirstActor('LT_Leggett02'), TRUE );
	sleep(3.0);
	ACTION_SetLookAtTarget( 'Outro_Leggett', GetFirstActor('LT_Leggett03'), TRUE );
	sleep(1.0);

	ACTION_PlayAnim( 'Outro_Boat01', 'lcvp_high_idle_beach', 0.1, 0.75, true);
	ACTION_PlayAnim( 'Outro_Boat02', 'lcvp_high_idle_beach', 0.1, 0.75, true);
	ACTION_PlayAnim( 'Outro_Boat03', 'lcvp_high_idle_beach', 0.1, 0.75, true);

	ACTION_PlayAnim( 'Outro_Blimp01', 'wind_1', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp02', 'wind_3', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp03', 'wind_2', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp04', 'wind_1', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp05', 'wind_2', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp06', 'wind_4', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp07', 'wind_1', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp08', 'wind_2', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp09', 'wind_1', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp10', 'wind_1', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp11', 'wind_3', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp12', 'wind_1', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp13', 'wind_2', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp14', 'wind_2', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp15', 'wind_1', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp16', 'wind_4', 0.1, 1.0, true);
	ACTION_PlayAnim( 'Outro_Blimp17', 'wind_2', 0.1, 1.0, true);

	ACTION_PlayAnim( 'Outro_IdleDudes_01', 'beach_idles_anim_1', 0.1, 1.0, true, 17.0);
	ACTION_PlayAnim( 'Outro_IdleDudes_02', 'beach_idles_anim_2', 0.1, 1.0, true, 13.0);
	ACTION_PlayAnim( 'Outro_IdleDudes_03', 'beach_idles_anim_1', 0.1, 1.0, true, 12.0);
	ACTION_PlayAnim( 'Outro_IdleDudes_04', 'beach_idles_anim_2', 0.1, 1.0, true, 7.0);
	ACTION_PlayAnim( 'Outro_IdleDudes_05', 'beach_idles_anim_1', 0.1, 1.0, true, 2.0);
	ACTION_PlayAnim( 'Outro_IdleDudes_06', 'beach_idles_anim_2', 0.1, 1.0, true, 0.0);
	ACTION_PlayAnim( 'Outro_IdleDudes_07', 'beach_idles_anim_2', 0.1, 1.0, true, 0.0);

	ACTION_PlayAnim( 'Outro_DudesGroup01', 'beach_marching_1', 0.1, 1.0, true, 17.0);
	ACTION_PlayAnim( 'Outro_DudesGroup02', 'beach_marching_1', 0.1, 1.0, true, 12.0);
	ACTION_PlayAnim( 'Outro_DudesGroup03', 'beach_marching_1', 0.1, 1.0, true, 7.0);
	ACTION_PlayAnim( 'Outro_DudesGroup04', 'beach_marching_1', 0.1, 1.0, true, 1.0);
	ACTION_PlayAnim( 'Outro_DudesGroup05', 'beach_slogging_1', 0.1, 0.5, true);
	ACTION_PlayAnim( 'Outro_DudesGroup06', 'beach_slogging_1', 0.1, 0.5, true, 12.0);

//	"Leggett: I understand the large hearts of heroes, the courage of present times..."
	ACTION_PlayLipSyncSound( 'Outro_Leggett', "D00600.LEGGETT_C", 255.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize( "LEGGETT_LINE_C", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE);
	sleep(2.5);
	ACTION_SetLookAtTarget( 'Outro_Mac', GetPawn('Outro_Leggett'), TRUE );
	sleep(3.0);


	ACTION_TriggerEvent( 'Outro_DudesGroup01_Scene' );
	ACTION_TriggerEvent( 'Outro_DudesGroup02_Scene' );
	ACTION_TriggerEvent( 'Outro_DudesGroup03_Scene' );
	ACTION_TriggerEvent( 'Outro_DudesGroup04_Scene' );

	ACTION_TriggerEvent( 'Outro_Truck01_Scene' );
	ACTION_TriggerEvent( 'Outro_Tank01_Scene' );

	ACTION_TriggerEvent( 'Outro_ShotTwo' );

//	"Leggett: It's from a poem my dad used to read to me as a kid."
	ACTION_PlayLipSyncSound( 'Outro_Leggett', "D00600.LEGGETT_D", 255.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize( "LEGGETT_LINE_D", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE);


	sleep(4.0);
	ACTION_ClearLookAtTarget( 'Outro_Mac' );
	sleep(2.0);
	ACTION_TriggerEvent( 'Outro_ShotThree' );
	sleep(1.0);

//	"Leggett: It amazes me that something so beautiful could be a part of something so ugly."
	ACTION_PlayLipSyncSound( 'Outro_Leggett', "D00600.LEGGETT_E", 255.0, 1.0, 1.0 );
	ACTION_DisplaySubTitleMessage2(S_Localize( "LEGGETT_LINE_E", "D0_0700_EXIT4" ), 6.0 , 1 , 1 , 1, , TRUE);
	sleep(3.0);

	ACTION_StopScene( 'Outro_DudesGroup01_Scene', 'null' );
	ACTION_StopScene( 'Outro_DudesGroup02_Scene', 'null' );
	ACTION_StopScene( 'Outro_DudesGroup03_Scene', 'null' );
	ACTION_StopScene( 'Outro_DudesGroup04_Scene', 'null' );

	ACTION_TriggerEvent( 'Outro_DudesGroup01_Scene2' );
	ACTION_TriggerEvent( 'Outro_DudesGroup02_Scene2' );
	ACTION_TriggerEvent( 'Outro_DudesGroup03_Scene2' );
	ACTION_TriggerEvent( 'Outro_DudesGroup04_Scene2' );

	sleep(2.5);

	ACTION_TriggerEvent( 'Outro_DudesGroup05_Scene' );
	ACTION_TriggerEvent( 'Outro_DudesGroup06_Scene' );

	sleep(4.0);
	ACTION_TriggerEvent( 'Outro_Boat04_Scene' );
	ACTION_TriggerEvent( 'boat_wake' );

	sleep(6.0);

	ACTION_SaveMemoryReport( "Exit4_End" );


//	sleep(10.0);
	ACTION_DisplayMapStats();
}
