// =============================================================================
// DD_GliderLandingScript.
// =============================================================================
class DD_GliderLandingScript extends TriggeredScript
	placeable;

var() edfindable AnimPawn GliderPawn;	// Used to reference the correct glider AnimPawn
var() name GliderAnimName;				// Used to play correct glider animation

var() name PilotPawnTag;				// Used to name pilot
var() name PilotCharacter;				// Used to set the correct head on the pilot

var() name GliderParticle;				// Used to turn off circling glider
var() name DustParticle;				// Used to turn on dust effect during landing

var() float fTime[4];					// Wait time till trigger mover, dust, then event

var() edfindable DD_PoleManagerScript PoleManager1;
var() edfindable DD_PoleManagerScript PoleManager2;
var() edfindable DD_PoleManagerScript PoleManager3;

var() name MoverTag;

var bool bIsLanding;
var AnimPawn Pawn_Pilot;

var int SoundID;

// =============================================================================
// Spawn and initialize Pilot
// =============================================================================
function AnimPawn SpawnPilot( name PilotTag )
{
	local AnimPawn AP_GliderPilot;

	ACTION_TriggerEvent( AttachTag );
	AP_GliderPilot = AnimPawn( GetFirstActor(PilotTag) );

	AP_GliderPilot.Controller.bGodMode = TRUE;
	AP_GliderPilot.SetCollision( FALSE, FALSE, FALSE );
	AP_GliderPilot.bCollideWorld = FALSE;
	AP_GliderPilot.SetPhysics( PHYS_NONE );

	return AP_GliderPilot;
}

// =============================================================================
// Starts on level load
// =============================================================================
state Default
{
	Begin:

	bIsLanding = FALSE;
	GliderPawn.bCanBeBaseForPawns = TRUE;
	ACTION_SetAnimSetDirect( GliderPawn, "k_vehicle_us.glider" );

	do
	{
		sleep( 30.0 );
	} until ( PoleManager1.bGroupDestroyed && PoleManager2.bGroupDestroyed && PoleManager3.bGroupDestroyed );

	GoToState( 'Triggered' );
}

state Triggered
{
	Begin:

	bIsLanding = TRUE;

	// Disable Circling Glider Particle
	ACTION_TriggerEvent( GliderParticle );

	// Send Glider In For Landing
	ACTION_PlayAnimDirect( GliderPawn, GliderAnimName, 0.0, 1.0 );
	GliderPawn.bHidden = FALSE;

	// Spawn and Initialize the pilot
	Pawn_Pilot = SpawnPilot( PilotPawnTag );

	ACTION_SetAnimSetDirect( Pawn_Pilot, "a_cin_d0_Rommels_asparagus.a_cin_d0_Rommels_asparagus" );
	ACTION_PlayAnimWithQueueDirect( Pawn_Pilot, 'pilot_idle', 0.1, 1.0, TRUE );

	GliderPawn.SetCollision( !GliderPawn.bCollideActors, !GliderPawn.bBlockActors, !GliderPawn.bBlockPlayers );
	GliderPawn.AttachToBone( Pawn_Pilot, 'Bone02' );

	Pawn_Pilot.SetRelativeRotation( rot(16384.0, -16384.0, 32768.0) ); 	// yaw, roll, pitch
	Pawn_Pilot.SetRelativeLocation( vect(134.0, 93.0, 73.0) );			// left/right, down/up, foward/backward

	// Start the TIMER
	ResetAbsoluteTime();
	StartAbsoluteTime();

	// Move mover with glider for collision
	WaitForAbsoluteTime( fTime[0] );
	ACTION_TriggerEvent( MoverTag );
	GetFirstActor( MoverTag ).SetCollision( TRUE, FALSE, TRUE );

	// Attach dust for the move across the field
	WaitForAbsoluteTime( fTime[1] );

	ACTION_PlaySound( PilotPawnTag, "D02000_SOUNDS.GLIDERBOUNCE", 1.0, 64.0, 4096.0 );

	if ( Tag == 'DD_GliderLandingScript' )
		sleep( 1.0 );

	SoundID = ACTION_PlaySoundReturnHandle( PilotPawnTag, "D02000_SOUNDS.GLIDERLAND", 1.0, 64.0, 4096.0 );

	GliderPawn.AttachToBone( GetFirstActor(DustParticle), 'Bone08' );
	ACTION_TriggerEvent( DustParticle );

	// Trigger an event
	WaitForAbsoluteTime( fTime[2] );
	ACTION_TriggerEvent( Event );

	WaitForAbsoluteTime( fTime[3] );

	GliderPawn.StopSound( SoundID, 2.0 );

	StopAbsoluteTime();

	bIsLanding = false;

	ScriptEnd:
}
