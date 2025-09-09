//=============================================================================
// TS_D10_0600_DemiDoyle.
//=============================================================================
class TS_D10_0600_DemiDoyle extends TriggeredScript
	placeable;

var gbxPawn gbxPawn_Doyle, gbxPawn_Paige;
var Tank Tank_DeadTank;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	sleep( 1.0 );

	gbxPawn_Doyle = gbxPawn( GetPawn('Doyle_Midtro1') );
	gbxPawn_Paige = gbxPawn( GetPawn('Paige_Midtro1') );
	Tank_DeadTank = Tank( GetPawn('TP_DeadTank') );

	if ( gbxPawn_Doyle != None )
	{
		gbxPawn_Doyle.Controller.bDemiGod = TRUE;
		ACTION_SetRepelBulletsDirect( gbxPawn_Doyle, TRUE );
	}
	else
	{
		SLog( "**** Error Doyle not set to demigod ****" );
	}

	if ( gbxPawn_Paige != None )
	{
		gbxPawn_Paige.Controller.bDemiGod = TRUE;
		ACTION_SetRepelBulletsDirect( gbxPawn_Paige, TRUE );
	}
	else
	{
		SLog( "**** Error Paige not set to demigod ****" );
	}

	if ( Tank_DeadTank != None )
	{
		Tank_DeadTank.Health = 1;
		Tank_DeadTank.bExcludeFromOracleCam = TRUE;
		SpecialTakeDamage( Tank_DeadTank, 500, None, Tank_DeadTank.Location, vect(0,0,0), class'DamageGammonBomb' );
		Tank_DeadTank.Health = 0;
	}
	else
	{
		SLog( "**** Error Dead Tank not found ****" );
	}

	ScriptEnd:
}

function SpecialTakeDamage( Tank MyTank, int Damage, Pawn instigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> DamageType, optional name HitBoxName)
{
	local int actualDamage;
	local Controller Killer;
	local vector v_push, PushAngVel;
	local vector RotX, RotY, RotZ;

	MyTank.GetAxes(MyTank.Rotation,RotX,RotY,RotZ);

	if ( MyTank.Controller != None )
	{
		MyTank.Controller.NotifyTakeHit(instigatedBy, HitLocation, actualDamage, DamageType, Momentum);
	}

	MyTank.KarmaSleepTime = Level.TimeSeconds + 3.0;  // put back to sleep again in 3.0 seconds

	if (instigatedBy != None)
		Killer = instigatedBy.Controller;

	MyTank.NotifyPlayersIDied(); // this MUST come before the Died() function is called
	MyTank.Died(Killer, damageType, HitLocation);

	MyTank.FireBurningSound = Sound( DynamicLoadObject( MyTank.FireBurningSoundName, class'Sound' ) );
	MyTank.FireBurningSoundHandle = PlaySound(MyTank.FireBurningSound);
	MyTank.FireBurningSoundDecayStart = MyTank.fTankDeathTime + 30.0f;

	// make dead tanks easier to push around...
	MyTank.ParkingDampFactor = 0.1;
	MyTank.LateralDampFactor = 0.3;
	MyTank.DecelerateDampFactor = 0.2;
	MyTank.UprightDamping = MyTank.UprightDamping * 0.1;

	Momentum = Normal(Momentum) * 20000.0;

	if (Momentum.Z > 10000)
		Momentum.Z = 10000;

	v_push = Momentum * MyTank.PushForce;

	PushAngVel = Normal(v_push) Cross ( Normal(v_push) * vect(1,1,0)) * MyTank.PushForce;
	MyTank.KSetSkelVel( v_push, PushAngVel );
	MyTank.KAddImpulse(v_push, Location);

	// spawn the TankBlowedUp emitter...
	MyTank.BlowedUpEmitter = TankBlowedUp( GetFirstActor('TankBlowedUp_World') );

	if (MyTank.BlowedUpEmitter != None)
	{
		MyTank.BlowedUpEmitter.SetLocation( MyTank.Location + MyTank.BlowedUpEmitterOffset );
		MyTank.BlowedUpEmitter.SetRotation( MyTank.Rotation );
		MyTank.BlowedUpEmitter.SetBase(MyTank);

		MyTank.BlowedUpEmitter.SmokeIndexOpacity = 0;
		MyTank.BlowedUpEmitter.FireIndexStartSizeRange = 1;
		MyTank.BlowedUpEmitter.FireIndexOpacity = 1;

		ACTION_TriggerEvent( 'TankBlowedUp_World' );

		MyTank.fBlowedUpFireDecayTime = Level.TimeSeconds + MyTank.FireDecayStartTime;
	}
}
