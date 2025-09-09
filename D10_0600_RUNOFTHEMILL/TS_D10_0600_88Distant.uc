//=============================================================================
// TS_D10_0600_88Distant.
//=============================================================================
class TS_D10_0600_88Distant extends TriggeredScript
	placeable;

var Actor A_88Emitter;

struct FirePosition
{
	var() const float fDelay;
	var() const rotator Rotation;
	var() const edfindable DynamicProjector DynamicProjector_Enable;
	var() const name nmExplosionTrigger;
};

var(Events) export editinline Array<FirePosition> sFP_Blockade;
var(Events) export editinline Array<FirePosition> sFP_Gate;

var Volume Volume_Blockade, Volume_Gate;

var bool bCanUnTouch, bIsFiring, bBlockade;

var Actor A_Touching;

var int numRand;

function PostBeginPlay()
{
	Super.PostBeginPlay();

	A_88Emitter = GetFirstActor( Event );

	Volume_Blockade = Volume( GetFirstActor('Volume_Blockade') );
	Volume_Gate = Volume( GetFirstActor('Volume_Gate') );

	bCanUnTouch = TRUE;
	bIsFiring = FALSE;
	bBlockade = FALSE;
}

state Triggered
{
	function Timer()
	{
		Super.Timer();

		bCanUnTouch = TRUE;
	}

	function Touch( Actor Other )
	{
		Super.Touch( Other );

		if ( bCanUnTouch )
		{
			if ( Other.IsA('Pawn') && Pawn(Other).PawnTeam == TEAM_US && Pawn(Other).Health  > 0 )
			{
				if ( !bIsFiring )
				{
					SLog( "**** Touch.Other " $ Other $ " ****" );

					bIsFiring = TRUE;
					bCanUnTouch = FALSE;
					SetTimer( 0.3, FALSE );

					A_Touching = Other;

					// Which volume was touched?
					if ( vSize( Self.Location - Other.Location ) < 3400 )
					{
						SLog( "**** Begin Firing at the Blockade ****" );

						bBlockade = TRUE;
						GoToState( 'Triggered', 'Begin' );
					}
					else
					{
						SLog( "**** Begin Firing at the Gate ****" );

						bBlockade = FALSE;
						GoToState( 'Triggered', 'Gate' );
					}
				}
				else
					SLog( "**** Touched but already firing ****" );
			}
			else
			{
				SLog( "**** Rejected Touch, not on team us ****" );
			}
		}
		else
			SLog( "**** Double Touch Rejected ****" );
	}

	function UnTouch( Actor Other )
	{
		Super.UnTouch( Other );

		if ( bCanUnTouch )
		{
			if ( A_Touching == Other )
			{
				SLog( "**** UnTouch.Other " $ Other $ " ****" );

				// Check if anyone is touching the same
				if ( bBlockade )
				{
					if ( CheckTouchList(Volume_Blockade) )
					{
						if ( !CheckTouchList(Volume_Gate) )
						{
							SLog( "**** Changing to a target at the gate ****" );

							bBlockade = FALSE;
							GoToState( 'Triggered', 'Gate' );
							return;
						}
					}
					else
						return;
				}
				else // if anyone is touching the other move to that target
				{
					if ( CheckTouchList(Volume_Gate) )
					{
						if ( !CheckTouchList(Volume_Blockade) )
						{
							SLog( "**** Changing to a target at the blockade ****" );

							bBlockade = TRUE;
							GoToState( 'Triggered', 'Begin' );
							return;
						}
					}
					else
						return;
				}

				SLog( "**** Firing Stopped ****" );
				bIsFiring = FALSE;
				GoToState( 'Triggered', 'ScriptEnd' );
			}
		}
		else
			SLog( "**** UnTouch Rejected ****" );
	}

	function bool CheckTouchList( Volume Volume_Check )
	{
		local Pawn Pawn_Touching;

		ForEach Volume_Check.TouchingActors(class'Pawn', Pawn_Touching)
		{
			if ( Pawn_Touching.PawnTeam == TEAM_US && Pawn_Touching.Health > 0 && A_Touching != Pawn_Touching )
			{
				SLog( "**** Continue firing at same location but different target " $ Pawn_Touching $ " ****" );
				A_Touching = Pawn_Touching;
				return FALSE;
			}
		}

		return TRUE;
	}

	function OnTrigger()
	{
		GoToState( 'Complete' );
	}

	Begin:

	if ( bIsFiring )
	{
		sleep( 2.0 );

		while ( TRUE )
		{
			numRand = RAND(sFP_Blockade.Length);

			// Rotate Emitter from random sFP_Blockade member
			A_88Emitter.SetRotation( sFP_Blockade[numRand].Rotation );

			ACTION_TriggerEvent( Event );

			// Wait and trigger explosion
			sleep( sFP_Blockade[numRand].fDelay );
			ACTION_TriggerEvent( sFP_Blockade[numRand].nmExplosionTrigger );

			// Turn on projector
			if ( sFP_Blockade[numRand].DynamicProjector_Enable != None && !sFP_Blockade[numRand].DynamicProjector_Enable.bProjectTerrain )
			{
				sFP_Blockade[numRand].DynamicProjector_Enable.bProjectTerrain = TRUE;
				sFP_Blockade[numRand].DynamicProjector_Enable.DetachProjector(True);
				sFP_Blockade[numRand].DynamicProjector_Enable.AttachProjector();
			}

			// Wait for next shot, sleep between 5 and 7 seconds
			sleep( 5 + RAND(3) );
		}

		Gate:

		sleep( 2.0 );

		while ( TRUE )
		{
			numRand = RAND(sFP_Gate.Length);

			// Rotate Emitter from random sFP_Blockade member
			A_88Emitter.SetRotation( sFP_Gate[numRand].Rotation );
	
			ACTION_TriggerEvent( Event );

			// Wait and trigger explosion
			sleep( sFP_Gate[numRand].fDelay );
			ACTION_TriggerEvent( sFP_Gate[numRand].nmExplosionTrigger );

			// Turn on projector
			if ( sFP_Gate[numRand].DynamicProjector_Enable != None && !sFP_Gate[numRand].DynamicProjector_Enable.bProjectTerrain )
			{
				sFP_Gate[numRand].DynamicProjector_Enable.bProjectTerrain = TRUE;
				sFP_Gate[numRand].DynamicProjector_Enable.DetachProjector(True);
				sFP_Gate[numRand].DynamicProjector_Enable.AttachProjector();
			}

			// Wait for next shot, sleep between 5 and 7 seconds
			sleep( 5 + RAND(3) );
		}
	}

	ScriptEnd:
}

state Complete
{
	function OnTrigger()
	{
	}

	Begin:

	SLog( "**** Distant 88 is complete ****" );

	ScriptEnd:
}
