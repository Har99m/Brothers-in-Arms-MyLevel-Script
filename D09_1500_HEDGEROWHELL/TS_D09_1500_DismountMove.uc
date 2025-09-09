//=============================================================================
// TS_D09_1500_DismountMove.
//=============================================================================
class TS_D09_1500_DismountMove extends TriggeredScript
	placeable;

var(Events) edfindable Actor A_Turret;
var(Events) bool bDoNothingIfHumanControlled;

var(Events) edfindable Unit Unit_Move;
var(Events) name nmPathNode;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	if ( Unit_Move != None && Unit_Move.GetNumLivingMembers() > 0 )
	{
		if ( A_Turret != None && A_Turret.IsA( 'MG42Factory' ) )
		{
			SLog( "**** Recruiting Disabled ****" );
			ACTION_EnableMG42Recruiting( A_Turret.Tag, FALSE );
			ACTION_ForceTurretDismountDirect( A_Turret, bDoNothingIfHumanControlled );

			sleep( 1.0 );
			if ( nmPathNode != 'None' )
				ACTION_OrderMove( Unit_Move.Tag, nmPathNode );
		}
		else
			SLog( "**** A_Turret " $ A_Turret $ " ****" );
	}

	ScriptEnd:
}
