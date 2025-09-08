//=============================================================================
// TS_D01_1200_MortarTeam.
//=============================================================================
class TS_D01_1200_MortarTeam extends TriggeredScript
	placeable;

var int RandomDistance;

var(Events) edfindable Actor A_Mortar;
var(Events) bool bDoNothingIfHumanControlled;

var(Events) edfindable Unit Unit_Move;
var(Events) name nmPathNode;

state Triggered
{
	function OnTrigger()
	{
		gotoState( 'TakeABreak', 'Begin' );
	}

	Begin:

	slog( "***** Mortar firing. *****" );

	RandomDistance = Rand( 2000 );

	ACTION_SetMortarTargetPlayer( 'TheMortar', MortarFire_Marching, 5, 5, 4000 + RandomDistance );

	ACTION_WaitForEvent( 'MortarStoppedFiring' );

	goto( 'Begin' );

	ScriptEnd:
}

state TakeABreak
{
	function OnTrigger()
	{
		gotoState( 'ForceDismount', 'Begin' );
	}

	Begin:

}

state ForceDismount
{
	function OnTrigger(){}

	Begin:

	if ( Unit_Move != None && Unit_Move.GetNumLivingMembers() > 0 )
	{
		if ( A_Mortar != None )
		{
			ACTION_ForceTurretDismountDirect( A_Mortar, bDoNothingIfHumanControlled );
			SLog( "**** Recruiting Disabled ****" );

			sleep( 1.0 );
			if ( nmPathNode != 'None' )
			{
				ACTION_OrderMove( Unit_Move.Tag, nmPathNode );
				SLog( "**** " $ Unit_Move $ " moving to " $ nmPathNode $ ". ****" );
			}
		}
		else
			SLog( "**** A_Mortar " $ A_Mortar $ " ****" );
	}

	ScriptEnd:
}
