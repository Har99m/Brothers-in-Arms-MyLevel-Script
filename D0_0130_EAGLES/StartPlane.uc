//=============================================================================
// StartPlane.
//=============================================================================
class StartPlane extends TriggeredScript
	placeable;

state triggered
	{
		Begin:
				ACTION_PlayAnim( 'Planes_Steady_01' , 'c47_low_4', 0.2 , 1.0 , TRUE );
				ACTION_PlayAnim( 'Planes_Steady_02' , 'c47_low_2', 0.2 , 1.0 , TRUE );
				ACTION_PlayAnim( 'Planes_Steady_03' , 'c47_low_1', 0.2 , 1.5 , TRUE );
				ACTION_PlayAnim( 'Planes_Steady_04' , 'c47_low_2', 0.2 , 1.0 , TRUE );
				ACTION_PlayAnim( 'Planes_Steady_05' , 'c47_low_2', 0.2 , 1.0 , TRUE );
				ACTION_PlayAnim( 'Planes_Steady_06' , 'c47_low_2', 0.2 , 1.0 , TRUE );
				ACTION_PlayAnim( 'Planes_Steady_07' , 'c47_low_2', 0.2 , 1.0 , TRUE );
				ACTION_PlayAnim( 'Planes_Steady_08' , 'c47_low_2', 0.2 , 1.0 , TRUE );
				ACTION_PlayAnim( 'Planes_FlakPlaneCrash' , 'c47_low_2', 0.2 , 1.0 , TRUE );
	}
