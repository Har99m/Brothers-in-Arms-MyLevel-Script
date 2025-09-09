//=============================================================================
// TS_D10_0600_PushOff.
//=============================================================================
class TS_D10_0600_PushOff extends TriggeredScript
	placeable;

var Pawn Pawn_Push;

state Triggered
{
	function OnTrigger()
	{
		GoToState( 'Push' );
	}

	Begin:

	Pawn_Push = GetPawn( 'IG_21_01' );

	if ( Pawn_Push != None )
	{
		Pawn_Push.Health = 1;
	}
}

function ACTION_PushKarmaActorDirect( Actor karmaActor, float pushForce, Actor targetActor, optional rotator pushRotation )
{
	local vector v_push, PushAngVel;

	if (targetActor != None)
	{
		v_push = Normal(targetActor.Location - karmaActor.Location);
	}
	else  // use PushRotation as direction...
	{
		v_push = Vector(PushRotation);
	}

	v_push = v_push * PushForce;

	karmaActor.KWake();
	PushAngVel = Normal(v_push) Cross ( Normal(v_push) * vect(1,1,0)) * pushForce;
	karmaActor.KSetSkelVel( v_push, PushAngVel );
	karmaActor.KAddImpulse(v_push, karmaActor.Location + vect(0,0,64) );

	SetSucceeded( true );
}

state Push
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	if ( Pawn_Push != None )
	{
		SLog( "**** Pushed ****" );

		sleep( 0.1 );
		ACTION_PushKarmaActorDirect( Pawn_Push, 250, Self );
	}

	ACTION_TriggerEvent( Event );

	ScriptEnd:
}
