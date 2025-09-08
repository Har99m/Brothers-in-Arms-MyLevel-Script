//=============================================================================
// TS_D01_1200_SupplyDrop02Script.
//=============================================================================
class TS_D01_1200_SupplyDrop02Script extends TriggeredScript
	placeable;

var bool bDrop2Marked;
var UsableUSSmoke UUS_Ref;

state Default
{
	Begin:

	bDrop2Marked = false;
}

function ThrowAnim( WargamePawn gbxPP )
{
	local FireSecondaryItem FSI_Self;
	local float AppliedFireRate;

	FSI_Self = FireSecondaryItem(gbxPP.Weapon.FireMode[1]);

	// Play Anim
	if( gbxPP.IsFirstPerson() )
	{
		if( PlayerController(gbxPP.Controller).IsZoomed() )
		{
			gbxPlayerController( gbxPP.Controller ).ChangeView(0);
			gbxPP.Weapon.m_fZoomed = false;
		}

		gbxPP.Weapon.PlayAnim('grenade_throw', 1.0, 0.0 );
	}

	if ( Level.NetMode == NM_Standalone )
		AppliedFireRate = FSI_Self.FireRateSP;

	gbxWeapon(gbxPP.Weapon).m_fCanZoom = false;
	FSI_Self.LastFireTime = Level.TimeSeconds;

	FSI_Self.NextFireTime = Level.TimeSeconds + AppliedFireRate*FSI_Self.Weapon.FireRateAtten;

	// Prevent other animations
	if (FSI_Self.Weapon.FireMode[0] != None)
		FSI_Self.Weapon.FireMode[0].NextFireTime = Level.TimeSeconds + AppliedFireRate*FSI_Self.Weapon.FireRateAtten;
	if (FSI_Self.Weapon.FireMode[2] != None)
		FSI_Self.Weapon.FireMode[2].NextFireTime = Level.TimeSeconds + AppliedFireRate*FSI_Self.Weapon.FireRateAtten;
}

state Triggered
{
	Begin:

	ACTION_DestroyActor( 'gbxTrig_Flare_02' );			// Destroy trigger
	ACTION_DestroyActor( 'WB_SupplyDrop_02' );			// Destroy beacon

	// Setup Smoke Grenade
	ThrowAnim( GetLocalPlayerPawn() );
	sleep( 1.56 );

	UUS_Ref = Spawn( class'UsableUSSmoke', GetLocalPlayerPawn() );
	UUS_Ref.Instigator = GetLocalPlayerPawn();
	UUS_Ref.Prepare();
	UUS_Ref.Use(0);

	// Setup Flare
	GetFirstActor('PFX_FlareThrow2').SetLocation( UUS_Ref.Grenade.Location + vect(0,0,4) );
	GetFirstActor('PFX_FlareThrow2').SetBase( UUS_Ref.Grenade );

	ACTION_PlaySound( 'PFX_FlareThrow2', "GEAR.FLARE", 1.0, 1.0, 2048 );
	ACTION_TriggerEvent( 'PFX_FlareThrow2' );				// Turn on flare

	bDrop2Marked = true;

	ACTION_TriggerEvent( 'TS_D01_1200_SupplyDrop' );	// Ping master script

}
