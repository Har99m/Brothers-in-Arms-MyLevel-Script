//=============================================================================
// OutroScript.
//=============================================================================
class OutroScript extends TriggeredScript
	placeable;

state Triggered
{
Begin:
	ACTION_DisableBattleDialogue();

	sleep(3.0);

	ACTION_TriggerEvent( 'Waypoint_Final_Volume' );
	ACTION_TriggerEvent( 'Waypoint_Final_Trigger' );

	ACTION_TriggerEvent( 'SeaWallExplosion' );
	ACTION_SetHidden( 'BeachWallWhole' , true );

	ACTION_DisplayObjectiveHint(S_Localize("HINT_7", "D0_0700_EXIT4" ), 6.0  );

	SLog( "OutroScript initated..." );
	sleep(1.0);
/*	//cleans up german bodies to free memory.
	ACTION_DestroyActor( 'M01' );
	ACTION_DestroyActor( 'M02' );
	ACTION_DestroyActor( 'M03' );
	ACTION_DestroyActor( 'M04' );
	ACTION_DestroyActor( 'M05' );
	ACTION_DestroyActor( 'M06' );
	ACTION_DestroyActor( 'M07' );
	ACTION_DestroyActor( 'M08' );
	ACTION_DestroyActor( 'M09' );
	ACTION_DestroyActor( 'M10' );
	ACTION_DestroyActor( 'M11' );
	ACTION_DestroyActor( 'M12' );
*/
	//turns on blocking volumes near the beach to keep player from running away from his objective
	ACTION_TriggerEvent( 'BlockingBeachCharge01' );
	ACTION_TriggerEvent( 'BlockingBeachCharge02' );

	//keeps allen and garnett from being distracted 'shellshock' effect
	getPawn('allen').sightradius=0;
	getPawn('garnett').sightradius=0;

	//destroys the explosions on the beach
	ACTION_DestroyActor( 'BeachBomb01' );
	ACTION_DestroyActor( 'BeachBomb02' );
	ACTION_DestroyActor( 'BeachBomb03' );
	ACTION_DestroyActor( 'BeachBomb04' );
	ACTION_DestroyActor( 'BeachBomb05' );
	ACTION_DestroyActor( 'mortar1' );
	ACTION_DestroyActor( 'mortar2' );
	ACTION_DestroyActor( 'mortar3' );
	ACTION_DestroyActor( 'mortar4' );
	ACTION_DestroyActor( 'mortar5' );
	ACTION_DestroyActor( 'mortar6' );
	ACTION_DestroyActor( 'mortar7' );
	ACTION_DestroyActor( 'mortar8' );
//	ACTION_DisplaySubTitleMessage2( "Spawning Mac and Leggett", 2.0, 255, 255, 0, true, true );

	ACTION_TriggerEvent( 'End_MacSpawn' );
	ACTION_TriggerEvent( 'End_LeggettSpawn' );
	ACTION_TriggerEvent( 'Outro_4IDSpawn' );

	//===== Attach radio to Leggett
	ACTION_AttachStaticMesh( GetPawn('End_Leggett') , StaticMesh's_military_us.equipment.us_radio_field_pack' , 'radio_bone' );

//	ACTION_OrderMove( 'Outro_4IDSargeantUnit' , 'PN_4ID_Sarge_Destination' );
	ACTION_OrderMove( 'Outro_4IDUnitA' , 'PN_4ID_EndPointA' );

	ACTION_DetachUnitFromSuperUnit( 'USAFireTeam1' );

	GetPawn('End_Mac').SetWalking(false);  // don't walk
	GetPawn('End_Leggett').SetWalking(false);  // don't walk
	GetPawn('allen').SetWalking(false);  // don't walk
	GetPawn('garnett').SetWalking(false);  // don't walk
	GetPawn('hartsock').SetWalking(false);  // don't walk

	GetPawn('End_Mac').ShouldCrouch(false);  // don't crouch
	GetPawn('End_Leggett').ShouldCrouch(false);  // don't crouch
	GetPawn('allen').ShouldCrouch(false);  // don't crouch
	GetPawn('garnett').ShouldCrouch(false);  // don't crouch
	GetPawn('hartsock').ShouldCrouch(false);  // don't crouch


	ACTION_SetAnimSet( 'End_Leggett', "a_ev_leggett.a_ev_leggett" );
	ACTION_MoveTowardTag('End_Mac', 'End_MacDest', false, 'End_MacLegsLookTarget' ); 
	ACTION_ChangeController( 'allen', Class'ScriptedController' );
	ACTION_ChangeController( 'garnett', Class'ScriptedController' );
	ACTION_ChangeController( 'hartsock', Class'ScriptedController' );
	ACTION_MoveTowardTag('allen', 'End_AllenDest', false, 'End_AllenGarnettLookTarget' );
	sleep(1.0);
	ACTION_MoveTowardTag('garnett', 'End_GarnettDest', false, 'End_AllenGarnettLookTarget'); 
	ACTION_MoveTowardTag('hartsock', 'End_HartsockDest', false, 'End_MacLegsLookTarget'); 

//	ACTION_DisplayObjectiveString( "CHECKPOINT REACHED", 6.0 );
//	ACTION_Checkpoint();

	sleep(1.0);
	ACTION_MoveTowardTag('End_Leggett', 'End_LegDest', false, 'End_MacLegsLookTarget'); 


	ScriptEnd:

}
