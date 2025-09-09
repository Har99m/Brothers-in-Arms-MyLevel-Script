//=============================================================================
// TS_D07_1500_FadeDistance.
//=============================================================================
class TS_D07_1500_FadeDistance extends TriggeredScript
	placeable;

var ZoneInfo ziZone;
var ParallaxSkyZoneInfo psziZone;

var float ziFadeMaxStart, ziFadeMaxEnd, ziFadeMinStart, ziFadeMinEnd;
var float psziFadeMaxStart, psziFadeMaxEnd, psziFadeMinStart, psziFadeMinEnd;
var float ziCurFadeMax, ziCurFadeMin;
var float psziCurFadeMax, psziCurFadeMin;

var TS_D07_1500_CheckPoint03_Setup CP3_ref;
var TS_D07_1500_CheckPoint04_Setup CP4_ref;

state Triggered
{
	function OnTrigger()
	{
		gotostate( 'FadeIn', 'Begin' );
	}
Begin:

	ziZone = ZoneInfo( GetFirstActor( 'ZoneInfo' ));
	psziZone = ParallaxSkyZoneInfo( GetFirstActor( 'ParallaxSkyZoneInfo' ));

	CP3_ref = TS_D07_1500_CheckPoint03_Setup( GetFirstActor( 'TS_D07_1500_CheckPoint03_Setup' ));
	CP4_ref = TS_D07_1500_CheckPoint04_Setup( GetFirstActor( 'TS_D07_1500_CheckPoint04_Setup' ));


	if( !CP3_ref.bCheckpointLoaded && !CP4_ref.bCheckpointLoaded )
	{

		// Set Distance Fade Values to the defaults
		ziZone.DistanceFade.Max = 8000;
		ziZone.DistanceFade.Min = 6000;
		psziZone.DistanceFadeInverse.Max = 8000;
		psziZone.DistanceFadeInverse.Min = 6000;

		// Set the ZoneInfo Distances
		ziFadeMaxStart = 8000;
		ziFadeMaxEnd = 15000;
		ziFadeMinStart = 6000;
		ziFadeMinEnd = 13000;

		// Set the ParallaxSkyZoneInfo Distances
		psziFadeMaxStart = 8000;
		psziFadeMaxEnd = 15000;
		psziFadeMinStart = 6000;
		psziFadeMinEnd = 13000;

		// Set up other variables
		ziCurFadeMax = ziFadeMaxStart;
		ziCurFadeMin = ziFadeMinStart;
		psziCurFadeMax = psziFadeMaxStart;
		psziCurFadeMin = psziFadeMinStart;

		do
		{
			// Push out fade distance for tank combat
			ziZone.DistanceFade.Max = ziCurFadeMax += 50.0;
			ziZone.DistanceFade.Min = ziCurFadeMin += 50.0;
			psziZone.DistanceFadeInverse.Max = psziCurFadeMax += 50.0;
			psziZone.DistanceFadeInverse.Min = psziCurFadeMin += 50.0;

			Sleep( 0.02 );
			slog( "***** Repeat ******" );

		} Until( ziCurFadeMax == ziFadeMaxEnd )

		// Make sure the right values are set
		ziZone.DistanceFade.Max = 15000;
		ziZone.DistanceFade.Min = 13000;
		psziZone.DistanceFadeInverse.Max = 15000;
		psziZone.DistanceFadeInverse.Min = 13000;

		slog( "***** Finished adjusting fade distance. ******" );

	}

	else if( CP3_ref.bCheckpointLoaded || CP4_ref.bCheckpointLoaded )
	{
		slog( "***** Reloaded from a checkpoint, skip the first fade distance push out. ******" );
	}

}

state FadeIn
{
	function OnTrigger(){}
	Begin:

	ziZone = ZoneInfo( GetFirstActor( 'ZoneInfo' ));
	psziZone = ParallaxSkyZoneInfo( GetFirstActor( 'ParallaxSkyZoneInfo' ));

	CP3_ref = TS_D07_1500_CheckPoint03_Setup( GetFirstActor( 'TS_D07_1500_CheckPoint03_Setup' ));
	CP4_ref = TS_D07_1500_CheckPoint04_Setup( GetFirstActor( 'TS_D07_1500_CheckPoint04_Setup' ));

	if( !CP4_ref.bCheckpointLoaded )
	{
		// Set the ZoneInfo Distances
		ziFadeMaxStart = 15000;
		ziFadeMaxEnd = 8000;
		ziFadeMinStart = 13000;
		ziFadeMinEnd = 6000;

		// Set the ParallaxSkyZoneInfo Distances
		psziFadeMaxStart = 15000;
		psziFadeMaxEnd = 8000;
		psziFadeMinStart = 13000;
		psziFadeMinEnd = 6000;

		// Set up other variables
		ziCurFadeMax = ziFadeMaxStart;
		ziCurFadeMin = ziFadeMinStart;
		psziCurFadeMax = psziFadeMaxStart;
		psziCurFadeMin = psziFadeMinStart;

		do
		{
			// Pull in fade distance for Hill30
			ziZone.DistanceFade.Max = ziCurFadeMax -= 50.0;
			ziZone.DistanceFade.Min = ziCurFadeMin -= 50.0;
			psziZone.DistanceFadeInverse.Max = psziCurFadeMax -= 50.0;
			psziZone.DistanceFadeInverse.Min = psziCurFadeMin -= 50.0;

			Sleep( 0.02 );
			slog( "***** Repeat ******" );

		} Until( ziCurFadeMax == ziFadeMaxEnd )

		// Make sure the right values are set
		ziZone.DistanceFade.Max = 8000;
		ziZone.DistanceFade.Min = 6000;
		psziZone.DistanceFadeInverse.Max = 8000;
		psziZone.DistanceFadeInverse.Min = 6000;

	}

	else if( CP4_ref.bCheckpointLoaded )
	{
		// Make sure the right values are set
		ziZone.DistanceFade.Max = 8000;
		ziZone.DistanceFade.Min = 6000;
		psziZone.DistanceFadeInverse.Max = 8000;
		psziZone.DistanceFadeInverse.Min = 6000;
	}
		slog( "***** Finished adjusting fade distance. ******" );
}
