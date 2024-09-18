//***************
//	Visuals
//***************

func void Patch_DG_B_SetVisuals_Gobbo_Different()
{
	Mdl_SetVisual(self, "Gobbo.mds");
	//								Body-Mesh Body-Tex Skin-Color Head-MMS Head-Tex Teeth-Tex ARMOR
	Mdl_SetVisualBody(self,	"Gob_Body",				1,		DEFAULT,	"",					DEFAULT,	DEFAULT,	-1);
};

func void Patch_DG_B_SetVisuals_Gobbo_Different_Update_Threshold_1(var C_NPC npc)
{
	//								Body-Mesh Body-Tex Skin-Color Head-MMS Head-Tex Teeth-Tex ARMOR
	Mdl_SetVisualBody(npc,	"Gob_Body",				0,		DEFAULT,	"",					DEFAULT,	DEFAULT,	-1);
};

// ***********
// Different Gobbo
// ***********

instance Patch_DG_Gobbo_Different(Mst_Default_Gobbo_Black)
{
	// -------- NPC --------
    name = "Different Goblin";

	// -------- attributes --------
    attribute[ATR_HITPOINTS_MAX]	= 400;
	attribute[ATR_HITPOINTS]		= 400;

	// -------- visuals --------
	Patch_DG_B_SetVisuals_Gobbo_Different();
    
    // -------- aivars --------
    aivar[AIV_MM_REAL_ID] = PATCH_DG_ID_GOBBO_DIFFERENT;

	Npc_SetToFightMode(self, ItMw_1h_Bau_Mace); // Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------

	// -------- daily routine --------
};
