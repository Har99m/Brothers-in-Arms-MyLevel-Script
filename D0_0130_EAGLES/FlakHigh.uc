//=============================================================================
// FlakHigh.
//=============================================================================
class FlakHigh extends TriggeredScript
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
			ACTION_TriggerEvent( 'Flak_High' );
			sleep(2.2);
			ACTION_TriggerEvent( 'Flak_High' );
			sleep(0.2);
		}


}
