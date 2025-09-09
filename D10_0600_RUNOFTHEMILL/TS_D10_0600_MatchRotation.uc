//=============================================================================
// TS_D10_0600_MatchRotation.
//=============================================================================
class TS_D10_0600_MatchRotation extends TriggeredScript
	placeable;

var Actor A_88, A_Player;
var AnimPawn AP_88;

state Default
{
	Begin:
	
	A_88 = GetFirstActor('PAK88_02');
	AP_88 = AnimPawn( GetPawn('AP_88') );
	A_Player = GetLocalPlayerPawn();

	if ( A_88 != None && A_88.IsA('PAK88Factory') )
		A_88 = PAK88Factory(A_88).Gun;

	if ( A_88 != None && A_88.IsA('WeapDEPak88_') && AP_88 != None && A_Player != None )
	{
		A_88.bIgnoreFarPlane = TRUE;

		while ( TRUE )
		{
			sleep( 0.5 );

			if( vSize(A_Player.Location - A_88.Location) < 20000 )
			{
				// Hide skybox 88
				AP_88.bHidden = TRUE;

				// Show world 88
				A_88.bHidden = FALSE;
			}
			else
			{
				// Show skybox 88
				AP_88.bHidden = FALSE;

				// Hide world 88
				A_88.bHidden = TRUE;
			}
		}
	}

	ScriptEnd:
}
