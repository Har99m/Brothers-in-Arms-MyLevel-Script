//=============================================================================
// TS_D10_0800_Midtro_Tank.
//=============================================================================
class TS_D10_0800_Midtro_Tank extends TriggeredScript
    placeable;

var Tank Panzer ;
var ActorLite PN_Tank_Fire_01 , PN_Tank_Fire_02 ;
var Actor LT_Tank_Shoot ;
var bool bTankFire;

var int i;

State Triggered
    {
        Begin:

            //===== Spawn tank and put into scripted mode
                ACTION_TriggerEvent( 'SpawnTank_DE_Combat4_02' );

                Panzer = Tank( GetPawn( 'Tank_DE_Combat4_02' ));
                PN_Tank_Fire_01 = GetNavigationPoint( 'PN_Tank_Fire_01' );
                PN_Tank_Fire_02 = GetNavigationPoint( 'PN_Tank_Fire_02' );
                LT_Tank_Shoot = GetFirstActor( 'LT_Tank_Shoot' );

                ACTION_TankEnterScriptedMode( Panzer );

            //===== Wait for trigger again before advancing
                ACTION_WaitForEvent( 'Event_Midtro_Tank_Enter' );

            //===== Move tank in
                Panzer.MaxThrust = 200.0 ;
                ACTION_TankMoveTo( Panzer , PN_Tank_Fire_01 );
                While( !ACTION_TankIsAtDestination( Panzer , PN_Tank_Fire_01 ))
                    {
                        ACTION_TankMoveTo( Panzer , PN_Tank_Fire_01 );
                            sleep( 0.1 );
                    }

            //===== Tank has reached destination , sit on it and rotate
                ACTION_TankHalt( Panzer );


                    ACTION_TankSetEnemy( Panzer , LT_Tank_Shoot , TRUE );
                        while ( !ACTION_TankIsAimingAtEnemy( Panzer ) )
                            {
                                sleep( 0.1 );
                            }

                    While ( bTankFire == False )
                    {
                        sleep(0.1);
                    }
		
                    ACTION_TriggerEvent( 'Event_Tank_Has_Shot' );    
						sleep(0.38);
                    ACTION_TankFireCannon( Panzer , TRUE );

            //===== Move tank out
                ACTION_TankSetEnemy( Panzer , None , False );
                ACTION_TankSetSpeed( Panzer, 1.0 );
                Panzer.MaxThrust = Panzer.default.MaxThrust ;

                PN_Tank_Fire_01 = GetNavigationPoint( 'PN_Tank_Fire_02' );
                ACTION_TankMoveTo( Panzer , PN_Tank_Fire_01 );
                
                ACTION_WaitForEvent( 'Event_Tank_Ready_For_Combat' );

                ACTION_TankLeaveScriptedMode( Panzer );
                ACTION_OrderMove( 'UNIT_DE_Tank_Combat4_02' , 'PN_Tank_Fire_02' );

        ScriptEnd:
    }
