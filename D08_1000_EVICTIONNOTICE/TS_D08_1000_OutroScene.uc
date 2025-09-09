//=============================================================================
// TS_D08_1000_OutroScene.
//=============================================================================
class TS_D08_1000_OutroScene extends TriggeredScript
	placeable;

var float i;
var WargamePlayerController PlayerC;
var WargamePawn PlayerP;
var AnimPawn AP_Baker, AP_Corrion, AP_Zanovich, AP_Courtland, AP_McCreary;
var Actor Trigger_Outro, gbxWaypointBeacon_OutroHint;
var Actorlite PN_Baker_Outro;

state Triggered
	{
    function OnTrigger()
        {
        GotoState( 'OutroSetup' );
        }
	Begin:

	ACTION_TriggerEvent( 'CSU_OutroChar' );

	ACTION_OrderMove( 'Unit_US_Baker_Base', 'PN_OutroEnd_Baker' );
	ACTION_OrderMove( 'Unit_US_Baker_Ass', 'PN_OutroEnd_Baker2' );

	Trigger_Outro = GetFirstActor( 'Trigger_OutroAtBaker' );
	gbxWaypointBeacon_OutroHint = GetFirstActor( 'gbxWaypointBeacon_OutroHint' );
	PN_Baker_Outro = GetNavigationPoint( 'PN_OutroEnd_Baker' );

	sleep( 2.0 );

	AP_Baker = AnimPawn( GetPawn( 'BakerOutro' ));
	AP_Corrion = AnimPawn( GetPawn( 'CorrionOutro' ));
	AP_Courtland = AnimPawn( GetPawn( 'CourtlandOutro' ));
	AP_Zanovich = AnimPawn( GetPawn( 'ZanovichOutro' ));
	AP_Mccreary = AnimPawn( GetPawn( 'MccrearyOutro' ));

	AP_Baker .Controller.bGodmode = true;
	ACTION_SetRepelBullets( 'BakerOutro', true );

	AP_Corrion.Controller.bGodmode = true;
	ACTION_SetRepelBullets( 'CorrionOutro', true );

	AP_Courtland.Controller.bGodmode = true;
	ACTION_SetRepelBullets( 'CourtlandOutro', true );

	AP_Zanovich.Controller.bGodmode = true;
	ACTION_SetRepelBullets( 'ZanovichOutro', true );

	AP_Mccreary.Controller.bGodmode = true;
	ACTION_SetRepelBullets( 'MccrearyOutro', true );

}


state OutroSetup
{
    function OnTrigger()
        {
        GotoState( 'OutroDialogue' );
        }
Begin:

	AP_Baker = AnimPawn( GetPawn( 'BakerOutro' ));
	AP_Corrion = AnimPawn( GetPawn( 'CorrionOutro' ));
	AP_Courtland = AnimPawn( GetPawn( 'CourtlandOutro' ));
	AP_Zanovich = AnimPawn( GetPawn( 'ZanovichOutro' ));
	AP_Mccreary = AnimPawn( GetPawn( 'MccrearyOutro' ));

	AP_Baker.Controller.bGodmode = true;
	ACTION_SetRepelBullets( 'BakerOutro', true );

	AP_Corrion.Controller.bGodmode = true;
	ACTION_SetRepelBullets( 'CorrionOutro', true );

	AP_Courtland.Controller.bGodmode = true;
	ACTION_SetRepelBullets( 'CourtlandOutro', true );

	AP_Zanovich.Controller.bGodmode = true;
	ACTION_SetRepelBullets( 'ZanovichOutro', true );

	AP_Mccreary.Controller.bGodmode = true;
	ACTION_SetRepelBullets( 'MccrearyOutro', true );

	//GetFirstActor(gbxWaypointBeacon('gbxWaypointBeacon_MainObjective')).bEnabled = False;
	ACTION_TriggerEvent('gbxWaypointBeacon_MainObjective');//OFF

	//GetFirstActor(gbxWaypointBeacon('gbxWaypointBeacon_OutroHint')).bEnabled = True;
	ACTION_TriggerEvent('gbxWaypointBeacon_OutroHint');//ON
	ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );

	ACTION_DisplayObjectiveHint(S_Localize("HINT_A"), 2.0 );

	ACTION_DisableBattleDialogueForCharacter( 'Corrion' );
	ACTION_DisableBattleDialogueForCharacter( 'Baker' );
	ACTION_DisableBattleDialogueForCharacter( 'Zanovich' );

	AP_Corrion.ShouldCrouch( false );
	AP_Baker.ShouldCrouch( false );
	AP_Corrion.EWeaponAimedState = WAS_Relaxed ;

	ACTION_ChangeControllerDirect( AP_Zanovich, class'ScriptedController' );

	ACTION_MoveToward( AP_Zanovich, GetNavigationPoint( 'PN_OutroEnd_Baker2' ), true );
	ACTION_MoveToward( AP_Corrion, GetNavigationPoint( 'PN_OutroCorrion' ), true, GetFirstActor( 'LT_OutroCorrion' ));
	ACTION_ChangeControllerDirect( AP_Corrion, class'ScriptedController' );
	ACTION_SetAnimSetDirect( AP_Corrion, "a_cin_d08_Eviction_notice.a_cin_d08_Eviction_notice" );

	ACTION_ClearPawnIdleQueue( 'CorrionOutro' );
	ACTION_AddAnimToPawnIdleQueue( 'CorrionOutro', 'standing_idle_relaxed_3' );
	ACTION_AddAnimToPawnIdleQueue( 'CorrionOutro', 'standing_idle_relaxed_1' );
	ACTION_AddAnimToPawnIdleQueue( 'CorrionOutro', 'standing_idle_relaxed_2' );
	ACTION_AddAnimToPawnIdleQueue( 'CorrionOutro', 'standing_idle_relaxed_4' );
	ACTION_AddAnimToPawnIdleQueue( 'CorrionOutro', 'standing_idle_relaxed_1' );
	ACTION_AddAnimToPawnIdleQueue( 'CorrionOutro', 'standing_idle_relaxed_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'CorrionOutro', false );

	ACTION_ChangeControllerDirect( AP_Baker, class'ScriptedController' );

	AP_Baker.AttachToBone( Trigger_Outro, 'Bip01 Spine1' );
	AP_Baker.AttachToBone( gbxWaypointBeacon_OutroHint, 'Bip01 Spine1' );

	ACTION_MoveToward( AP_Baker, PN_Baker_Outro, true, GetFirstActor( 'LT_OutroBaker' ) );

	while( !PawnIsAtDestination( AP_Baker, PN_Baker_Outro ))
		{
			WaitForAbsoluteTime( i+= 0.2 );
		}
	AP_Baker.EWeaponAimedState = WAS_Relaxed ;

	ACTION_SetAnimSetDirect( AP_Baker, "a_cin_d08_Eviction_notice.a_cin_d08_Eviction_notice" );

	ACTION_ClearPawnIdleQueue( 'BakerOutro' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'Baker_outro_waves_thanks' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_3' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_7' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_1' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_2' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'Baker_outro_waves_thanks' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_1' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_2' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_3' );
	ACTION_PlayAnimFromPawnIdleQueue( 'BakerOutro', false );

	ACTION_TriggerEvent( 'Trigger_OutroAtBaker' );
}


state OutroDialogue
{
	function OnTrigger()
		{
		}

Begin:

//START DIALOGUE

	ACTION_DisableBattleDialogue();
	ACTION_TriggerEvent( 'CSG_Outro_U01' );

// Limit input
	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );

	if( AP_Baker.IsAnimating( 0 ) )
	{
	ACTION_WaitForAnimEnd( AP_Baker, 0 );
	}

	ACTION_OrderMove( 'Unit_DE_Outro_U01', 'PN_Outro_Germans' );

	AP_Baker.Controller.focus = GetLocalPlayerPawn();
	ACTION_WaitForPawnRotateToward( AP_Baker );

        i = 0.0;
        ResetAbsoluteTime();
        StartAbsoluteTime();

	ACTION_SetLookAtTargetDirect( AP_Baker, GetLocalPlayerPawn(), true );
	ACTION_ClearPawnIdleQueue( 'BakerOutro' );
	ACTION_PlayAnimWithQueueDirect( AP_Baker, 'Baker_outro_dialogue', 0.2, 1.0 );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_3' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_7' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_1' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_1' );
	ACTION_AddAnimToPawnIdleQueue( 'BakerOutro', 'standing_idle_combat_2' );
	ACTION_PlayAnimFromPawnIdleQueue( 'BakerOutro', false );

	ACTION_SetLookAtTargetDirect( AP_Baker, GetLocalPlayerPawn(), false );

//BAKER_B="Baker: Looks like we flushed a lotta the Krauts out into the open."
	ACTION_PlayLipSyncSoundDirect( AP_Baker, "D08_1000.BAKER_B", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_B" ), 3.0, 1 , 1 , 1 , , TRUE );
		WaitForAbsoluteTime( i+= 3.3 );

//CORRION_A="Corrion: They're getting away."
	ACTION_PlayLipSyncSoundDirect( AP_Corrion, "D08_1000.CORRION_A", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("CORRION_A" ), 2.3, 1 , 1 , 1 , , TRUE );
	ACTION_PlayAnimWithQueueDirect( AP_Corrion, 'Corrion_points', 0.2, 1.0 );
		WaitForAbsoluteTime( i+= 0.75 );

	ACTION_SetLookAtTargetDirect( AP_Baker, AP_Corrion, true );
		WaitForAbsoluteTime( i+= 1.85 );

//BAKER_C1="Baker: We'll sit tight for a few minutes and regroup."
	ACTION_PlayLipSyncSoundDirect( AP_Baker, "D08_1000.BAKER_C", 1.0, 1.0, 1.0 );
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_C1" ), 3.0, 1 , 1 , 1 , , TRUE );
		WaitForAbsoluteTime( i+= 1.3 );

	ACTION_SetLookAtTargetDirect( AP_Baker, GetLocalPlayerPawn(), true );
		WaitForAbsoluteTime( i+= 2.0 );

//BAKER_C2="Baker: Then we'll chase 'em down and rout the shit out of them."
	ACTION_DisplaySubtitleMessage2(S_Localize("BAKER_C2" ), 3.0, 1 , 1 , 1 , , TRUE );
		WaitForAbsoluteTime( i+= 4.0 );

	ACTION_TriggerEvent('TriggeredScriptMapComplete');

}
