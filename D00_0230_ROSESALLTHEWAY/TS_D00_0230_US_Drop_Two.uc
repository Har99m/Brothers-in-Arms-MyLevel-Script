//=============================================================================
// TS_D00_0230_US_Drop_Two.
//=============================================================================
class TS_D00_0230_US_Drop_Two extends TriggeredScript
	placeable;

var AnimPawn AP_Drop_Body_02 ;

State Triggered
	{
		Begin:

			//===== Define
				AP_Drop_Body_02 = AnimPawn( GetPawn( 'AP_Drop_Body_02' ));

		//		AP_Drop_Body_02.AttachToBone( GetFirstActor( 'gbxET_Drop_02_Shot' ) , 'Bone95' );

			//===== Drop
				ACTION_TriggerEvent( 'Event_SS_Drop_02' );

					sleep( 12.5 );

				ACTION_PlayLipSyncSoundDirect( AP_Drop_Body_02 , "IMPACTS.BODY_GROUND" , 1.0 , 1.0 , 1.0 , , 'Bip01 L Foot' );

					sleep( 5.8 );

				ACTION_PlayLipSyncSoundDirect( AP_Drop_Body_02 , "Gear.CLOTHING" , 1.0 , 1.0 , 1.0 , , 'shovel_us' );

					sleep( 1.0 );

				ACTION_PlayLipSyncSoundDirect( AP_Drop_Body_02 , "BD_GARNETT.M_SUPERPAIN_B" , 1.0 , 1.0 , 1.0 , , 'bottom_lip' );

					sleep( 1.6 );

				ACTION_PlayLipSyncSoundDirect( AP_Drop_Body_02 , "IMPACTS.BODY_GROUND" , 1.0 , 1.0 , 1.0 , , 'Bip01 L Foot' );

		ScriptEnd:
	}
