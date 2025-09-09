//=============================================================================
// TS_D09_1500_OutroTeleport.
//=============================================================================
class TS_D09_1500_OutroTeleport extends TS_D09_1500_IntroScene
	placeable;

var ActorLite PN_Outro_Paige, PN_Outro_Paddock;
var Actor PN_C4HT2_StartPosition_04; 

state Triggered
{
	Begin:

	WP_Player = GetLocalPlayerPawn();

	AP_Paddock = AnimPawn( GetPawn('IG_Paddock') );
	AP_Paige = AnimPawn( GetPawn('IG_Paige') );

	PN_Outro_Paddock = GetNavigationPoint('PN_Outro_Paddock');
	PN_Outro_Paige = GetNavigationPoint('PN_Outro_Paige');
	PN_C4HT2_StartPosition_04 = GetFirstActor( 'LT_PaigeTeleport' );

	if ( AP_Paige != None && AP_Paige.Health > 0 )
	{
	 	if (  AP_Paddock != None && AP_Paddock.Health > 0 )
		{
			if ( vSize( AP_Paddock.location - PN_C4HT2_StartPosition_04.location ) > 4096 )
				ACTION_TeleportPawnToActor( AP_Paddock, 'LT_PaddockTeleport' );

			ACTION_ChangeControllerDirect( AP_Paddock, class'ScriptedController' );

			WargamePawn(AP_Paddock).SetWeaponAimedState( WAS_Relaxed );
			ACTION_RunDirect( AP_Paddock );
			ACTION_MoveToward( AP_Paddock, PN_Outro_Paddock, TRUE );

			if ( vSize( AP_Paige.location - PN_C4HT2_StartPosition_04.location ) > 4096 )
				ACTION_TeleportPawnToActor( AP_Paige, 'LT_PaigeTeleport' );

			ACTION_ChangeControllerDirect( AP_Paige, class'ScriptedController' );

			WargamePawn(AP_Paige).SetWeaponAimedState( WAS_Relaxed );
			ACTION_RunDirect( AP_Paige );
			ACTION_MoveToward( AP_Paige, PN_Outro_Paige, TRUE );

			while( !PawnIsAtDestination(AP_Paddock, PN_Outro_Paddock) )
				sleep( 1.0 );

			AP_Paddock.Controller.Focus = WP_Player;

			while ( !PawnIsAtDestination(AP_Paige, PN_Outro_Paige) )
				sleep( 1.0 );

			AP_Paige.Controller.Focus = WP_Player;

			ACTION_WaitForPawnRotateToward( AP_Paddock );
		}
	}

	ScriptEnd:
}
