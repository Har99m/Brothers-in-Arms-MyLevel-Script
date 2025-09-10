//=============================================================================
// TS_D10_0800_Midtro_Random_Dialogue.
//=============================================================================
class TS_D10_0800_Midtro_Random_Dialogue extends TriggeredScript
	placeable;

var int Random_Dialogue ;
var AnimPawn AP_Friar , AP_McConnel , AP_Marsh , AP_Paddock ;

State Triggered
	{
		Begin:

			AP_Friar = AnimPawn( GetPawn( 'AP_Friar' ));
			AP_Marsh = AnimPawn( GetPawn( 'AP_Marsh' ));
			AP_McConnel = AnimPawn( GetPawn( 'AP_McConnel' ));
			AP_Paddock = AnimPawn( GetPawn( 'AP_Paddock' ));

		//===== Wait 7 seconds for PAIGE "SHIT!  SHIT!"
				sleep( 7.0 );

		//===== PADDOCK says random comment ( 1 / 4 )

	if( AP_Paddock.Health > 0 )
		{
			Random_Dialogue = Rand( 4 );
				switch ( Random_Dialogue ) 
					{ 
						Case 0: 
								ACTION_PlayLipSyncSoundDirect( AP_Paddock , "BD_PADDOCK.M_ATTACK_E" , 1.0, 1.0 , 1.0 );
										//-----/ 1.05 /----- Paddock : Fire! NOW!
							break;
						Case 1: 

								ACTION_PlayLipSyncSoundDirect( AP_Paddock , "BD_PADDOCK.M_RETREAT_A" , 1.0, 1.0 , 1.0 );
										//-----/ 2.12 /----- Paddock : Red!  We have to fall back!
							break;
						Case 2: 

								ACTION_PlayLipSyncSoundDirect( AP_Paddock , "BD_PADDOCK.M_SEEENEMYTANK_D" , 1.0, 1.0 , 1.0 );
										//-----/ 1.73 /----- Paddock : Shit, armor!
							break;
						Case 3: 

								ACTION_PlayLipSyncSoundDirect( AP_Paddock , "BD_PADDOCK.M_SUPPRESSINGENEMY_D" , 1.0, 1.0 , 1.0 );
										//-----/ 0.57 /----- Paddock : Just shoot at the krauts!
							break;
					}
		}

				sleep( 3.0 );

		//===== FRIAR says random comment ( 1 / 5 )

	if( AP_Friar.Health > 0 )
		{

			Random_Dialogue = Rand( 4 );
				switch ( Random_Dialogue ) 
					{ 
						Case 0: 
								ACTION_PlayLipSyncSoundDirect( AP_Friar , "BD_FRIAR.M_EVERYONEDYING_B" , 1.0, 1.0 , 1.0 );
										//-----/ 2.18 /----- Friar : Fuck FUUUUCK!
							break;
						Case 1: 

								ACTION_PlayLipSyncSoundDirect( AP_Friar , "BD_FRIAR.M_INCOMINGGRENADE_C" , 1.0, 1.0 , 1.0 );
										//-----/ 1.47 /----- Friar : Ah, SHIT!
							break;
						Case 2: 

								ACTION_PlayLipSyncSoundDirect( AP_Friar , "BD_FRIAR.M_SEEPLAYERHURT_B" , 1.0, 1.0 , 1.0 );
										//-----/ 1.49 /----- Friar : Red!  What the hell!?
							break;
						Case 3: 

								ACTION_PlayLipSyncSoundDirect( AP_Friar , "BD_FRIAR.M_PAIN_F" , 1.0, 1.0 , 1.0 );
										//-----/ 1.61 /----- Friar : Ah, God DAMNIT!
							break;
						Case 4: 

								ACTION_PlayLipSyncSoundDirect( AP_Friar , "BD_FRIAR.M_SUPPRESSINGENEMY_A" , 1.0, 1.0 , 1.0 );
										//-----/ 1.44 /----- Friar : Covering fire!
							break;
					}

		}

				sleep( 7.5 );

		//===== PAIGE SCREAMS AS HE DRAGS PLAYER ( 1 / 2 )

			Random_Dialogue = Rand( 2 );
				switch ( Random_Dialogue ) 
					{ 
						Case 0: 
								ACTION_PlaySound( 'LT_Paige_Speak' , "BD_PAIGE.M_PAIN_F" , 1.0, 1.0, 8192 );
										//-----/ 1.71 /----- Paige : AH!!! God damnit!
							break;
						Case 1: 

								ACTION_PlaySound( 'LT_Paige_Speak' , "BD_PAIGE.M_SUPERPAIN_B" , 1.0, 1.0, 8192 );
										//-----/ 0.57 /----- Paige : Pain sounds
							break;
					}

				sleep( 4.1 );

		//===== McCONNEL says random comment ( 1 / 5 )

	if( AP_McConnel.Health > 0 )
		{
			Random_Dialogue = Rand( 4 );
				switch ( Random_Dialogue ) 
					{ 
						Case 0: 
								ACTION_PlayLipSyncSoundDirect( AP_McConnel , "BD_MCCONNEL.M_EVERYONEDYING_A" , 1.0, 1.0 , 1.0 );
										//-----/ 1.49 /----- McConnel : NOOOOOOOooooooooooo!
							break;
						Case 1: 

								ACTION_PlayLipSyncSoundDirect( AP_McConnel , "BD_MCCONNEL.M_EXPOSEDTOFIRE_B" , 1.0, 1.0 , 1.0 );
										//-----/ 1.67 /----- McConnel : We're out in the open, Red!
							break;
						Case 2: 

								ACTION_PlayLipSyncSoundDirect( AP_McConnel , "BD_MCCONNEL.M_HORROR_A" , 1.0, 1.0 , 1.0 );
										//-----/ 1.73 /----- McConnel : We gotta get out of here soon!
							break;
						Case 3: 

								ACTION_PlayLipSyncSoundDirect( AP_McConnel , "BD_MCCONNEL.M_INCOMING_GRENADE_D" , 1.0, 1.0 , 1.0 );
										//-----/ 0.93 /----- McConnel : Get down!
							break;
						Case 4: 

								ACTION_PlayLipSyncSoundDirect( AP_McConnel , "BD_MCCONNEL.M_RED_A" , 1.0, 1.0 , 1.0 );
										//-----/ 0.61 /----- McConnel : Red!
							break;
					}
		}

				sleep( 3.4 );

		//===== MARSH says random comment ( 1 / 5 )
	if( AP_Marsh.Health > 0 )
		{
			Random_Dialogue = Rand( 4 );
				switch ( Random_Dialogue ) 
					{ 
						Case 0: 
								ACTION_PlayLipSyncSoundDirect( AP_Marsh , "BD_MARSH.M_CANTKILL_A" , 1.0, 1.0 , 1.0 );
										//-----/ 2.32 /----- Marsh : We can't even SCRATCH it with these!
							break;
						Case 1: 

								ACTION_PlayLipSyncSoundDirect( AP_Marsh , "BD_MARSH.M_ENEMYUNSUPPRESED_B" , 1.0, 1.0 , 1.0 );
										//-----/ 1.89 /----- Marsh : Keep shooting!  Keep shooting!
							break;
						Case 2: 

								ACTION_PlayLipSyncSoundDirect( AP_Marsh , "BD_MARSH.M_FIRING_A" , 1.0, 1.0 , 1.0 );
										//-----/ 1.11 /----- Marsh : Firing!
							break;
						Case 3: 

								ACTION_PlayLipSyncSoundDirect( AP_Marsh , "BD_MARSH.M_HEARDNOISE_B" , 1.0, 1.0 , 1.0 );
										//-----/ 1.14 /----- Marsh : What was that?!
							break;
						Case 4: 

								ACTION_PlayLipSyncSoundDirect( AP_Marsh , "BD_MARSH.M_HEAVYFIRE_A" , 1.0, 1.0 , 1.0 );
										//-----/ 1.85 /----- Marsh : This area is too hot, Red!
							break;
					}
		}

				sleep( 3.0 );

		ScriptEnd:
	}
