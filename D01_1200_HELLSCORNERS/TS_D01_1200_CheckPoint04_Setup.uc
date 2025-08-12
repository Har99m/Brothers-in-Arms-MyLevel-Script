//=============================================================================
// TS_D01_1200_CheckPoint04_Setup.
//=============================================================================
class TS_D01_1200_CheckPoint04_Setup extends TriggeredScript
	placeable;

state Triggered
	{
		Begin:

	ACTION_StartRain( 1.0 );


			ACTION_TriggerEvent( 'Trigger_Combat4_01' );
			ACTION_TriggerEvent( 'WB_Outro' );
	
			ACTION_DestroyActor('Trigger_Checkpoint_04');
			ACTION_DestroyActor('TRIG_Midtro2_Ready');
			ACTION_DestroyActor('TRIG_Midtro2');
			ACTION_DestroyActor('Trigger_Combat3_02');
			ACTION_DestroyActor('Trigger_Combat3_01');
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
			ACTION_UnBlockNavPoints('PN_CP2'); //enable pathnodes
			ACTION_UnBlockNavPoints('PN_CP3'); //enable pathnodes
			ACTION_UnBlockNavPoints('PN_CP4'); //enable pathnodes
			ACTION_UnBlockNavPoints('PN_ContinueOn'); //enable pathnodes
		//===== Unhide parachute drops 1 , 2 , 3
			GetFirstActor( 'SM_Chute_01' ).bHidden = FALSE ;
			GetFirstActor( 'SM_Chute_02' ).bHidden = FALSE ;
			GetFirstActor( 'SM_Chute_03' ).bHidden = FALSE ;

			ACTION_DestroyActor( 'WB_SupplyDrop_01' );
			ACTION_DestroyActor( 'WB_SupplyDrop_02' );
			ACTION_DestroyActor( 'WB_SupplyDrop_03' );

	ACTION_TriggerEVent('CSG_Squad_19');
	ACTION_OrderMove( 'Unit_DE_19', 'PN_GermanMovement_19' );

		ScriptEnd:
	}
