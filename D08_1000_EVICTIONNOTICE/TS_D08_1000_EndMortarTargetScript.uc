//=============================================================================
// TS_D08_1000_EndMortarTargetScript.
//=============================================================================
class TS_D08_1000_EndMortarTargetScript extends TriggeredScript
	placeable;

var int BodyCount, iRand, iRand2;

var Actor myMortar, LookTarget;
var float fDistance;
var bool bMortarStatus;
var WeapDEMortar myMortarActor;

var Pawn Player;

var Unit GermanUnit;

State Triggered
{
Begin:

	sleep(1.0);
	SLog("MORTAER TEAM WAVE TWO RUNNING");

	GermanUnit = Unit( GetFirstActor( 'Unit_DE_C5_Mortar' ));

	myMortar = GetFirstActor( 'Mortar02' );
	myMortarActor = WeapDEMortar( GetFirstActor( 'Mortar02' ));
	Player = GetLocalPlayerPawn();

	GermanUnit = Unit( GetFirstActor( 'Unit_DE_C5_Mortar' ));

	While ( GermanUnit.GetNumLivingMembers() > 0 )
	{

		iRand = Rand( 5 );
		Switch( iRand )
		{

			Case 0:
				ACTION_SetMortarTargetByName( 'Mortar02', 'LT_Mortar2_Path01',  MortarFire_Marching, 6, 4.25, 4500.0 );
				break;
			Case 1:
				ACTION_SetMortarTargetByName( 'Mortar02', 'LT_Mortar2_Path02',  MortarFire_Marching, 6, 4.25, 4500.0 );
				break;
			Case 2:
				ACTION_SetMortarTargetByName( 'Mortar02', 'LT_Mortar2_Path03',  MortarFire_Marching, 6, 4.25, 4500.0 );
				break;
			Case 3:
				ACTION_SetMortarTargetByName( 'Mortar02', 'LT_Mortar2_Path04',  MortarFire_Marching, 6, 4.25, 4500.0 );
				break;
			Case 4:
				ACTION_SetMortarTargetByName( 'Mortar02', 'LT_Mortar2_Path05',  MortarFire_Marching, 6, 4.25, 4500.0 );
				break;
			Default:
				break;

		}
		
		sleep(1.0);
		ACTION_WaitForEvent('M2Done');
	}
}
