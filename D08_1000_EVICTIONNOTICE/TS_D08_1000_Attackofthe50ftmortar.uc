//=============================================================================
// TS_D08_1000_Attackofthe50ftmortar.
//=============================================================================
class TS_D08_1000_Attackofthe50ftmortar extends TriggeredScript
	placeable;

var int BodyCount, iRand, iRand2;

var Actor myMortar, LookTarget;
var float fDistance;
var bool bMortarStatus;
var WeapDEMortar myMortarActor;

var Pawn Player;

var Unit GermanUnit[3];

State Triggered
{
Begin:

	GermanUnit[1] = Unit( GetFirstActor( 'Unit_DE_C2_Mortar' ));

	If ( Unit( GetFirstActor( 'Unit_DE_C2_Mortar' )).GetNumLivingMembers() > 0 )
	{
		gotoState('WaveOne');
	} Else {
		GotoState('WaveTwo');
	}
}

State WaveOne
{
	Function OnTrigger()
	{
		GotoState('WaveTwo');
	}
Begin:

	GermanUnit[1] = Unit( GetFirstActor( 'Unit_DE_C2_Mortar' ));

	myMortar = GetFirstActor( 'Mortar01' );
	myMortarActor = WeapDEMortar( GetFirstActor( 'Mortar01' ));
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
					ACTION_SetMortarTargetByName( 'Mortar01', 'LT_Mortar_Path01',  MortarFire_Marching, 6, 4.0, 4500.0 );
					break;
				Case 1:
					ACTION_SetMortarTargetByName( 'Mortar01', 'LT_Mortar_Path02',  MortarFire_Marching, 6, 4.0, 4500.0 );
					break;
				Case 2:
					ACTION_SetMortarTargetByName( 'Mortar01', 'LT_Mortar_Path03',  MortarFire_Marching, 6, 4.0, 4500.0 );
					break;
				Default:
					break;
			}
		}
		ELSE IF ( fDistance < 5600.0 )
		{
			iRand2 = Rand( 2500 );
			ACTION_SetMortarTargetByName( 'Mortar01', 'LT_Mortar_Random01', MortarFire_Effect, 6, 1.75, iRand2 );
		}
		sleep(2.0);

		ACTION_WaitForEvent('M1Done');
	}
	
}

/*

State WaveTwo
{
	Function OnTrigger()
	{
		//  no
	}
Begin:

	SLog("MORTAER TEAM WAVE TWO RUNNING");

	GermanUnit[1] = Unit( GetFirstActor( 'Unit_DE_C5_Mortar' ));

	myMortar = GetFirstActor( 'Mortar02' );
	myMortarActor = WeapDEMortar( GetFirstActor( 'Mortar02' ));
	Player = GetLocalPlayerPawn();

	SLog("MORTAR TESM:LKSDJFK:LSDLJ OPIUL:IUL:JKLN:MK  OUIPJKL:  MOPUIJLK: OUIPL:JK OUIP)*#)(*W#(*_$&(*&{()I _(N _(* )(* )(* )(* )(* )(* N)(* )(* )( " );

	GermanUnit[1] = Unit( GetFirstActor( 'Unit_DE_C5_Mortar' ));

	While ( GermanUnit[1].GetNumLivingMembers() > 0 )
	{

	SLog("MORTAR TESM:LKSDJFK:LSDLJ OPIUL:IUL:JKLN:MK  OUIPJKL:  MOPUIJLK: OUIPL:JK OUIP)*#)(*W#(*_$&(*&{()I _(N _(* )(* )(* )(* )(* )(* N)(* )(* )( " );

		iRand = Rand( 5 );
		Switch( iRand )
		{

			Case 0:
				ACTION_SetMortarTargetByName( 'Mortar02', 'LT_Mortar2_Path01',  MortarFire_Marching, 6, 2.0, 4500.0 );
				break;
			Case 1:
				ACTION_SetMortarTargetByName( 'Mortar02', 'LT_Mortar2_Path02',  MortarFire_Marching, 6, 2.0, 4500.0 );
				break;
			Case 2:
				ACTION_SetMortarTargetByName( 'Mortar02', 'LT_Mortar2_Path03',  MortarFire_Marching, 6, 2.0, 4500.0 );
				break;
			Case 3:
				ACTION_SetMortarTargetByName( 'Mortar02', 'LT_Mortar_Path04',  MortarFire_Marching, 6, 2.0, 4500.0 );
				break;
			Case 4:
				ACTION_SetMortarTargetByName( 'Mortar02', 'LT_Mortar_Path05',  MortarFire_Marching, 6, 2.0, 4500.0 );
				break;
			Default:
				break;

		}
		
		sleep(1.0);
		ACTION_WaitForEvent('M2Done');
	}
}

*/
