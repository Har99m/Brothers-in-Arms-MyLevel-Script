//=============================================================================
// TS_D00_1630_TeleportSquad.
//=============================================================================
class TS_D00_1630_TeleportSquad extends TriggeredScript
	placeable;

var AnimPawn Pawn_HTGuy01, Pawn_HTGuy02, Pawn_HTGuy03;
var WargamePawn	Pawn_DummyTarget;
var UnitCentroid Unit_Ass, Unit_Base;
var ActorLite PN_Teleport_Friar, PN_Teleport_Doyle, PN_Teleport_Paddock,
			PN_Teleport_Allen, PN_Teleport_Garnett;
var AnimPawn AP_Friar, AP_Doyle, AP_Paddock, AP_Allen, AP_Garnett;

var Volume Volume_Tele;

state Triggered
{
	Begin:

	AP_Paddock = AnimPawn( GetPawn( 'Paddock' ) );
	AP_Garnett = AnimPawn( GetPawn( 'Garnett' ) );
	AP_Friar = AnimPawn( GetPawn( 'Friar' ) );
	AP_Doyle = AnimPawn( GetPawn( 'Doyle' ) );
	AP_Allen = AnimPawn( GetPawn( 'Allen' ) );

	PN_Teleport_Paddock = GetNavigationPoint( 'PN_Teleport_Paddock' );
	PN_Teleport_Garnett = GetNavigationPoint( 'PN_Teleport_Garnett' );
	PN_Teleport_Allen = GetNavigationPoint( 'PN_Teleport_Allen' );
	PN_Teleport_Doyle = GetNavigationPoint( 'PN_Teleport_Doyle' );
	PN_Teleport_Friar = GetNavigationPoint( 'PN_Teleport_Friar' );

	Volume_Tele = Volume(GetFirstActor('Volume_Teleport'));

	ForEach Volume_Tele.TouchingActors(class'UnitCentroid', Unit_Ass)
	{
		if ( Unit_Ass.Tag == 'Unit_US_Ass' )
		{
			// OrderMove

			// Found a squad so teleport
			if ( AP_Friar != None && AP_Friar.Health > 0 )
			{
				ACTION_TeleportPawnToActor( AP_Friar, 'LT_FriarTeleport' );
				ACTION_MoveToward( AP_Friar, PN_Teleport_Friar, TRUE );
			}
 			if ( AP_Paddock != None && AP_Paddock.Health > 0 )
			{
				ACTION_TeleportPawnToActor( AP_Paddock, 'LT_PaddockTeleport' );
				ACTION_MoveToward( AP_Paddock, PN_Teleport_Paddock, TRUE );
			}
 			if ( AP_Doyle != None && AP_Doyle.Health > 0 )
			{
				ACTION_TeleportPawnToActor( AP_Doyle, 'LT_DoyleTeleport' );
				ACTION_MoveToward( AP_Doyle, PN_Teleport_Doyle, TRUE );
			}
		}

		if ( Unit_Ass.Tag == 'Unit_US_Base' )
		{
			// Order Move

			if ( AP_Allen != None && AP_Allen.Health > 0 )
			{
				ACTION_TeleportPawnToActor( AP_Allen, 'LT_AllenTeleport' );
				ACTION_MoveToward( AP_Allen, PN_Teleport_Allen, TRUE );
			}
	 		if ( AP_Garnett != None && AP_Garnett.Health > 0 )
			{
				ACTION_TeleportPawnToActor( AP_Garnett, 'LT_GarnettTeleport' );
				ACTION_MoveToward( AP_Garnett, PN_Teleport_Garnett, TRUE );
			}
		}
	}
}
