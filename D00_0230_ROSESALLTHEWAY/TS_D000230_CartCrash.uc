//=============================================================================
// TS_D000230_CartCrash.
//=============================================================================
class TS_D000230_CartCrash extends TriggeredScript
	placeable;

var float i;
var AnimPawn Cart;
var Actor PFX[3];

State Triggered
	{
		Begin:
			//===== DEFINE
				Cart = AnimPawn(GetPawn('AP_Outro_Convoy_01_Horse'));
				PFX[0] = GetFirstActor('PFX_CartFL');
				PFX[1] = GetFirstActor('PFX_CartRL');
				PFX[2] = GetFirstActor('PFX_CartRR');
				PFX[3] = GetFirstActor('PFX_CartFR');

				Cart.AttachToBone( PFX[0], 'bip01 l finger0' );
				Cart.AttachToBone( PFX[1], 'bip01 l toe0' );
				Cart.AttachToBone( PFX[2], 'bip01 r toe0' );
				Cart.AttachToBone( PFX[3], 'bip01 r finger0' );

					sleep( 1.0 );

				ACTION_TriggerEvent('PFX_CartFL');
				ACTION_TriggerEvent('PFX_CartRL');
				ACTION_TriggerEvent('PFX_CartRR');
				ACTION_TriggerEvent('PFX_CartFR');

					sleep( 4.35 );

				ACTION_TriggerEvent('PFX_CartRoll');

					sleep(7.0);

				ACTION_TriggerEvent('PFX_CartFL');
				ACTION_TriggerEvent('PFX_CartRL');
				ACTION_TriggerEvent('PFX_CartRR');
				ACTION_TriggerEvent('PFX_CartFR');
	}
