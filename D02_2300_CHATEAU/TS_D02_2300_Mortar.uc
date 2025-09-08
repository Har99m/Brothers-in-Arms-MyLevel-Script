//=============================================================================
// TS_D02_2300_Mortar.
//=============================================================================
class TS_D02_2300_Mortar extends TriggeredScript
	placeable;

var int BodyCount, iRand, iRand2;

var Actor myMortar , LookTarget , SM_C3_Wall_01;
var float fDistance;
var bool bMortarStatus;
var WeapDEMortar myMortarActor;

var Pawn Player;

var TS_D02_2300_CP3_Misc CP3_Load_Ref ;

var Unit GermanUnit[3];

state Default
{
	Begin:

	myMortar = GetFirstActor( 'C3_Mortar' );

	GetFirstActor('StaticMeshActor_MortarPropsEnd').bHidden=True;
	GetFirstActor('StaticMeshActor_MortarPropsEndB').bHidden=True;
	GetFirstActor('StaticMeshActor_MortarPropsEnd').SetCollision( FALSE,FALSE,FALSE );

	sleep( 0.5 );
	myMortar.bHidden = TRUE;
	myMortar.SetCollision( FALSE, FALSE, FALSE );
}

State Triggered
	{
		Begin:

	myMortar.bHidden = FALSE;
	myMortar.SetCollision( TRUE, TRUE, TRUE );

			//===== Define wall mesh pieces
				SM_C3_Wall_01 = GetFirstActor( 'SM_C3_Wall_01' );

				CP3_Load_Ref = TS_D02_2300_CP3_Misc( GetFirstActor( 'TS_D02_2300_CP3_Misc' ));

			//===== Enable Mortar recruiting
				ACTION_EnableMortarRecruiting( 'C3_Mortar' , TRUE );

			//===== If checkpoint 3 has just been loaded, set wall as blown up

				if	(	CP3_Load_Ref.bCP3_Loaded == FALSE	)
						{
									sleep( 0.2 );

							//===== Trigger fake mortar explosions leading up to wall explosion
								ACTION_TriggerEvent( 'gbxExTrig_Mortar_03' );
									sleep( 1.3 );

								ACTION_TriggerEvent( 'gbxExTrig_Mortar_04' );
									sleep( 1.3 );

								ACTION_TriggerEvent( 'gbxExTrig_Mortar_05' );
								ACTION_TriggerEvent( 'PFX_WALLBEGONE' );
							ACTION_SetObjectiveStatus( 0 , OI_Complete , 'ObjectiveList' );
							ACTION_SetObjectiveStatus( 1 , OI_Active , 'ObjectiveList' );
							ACTION_DisplayObjective( 1 , 'ObjectiveList' , 3.0 );

						}

					ACTION_UnblockNavPoints( 'PN_C3_Wall' );
					ACTION_TriggerEvent( 'BVT_C3_Wall' );
					GetFirstActor('SM_C3_Wall_01').SetCollision(FALSE,FALSE,FALSE);
					SM_C3_Wall_01.bHidden = TRUE ;

	GetFirstActor('StaticMeshActor_MortarPropsEnd').bHidden=False;
	GetFirstActor('StaticMeshActor_MortarPropsEndB').bHidden=False;
	GetFirstActor('StaticMeshActor_MortarPropsEnd').SetCollision( True,True,True );

						sleep( 2.0 );

		gotoState('WaveOne');
	}



State WaveOne
	{

			Function OnTrigger()
				{
					GotoState('WaveTwo');
				}

		Begin:

				GermanUnit[1] = Unit( GetFirstActor( 'UNIT_C300' ));

				Player = GetLocalPlayerPawn();

				WHILE ( GermanUnit[1].GetNumLivingMembers() > 0 )
					{
						fDistance = VSize( myMortar.Location - Player.Location );
						SLog( "fDistance: " $ fDistance );

							IF ( fDistance > 5600.0 )
								{

									iRand = Rand( 3 );

										Switch( iRand )
											{
												Case 0:
													ACTION_SetMortarTargetByName( 'C3_Mortar', 'LT_Mortar_Path01',  MortarFire_Marching, 6, 1.5, 4500.0 );
														break;
												Case 1:
													ACTION_SetMortarTargetByName( 'C3_Mortar', 'LT_Mortar_Path02',  MortarFire_Marching, 6, 1.5, 4500.0 );
														break;
												Case 2:
													ACTION_SetMortarTargetByName( 'C3_Mortar', 'LT_Mortar_Path03',  MortarFire_Marching, 6, 1.5, 4500.0 );
														break;
												Default:
														break;
											}
								}

							ELSE IF ( fDistance < 5600.0 )
								{
									iRand2 = Rand( 4096 );

									ACTION_SetMortarTargetByName( 'C3_Mortar', 'LT_Mortar_Random01', MortarFire_Effect, 6, 1.75, iRand2 );
								}

							sleep(1.0);

						ACTION_WaitForEvent('MortarDone');
					
					}


	}

