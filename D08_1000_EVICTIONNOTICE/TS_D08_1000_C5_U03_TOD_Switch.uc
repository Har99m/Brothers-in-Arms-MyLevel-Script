//=============================================================================
// TS_D08_1000_C5_U03_TOD_Switch.
//=============================================================================
class TS_D08_1000_C5_U03_TOD_Switch extends TriggeredScript
	placeable;

var wargamepawn DE_C05_U03;

state Triggered
{
Begin:

	DE_C05_U03 = WargamePawn( GetPawn( 'DE_C05_U03'  ));

	if ( DE_C05_U03 != None && DE_C05_U03.health > 0 )
	{
	DE_C05_U03.TriggerOnDeath = 'TS_Combat5Final';
	}
}
