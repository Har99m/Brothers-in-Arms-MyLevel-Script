//=============================================================================
// TS_D000230_C3_Cole_Flank.
//=============================================================================
class TS_D000230_C3_Cole_Flank extends TriggeredScript
	placeable;

var AnimPawn AP_Boyd , AP_Campbell , AP_Cole ;

state triggered
	{
		Begin:

			//===== Define variables
				AP_Boyd = AnimPawn( GetPawn( 'AP_Boyd' ));
				AP_Campbell = AnimPawn( GetPawn( 'AP_Campbell' ));
				AP_Cole = AnimPawn( GetPawn( 'AP_Cole' ));

			//===== Teleport Boyd , Campbell , Cole to other side of fence
				ACTION_TeleportPawnToActor( AP_Boyd , 'LT_Boyd_Teleport_Flank' );
				ACTION_TeleportPawnToActor( AP_Campbell , 'LT_Campbell_Teleport_Flank' );
				ACTION_TeleportPawnToActor( AP_Cole , 'LT_Cole_Teleport_Flank' );

					sleep( 0.2 );

			//===== Order Cole's unit to flank it up
				ACTION_OrderMove( 'UNIT_US_Cole' , 'PN_C3_Cole_Flank_01' );
				ACTION_OrderMove( 'UNIT_US_Cole' , 'PN_C3_Cole_Flank_02' , TRUE );

		ScriptEnd:
	}
