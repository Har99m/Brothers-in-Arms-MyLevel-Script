//=============================================================================
// 	TS_D02_2300_MG_04_Sector.
//	Triggered by:	CSG_MG2 - (OnTrigger) TriggerOnDeath
//	Use:			Disables recruiting on MG42 in Sector 04 to help performance / memory
//=============================================================================
class TS_D02_2300_MG_04_Sector extends TriggeredScript
	placeable;

state triggered
	{

			function OnTrigger()
				{
					GoToState( 'CarryOn' );
				}

		Begin:
				sleep( 1.0 );

			//===== Enable recruiting
				ACTION_EnableMG42Recruiting( 'MG42_S4' , TRUE );
				ACTION_OrderTarget( 'UNIT_MG2' , 'Unit_Player' );

		ScriptEnd:
	}

state CarryOn
	{
		Begin:

				sleep( 1.0 );

			//===== German on MG has been killed , disable recruiting
				ACTION_EnableMG42Recruiting( 'MG42_S4' , FALSE );

		ScriptEnd:
	}
