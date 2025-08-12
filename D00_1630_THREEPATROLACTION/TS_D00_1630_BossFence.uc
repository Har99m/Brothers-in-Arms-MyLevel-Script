//=============================================================================
// TS_D00_1630_BossFence.
//=============================================================================
class TS_D00_1630_BossFence extends TriggeredScript
	placeable;

var Actor SM_Fence01;
var Actor SM_Fence02;
var Actor SM_Fence03;

state triggered
{
   	function OnTrigger()
    {
       	GotoState( 'Opel' );
    }

	Begin:

	SM_Fence01 = GetFirstActor( 'SM_C4_Fence01' );
	SM_Fence02 = GetFirstActor( 'SM_C4_Fence02' );

	//===== Unblock fence
	ACTION_TriggerEvent( 'BTV_C4_Fence' );
//	ACTION_UnBlockNavPoints( 'PN_C4_Fence' );

	SM_Fence01.bHidden = TRUE ;
	SM_Fence02.bHidden = TRUE ;

	ScriptEnd:
}

state Opel
{
   	function OnTrigger()
    {
       	GotoState( 'NullState' );
    }

	Begin:

	SM_Fence03 = GetFirstActor( 'SM_C4_Fence03' );

	//===== Unblock fence
	ACTION_TriggerEvent( 'BTV_C4_Fence03' );
//	ACTION_UnBlockNavPoints( 'PN_C4_Fence03' );

	SM_Fence03.bHidden = TRUE ;

	ScriptEnd:
}

state NullState
{
   	function OnTrigger() { GotoState( 'NullState' ); }
	Begin:
}

