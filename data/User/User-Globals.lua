--Place for your settings and custom functions that are meant to affect all of your jobs and characters.
latency = .25
--If this is set to true it will prevent you from casting shadows when you have more up than that spell would generate.
conserveshadows = false
--Display related settings.

--Options for automation.
state.ReEquip 		  		= M(true, 'ReEquip Mode')		 --Set this to false if you don't want to equip your current Weapon set when you aren't wearing any weapons.
state.AutoArts 		  		= M(true, 'AutoArts') 		 --Set this to false if you don't want to automatically try to keep up Solace/Arts.
state.AutoLockstyle	 	    = M(true, 'AutoLockstyle Mode') --Set this to false if you don't want gearswap to automatically lockstyle on load and weapon change.
state.CancelStoneskin 		= M(true, 'Cancel Stone Skin') --Set this to false if you don't want to automatically cancel stoneskin when you're slept.
state.SkipProcWeapons 		= M(true, 'Skip Proc Weapons') --Set this to false if you want to display weapon sets fulltime rather than just Aby/Voidwatch.
state.NotifyBuffs	  		= M(false, 'Notify Buffs') 	 --Set this to true if you want to notify your party when you recieve a specific buff/debuff. (List Below)
state.NotifyBuffs	  		= M(true, 'Notify Buffs') 	 --Set this to true if you want to notify your party when you recieve a specific buff/debuff. (List Below)
NotifyBuffs = S{'doom','petrification'}


	state.AdjustTargets	  	  = M(true, 'Automatically Adjust Targets')
	state.AutoAcceptRaiseMode = M(false, 'Auto Accept Raise Mode')
	state.AutoCleanupMode  	  = M(false, 'Auto Cleanup Mode')
	state.AutoContradanceMode = M(true, 'Auto Contradance Mode')
	state.AutoFoodMode		  = M(false, 'Auto Food Mode')
	state.AutoHolyWaterMode   = M(true, 'Auto Holy Water Mode')
	state.AutoJumpMode 		  = M(false, 'Auto Jump Mode')
	state.AutoNukeMode 		  = M(false, 'Auto Nuke Mode')
	state.AutoRemoveDoomMode  = M(true, 'Auto Remove Doom Mode')
	state.AutoShadowMode 	  = M(false, 'Auto Shadow Mode')
	state.AutoSubMode 		  = M(false, 'Auto Sublimation Mode')
	state.AutoSuperJumpMode   = M(false, 'Auto SuperJump Mode')
	state.AutoTankMode 		  = M(false, 'Auto Tank Mode')
	state.AutoTrustMode 	  = M(false, 'Auto Trust Mode')
	state.AutoWSMode		  = M(false, 'Auto Weaponskill Mode')
	state.AutoWSRestore		  = M(true, 'Auto Weaponskill Restore Mode')
	state.Capacity 			  = M(false, 'Capacity Mode')
	state.DisplayMode  	  	  = M(true, 'Display Mode')
	state.ElementalWheel 	  = M(false, 'Elemental Wheel')
	state.HoverShot		 	  = M(true, 'HoverShot')
	state.IdleStep			  = M(true, 'Idle Step Mode')
	state.Kiting              = M(false, 'Kiting')
	state.MaintainAftermath	  = M(true, 'Maintain Aftermath')
	state.MiniQueue		 	  = M(true, 'MiniQueue')
	state.RefineWaltz		  = M(true, 'RefineWaltz')
	state.RngHelper		 	  = M(false, 'RngHelper')
	state.RngHelperQuickDraw  = M(false, 'RngHelperQuickDraw')
	state.SelectNPCTargets    = M(false, 'Select NPC Targets')
	state.SelfWarp2Block 	  = M(true, 'Block Warp2 on Self')
	state.UnlockWeapons		  = M(false, 'Unlock Weapons')
	state.UseCustomTimers 	  = M(true, 'Use Custom Timers')
	state.WakeUpWeapons 	  =	M(false, 'Wake Up Weapons')
	state.WakeUpWeapons 	  =	M(true, 'Wake Up Weapons')

--[[Binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
]]
send_command('bind !@^f7 gs c toggle AutoWSMode') --Turns auto-ws mode on and off.
send_command('bind !^f7 gs c toggle AutoFoodMode') --Turns auto-ws mode on and off.
send_command('bind f7 gs c cycle Weapons') --Cycle through weapons sets.
send_command('bind @f8 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
send_command('bind ^f8 gs c toggle AutoStunMode') --Turns auto-stun mode off and on.
send_command('bind !f8 gs c toggle AutoDefenseMode') --Turns auto-defense mode off and on.
send_command('bind ^@!f8 gs c toggle AutoTrustMode') --Summons trusts automatically.
send_command('bind @pause gs c cycle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
send_command('bind @scrolllock gs c cycle Passive') --Changes offense settings such as accuracy.
send_command('bind f9 gs c cycle OffenseMode') --Changes offense settings such as accuracy.
send_command('bind ^f9 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
send_command('bind @f9 gs c cycle RangedMode') --Changes ranged offense settings such as accuracy.
send_command('bind !f9 gs c cycle WeaponskillMode') --Changes weaponskill offense settings such as accuracy.
send_command('bind f10 gs c set DefenseMode Physical') --Turns your physical defense set on.
send_command('bind ^f10 gs c cycle PhysicalDefenseMode') --Changes your physical defense set.
send_command('bind !f10 gs c toggle Kiting') --Keeps your kiting gear on..
send_command('bind f11 gs c set DefenseMode Magical') --Turns your magical defense set on.
send_command('bind ^f11 gs c cycle MagicalDefenseMode') --Changes your magical defense set.
send_command('bind @f11 gs c cycle CastingMode') --Changes your castingmode options such as magic accuracy.
send_command('bind !f11 gs c cycle ExtraMeleeMode') --Adds another set layered on top of your engaged set.
send_command('bind ^f12 gs c cycle ResistDefenseMode') --Changes your resist defense set.
send_command('bind f12 gs c set DefenseMode Resist') --Turns your resist defense set on.
send_command('bind @f12 gs c cycle IdleMode') --Changes your idle mode options such as refresh.
send_command('bind !f12 gs c reset DefenseMode') --Turns your defensive mode off.
send_command('bind ^@!f12 gs reload') --Reloads gearswap.
send_command('bind pause gs c update user') --Runs a quick check to make sure you have the right gear on and checks variables.
send_command('bind ^@!pause gs org') --Runs organizer.
send_command('bind ^@!backspace gs c buffup') --Buffup macro because buffs are love.
send_command('bind ^z gs c toggle Capacity') --Keeps capacity mantle on and uses capacity rings.
send_command('bind ^y gs c toggle AutoCleanupMode') --Uses certain items and tries to clean up inventory.
send_command('bind ^t gs c cycle treasuremode') --Toggles hitting htings with your treasure hunter set.
send_command('bind !t input /target <bt>') --Targets the battle target.
send_command('bind ^o fillmode') --Lets you see through walls.
send_command('bind @m gs c mount Spheroid')

NotifyBuffs = S{'doom','petrification'}

Rings = S{'Capacity Ring', 'Warp Ring', 'Trizek Ring', 'Expertise Ring', 'Emperor Band', 'Caliber Ring', 'Echad Ring', 'Facility Ring'}
sets.reive = {neck="Ygnas's Resolve +1"}
-- sets.crafting = { body="Alchemist's Apron", sub="Brewer's Scutum", head="Midras's Helm +1", main="Caduceus", neck="Alchemist's Torque", ring1="Craftmaster's ring", ring2="Orvail Ring" }

equip_lock = S{
    "Warp Ring",
    "Capacity Ring",
    "Vocation Ring",
    "Trizek Ring",
    "Endorsement Ring"
}
function user_handle_equipping_gear(status, eventArgs)
     if equip_lock:contains(player.equipment.right_ring) then
         disable('ring2')
     else
         enable('ring2')
     end
 end

function user_post_precast(spell, action, spellMap, eventArgs)
    -- reive mark
	if spell.type:lower() == 'weaponskill' then
        if buffactive['Reive Mark'] then
            equip(sets.reive)
        end
    end
end

 --function user_post_aftercast(spell, action, spellMap, eventArgs)
  --   if spell.type:lower() == 'weaponskill' then
  --       send_command('wait 1; input /echo ---------------- TP <tp> ----------------')
  --   end
 -- end

function user_customize_melee_set(meleeSet)
    if buffactive['Reive Mark'] then
        meleeSet = set_combine(meleeSet, sets.reive)
    end
    return meleeSet
end

function user_customize_idle_set(idleSet)
    if buffactive['Reive Mark'] then
        idleSet = set_combine(idleSet, sets.reive)
    end
    return idleSet
end
 function user_buff_change(buff, gain, eventArgs)
--     -- Sick and tired of rings being unequip when you have 10,000 buffs being gain/lost?  
     if not gain then
         if Rings:contains(player.equipment.ring1) or Rings:contains(player.equipment.ring2) then
             eventArgs.handled = true
         end
     end
 end
function is_sc_element_today(spell)
    if spell.type ~= 'WeaponSkill' then
        return
    end

   local weaponskill_elements = S{}:
    union(skillchain_elements[spell.skillchain_a]):
    union(skillchain_elements[spell.skillchain_b]):
    union(skillchain_elements[spell.skillchain_c])

    if weaponskill_elements:contains(world.day_element) then
        return true
    else
        return false
    end

end


function user_job_lockstyle()
	windower.chat.input('/lockstyleset 018')
end