//=============================================================================
// GarnettEndScript.
//=============================================================================
class GarnettEndScript extends TriggeredScript
	placeable;

var Pawn GarnettEnd;
var WargamePawn AllenEnd;
var Pawn LocalPlayer;
var Pawn Hartsock;

state Triggered
{
Begin:

		ACTION_DisableBattleDialogue();
		ACTION_SetRepelBullets( 'AllenEnd', true );
		ACTION_SetRepelBullets( 'GarnettEnd', true );

		GarnettEnd = GetPawn( 'GarnettEnd' );
		AllenEnd = WargamePawn( GetPawn( 'AllenEnd' ));
		ACTION_DetachWeapon( GarnettEnd, '' );
		ACTION_StripAllWeapons( GarnettEnd );

		ACTION_ChangeController('AllenEnd',class'Mind');
		ACTION_StripAllWeapons( AllenEnd );
		//ACTION_GivePlayerWeapon(AllenEnd, "gbxInventory.WeapUSBazooka" );
		ACTION_ReattachWeapon( AllenEnd, '');
		ACTION_ChangeController('AllenEnd',class'ScriptedController');
		ACTION_AttachStaticMesh( AllenEnd, StaticMesh's_npc_weapon_us.us_bazooka', 'bazooka_special' );
		GetFirstActor( 'BazookaActor' ).bHidden = true;
		GetFirstActor( 'BazookaProjectile' ).bHidden = true;

		ACTION_SetRepelBullets( 'AllenEnd', true );
		ACTION_SetRepelBullets( 'GarnettEnd', true );
		GarnettEnd.controller.bGodMode = true;
		AllenEnd.controller.bGodMode = true;

		//ACTION_FlushAnimQueue( 'GarnettEnd' ); 
		//ACTION_FlushAnimQueue( 'AllenEnd' );

		ACTION_SetAnimSet( 'AllenEnd', "a_cin_d0_xyz.a_cin_d0_xyz" );
		ACTION_SetAnimSet( 'GarnettEnd', "a_cin_d0_xyz.a_cin_d0_xyz" );

		ACTION_PlayAnim( 'AllenEnd', 'Allen_bazooka_nervous', 0, 1.0,true,,,);
		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_fidget', 1.0, 1.0,true,,,1);

		GarnettEnd.m_fDispositionAnimPlaying = true;
		//AllenEnd.m_fDispositionAnimPlaying = true;

		ACTION_DisableAnimQueue( 'GarnettEnd', TRUE );
		ACTION_DisableAnimQueue( 'AllenEnd', TRUE );


}
state Outro
{
Begin:

ResetAbsoluteTime();
StartAbsoluteTime();

WaitForAbsoluteTime( 0.0 );
		//ACTION_FlushAnimQueue( 'GarnettEnd' );
		//ACTION_FlushAnimQueue( 'AllenEnd' );

		ACTION_BlockNavPoints( 'HartsockAwayPath' );
		ACTION_BlockNavPoints( 'HartsockAwayPathA' );
		ACTION_BlockNavPoints( 'OutroChar_Path02' );
		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_loads', 0.2, 1.0,,1,,1);

WaitForAbsoluteTime( 0.3 );
		ACTION_AttachStaticMesh( GarnettEnd , StaticMesh's_npc_weapon_us.us_rocket_projectile', 'bazooka_rocket' );

WaitForAbsoluteTime( 0.8 );
		//ACTION_PlayAnim( 'AllenEnd', 'Allen_bazooka_loaded', 0, 1.0,,,,);

WaitForAbsoluteTime( 1.3 );
		ACTION_DetachStaticMesh( GarnettEnd , StaticMesh's_npc_weapon_us.us_rocket_projectile', 'bazooka_rocket' );

WaitForAbsoluteTime( 1.91 );
		//ACTION_PlayAnim( 'AllenEnd', 'Allen_bazooka_nervous', 0, 1.0,true,,,);

WaitForAbsoluteTime( 2.16 );

		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_trying', 0.5, 1.0,true,,,1);
WaitForAbsoluteTime( 4.0 );
		GarnettEnd.bNoTurnBody = true;
		//AllenEnd.bNoTurnBody = true;
		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_dismounts', 0, 1.0,,,,);

		ACTION_DisplaySubTitleMessage2(S_Localize("GARNETT_B", "D0_1015_XYZ" ),6 , 1 , 1 , 1 , , TRUE );
		ACTION_PlayLipSyncSound( 'GarnettEnd', "D01015.GARNETT_B", 1.0, 1.0, 80.0 );

WaitForAbsoluteTime( 5.00 );
//WaitForAbsoluteTime( 5.66 );
		ACTION_WaitForAnimEnd( GarnettEnd, 0 );
		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_dismount_idle', 0, 1.0,true,,,1);
		ACTION_DisplaySubTitleMessage2(S_Localize("GARNETT_C", "D0_1015_XYZ" ), 2.0, 1 , 1 , 1 , , TRUE );
		ACTION_PlayLipSyncSound( 'GarnettEnd', "D01015.GARNETT_C", 1.0, 1.0, 80.0 );

WaitForAbsoluteTime( 6.0 );
		ACTION_PlayAnim( 'AllenEnd', 'Allen_bazooka_stands', 0, 1.0,,,,);

WaitForAbsoluteTime( 6.88 );
		ACTION_PlayAnim( 'AllenEnd', 'Allen_fires_bazooka', 0, 1.0,,,,1);

WaitForAbsoluteTime( 7.25 );
		ACTION_TriggerEvent( 'BazookaSequenceA' );
		ACTION_TriggerEvent( 'RocketSmokeA' );
		GetFirstActor( 'BazookaProjectile' ).bHidden = false;
		ACTION_PlaySound( 'BazookaProjectile', "W_USBAZOOKA.FIRE_ST_B", 2.0, 1.0, 80.0 );
		ACTION_TriggerEvent( 'BackblastA' );
		ACTION_TriggerEvent( 'BazookaEmitterA' );
		ACTION_TriggerEvent( 'BazookaEmitterB' );

WaitForAbsoluteTime( 8.38 );
		ACTION_TriggerEvent( 'EndCombatScript' );
		ACTION_PlayAnim( 'AllenEnd', 'Allen_bazooka_reacts_to_miss', 0.2, 1.0,,,,1);
		ACTION_TriggerEvent( 'BarnMesh' );
		ACTION_TriggerEvent( 'Explosion01' );
		GetFirstActor( 'BazookaProjectile' ).bHidden = true;
		GetFirstActor( 'BackBlastA' ).bHidden = true;
		GetFirstActor( 'BackblastA' ).bHidden = true;
		GetFirstActor( 'BazookaEmitterA' ).bHidden = true;
		GetFirstActor( 'BazookaEmitterB' ).bHidden = true;

WaitForAbsoluteTime( 11.50 );
		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_remounts', 0, 1,,,,);	

WaitForAbsoluteTime( 12.00 );
		ACTION_DisplaySubTitleMessage2(S_Localize("ALLEN_F", "D0_1015_XYZ" ), 6.0, 1 , 1 , 1 , , TRUE );
		ACTION_PlayLipSyncSound( 'AllenEnd', "D01015.ALLEN_F", 1.0, 1.0, 80.0 );

//WaitForAbsoluteTime( 13.50 );
//		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_loads', 0.2, 1.0,true,,,1);

WaitForAbsoluteTime( 13.50 );
		ACTION_AttachStaticMesh( GarnettEnd , StaticMesh's_npc_weapon_us.us_rocket_projectile', 'bazooka_rocket' );

WaitForAbsoluteTime( 13.71 );
		ACTION_PlayAnim( 'AllenEnd', 'Allen_bazooka_load_another', 0.2, 1.0,,,,1);
		ACTION_DisplaySubTitleMessage2(S_Localize("GARNETT_D", "D0_1015_XYZ" ), 6.0, 1 , 1 , 1 , , TRUE );
		ACTION_PlayLipSyncSound( 'GarnettEnd', "D01015.GARNETT_D", 1.0, 1.0, 80.0 );

//WaitForAbsoluteTime( 13.80 );
//		ACTION_AttachStaticMesh( GarnettEnd , StaticMesh's_npc_weapon_us.us_rocket_projectile', 'bazooka_rocket' );

WaitForAbsoluteTime( 13.80 );
		ACTION_DetachStaticMesh( GarnettEnd , StaticMesh's_npc_weapon_us.us_rocket_projectile', 'bazooka_rocket' );

WaitForAbsoluteTime( 14.00 );
//WaitForAbsoluteTime( 14.94 );
		ACTION_WaitForAnimEnd( GarnettEnd, 0 );
		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_trying', 0, 1.0,true,,,1);

//WaitForAbsoluteTime( 15.66 );
//		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_trying', 0.5, 1.0,true,,,1);

WaitForAbsoluteTime( 17.25 );
		ACTION_DisplaySubTitleMessage2(S_Localize("ALLEN_H", "D0_1015_XYZ" ), 6.0, 1 , 1 , 1 , , TRUE );
		ACTION_PlayLipSyncSound( 'AllenEnd', "D01015.ALLEN_H", 1.0, 1.0, 80.0 );

WaitForAbsoluteTime( 17.37 );
		ACTION_PlayAnim( 'AllenEnd', 'Allen_bazooka_nervous', 0.2, 1.0,true,,,);

WaitForAbsoluteTime( 18.00 );
		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_hang_on', 0, 1.0,,,,1);

WaitForAbsoluteTime( 18.50 );
		ACTION_DisplaySubTitleMessage2(S_Localize("GARNETT_E", "D0_1015_XYZ" ), 6.0, 1 , 1 , 1 , , TRUE );
		ACTION_PlayLipSyncSound( 'GarnettEnd', "D01015.GARNETT_E", 1.0, 1.0, 80.0 );

WaitForAbsoluteTime( 19.9 );
		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_fidget', 1.0, 1.0,true,,,1);
		ACTION_PlayAnim( 'AllenEnd', 'Allen_i_swear_to_god', 0, 1.0,,,,);

		ACTION_DisplaySubTitleMessage2(S_Localize("ALLEN_I", "D0_1015_XYZ" ), 6.0, 1 , 1 , 1 , , TRUE );
		ACTION_PlayLipSyncSound( 'AllenEnd', "D01015.ALLEN_I", 1.0, 1.0, 80.0 );

WaitForAbsoluteTime( 24.23 );
		ACTION_PlayAnim( 'AllenEnd', 'Allen_bazooka_nervous', 0.2, 1.0,true,,,);

WaitForAbsoluteTime( 25.00 );
		ACTION_DisplaySubTitleMessage2(S_Localize("GARNETT_F", "D0_1015_XYZ" ), 6.0, 1 , 1 , 1 , , TRUE );
		ACTION_PlayLipSyncSound( 'GarnettEnd', "D01015.GARNETT_F", 1.0, 1.0, 80.0 );
		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_dismounts', 0.2, 1.0,,,,1);

WaitForAbsoluteTime( 26.50 );
		ACTION_DisplaySubTitleMessage2(S_Localize("GARNETT_G", "D0_1015_XYZ" ), 6.0, 1 , 1 , 1 , , TRUE );
		ACTION_PlayLipSyncSound( 'GarnettEnd', "D01015.GARNETT_G", 1.0, 1.0, 80.0 );

WaitForAbsoluteTime( 26.66 );
		ACTION_PlayAnim( 'GarnettEnd', 'Garnett_pick_up_gun', 0, 1.0,,,,1 );
		//ACTION_PlayAnim( 'GarnettEnd', 'Garnett_bazooka_dismount_idle', 0, 1.0,true,,,1);

WaitForAbsoluteTime( 27.30 );
		ACTION_StripAllWeapons( GarnettEnd );
		ACTION_GivePlayerWeapon(GarnettEnd, "gbxInventory.WeapUSM1_" );
		ACTION_ReattachWeapon( GarnettEnd, '' );
		GetFirstActor( 'GarnettM1' ).bHidden = true;

WaitForAbsoluteTime( 27.50 );
		ACTION_DisplaySubTitleMessage2(S_Localize("GARNETT_H", "D0_1015_XYZ" ), 3.0, 1 , 1 , 1 , , TRUE );
		ACTION_PlayLipSyncSound( 'GarnettEnd', "D01015.GARNETT_H", 1.0, 1.0, 80.0 );

WaitForAbsoluteTime( 27.99 );
		ACTION_UnBlockNavPoints( 'HartsockAwayPathA' );
		GarnettEnd.m_fDispositionAnimPlaying = FALSE;
		GarnettEnd.bNoTurnBody = FALSE;
		ACTION_PlayAnim( 'Garnett', 'standing_idle_relaxed_1', 0.2, 1.0, TRUE,,,1 );
		WargamePawn( GetPawn('GarnettEnd')).eWeaponAimedState = WAS_COMBATRELAXED;
		ACTION_ChangeController('GarnettEnd',class'Mind');
		ACTION_AssignToUnit( 'GarnettEnd', 'AllenGarnettEnd' );
		//ACTION_OrderMove( 'AllengarnettEnd', 'C3_Garnett_Position' );
		GarnettEnd.controller.bGodMode = true;
		ACTION_TriggerEvent( 'BlockFromBazooka' );

WaitForAbsoluteTime( 28.50 );
		ACTION_PlayAnim( 'AllenEnd', 'Allen_bazooka_stands', 0.2, 1.0,,,,2);

WaitForAbsoluteTime( 29.33 );
		ACTION_PlayAnim( 'AllenEnd', 'Allen_fires_bazooka', 0.5, 1.0,,,,1);
		ACTION_TriggerEvent( 'BazookaSequenceB' );
		ACTION_TriggerEvent( 'RocketSmokeB' );
		ACTION_TriggerEvent( 'BackblastB' );
		ACTION_TriggerEvent( 'BazookaEmitterC' );
		ACTION_TriggerEvent( 'BazookaEmitterD' );
		GetFirstActor( 'BazookaProjectile' ).bHidden = false;
		ACTION_PlaySound( 'BazookaProjectile', "W_USBAZOOKA.FIRE_ST_B", 2.0, 1.0, 80.0 );

WaitForAbsoluteTime( 30.78 );
		ACTION_PlayAnim( 'AllenEnd', 'Allen_drops_bazooka', 0.5, 1.0,,,,1);

WaitForAbsoluteTime( 31.00 );
		ACTION_TriggerEvent( 'HouseMesh' );
		ACTION_TriggerEvent( 'Explosion02' );
		GetFirstActor( 'BazookaProjectile' ).bHidden = true;
		GetFirstActor( 'BackBlastA' ).bHidden = true;
		GetFirstActor( 'BackblastA' ).bHidden = true;
		GetFirstActor( 'BazookaEmitterA' ).bHidden = true;
		GetFirstActor( 'BazookaEmitterB' ).bHidden = true;

WaitForAbsoluteTime( 31.70 );
		ACTION_DetachStaticMesh( AllenEnd, StaticMesh's_npc_weapon_us.us_bazooka', 'bazooka_special' );
		ACTION_TriggerEvent( 'BazookaToss' );
		GetFirstActor( 'BazookaActor' ).bHidden = false;

WaitForAbsoluteTime( 32.50 );
		ACTION_AttachStaticMesh( AllenEnd, StaticMesh's_npc_weapon_us.us_thompson', 'rifle_hold' );
		GetFirstActor( 'EndThompson' ).bHidden = true;

WaitForAbsoluteTime( 33.58 );
		ACTION_DetachStaticMesh( AllenEnd, StaticMesh's_npc_weapon_us.us_thompson', 'rifle_hold' );
		ACTION_GivePlayerWeapon(AllenEnd, "gbxInventory.WeapUSThompson" );
		ACTION_ReattachWeapon( AllenEnd, '');

		ACTION_UnBlockNavPoints( 'HartsockAwayPath' );
		ACTION_UnBlockNavPoints( 'OutroChar_Path02' );

		WargamePawn( GetPawn('AllenEnd')).eWeaponAimedState = WAS_COMBATRELAXED;
		ACTION_ChangeController('AllenEnd',class'Mind');
		AllenEnd.controller.bGodmode = true;
		AllenEnd.health = 10000;
		ACTION_AssignToUnit( 'AllenEnd', 'AllenGarnettEnd' );

WaitForAbsoluteTime( 34.50 );
		//ACTION_OrderMove( 'AllenGarnettEnd' ,'AllenGarnettEnd_Path01' );
			sleep(0.5);
		ACTION_TriggerEvent( 'Explosion01' );

		ACTION_SetRepelBullets( 'AllenEnd', true );
		ACTION_SetRepelBullets( 'GarnettEnd', true );

		ACTION_TriggerEvent( 'SpawnMGGunnerEnd' );
		ACTION_TriggerEvent( 'SpawnMGGunnerWindow' );

		//ACTION_DisplayObjectiveString( "Clear out the barracks.", 6 );	
		//	sleep( 2.0 );

		ACTION_EnableBattleDialogue();
			sleep( 8.0 );
			//ACTION_OrderMove( 'AllenGarnettEnd' ,'AllenGarnettEnd_Path01' );

}	


state OutroAudio
{
Begin:

		Hartsock = Getpawn('Hartsock');

		ACTION_ChangeController('Hartsock',class'ScriptedController');
		Hartsock.shouldCrouch(false);

			sleep(0.2);
		ACTION_MoveTowardTag( 'Hartsock', 'HartsockFountain',false, 'OutroPlayerPositionTarget' );

    	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
		ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
		ACTION_HideHUD( GetLocalPlayerController(), true );

		AllenEnd.controller.focus = GetLocalPlayerPawn();
		ACTION_WaitForPawnRotateToward(AllenEnd);

		GarnettEnd.controller.focus = GetLocalPlayerPawn();
		ACTION_WaitForPawnRotateToward(GarnettEnd);

		ACTION_PlayAnim( 'AllenEnd', 'Standing_idle_relaxed_3', 0.2, 1.0,true,,,2);
		ACTION_PlayAnim( 'GarnettEnd', 'Standing_idle_relaxed_2', 0.2, 1.0,true,,,2);
	
		ACTION_DisplaySubTitleMessage2(S_Localize("GARNETT_I", "D0_1015_XYZ" ), 6.0, 1 , 1 , 1 , , TRUE );
			sleep(ACTION_PlayLipSyncSound( 'GarnettEnd', "D01015.GARNETT_I", 1.0, 1.0, 80.0 ) + 0.5 );
		ACTION_DisplaySubTitleMessage2(S_Localize("ALLEN_J", "D0_1015_XYZ" ), 6.0, 1 , 1 , 1 , , TRUE );
			sleep( ACTION_PlayLipSyncSound( 'AllenEnd', "D01015.ALLEN_J", 1.0, 1.0, 80.0 ) + 0.5 );
		ACTION_DisplaySubTitleMessage2(S_Localize("ALLEN_K", "D0_1015_XYZ" ), 6.0, 1 , 1 , 1 , , TRUE );
			sleep(ACTION_PlayLipSyncSound( 'AllenEnd', "D01015.ALLEN_K", 1.0, 1.0, 80.0 ) + 0.5 );
				sleep(2.0);
		ACTION_SaveMemoryReport("XYZ_End");
		ACTION_DisplayMapStats();
}

