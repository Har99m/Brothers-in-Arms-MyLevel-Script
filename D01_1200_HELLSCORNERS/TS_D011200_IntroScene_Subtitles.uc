//=============================================================================
// TS_D011200_IntroScene_Subtitles.
//=============================================================================
class TS_D011200_IntroScene_Subtitles extends TriggeredScript
	placeable;

var float i;

State Triggered
{
Begin:
	//slog( GetAbsoluteTime() );

	i = 0.0;

	ResetAbsoluteTime();
	StartAbsoluteTime();

//MARSH_A=Marsh: There's no way we're getting this out.
	ACTION_DisplaySubTitleMessage2( S_Localize( "MARSH_A" ), 2.3, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 2.3 );

//GARNETT_A1=Garnett: Seems Baker is all too willing to send us out on these wild goose chases.
	ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_A1" ), 4.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 4.0 );

//GARNETT_A2=Garnett: Would it kill him to give us a map?
	ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_A2" ), 3.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 1.6 );

//PADDOCK_A=Paddock: What's up with Baker anyway?  Always seems to be alone, staring off and shit.
	ACTION_DisplaySubTitleMessage2( S_Localize( "PADDOCK_A" ), 4.5, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 4.6 );

//DESOLA_A1=Desola: He's always been like that.  We'd play baseball or whatever in England-
	ACTION_DisplaySubTitleMessage2( S_Localize( "DESOLA_A1" ), 3.8, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 3.6 );
//DESOLA_A2=Desola: -not Baker.
	ACTION_DisplaySubTitleMessage2( S_Localize( "DESOLA_A2" ), 1.3, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 2.0 );
//MARSH_B=Marsh: I don't think we're getting that hunk of crap out of the mud any time soon.
	ACTION_DisplaySubTitleMessage2( S_Localize( "MARSH_B" ), 3.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 2.7 );
//FRIAR_A=Friar: We should think of something fast before they realize where we are.
	ACTION_DisplaySubTitleMessage2( S_Localize( "FRIAR_A" ), 3.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 2.8 );
//DESOLA_B=Desola: Where the hell is Allen?  He never misses a Baker goose chase.
	ACTION_DisplaySubTitleMessage2( S_Localize( "DESOLA_B" ), 3.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 3.0 );
//GARNETT_B1=Garnett: He's stuck unloading trucks for the push into St. Come du Mont.
	ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_B1" ), 4.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 4.0 );
//GARNETT_B2=Garnett: -he's on Mac's shit list.
	ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_B2" ), 1.5, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 2.0 );
//GARNETT_B3=Garnett: Actually I think he is Mac's shitlist.
	ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_B3" ), 2.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 4.0 );
//GARNETT_C=Garnett: Follow the gunfire, that's how you can always find us.
	ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_C" ), 3.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 4.0 );
//CAMPBELL_A1=Campbell: Got word you guys were on your way.  Colonel Johnson sent me to find you.
	ACTION_DisplaySubTitleMessage2( S_Localize( "CAMPBELL_A1" ), 3.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 4.0 );
//CAMPBELL_A2=Campbell: Fucking Germans...
	ACTION_DisplaySubTitleMessage2( S_Localize( "CAMPBELL_A2" ), 1.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 1.0 );
//CAMPBELL_B1=Campbell: Krauts are attacking the Locks and tore us to pieces with some damn mortar fire.
	ACTION_DisplaySubTitleMessage2( S_Localize( "CAMPBELL_B1" ), 4.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 4.0 );
//CAMPBELL_B2=Campbell: Here comes the supply drop. Mark the supplies with smoke. We'll pick 'em up later.
	ACTION_DisplaySubTitleMessage2( S_Localize( "CAMPBELL_B2" ), 5.0, 1, 1, 1, TRUE, TRUE );
	WaitForAbsoluteTime( i += 5.0 );
//CAMPBELL_B3=Campbell: You'll rendezvous with the Colonel on the other side of the locks. Good luck Red.
	ACTION_DisplaySubTitleMessage2( S_Localize( "CAMPBELL_B3" ), 6.0, 1, 1, 1, TRUE, TRUE );

}

