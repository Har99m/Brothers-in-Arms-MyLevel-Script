//=============================================================================
// MacMeetShoot_Script.
//=============================================================================
class MacMeetShoot_Script extends TriggeredScript
	placeable;

var bool Baker_Has_Shot;
var bool DontTrig;

State Triggered
	{
		Begin:
			if ( DontTrig == False )
				{
					MacMeet_Script(getFirstActor('MacMeet_Script')).ShotsFired = True;
					MacMeet_Script(getFirstActor('MacMeet_Script')).MacFireNow = True;
				}

			Baker_Has_Shot = TRUE ;
	}
