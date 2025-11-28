//=============================================================================
// DD_PoleScript.
//=============================================================================
class DD_PoleScript extends TriggeredScript
	placeable;

var() edfindable Actor A_PoleNormal, A_PoleHidden;
var() edfindable KActor KA_Pole;
var() name nEmitterTag;

function Timer()
{
	ACTION_SetPhysics( KA_Pole.Tag, PHYS_None );
}

state Triggered
{
	function OnTrigger()
	{
		SLog( "Explosion, Karma Pole: " $ KA_Pole.bKTakeShot );
	}

	Begin:

	// Hide and turn off collision on regular pole
	A_PoleNormal.bHidden = TRUE;
	A_PoleNormal.SetCollision( !A_PoleNormal.bCollideActors, !A_PoleNormal.bBlockActors, !A_PoleNormal.bBlockPlayers );

	// Turn on pole base
	A_PoleHidden.bHidden = FALSE;

	// Enable karma pole
	KA_Pole.bHidden = FALSE;
	KA_Pole.bKTakeShot = TRUE;
	ACTION_WakeKarmaActor( KA_Pole.Tag );

	// Put pole to sleep in 5.0 seconds
	SetTimer( 8.0, FALSE );

	ACTION_TriggerEvent( nEmitterTag );

	sleep( 0.1 );
	ACTION_PlaySound( KA_Pole.Tag, "D02000_SOUNDS.POLEEXPLOSION", 1.0, 64, 512 );

	ACTION_TriggerEvent( Event );

	ScriptEnd:
}

