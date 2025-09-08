//=============================================================================
// 	TS_D02_2300_MG_03_Sector.
//	Triggered by:	CSG_MG - TriggerOnDeath
//	Use:			Disables recruiting on MG42 in Sector 03 to help performance / memory
//=============================================================================
class TS_D02_2300_MG_03_Sector extends TriggeredScriptCombat
	placeable;

state triggered
	{
		Begin:

				sleep( 1.0 );

			//===== Disable recruiting
				ACTION_EnableMG42Recruiting( 'MG42_S3' , FALSE );

		ScriptEnd:
	}
