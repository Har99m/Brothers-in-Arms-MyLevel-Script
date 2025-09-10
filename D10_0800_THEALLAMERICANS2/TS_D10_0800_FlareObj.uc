//=============================================================================
// TS_D10_0800_FlareObj.
//=============================================================================
class TS_D10_0800_FlareObj extends TriggeredScript
	placeable;

var UsableUSSmoke UUS_Ref;

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

State Triggered
{
	Function OnTrigger()
	{
		//
	}

	Begin:



	// display objective stuff here :
	ACTION_SetObjectiveStatus( 3, OI_Complete, 'ObjectiveList' );
	ACTION_DisplayObjective(3, 'ObjectiveList', 2);
	sleep(4.0);
					
	ACTION_SetObjectiveStatus( 4, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective(4, 'ObjectiveList', 4);
	sleep(6.0);

	ACTION_DisplayObjectiveHint(S_Localize("HINT_I"), 4.0 );
	

	// the script is initialized, turns on the flare trigger
	ACTION_TriggerEvent( 'gbxTrig_FlareObj' );

	// waiting for the flare trigger to be used
	ACTION_WaitForEvent( 'EVENT_FlareObj' );
	ACTION_DestroyActor( 'gbxTrig_FlareObj' );

	// Setup Smoke Grenade
	ThrowAnim( GetLocalPlayerPawn() );
	sleep( 1.56 );

	UUS_Ref = Spawn(class'UsableUSSmoke', GetLocalPlayerPawn() );
	UUS_Ref.Instigator = GetLocalPlayerPawn();
	UUS_Ref.Prepare();
	UUS_Ref.Use(0);

	// Setup smoke
	GetFirstActor('PFX_FLARE_OBJ').SetLocation( UUS_Ref.Grenade.Location );
	GetFirstActor('PFX_FLARE_OBJ').SetBase( UUS_Ref.Grenade );

	// Start flare and play sound
	ACTION_PlaySound( 'PFX_FLARE_OBJ', "GEAR.FLARE", 1.0, 1.0, 2048 );
	ACTION_TriggerEvent( 'PFX_FLARE_OBJ' );

	ACTION_TriggerEvent('TS_D10_0800_BOMBS');

	// Display Objective Complete
	ACTION_SetObjectiveStatus( 4, OI_Complete, 'ObjectiveList' );
	ACTION_DisplayObjective(4, 'ObjectiveList', 4);

			sleep( 1.8 );

	//===== Tank A makes it's entrance
		ACTION_TriggerEvent( 'TankSpawner_US_Outro_A' );
		Tank( GetPawn( 'AP_Tank_US_Outro_A' )).MaxThrust = 140 ;
			sleep( 0.5 );
		ACTION_OrderMove( 'Unit_US_Tank_Outro_A' , 'PN_Outro_Tank_A' );
			sleep( 0.7 );

	//===== Tank B makes it's entrance
		ACTION_TriggerEvent( 'pfx_Outro_Tank_Entrance' );
		ACTION_PlaySound( 'LT_Outro_Wall_Explode' , "EXPLOSIONS.HOUSE_EXT" , 1.0 , 1.0 , 16000 );
			sleep( 0.5 );
		ACTION_TriggerEvent( 'TankSpawner_US_Outro_B' );
		Tank( GetPawn( 'AP_Tank_US_Outro_B' )).MaxThrust = 112 ;
			sleep( 0.5 );
		ACTION_OrderMove( 'Unit_US_Tank_Outro_B' , 'PN_Outro_Tank_B' );

	// set objective to complete :
	ACTION_TriggerEvent('TS_D10_0800_Outro');

	ScriptEnd:
}

