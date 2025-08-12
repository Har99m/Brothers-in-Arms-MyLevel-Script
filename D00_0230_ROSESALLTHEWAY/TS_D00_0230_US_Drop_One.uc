//=============================================================================
// TS_D00_0230_US_Drop_One.
//=============================================================================
class TS_D00_0230_US_Drop_One extends TriggeredScript
	placeable;

var AnimPawn AP_Drop_Body_01 , AP_Drop_Chute_01 ;

State Triggered
	{
		Begin:

			//===== Define
				AP_Drop_Body_01 = AnimPawn( GetPawn( 'AP_Drop_Body_01' ));
				AP_Drop_Chute_01 = AnimPawn( GetPawn( 'AP_Drop_Chute_01' ));

				AP_Drop_Body_01.bHidden = FALSE ;
				AP_Drop_Chute_01.bHidden = FALSE ;

			//===== Drop
				ACTION_TriggerEvent( 'Event_SS_Drop_01' );

					sleep( 5.5 );

				ACTION_PlayLipSyncSoundDirect( AP_Drop_Body_01 , "D00_0230_SOUNDS.TREE_LANDING" , 1.0 , 1.0 , 1.0 , , 'Bip01 L Foot' );

					sleep( 0.8 );

				ACTION_PlayLipSyncSoundDirect( AP_Drop_Body_01 , "BD_BAKER.M_DEATH_D" , 1.0 , 1.0 , 1.0 , , 'bottom_lip' );
				ACTION_TriggerEvent( 'pft_Drop_03_Leaves' );

		ScriptEnd:
	}

