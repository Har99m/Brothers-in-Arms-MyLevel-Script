//=============================================================================
// FlakLow.
//=============================================================================
class FlakLow extends TriggeredScript
	placeable;

var bool bShouldTrigger;

state Default
	{
		begin:
			bShouldTrigger = TRUE;
	}

state Triggered
	{
		begin:
			while (bShouldTrigger)
				{
					ACTION_TriggerEvent( 'Flak_Low' );
						sleep(2.2);
					ACTION_TriggerEvent( 'Flak_Low' );
						sleep(0.2);
				}
	}

