//=============================================================================
// TS_StartRain.
//=============================================================================
class TS_StartRain extends TriggeredScript
	placeable;

var Actor A_Player, A_Emitter;
var Vector vLocation;

var float fAdjust;

state Default
{
	Begin:

	A_Player = GetLocalPlayerPawn();
	A_Emitter = GetFirstActor( 'Emitter_Rain' );

	ACTION_StartRain( 1, FALSE );

	if ( A_Player != None && A_Emitter != None )
	{
		while ( TRUE )
		{
			vLocation = A_Player.Location;
			vLocation.z = -843.0;
			// vLocation.y = FClamp( vLocation.y, -4156, 12000 );

			A_Emitter.SetLocation( vLocation );

			sleep( 0.1 );
		};
	}
}

state Triggered
{
	function OnTrigger()
	{	
	}

	Begin:

	fAdjust = 0.9;
	while ( fAdjust > 0.1 )
	{
		ACTION_AdjustRain( fAdjust );
		Emitter(A_Emitter).Emitters[0].Opacity = Emitter(A_Emitter).Emitters[0].Opacity * fAdjust;
		Emitter(A_Emitter).Emitters[1].Opacity = Emitter(A_Emitter).Emitters[1].Opacity * fAdjust;

		fAdjust -= 0.1;
		sleep( 1.0 );
	}

	ACTION_TriggerEvent( 'Emitter_Rain' );
	ACTION_StopRain();

	ScriptEnd:
}
