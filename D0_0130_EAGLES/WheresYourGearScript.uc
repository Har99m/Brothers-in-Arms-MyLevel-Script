//=============================================================================
// WheresYourGearScript.
//=============================================================================
class WheresYourGearScript extends TriggeredScript
	placeable;

State Triggered
	{

		Begin:

				sleep (1.0);

				ACTION_DisplaySubtitleMessage2( S_Localize("MAC_HA"), 1.0, 1, 1, 1, TRUE, TRUE );
				sleep( ACTION_PlayLipSyncSound('Mac',"D_MAC.BAKER_A", 1.0, 1.0, 4096.0, True ) );
					//	Mac: Baker!
				
				sleep (0.5);

				ACTION_DisplaySubtitleMessage2( S_Localize( "MAC_H" ), 3.0, 1, 1, 1, TRUE, TRUE );
				sleep( ACTION_PlayLipSyncSound('Mac',"D00130.MAC_H", 1.0, 1.0, 4096.0, True ) - 1.0 );	
					// Mac: "Where the hell is all your gear?"


	}
