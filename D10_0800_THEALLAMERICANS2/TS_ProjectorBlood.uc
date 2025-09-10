//=============================================================================
// TS_ProjectorBlood.
//=============================================================================
class TS_ProjectorBlood extends TriggeredScript
	placeable;



state Triggered
	{
	Begin:

AnimPawn(GetPawn('AP_Midtro_Paige')).Skins[0] = GbxShaderMaterial't_character_us.para_uniform_shaders.paige_dead';
GetFirstActor('gbxExplosionTrigger_MortarEnd2').bHidden=False;
//AP_German_01.ExtendedSkins[0] = Texture't_character_de.Infantry.de_conscript_craig_shot';


GetFirstActor('BloodDoyle_01').SetLocation(vect( -6930.208984, 8531.045898, 595.055115 ));
GetFirstActor('BloodDoyle_02').SetLocation(vect( -6707.486816, 8301.077148, 639.054932 ));

	}
