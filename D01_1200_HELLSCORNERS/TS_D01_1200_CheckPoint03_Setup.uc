//=============================================================================
// TS_D01_1200_CheckPoint03_Setup.
//=============================================================================
class TS_D01_1200_CheckPoint03_Setup extends TriggeredScript
	placeable;

state Triggered
	{
		Begin:

	ACTION_StartRain( 1.0 );


				ACTION_TriggerEvent('PFX_Flare1');
				ACTION_TriggerEvent('PFX_Flare2');
				ACTION_TriggerEvent('PFX_Flare3');
				ACTION_TriggerEvent('Toggle_On_BarnDoor');
				GetFirstActor('Hide_BarnDoor').bHidden = True;
			ACTION_UnBlockNavPoints('PN_CP2'); //enable pathnodes
			ACTION_UnBlockNavPoints('PN_CP3'); //enable pathnodes
					sleep( 0.5 );

				ACTION_TriggerEvent('WB_MG42');


				ACTION_DestroyActor('TRIG_Midtro1Go');
				ACTION_DestroyActor('TRIG_Midtro1End');
				ACTION_DestroyActor('Trigger_Checkpoint_03');
				ACTION_DestroyActor('TRIG_Midtro1Scene');
				ACTION_DestroyActor('Trigger_Combat2_03');
				ACTION_DestroyActor('Trigger_Combat2_02');
				ACTION_DestroyActor('Trigger_Combat2_01');
				ACTION_DestroyActor('Trigger_Checkpoint_02');
				ACTION_DestroyActor('Trigger_Combat1_04');
				ACTION_DestroyActor('Trigger_Combat1_03');
				ACTION_DestroyActor('Trigger_Combat1_02');
				ACTION_DestroyActor('Trigger_Combat1_01');
				ACTION_DestroyActor( 'Trigger_BarnBlock' );

			//===== Unhide parachute drops 1 , 2 , 3
				GetFirstActor( 'SM_Chute_01' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Chute_02' ).bHidden = FALSE ;
				GetFirstActor( 'SM_Chute_03' ).bHidden = FALSE ;

				ACTION_DestroyActor( 'WB_SupplyDrop_01' );
				ACTION_DestroyActor( 'WB_SupplyDrop_02' );
				ACTION_DestroyActor( 'WB_SupplyDrop_03' );

		ScriptEnd:
	}
