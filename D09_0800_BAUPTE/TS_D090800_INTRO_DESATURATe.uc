//=============================================================================
// TS_D090800_INTRO_DESATURATe.
//=============================================================================
class TS_D090800_INTRO_DESATURATe extends TriggeredScript
	placeable;

var float i;

State Triggered
{
	Function OnTrigger()
	{
		GotoState('SATURATE');
	}
Begin:
				i=0.0;
					ResetAbsoluteTime();
					StartAbsoluteTime();

				ACTION_SetSaturationEffect( 500.0 );	
					WaitForAbsoluteTime( i+=0.4 );
				ACTION_SetSaturationEffect( 1000.0 );
					WaitForAbsoluteTime( i+=0.4 );
				ACTION_SetSaturationEffect( 1500.0 );
					WaitForAbsoluteTime( i+=0.4 );
				ACTION_SetSaturationEffect( 2000.0 );
					WaitForAbsoluteTime( i+=0.4 );
				ACTION_SetSaturationEffect( 2500.0 );
					WaitForAbsoluteTime( i+=0.4 );
				ACTION_SetSaturationEffect( 3000.0 );	
}

State SATURATE
{
	Function OnTrigger()
	{
		//
	}
Begin:
				i=0.0;
					ResetAbsoluteTime();
					StartAbsoluteTime();

				ACTION_SetSaturationEffect( 2500.0 );	
					WaitForAbsoluteTime( i+=0.5 );
				ACTION_SetSaturationEffect( 2000.0 );
					WaitForAbsoluteTime( i+=0.5 );
				ACTION_SetSaturationEffect( 1500.0 );
					WaitForAbsoluteTime( i+=0.5 );
				ACTION_SetSaturationEffect( 1000.0 );
					WaitForAbsoluteTime( i+=0.5 );
				ACTION_SetSaturationEffect( 500.0 );
					WaitForAbsoluteTime( i+=0.5 );
				ACTION_SetSaturationEffect( 0.0 );	
}
