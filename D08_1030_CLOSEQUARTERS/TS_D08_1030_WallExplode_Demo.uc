//=============================================================================
// TS_D08_1030_WallExplode_Demo.
//=============================================================================
class TS_D08_1030_WallExplode_Demo extends TriggeredScript
	placeable;

var AnimPawn AP_WallCollapse;

state Default
	{
	Begin:

	AP_WallCollapse = AnimPawn( GetPawn( 'AP_WallCollapse' ));
	ACTION_SetAnimSet( 'AP_WallCollapse', "k_prop.cq_wall_explode" );

	}

state Triggered
	{
	Begin:

	ACTION_SetHidden( 'AP_WallCollapse' , FALSE );
	ACTION_PlayAnimDirect( AP_WallCollapse, 'cq_wall_explode', 0.2, 1.0,false,,,1);

	}
