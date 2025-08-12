//=============================================================================
// TS_D00_0230_US_Drop_Three.
//=============================================================================
class TS_D00_0230_US_Drop_Three extends TriggeredScript
	placeable;

var AnimPawn AP_Drop_Body_03 ;

State Triggered
	{
		Begin:

			//===== Define
				AP_Drop_Body_03 = AnimPawn( GetPawn( 'AP_Drop_Body_03' ));

			//===== Drop
				ACTION_TriggerEvent( 'Event_SS_Drop_03' );

					sleep( 9.0 );

				ACTION_PlayLipSyncSoundDirect( AP_Drop_Body_03 , "D00_0230_SOUNDS.TREE_LANDING" , 1.0 , 1.0 , 1.0 , , 'Bip01 L Foot' );

					sleep( 1.2 );

				ACTION_PlayLipSyncSoundDirect( AP_Drop_Body_03 , "BD_PAIGE.M_DEATH_A" , 1.0 , 1.0 , 1.0 , , 'bottom_lip' );
				ACTION_TriggerEvent( 'pfx_Drop_03_Leaves' );

					sleep( 10.0 );

				ACTION_TriggerEvent( 'pfx_Drop_03_Leaves' );
				ACTION_DestroyActor( 'pfx_Drop_03_Leaves' );

		ScriptEnd:
	}
