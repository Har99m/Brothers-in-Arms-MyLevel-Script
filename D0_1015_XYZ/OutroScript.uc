//=============================================================================
// OutroScript.
//=============================================================================
class OutroScript extends TriggeredScript
	placeable;

var Pawn GarnettEnd;
var Pawn AllenEnd;

state Triggered

{
Begin:

	/*
	ACTION_WaitForEvent( 'PlayerTriggerEnd' );
	ACTION_DisableBattleDialogue();	
	GetFirstActor( 'GarnettEndScript' ).goToState( 'OutroAudio' );
	*/

	/*
	GarnettEnd = GetPawn( 'GarnettEnd' );
	AllenEnd = GetPawn( 'AllenEnd' );

	//brings down the letterbox
	ACTION_ChangeController('AllenEnd',class'ScriptedController');
	ACTION_ChangeController('GarnettEnd',class'ScriptedController');
		sleep(1.0);
	GarnettEnd.bNoturnBody=true;		
	AllenEnd.bNoturnBody=true;	
	
	GarnettEnd.shouldCrouch(false);
	AllenEnd.shouldCrouch(false);
	*/
	//GarnettEnd.SetWalking(true);
	//AllenEnd.SetWalking(true);

//		ACTION_FlushAnimQueue( 'GarnettEnd' ); 
//		ACTION_FlushAnimQueue( 'AllenEnd' );
//	ACTION_ClearPawnIdleQueue( 'GarnettEnd' );
//	ACTION_MoveTowardTag( 'GarnettEnd', 'GarnettFountain01' );
//	ACTION_MoveTowardTag( 'GarnettEnd', 'GarnettFountain' );
//	ACTION_MoveTowardTag( 'AllenEnd', 'AllenFountain' );

		//sleep(8.0);

		//sleep(16.7);

/*
	ACTION_WaitForEvent( 'GarnettAtDestination' );

//ResetAbsoluteTime();
//StartAbsoluteTime();

	ACTION_AddAnimToPawnIdleQueue( 'GarnettEnd', 'Garnett_idles_on_fountain' );
	ACTION_PlayAnimWithQueue( 'GarnettEnd', 'Garnett_sits_on_fountain', 0.2, 1.0,,,1);

	ACTION_PlayAnimFromPawnIdleQueue( 'GarnettEnd', false );

		sleep(8.0);
	GetFirstActor( 'GarnettEndScript' ).goToState( 'OutroAudio' );
//	ACTION_PlayAnim( 'GarnettEnd', 'Garnett_sits_on_fountain', 0.2, 1.0,,,,1);	
	ACTION_WaitForAnimEnd( GarnettEnd, 0 );

//	ACTION_PlayAnim( 'GarnettEnd', 'Garnett_idles_on_fountain', 0.2, 1.0,true,,,);		
		sleep(16.7);	
*/


//	ACTION_SaveMemoryReport("XYZ_End");
//	ACTION_DisplayMapStats();

ScriptEnd:
}
/*
//=============================================================================
// OutroScript.
//=============================================================================
class OutroScript extends TriggeredScript
	placeable;

var Pawn GarnettEnd;

state Triggered

{
Begin:

	GarnettEnd = GetPawn( 'GarnettEnd' );

	//brings down the letterbox
	ACTION_ChangeController('AllenEnd',class'ScriptedController');
	ACTION_ChangeController('GarnettEnd',class'ScriptedController');
		sleep(1.0);
	GarnettEnd.bNoturnBody =true;		
	GarnettEnd.SetWalking (true);
//		ACTION_FlushAnimQueue( 'GarnettEnd' ); 
		ACTION_FlushAnimQueue( 'AllenEnd' );
	ACTION_ClearPawnIdleQueue( 'GarnettEnd' );
	ACTION_MoveTowardTag( 'GarnettEnd', 'GarnettFountain' );

	ACTION_WaitForEvent( 'GarnettAtDestination' );

	ACTION_PlayAnimWithQueue( 'GarnettEnd', 'Garnett_sits_on_fountain', 0.2, 1.0,,,1);
	ACTION_AddAnimToPawnIdleQueue( 'GarnettEnd', 'Garnett_idles_on_fountain' );
	ACTION_PlayAnimFromPawnIdleQueue( 'GarnettEnd', false );

//	ACTION_PlayAnim( 'GarnettEnd', 'Garnett_sits_on_fountain', 0.2, 1.0,,,,1);	
	ACTION_WaitForAnimEnd( GarnettEnd, 0 );
	ACTION_PlayLipSyncSound( 'GarnettEnd', "D01015.GARNETT_I", 1.0, 1.0, 80.0 );

//	ACTION_PlayAnim( 'GarnettEnd', 'Garnett_idles_on_fountain', 0.2, 1.0,true,,,);		
		sleep(16.7);	

	sleep( ACTION_PlayLipSyncSound( 'AllenEnd', "D01015.ALLEN_J", 1.0, 1.0, 80.0 ) + 0.5 );
	sleep( ACTION_PlayLipSyncSound( 'AllenEnd', "D01015.ALLEN_K", 1.0, 1.0, 80.0 ) + 0.5 );

	ACTION_SaveMemoryReport("XYZ_End");
	ACTION_DisplayMapStats();

ScriptEnd:
} */
