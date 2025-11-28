//=============================================================================
// DD_PoleManagerScript.
//=============================================================================
class DD_PoleManagerScript extends TriggeredScript
	placeable;

var() int  iNumPoles;
var() name CounterTag;
var() name WaypointManagerTag;

var bool bGroupDestroyed;
var int  i;

// This function gets called when the map loads. Good for initialization.
function PostBeginPlay()
{
	i = 0;
	bGroupDestroyed = FALSE;
}

state Triggered
{
	Begin:

	i++;

	if ( i == iNumPoles )
	{
		bGroupDestroyed = TRUE;
		ACTION_TriggerEvent( CounterTag );
		ACTION_TriggerEvent( WaypointManagerTag );
	}

	ScriptEnd:
}
