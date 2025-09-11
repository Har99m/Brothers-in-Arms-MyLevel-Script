//=============================================================================
// GermanNoise1_script.
//=============================================================================
class GermanNoise1_script extends TriggeredScript
	placeable;

var int timer, iRand;
var name nRandSoundTarget;
var string selectedSound[12];
var byte bUsed[12];

state Triggered
{
	Begin:

	selectedSound[0] = "D_GERMAN_A.G_Americans!";
	selectedSound[1] = "D_GERMAN_A.G_Americans!_b";
	selectedSound[2] = "D_GERMAN_A.G_Americans!_c";
	selectedSound[3] = "D_GERMAN_A.G_Americans!_d";
	selectedSound[4] = "D_GERMAN_A.G_Americans!_e";
	selectedSound[5] = "D_GERMAN_A.G_Americans!_f";
	selectedSound[6] = "D_GERMAN_A.G_Americans!_g";
	selectedSound[7] = "D_GERMAN_A.G_Move_left_a";
	selectedSound[8] = "D_GERMAN_A.G_Move_right_b";
	selectedSound[9] = "D_GERMAN_A.G_run_b";
	selectedSound[10] = "D_GERMAN_A.G_GO!_a";
	selectedSound[11] = "D_GERMAN_A.G_firing_positions_c";

	bUsed[0] = 0;
	bUsed[1] = 0;
	bUsed[2] = 0;
	bUsed[3] = 0;
	bUsed[4] = 0;
	bUsed[5] = 0;
	bUsed[6] = 0;
	bUsed[7] = 0;
	bUsed[8] = 0;
	bUsed[9] = 0;
	bUsed[10] = 0;
	bUsed[11] = 0;

	sleep(2.0);

	for ( timer = 0; timer < 4; timer++ )
	{
		TryAgain:

		iRand = rand(12);
		if ( bUsed[iRand] == 1 )
			GoTo( 'TryAgain' );

		switch( iRand )
		{
			case 0:
				bUsed[0] = 1;
				nRandSoundTarget = 'LT_GermanNoise1';
				break;
			case 1:
				bUsed[1] = 1;
				nRandSoundTarget = 'LT_GermanNoise2';
				break;
			case 2:
				bUsed[2] = 1;
				nRandSoundTarget = 'LT_GermanNoise3';
				break;
			case 3:
				bUsed[3] = 1;
				nRandSoundTarget = 'LT_GermanNoise4';
				break;
			case 4:
				bUsed[4] = 1;
				nRandSoundTarget = 'LT_GermanNoise5';
				break;
			case 5:
				bUsed[5] = 1;
				nRandSoundTarget = 'LT_GermanNoise6';
				break;
			case 6:
				bUsed[6] = 1;
				nRandSoundTarget = 'LT_GermanNoise7';
				break;
			case 7:
				bUsed[7] = 1;
				nRandSoundTarget = 'LT_GermanNoise8';
				break;
			case 8:
				bUsed[8] = 1;
				nRandSoundTarget = 'LT_GermanNoise1';
				break;
			case 9:
				bUsed[9] = 1;
				nRandSoundTarget = 'LT_GermanNoise2';
				break;
			case 10:
				bUsed[10] = 1;
				nRandSoundTarget = 'LT_GermanNoise3';
				break;
			case 11:
				bUsed[11] = 1;
				nRandSoundTarget = 'LT_GermanNoise4';
				break;
		}

		ACTION_PlaySound( nRandSoundTarget, selectedSound[iRand], 255.0, 1.0, 8192.0 );
		sleep( 2.5 + rand(4) );
	}

	ScriptEnd:
}
