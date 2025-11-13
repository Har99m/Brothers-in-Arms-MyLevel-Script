//=============================================================================
// GS03_Wall.
//=============================================================================
class GS03_Wall extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_DisplayObjectiveHint( "", 0.0 );
		sleep(0.5);
	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );

	ACTION_OrderMove( 'GermanSquad03', 'GermanSquad03_Path03' );
	ACTION_ForceTurretDismount( 'MG42_Road01' );

	ACTION_EnableMG42Recruiting('MG42_Road01', FALSE );

	ACTION_OrderMove( 'GermanGunner01Bags', 'MGFlank' );
		sleep(2.0);
	ACTION_OrderMove( 'GermanGunner01Bags', 'MGFlank' );
		sleep(2.0);
	ACTION_OrderMove( 'GermanGunner01Bags', 'MGFlank' );	

	ScriptEnd:
	}
