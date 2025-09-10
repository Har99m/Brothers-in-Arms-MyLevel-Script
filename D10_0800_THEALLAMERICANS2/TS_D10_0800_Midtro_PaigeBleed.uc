//=============================================================================
// TS_D10_0800_Midtro_PaigeBleed.
//=============================================================================
class TS_D10_0800_Midtro_PaigeBleed extends TriggeredScript
	placeable;

var AnimPawn AP_Paige;
var Actor ChestWound;
var Actor MouthDrip;

State Triggered
{
Begin:
	AP_Paige = AnimPawn( GetPawn( 'AP_Midtro_Paige' ) );
	ChestWound = GetFirstActor( 'PFX_CHESTWOUND' );

	MouthDrip = GetFirstActor( 'PFX_PAIGE_Mouth' );

	//AP_Paige.AttachToBone( ChestWound, 'Bip01 Spine2' );
	//ChestWound.SetRelativeLocation( vect(2.0,-13.0,8.0) );
// + up, +back

	AP_Paige.AttachToBone( MouthDrip, 'top_lip' );
	//ChestWound.SetRelativeLocation( vect(2.0,-13.0,8.0) );



}
