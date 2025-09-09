//=============================================================================
// TS_D07_1500_MG01Dismount.
//=============================================================================
class TS_D07_1500_MG01Dismount extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	ACTION_ForceTurretDismount( 'MG42Factory_01' );
	ACTION_ForceTurretDismount( 'MG42Factory_02' );

	ACTION_EnableMG42Recruiting( 'MG42Factory_01', false );
	ACTION_EnableMG42Recruiting( 'MG42Factory_02', false );

	ScriptEnd:
}
