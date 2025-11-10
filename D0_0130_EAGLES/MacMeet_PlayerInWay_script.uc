//=============================================================================
// MacMeet_PlayerInWay_script.
//=============================================================================
class MacMeet_PlayerInWay_script extends TriggeredScript
	placeable;

State Triggered
	{
		Begin:

				if ( !MacMeet_Script(getFirstActor('MacMeet_Script')).ReadyToDismount )
					{
						ACTION_ChangeController('GermanMacKill1',class'Mind');
						ACTION_ChangeController('GermanMacKill2',class'Mind');
						ACTION_OrderTarget('GermanSquad14','USAFireTeam1');
						MacMeetShoot_Script(getFirstActor('MacMeetShoot_Script')).DontTrig = True;
						MacMeet_Script(getFirstActor('MacMeet_Script')).ShotsFired = True;
						MacMeet_Script(getFirstActor('MacMeet_Script')).MacFireNow = True;
						ACTION_TriggerEvent('Trig_MacFirst');

							sleep( 1.0 );
						ACTION_OrderTarget( 'GermanSquad14' , 'USAFireTeam' );
					}

				else
					{
						MacMeet_Script(getFirstActor('MacMeet_Script')).ShotsFired = True;
						MacMeet_Script(getFirstActor('MacMeet_Script')).MacFireNow = True;
					}
	}
