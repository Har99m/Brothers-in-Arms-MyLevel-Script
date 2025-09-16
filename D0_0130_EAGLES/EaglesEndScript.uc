//=============================================================================
// EaglesEndScript.
//=============================================================================
class EaglesEndScript extends TriggeredScript
	placeable;

enum CounterName
	{
	waiting_on_one,
	waiting_on_two,
	};

var CounterName Counter;




function OnStart()
	{
		Super.OnStart();

		Counter = waiting_on_one;
	}

state triggered
	{
		Begin:

			IF (Counter == waiting_on_one)
				{

					Counter = waiting_on_two;
					slog("first ping ---------------------------------------------------");
				}

			ELSE IF (Counter == waiting_on_two)
				{

				sleep (0.1);
				ACTION_TriggerEvent ('End_Eagles');
					slog("second ping ---------------------------------------------------");
				}

		ScriptEnd:
	}

