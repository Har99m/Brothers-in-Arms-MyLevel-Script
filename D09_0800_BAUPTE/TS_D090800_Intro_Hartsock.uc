//=============================================================================
// TS_D090800_Intro_Hartsock.
//=============================================================================
class TS_D090800_Intro_Hartsock extends TriggeredScript
	placeable;

var AnimPawn AP_Hartsock, AP_Hartsock_BODY;
var float i;
var int myStage;

State Triggered
{
	Function OnTrigger()
	{
		//
	}
Begin:
	AP_Hartsock = AnimPawn( Getpawn( 'AP_Hartsock_Intro' ));
	AP_Hartsock_BODY = AnimPawn( Getpawn( 'AP_Hartsock_Intro_BODY' ));

	ACTION_PlayAnimDirect( AP_Hartsock_BODY, 'player_hand_shot', 0.0, 1.0, False, 0, , 1 );
	ACTION_WaitForAnimEnd( AP_Hartsock_BODY, 0 );
	ACTION_PlayAnimDirect( AP_Hartsock_BODY, 'player_hand_pain_idle', 0.0, 1.2, False, 0, , 1);
	ACTION_WaitForAnimEnd( AP_Hartsock_BODY, 0 );
	ACTION_PlayAnimDirect( AP_Hartsock_BODY, 'player_brings_hand_down', 0.0, 1.0, False, 0, , 1 );
	ACTION_WaitForAnimEnd( AP_Hartsock_BODY, 0 );
	
	GotoState('Hand_Idle');
}

State Hand_Idle
{
	Function OnTrigger()
	{
		GotoState('Helped_Up');
	}
Begin:
	ACTION_PlayAnimDirect( AP_Hartsock_BODY, 'player_hand_down_idle', 0.0, 1.0, False, 0, , 1);
	sleep(0.1);
	ACTION_WaitForAnimEnd( AP_Hartsock_BODY, 0 );
	Goto('Begin');
}

State Helped_Up
{
	Function OnTrigger()
	{
		
	}
Begin:
	ACTION_PlayAnimDirect( AP_Hartsock_BODY, 'player_helped_up', 0.0, 1.0, False, 0, , 1 );
	ACTION_WaitForAnimEnd( AP_Hartsock_BODY, 0 );
	ACTION_PlayAnimDirect( AP_Hartsock_BODY, 'standing_idle_combat_2', 0.0, 1.0, True, 0, , );
	ACTION_TriggerEvent('EVENT_ONFEET');
}

