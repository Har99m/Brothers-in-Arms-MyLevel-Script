//=============================================================================
// TS_D09_1500_88TreeExplosion.
//=============================================================================
class TS_D09_1500_88TreeExplosion extends TriggeredScript
	placeable;

var bool bReady;
var int i;

var WeapDEPAK88_ Pak88_Ref;

function PostBeginPlay()
{
	Super.PostBeginPlay();

	Pak88_Ref = Pak88Factory( GetFirstActor('Pak88Factory_Hill') ).Gun;

	if ( Pak88_Ref == None )
		Pak88_Ref = WeapDEPAK88_( GetFirstActor('Pak88Factory_Hill') );

	if ( Pak88_Ref != None )
		Pak88_Ref.CurBaseYaw = 19686;
}

state Triggered
{
	function OnTrigger()
	{
		SLog( "**** Player got to the firing position before the 88 was ready to fire ****" );
		bReady = TRUE;
	}

	Begin:

	i = 0;
	bReady = FALSE;

	ACTION_UnBlockNavPoints( 'PN_C1_Blocked' );

	ACTION_Pak88EnterScriptedMode( 'Pak88Factory_Hill' );

	ACTION_Set88TargetByName( 'Pak88Factory_Hill', 'TrigShoot_TS_D09_1500_TreeExplode', TRUE );
	SLog( "**** 88 is moving into aim position for the tree ****" );

	sleep( 8.0 );
	ACTION_TriggerEvent( 'LOSTrig_88TreeExplosion' );

	GoToState( 'WaitingToFire' );
}

state WaitingToFire
{
	function OnTrigger()
	{
		GoToState( 'ReadyToFire' );
	}

	Begin:

	SLog( "**** 88 is ready to fire at the tree ****" );

	if ( bReady )
		GoToState( 'ReadyToFire' );
}

state ReadyToFire
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	ACTION_TriggerEvent( 'CSG_C3U2' );
	ACTION_OrderMove( 'Unit_DE_C3U2', 'PN_U2_SubMoveCrater', TRUE );
	ACTION_OrderMove( 'Unit_DE_C3U2', 'PN_U2_MoveCrater', TRUE );

	SLog( "**** 88 is firing at the tree ****" );

	ACTION_FireAtTarget( 'Pak88Factory_Hill', 'TrigShoot_TS_D09_1500_TreeExplode' );
	sleep( 0.5 );

	ACTION_PlayLocalSound( "D71400_SOUNDS.TREE_EXPLODE" );
	ACTION_TriggerEvent( 'TS_D09_1500_TreeExplode' );

	ACTION_88LeaveScriptedMode( 'Pak88Factory_Hill' );

	ScriptEnd:
}
