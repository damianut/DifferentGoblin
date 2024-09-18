/*
 *  CONSTANTS
 */
// Threshold for doing actions with Different Gobbo
const int Patch_DG_Threshold_HP_1 = 80;
const int Patch_DG_Threshold_HP_2 = 60;
const int Patch_DG_Threshold_HP_3 = 40;

/*
 *  Patch_DG_HPInPercent
 *   - return the percent of maximal hitpoints of the C_NPC. Returns `0`, if C_NPC doesn't exist.
 */
func int Patch_DG_HPInPercent(var C_NPC npc)
{
    // SAFETY CHECK
    if (false == Hlp_IsValidNpc(npc)) { return 0; };
    
    // Is dead
    if (true == Npc_IsDead(npc)) { return 0; };
    
    // Count percents. A value after a comma is ignored.
    return ((100 * npc.attribute[ATR_HITPOINTS]) / npc.attribute[ATR_HITPOINTS_MAX]);
};

/*
 *  Patch_DG_Action_*
 *   - an action taken on Different Gobbo because of the percents of the maximal hitpoints
 */
func void Patch_DG_Action_1(var C_NPC npc)
{
    // Change a texture
    Patch_DG_B_SetVisuals_Gobbo_Different_Update_Threshold_1(npc);
};
func void Patch_DG_Action_2(var C_NPC npc)
{
    // Play an visual effect
    AI_PlayFX(npc, npc, "SPELLFX_FIRESTORM");
};
func void Patch_DG_Action_3(var C_NPC npc)
{
    // Change a weapon
    AI_RemoveWeapon(npc);
    
    // Create a better weapon
    if (0 >= Npc_HasItems(npc, ItMw_1h_MISC_Sword))
    {
        CreateInvItem(npc, ItMw_1h_MISC_Sword);
    };
    
    // Equip this weapon
    AI_EquipBestMeleeWeapon(npc);
    
    // Draw this weapon
    AI_ReadyMeleeWeapon(npc);
};

/*
 *  Patch_DG_HandleHP
 *   - call the actions on Different Gobbo because of the percents of the maximal hitpoints.
 */
func void Patch_DG_HandleHP(var C_NPC npc)
{
    var int HPInPercent; HPInPercent = Patch_DG_HPInPercent(npc);
    
    // Don't do anything, if is dead or not exist.
    if (0 == HPInPercent)
    {
        return;
    };
    
    // Check thresholds
    if (Patch_DG_Threshold_HP_3 >= HPInPercent)
    {
        Patch_DG_Action_3(npc);
    } else if (Patch_DG_Threshold_HP_2 >= HPInPercent)
    {
        Patch_DG_Action_2(npc);
    } else if (Patch_DG_Threshold_HP_1 >= HPInPercent)
    {
        Patch_DG_Action_1(npc);
    };
};
