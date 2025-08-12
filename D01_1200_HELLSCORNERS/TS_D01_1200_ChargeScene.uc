//=============================================================================
// TS_D01_1200_ChargeScene.
//=============================================================================
class TS_D01_1200_ChargeScene extends TriggeredScript
	placeable;

var TS_D01_1200_ChargeSceneEnd Charge_Ref;
var TS_D01_1200_DE01Alive DE01_Ref;
var TS_D01_1200_DE02Alive DE02_Ref;
var TS_D01_1200_DE03Alive DE03_Ref;
var TS_D01_1200_DE04Alive DE04_Ref;
var TS_D01_1200_DE05Alive DE05_Ref;

var AnimPawn AP_Desola, AP_Paddock, AP_Marsh, AP_Garnett, AP_Friar;

var Unit GermanUnit[5], Unit19, Unit23, Unit24;

state Default
{
	Begin:

	Charge_Ref = TS_D01_1200_ChargeSceneEnd( GetFirstActor( 'TS_D01_1200_ChargeSceneEnd' ) );
	DE01_Ref = TS_D01_1200_DE01Alive( GetFirstActor( 'TS_D01_1200_DE01Alive' ) );
	DE02_Ref = TS_D01_1200_DE02Alive( GetFirstActor( 'TS_D01_1200_DE02Alive' ) );
	DE03_Ref = TS_D01_1200_DE03Alive( GetFirstActor( 'TS_D01_1200_DE03Alive' ) );
	DE04_Ref = TS_D01_1200_DE04Alive( GetFirstActor( 'TS_D01_1200_DE04Alive' ) );
	DE05_Ref = TS_D01_1200_DE05Alive( GetFirstActor( 'TS_D01_1200_DE05Alive' ) );

	GermanUnit[0] = Unit( GetFirstActor( 'Unit_DE_Assault_01' ));
	GermanUnit[1] = Unit( GetFirstActor( 'Unit_DE_Assault_04' ));
	GermanUnit[2] = Unit( GetFirstActor( 'Unit_DE_Assault_02' ));
	GermanUnit[3] = Unit( GetFirstActor( 'Unit_DE_Assault_03' ));
	GermanUnit[4] = Unit( GetFirstActor( 'Unit_DE_Assault_05' ));

	Unit19 = Unit( GetFirstActor( 'Unit_DE_19' ));
//	Unit23 = Unit( GetFirstActor( 'Unit_DE_23' ));
//	Unit24 = Unit( GetFirstActor( 'Unit_DE_24' ));

}

state Triggered
{
	Begin:

	ACTION_DisableFlankingDialogue();

	ACTION_TriggerEvent( 'TS_D01_1200_DE01Death' );
	DE01_Ref.bDE01Alive = true;
	ACTION_TriggerEvent( 'TS_D01_1200_DE04Death' );
	DE04_Ref.bDE04Alive = true;

	do{
/*		if( !DE01_Ref.bDE01Alive && !DE02_Ref.bDE02Alive )
		{
			ACTION_TriggerEvent( 'TS_D01_1200_DE01Death' );
			DE01_Ref.bDE01Alive = true;
		}

		if( !DE02_Ref.bDE02Alive && !DE03_Ref.bDE03Alive )
		{
			ACTION_TriggerEvent( 'TS_D01_1200_DE02Death' );
			DE02_Ref.bDE02Alive = true;
		}

		if( !DE03_Ref.bDE03Alive && !DE04_Ref.bDE04Alive )
		{
			ACTION_TriggerEvent( 'TS_D01_1200_DE03Death' );
			DE03_Ref.bDE03Alive = true;
		}

		if( !DE04_Ref.bDE04Alive && !DE05_Ref.bDE05Alive )
		{
			ACTION_TriggerEvent( 'TS_D01_1200_DE04Death' );
			DE04_Ref.bDE04Alive = true;
		}

		if( !DE05_Ref.bDE05Alive && !DE01_Ref.bDE01Alive )
		{
			ACTION_TriggerEvent( 'TS_D01_1200_DE05Death' );
			DE05_Ref.bDE05Alive = true;
		} */

		sleep( 3.0 );

	}until( Charge_Ref.bChargeHasEnded )

	slog( "***** Destroying Final Units. *****" );

	ACTION_DestroyActor( 'CSG_Squad_Assault_01');
	ACTION_DestroyActor( 'CSG_Squad_Assault_02');
	ACTION_DestroyActor( 'CSG_Squad_Assault_03');
	ACTION_DestroyActor( 'CSG_Squad_Assault_04');
	ACTION_DestroyActor( 'CSG_Squad_Assault_05');
	
	while(	(GermanUnit[0].GetNumLivingMembers() != 0) ||
			(GermanUnit[1].GetNumLivingMembers() != 0) ||
			(GermanUnit[2].GetNumLivingMembers() != 0) ||
			(GermanUnit[3].GetNumLivingMembers() != 0) ||
			(GermanUnit[4].GetNumLivingMembers() != 0) ||
			(Unit19.GetNumLivingMembers() != 0) /*|| 
			(Unit23.GetNumLivingMembers() != 0) || 
			(Unit24.GetNumLivingMembers() != 0) */ )
		{
			sleep( 1.0 );
		}

	if( (GermanUnit[0].GetNumLivingMembers() != 0) )
		slog( "***** Unit_DE_Assault_01 still has living members!!! *****" );

	if( (GermanUnit[1].GetNumLivingMembers() != 0) )
		slog( "***** Unit_DE_Assault_02 still has living members!!! *****" );

	if( (GermanUnit[2].GetNumLivingMembers() != 0) )
		slog( "***** Unit_DE_Assault_03 still has living members!!! *****" );

	if( (GermanUnit[3].GetNumLivingMembers() != 0) )
		slog( "***** Unit_DE_Assault_04 still has living members!!! *****" );

	if( (GermanUnit[4].GetNumLivingMembers() != 0) )
		slog( "***** Unit_DE_Assault_05 still has living members!!! *****" );

	if( (Unit19.GetNumLivingMembers() != 0) )
		slog( "***** Unit_DE_19 still has living members!!! *****" );

//	if( (Unit23.GetNumLivingMembers() != 0) )
//		slog( "***** Unit_DE_23 still has living members!!! *****" );

//	if( (Unit24.GetNumLivingMembers() != 0) )
//		slog( "***** Unit_DE_24 still has living members!!! *****" );

	slog( "***** Combat finished. *****" );

	ACTION_SetObjectiveStatus( 3, OI_Complete, 'ObjectiveList' );
	ACTION_DisplayObjectiveString( S_Localize( "OBJCOMP" ), 3.0 );

	//=============================================================================
	GetLocalPlayerPawn().Controller.bGodMode = true;
	ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn(), TRUE );
	ACTION_DestroyActor( 'Pawn_KillMeIfImStillAlive');

	AP_Desola = AnimPawn( GetPawn( 'Pawn_Desola' ) );
	AP_Paddock = AnimPawn( GetPawn( 'Pawn_Paddock' ) );
	AP_Marsh = AnimPawn( GetPawn( 'Pawn_Marsh' ) );
	AP_Garnett = AnimPawn( GetPawn( 'Pawn_Garnett' ) );
	AP_Friar = AnimPawn( GetPawn( 'Pawn_Friar' ) );

	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Desola), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Paddock), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Marsh), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Garnett), TRUE );
	ACTION_SetRepelBulletsDirect( gbxPawn(AP_Friar), TRUE );

	GetPawn('Pawn_Paddock').Controller.bDemiGod = TRUE;
	GetPawn('Pawn_Desola').Controller.bDemiGod = TRUE;
	GetPawn('Pawn_Marsh').Controller.bDemiGod = TRUE;
	GetPawn('Pawn_Garnett').Controller.bDemiGod = TRUE;
	GetPawn('Pawn_Friar').Controller.bDemiGod = TRUE;
	//=============================================================================

	sleep( 3.0 );

	ACTION_FadeOverlay( GetLocalPlayerController(), 1, 2.0 );
	sleep( 2.0 );

	ACTION_TriggerEvent( 'TS_D01_1200_OutroScene' );

}
