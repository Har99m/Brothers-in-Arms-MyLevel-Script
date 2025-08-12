//=============================================================================
// TS_D00_1630_FadeDistance.
//=============================================================================
class TS_D00_1630_FadeDistance extends TriggeredScript
	placeable;

var ZoneInfo ziZone;
var ParallaxSkyZoneInfo psziZone;

var float ziFadeMaxStart, ziFadeMaxEnd, ziFadeMinStart, ziFadeMinEnd;
var float psziFadeMaxStart, psziFadeMaxEnd, psziFadeMinStart, psziFadeMinEnd;
var float ziCurFadeMax, ziCurFadeMin;
var float psziCurFadeMax, psziCurFadeMin;

state Triggered
{
	function OnTrigger()
	{
		gotostate( 'FadeIn', 'Begin' );
	}

	Begin:

	ziZone = ZoneInfo( GetFirstActor( 'ZoneInfo' ));
	psziZone = ParallaxSkyZoneInfo( GetFirstActor( 'ParallaxSkyZoneInfo' ));

		// Set Distance Fade Values to the defaults
		ziZone.DistanceFade.Max = 9000;
		ziZone.DistanceFade.Min = 7000;
		psziZone.DistanceFadeInverse.Max = 7000;
		psziZone.DistanceFadeInverse.Min = 5000;

		// Set the ZoneInfo Distances
		ziFadeMaxStart = 9000;
		ziFadeMaxEnd = 15000;
		ziFadeMinStart = 7000;
		ziFadeMinEnd = 13000;

		// Set the ParallaxSkyZoneInfo Distances
		psziFadeMaxStart = 7000;
		psziFadeMaxEnd = 13000;
		psziFadeMinStart = 5000;
		psziFadeMinEnd = 11000;

		// Set up other variables
		ziCurFadeMax = ziFadeMaxStart;
		ziCurFadeMin = ziFadeMinStart;
		psziCurFadeMax = psziFadeMaxStart;
		psziCurFadeMin = psziFadeMinStart;

		do
		{
			// Push out fade distance for halftrack
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
		psziZone.DistanceFadeInverse.Max = 13000;
		psziZone.DistanceFadeInverse.Min = 11000;

		slog( "***** Finished adjusting fade distance. ******" );

}

state FadeIn
{
	function OnTrigger(){}
	Begin:

	ziZone = ZoneInfo( GetFirstActor( 'ZoneInfo' ));
	psziZone = ParallaxSkyZoneInfo( GetFirstActor( 'ParallaxSkyZoneInfo' ));

		// Set the ZoneInfo Distances
		ziFadeMaxStart = 15000;
		ziFadeMaxEnd = 9000;
		ziFadeMinStart = 13000;
		ziFadeMinEnd = 7000;

		// Set the ParallaxSkyZoneInfo Distances
		psziFadeMaxStart = 13000;
		psziFadeMaxEnd = 7000;
		psziFadeMinStart = 11000;
		psziFadeMinEnd = 5000;

		// Set up other variables
		ziCurFadeMax = ziFadeMaxStart;
		ziCurFadeMin = ziFadeMinStart;
		psziCurFadeMax = psziFadeMaxStart;
		psziCurFadeMin = psziFadeMinStart;

		do
		{
			// Pull in fade distance
			ziZone.DistanceFade.Max = ziCurFadeMax -= 50.0;
			ziZone.DistanceFade.Min = ziCurFadeMin -= 50.0;
			psziZone.DistanceFadeInverse.Max = psziCurFadeMax -= 50.0;
			psziZone.DistanceFadeInverse.Min = psziCurFadeMin -= 50.0;

			Sleep( 0.02 );
			slog( "***** Repeat ******" );

		} Until( ziCurFadeMax == ziFadeMaxEnd )

		// Make sure the right values are set
		ziZone.DistanceFade.Max = 9000;
		ziZone.DistanceFade.Min = 7000;
		psziZone.DistanceFadeInverse.Max = 7000;
		psziZone.DistanceFadeInverse.Min = 5000;

		slog( "***** Finished adjusting fade distance. ******" );
}
