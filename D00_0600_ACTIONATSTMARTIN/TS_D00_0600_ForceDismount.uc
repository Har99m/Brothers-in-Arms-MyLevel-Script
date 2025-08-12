//=============================================================================
// TS_D00_0600_ForceDismount.
//=============================================================================
class TS_D00_0600_ForceDismount extends TriggeredScript
	placeable;

var(Events) edfindable Actor A_Turret;
var(Events) bool bDoNothingIfHumanControlled;

var(Events) edfindable Unit Unit_Move;
var(Events) name nmPathNode;

state Triggered
{
   function OnTrigger()
   {
       // Trigger Once
   }

   Begin:

   if ( Unit_Move != None && Unit_Move.GetNumLivingMembers() > 0 )
   {
       if ( A_Turret != None )
       {
           if ( A_Turret.IsA('MG42Factory') )
               ACTION_EnableMG42Recruiting( A_Turret.Tag, FALSE );

           ACTION_ForceTurretDismountDirect( A_Turret, bDoNothingIfHumanControlled );
           SLog( "**** Recruiting Disabled ****" );

           sleep( 1.0 );
           if ( nmPathNode != 'None' )
               ACTION_OrderMove( Unit_Move.Tag, nmPathNode );
       }
       else
           SLog( "**** A_Turret " $ A_Turret $ " ****" );
   }

   ScriptEnd:
}
