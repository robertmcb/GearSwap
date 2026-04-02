-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function character_user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT','MDT','MEVA')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.Weapons:options('None','DualWeapons','Maxentius', 'Daybreak','Yagrush', 'SinMage') 
	state.ResistDefenseMode:options('MEVA')
	state.WeaponskillMode:options('Normal','Fodder')
	
	--default_weapons = 'Maxentius'
	default_weapons='None'
	default_dual_weapons = 'DualWeapons'
	
	autows_list = {['DualWeapons']='Black Halo',['Maxentius']='Black Halo'}

		-- Additional local binds
	send_command('bind @` gs c cycle ElementalMode')
	send_command('bind ^` gs c scholar dark')
	send_command('bind !` gs c scholar light')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind !backspace input /ja "Afflatus Solace" <me>')
	send_command('bind @backspace input /ja "Afflatus Misery" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Default;gs c set unlockweapons false')
	send_command('bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons none')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.Maxentius = {main="Maxentius",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Yagrush",sub="Sindri"}
	sets.weapons.SinMage = {main="Sindri", sub="Magesmasher +1"}
--	sets.weapons.Queller = {main="Queller rod",sub="Genmei Shield"}
--	sets.weapons.Bunzis ={main="Bunzi's Rod",sub="Ammurapi Shield"}
	--sets.weapons.Rubicundity ={main="Rubicundity",sub="Ammurapi Shield"}
	sets.weapons.Yagrush =  {main="Yagrush",sub="Ammurapi Shield"}
	sets.weapons.Daybreak = {main="Daybreak", sub="Ammurapi Shield"}
	
	WHM_Relic_Head		= "Piety Cap +3"   
	WHM_Relic_Body		= "Piety Bliaut +3"  --Regen potency+52%/Refresh+3 -- BIS Regen body  
	WHM_Relic_Hand		= "Piety Mitts"  --no 
	WHM_Relic_Legs		= "Piety Pantaln. +3"   
	WHM_Relic_Feet		= "Piety Duckbills +3" 

	WHM_AF_Head			= "Theophany Cap +3"   
	WHM_AF_Body			= "Theo. Bliaut +3"     
	WHM_AF_Hand			= "Theo. Mitts +4" --BUG FIX: in-game name is abbreviated at +4 tier (was "Theophany Mitts +4")  
	WHM_AF_Legs			= "Th. Pant. +3"   
	WHM_AF_Feet			= "Theo. Duckbills +3"  --Enh dur+10%/SIRD-29%/Enh+Enf skills+21 [BIS for enhancing feet]  

	WHM_Empy_Head		= "Ebers Cap +3"      --FC+13%/Cure potency+22%/Divine Veil+26%      
	WHM_Empy_Body		= "Ebers Bliaut +3"   
	WHM_Empy_Hand		= "Ebers Mitts +3"      
	WHM_Empy_Legs		= "Ebers Pant. +3"   --Heal cast-15%/8%Cure→MP/DT-13%/Divine Benison+4   
	WHM_Empy_Feet		= "Ebers Duckbills +3"   
	WHM_Empy_Ear 		= "Ebers Earring +1"
	


	
	--gear.jse_ws
	--gear.jse_stp
	gear.jse_MND_FC={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.jse_WSD ={ name="Alaunus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.jse_MND_Cure = { name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Damage taken-5%',}}
	
    -- Precast Sets
	
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body=WHM_Relic_Body}
	sets.precast.JA['Afflatus Solace'] = {feet=WHM_Relic_Feet}
	sets.precast.JA['Sublimation'] = {waist="Embla Sash"}

	-- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Fast cast sets for spells
    sets.precast.FC = {
		main=gear.grioavolr_fc_staff,			
		sub="Clerisy Strap",				--sub="Clerisy Strap +1",
		ammo="Impatiens",
		head=WHM_Empy_Head,					
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Enchntr. Earring +1",				--Etiolation Earring
		ear2="Malignance Earring",			
		body="Inyanga Jubbah +2",
		hands=gear.gende_hands_whm, 
		ring1="Kishar Ring",				
		ring2="Lebeche Ring",				
		back=gear.jse_MND_FC, 
		waist="Witful Belt",
		legs=gear.chironic_fc_legs,			--Volte Brais
		feet="Regal Pumps +1"				
		}
		
    sets.precast.FC.DT = {
		main=gear.grioavolr_fc_staff,		
		sub="Clerisy Strap",				--sub="Clerisy Strap +1",
		ammo="Impatiens",
		head="Bunzi's Hat",					
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Loquac. Earring",
		ear2="Malignance Earring",
		body="Inyanga Jubbah +2",
		hands=gear.gende_hands_whm,				
		ring1="Stikini Ring +1",
		ring2="Lebeche Ring",				
		back="Perimede Cape",				
		waist="Witful Belt",
		legs=gear.chironic_fc_legs,
		feet="Regal Pumps +1"				
		}

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
			main="Queller Rod", --your aug: Heal skill+15/Cure potency+10%/Cure cast-7%
			sub="Sors Shield", --Sors Shield: Cure potency+3%/Cure cast-5% (shield bonus for healing precast)
			ammo="Impatiens",
			head=WHM_Empy_Head,
			neck="Cleric's Torque +2",
			body="Inyanga Jubbah +2",
			ear1="Nourishing Earring", --"Mendi. Earring",
			ear2="Nourishing Earring +1",
			ring1="Kishar Ring",
			ring2="Lebeche Ring",
			hands=gear.gende_hands_whm, --"Vanya Cuffs",
			back=gear.jse_MND_FC,
			waist="Embla Sash",
			legs=WHM_Empy_Legs,				--gear.chironic_fc_legs  WHM_Empy_Legs
			feet="Vanya Clogs"
				})
				
    sets.precast.FC.StatusRemoval = set_combine(sets.precast.FC['Healing Magic'], {main="Yagrush", sub="Ammurapi Shield"})
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {feet="Hygieia Clogs +1"})
    sets.precast.FC.Curaga = set_combine(sets.precast.FC.Cure, {})
	sets.precast.FC.CureSolace =  set_combine(sets.precast.FC.Cure, {})
	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {main="Daybreak",sub="Ammurapi Shield"})

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		ammo="Oshasha's Treatise",		
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Epaminondas's Ring",
		ring2="Epaminondas's Ring", --V1 FIX: Cornelia's Ring NOT IN INVENTORY (own Belt not Ring); Epaminondas=WSD+5%		
		back=gear.jse_WSD,--"Null Shawl",
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}

    sets.precast.WS['Flash Nova'] = {
		ammo="Oshasha's Treatise",			
		head="Nyame Helm",
		neck="Null Loop",
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Epaminondas's Ring",
		ring2="Epaminondas's Ring", --V1 FIX: Cornelia's Ring not owned; Epaminondas=WSD+5%
		back=gear.jse_WSD,--"Null Shawl",
		waist="Orpheus's Sash", --elemental damage by distance (correct for Flash Nova elemental WS)
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
    sets.precast.WS['Mystic Boon'] = {		
		ammo="Oshasha's Treatise",		
		head="Nyame Helm",
		neck="Rep. Plat. Medal", --"Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Regal Earring", --INT+10/MND+10/MAB+7/MaAcc set bonus [NO WSD; correct for MND-based WS]
		ear2="Moonshade Earring",
		body="Nyame Mail", --"Bunzi's Robe",
		hands="Nyame Gauntlets",
		ring1="Metamor. Ring +1",
		ring2="Epaminondas's Ring",			
		back=gear.jse_WSD, --"Null Shawl",
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
	sets.precast.WS['Black Halo'] = { 
		ammo="Oshasha's Treatise",		
		head="Nyame Helm",
		neck="Rep. Plat. Medal", --"Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Regal Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail", --"Bunzi's Robe", --WHM_Relic_Body, --"Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Metamor. Ring +1",
		ring2="Epaminondas's Ring",			
		back=gear.jse_WSD,--"Toro Cape",
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
	sets.precast.WS['Hexa Strike'] = { 
		ammo="Hasty Pinion +1",		
		head="Blistering Sallet +1",
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Cessance Earring",
		ear2="Brutal Earring",
		body="Nyame Mail", --"Bunzi's Robe",
		hands="Nyame Gauntlets",
		ring1="Begrudging Ring",
		ring2="Epaminondas's Ring", --V1 FIX: Rufescent Ring NOT IN INVENTORY; Epaminondas=WSD+5%			
		back=gear.jse_WSD,--"Toro Cape",
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
	sets.precast.WS['Realmrazer'] = { 
		ammo="Oshasha's Treatise",		
		head=WHM_AF_Head, --BUG FIX: was -WHM_AF_Head (unary minus makes this nil)
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Domin. Earring +1",
		ear2="Regal Earring",
		body="Nyame Mail", --"Bunzi's Robe",
		hands="Bunzi's Gloves",
		ring1="Metamor. Ring +1",
		ring2="Epaminondas's Ring", --V1 FIX: Rufescent Ring NOT IN INVENTORY; Epaminondas=WSD+5%			
		back=gear.jse_WSD,--"Toro Cape",
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}

	sets.precast.WS['Seraph Strike'] = { 
		ammo="Oshasha's Treatise",		
		head="Nyame Helm", --BUG FIX: was -"Nyame Helm" (unary minus makes this nil)
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Moonshade Earring",
		ear2="Friomisi Earring",
		body="Nyame Mail", --"Bunzi's Robe",
		hands="Nyame Gauntlets",
		ring1="Freke Ring",
		ring2="Epaminondas's Ring",			
		back=gear.jse_MND_FC,--"Toro Cape",
		waist="Orpheus's Sash", --"Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}

	sets.MaxTP = {}
	sets.MaxTP.Myrkr = {}
	sets.MaxTP.Dagan = {}

	-- Midcast Sets
    sets.midcast.FastRecast = {
		main=gear.grioavolr_fc_staff,			
		sub="Clerisy Strap",
		ammo="Pemphredo Tathlum",				
		head=WHM_Empy_Head,					
		neck="Voltsurge Torque", --"Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Loquac. Earring",
		ear2="Malignance Earring",
		body="Inyanga Jubbah +2",
		hands="Gende. Gages +1",					
		ring1="Defending Ring",					
		ring2="Freke Ring",						--ring2="Freke Ring",ODIN
		back="Swith Cape +1", --gear.jse_MND_FC,					
		waist="Witful Belt",				--waist="Cornelia's Belt", TVR
		legs="Aya. Cosciales +2",
		feet="Regal Pumps +1"					
		}
		
	sets.midcast.Raise = sets.midcast.FastRecast

    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
		main="Daybreak", --Cure potency+30%/MND+30/MaAcc+40 [BIS cure weapon]
		sub="Ammurapi Shield", 
		ammo="Hydrocera", 					--"Pemphredo Tathlum",		
		head="Kaykaus Mitra +1",			
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Mendi. Earring",				
		ear2="Nourish. Earring +1",			--"Glorious Earring",
		body=WHM_Empy_Body,				
		hands=WHM_AF_Hand,			
		ring1=Stikini_ring1,				
		ring2="Lebeche Ring",				
		back=gear.jse_MND_Cure,				
		waist="Shinjutsu-no-Obi +1" --CORRECTED spelling: capital O. NOTE: MP+85 ONLY (no cure potency) — for MP recovery context, 
		legs=WHM_Empy_Legs,				
		feet="Kaykaus Boots +1"				
		}
		
	sets.midcast.CureSolace = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head="Kaykaus Mitra +1",
		neck="Cleric's Torque +2",
		ear1="Mendi. Earring",				
		ear2="Nourish. Earring +1",			--"Glorious Earring",
		body=WHM_Empy_Body,				
		hands=WHM_AF_Hand,			 
		ring1="Naji's Loop",				
		ring2="Lebeche Ring",				
		back=gear.jse_MND_Cure,				--switch out to the +cure potency one
		waist="Luminary Sash",				--"Hachirin-no-Obi"
		legs=WHM_Empy_Legs,			
		feet="Kaykaus Boots +1"				
		}

	sets.midcast.LightWeatherCure = {
		main="Chatoyant Staff",
		sub="Clerisy Strap",				
		ammo="Pemphredo Tathlum",			
		head="Kaykaus Mitra +1", --your aug: MP+80/SIRD+12%/Cure cast-7% (cast-time variant)
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Mendi. Earring",
		ear2="Nourish. Earring +1",			--ear2="Glorious Earring",
		body=WHM_Empy_Body,					
		hands=WHM_AF_Hand,				
		ring1="Lebeche Ring", 				--Stikini_ring1,				
		ring2="Naji's Loop",
		back=gear.jse_MND_Cure, 					--"Twilight Cape",				
		waist="Luminary Sash",					--"Hachirin-no-Obi",
		legs=WHM_Empy_Legs,				--="Ebers Pant. +3",
		feet="Kaykaus Boots +1", 		--WHM_Relic_Feet			
		}

	sets.midcast.LightWeatherCureSolace = {
		main="Chatoyant Staff",
		sub="Clerisy Strap",						
		ammo="Pemphredo Tathlum",			
		head="Kaykaus Mitra +1",				
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Mendi. Earring",
		ear2="Nourish. Earring +1",				--ear2="Glorious Earring",
		body=WHM_Empy_Body,					
		hands=WHM_AF_Hand,				
		ring1="Mephitas's Ring +1",				--"Sirona's Ring",
		ring2="Lebeche Ring",					--"Lebeche Ring", Naji's Loop
		back=gear.jse_MND_Cure,
		waist="Luminary Sash",				--"Hachirin-no-Obi",
		legs=WHM_Empy_Legs,				
		feet="Kaykaus Boots +1", --feet=WHM_Relic_Feet				
		}
		
	sets.midcast.LightDayCureSolace = {
		main="Chatoyant Staff",
		sub="Clerisy Strap",						
		ammo="Pemphredo Tathlum",			
		head="Kaykaus Mitra +1",				
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Mendi. Earring",
		ear2="Nourish. Earring +1",				--ear2="Glorious Earring",
		body=WHM_Empy_Body,					
		hands=WHM_AF_Hand,				
		ring1="Mephitas's Ring +1",				--"Sirona's Ring",
		ring2="Lebeche Ring",					--"Lebeche Ring", Naji's Loop
		back=gear.jse_MND_Cure,
		waist="Luminary Sash",				--"Hachirin-no-Obi",
		legs=WHM_Empy_Legs,				
		feet="Kaykaus Boots +1", --feet=WHM_Relic_Feet				
		}

		

	sets.midcast.LightDayCure = {
		main="Chatoyant Staff",
		sub="Clerisy Strap",						
		ammo="Pemphredo Tathlum",			
		head="Kaykaus Mitra +1",				
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Mendi. Earring",
		ear2="Nourish. Earring +1",				--ear2="Glorious Earring",
		body=WHM_Empy_Body,					
		hands=WHM_AF_Hand,				
		ring1="Mephitas's Ring +1",				--"Sirona's Ring",
		ring2="Lebeche Ring",					--"Lebeche Ring", Naji's Loop
		back=gear.jse_MND_Cure,
		waist="Luminary Sash",				--"Hachirin-no-Obi",
		legs=WHM_Empy_Legs,				
		feet="Kaykaus Boots +1", --feet=WHM_Relic_Feet				
		}

	sets.midcast.Curaga = {
		main="Chatoyant Staff",
		sub="Clerisy Strap",
		ammo="Hydrocera", --"Pemphredo Tathlum",			
		head="Kaykaus Mitra +1",				
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Mendi. Earring",
		ear2="Nourish. Earring +1",				--ear2="Glorious Earring",
		body=WHM_AF_Body,					
		hands=WHM_AF_Hand,				
		ring1="Sirona's Ring", 
		ring2="Naji's Loop", --"Lebeche Ring",					
		back=gear.jse_MND_Cure, 
		waist="Luminary Sash",					--waist="Luminary Sash", 
		legs=WHM_Empy_Legs,					
		feet="Kaykaus Boots +1"				
		}
		
	sets.midcast.LightWeatherCuraga = {
		main="Chatoyant Staff",
		sub="Clerisy Strap", --"Enki Strap",					
		ammo="Pemphredo Tathlum",
		head=WHM_Empy_Head,						
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Mendi. Earring",
		ear2="Nourish. Earring +1",		--Nourish. Earring		 Glorious Earring [adoulin quested]	
		body=WHM_AF_Body,						
		hands="Kaykaus Cuffs +1", --your aug: MP+80/SIRD+12%/Cure cast-7% (cast-time variant; good for DT curing)
		ring1="Mephitas's Ring +1",						--0"Sirona's Ring",
		ring2="Lebeche Ring",
		back=gear.jse_MND_Cure,						
		waist="Luminary Sash",					--"Hachirin-no-Obi",
		legs=WHM_Empy_Legs,						
		feet=WHM_Relic_Feet					
		}
		
	sets.midcast.LightDayCuraga = {
		main="Chatoyant Staff",
		sub="Clerisy Strap",					--Ammurapi Shield
		ammo="Pemphredo Tathlum",
		head=WHM_Empy_Head,
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Mendi. Earring",
		ear2="Nourish. Earring +1",		--Nourish. Earring		 Glorious Earring [adoulin quested]	
		body=WHM_Empy_Body,
		hands=WHM_AF_Hand,
		ring1="Mephitas's Ring +1", --"Sirona's Ring",
		ring2="Lebeche Ring",
		back=gear.jse_MND_Cure,
		waist="Witful Belt", --"Hachirin-no-Obi",
		legs=WHM_Empy_Legs,
		feet="Kaykaus Boots +1" --your aug: MaAcc+20/Cure potency+6%/FC+4% [BEST cure feet]
		}

	sets.midcast.Cure.DT = {
		main="Daybreak",
		sub="Culminus",							--One to be Feared II
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		neck="Loricate Torque +1",
		ear1="Mendi. Earring",
		ear2="Nourish. Earring +1",		--Nourish. Earring		 Glorious Earring [adoulin quested]	
		body="Bunzi's Robe",
		hands="Kaykaus Cuffs +1",
		ring1="Defending Ring",
		ring2="Freke Ring",				--A Stygian Pact II
		back=gear.jse_MND_Cure,
		waist="Luminary Sash", --"Emphatikos Rope",
		legs=WHM_Empy_Legs,
		feet=WHM_AF_Feet
		}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {
	
		ammo="Pemphredo Tathlum",				
		head="Bunzi's Hat",					--"Ebers Cap +3",
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Mendi. Earring",
		ear2="Malignance Earring",				--Glorious Earring [adoulin quested]	
		body=WHM_AF_Body, --"Kaykaus Bliaut +1",   		 
		hands="Kaykaus Cuffs +1", 
		ring1="Sirona's Ring",			
		ring2="Naji's Loop",
		back=gear.jse_MND_Cure, --jse_MND_Cure			
		waist="Luminary Sash", --"Embla Sash",
		feet="Kaykaus Boots +1",    				
		legs=WHM_Empy_Legs			--BUG FIX: was WHM_Empy_Feet in legs slot (copy-paste error)
		}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body=WHM_Empy_Body,back=gear.jse_MND_FC,})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {back="Twilight Cape",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body=WHM_Empy_Body,back=gear.jse_MND_FC,waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body=WHM_Empy_Body,back="Twilight Cape",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {back="Twilight Cape",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {body=WHM_AF_Body})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {body=WHM_AF_Body,back="Twilight Cape",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {body=WHM_AF_Body,back="Twilight Cape",waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body=WHM_Empy_Body})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body=WHM_Empy_Body,waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body=WHM_Empy_Body,waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {body=WHM_AF_Body,waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {body=WHM_AF_Body,waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body=WHM_Empy_Body})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body=WHM_Empy_Body,waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {
	body=WHM_Empy_Body,
	waist="Hachirin-no-Obi"
	})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {body=WHM_AF_Body,waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	
	--Situational Healing Sets
	sets.Self_Healing = {neck="Nodens Gorget",waist="Gishdubar Sash"} --V1 FIX: Phalaina Locket NOT IN INVENTORY; Nodens=Cure+5%/Stoneskin+30
	sets.Cure_Received = {neck="Nodens Gorget",waist="Gishdubar Sash"} --V1 FIX: Phalaina Locket NOT IN INVENTORY

	sets.midcast.Cursna = {
		main="Yagrush",					
		sub="Ammurapi Shield",  				--Wepwawet Clemency Grip "Enki Strap"
	    ammo="Pemphredo Tathlum",
		head="Vanya Hood",
		neck="Debilis Medallion",  
		ear1="Meili Earring",
		ear2="Ebers Earring +1",
		body=WHM_Empy_Body,
		hands=gear_fanatic_fc, --Fanatic Gloves FC aug: defined in Mrfiend-Items.lua
		ring1="Haoma's Ring",			
		ring2="Menelaus's Ring",
		back=gear.jse_MND_FC, 
		waist="Bishop's Sash",
		legs=WHM_AF_Legs,
		feet="Vanya Clogs"
		}

	sets.midcast.StatusRemoval = {
		main="Yagrush",
		sub="Ammurapi Shield",   					
		ammo="Hasty Pinion +1", --"Pemphredo Tathlum",
		head=WHM_Empy_Head,
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Enchntr. Earring +1", --"Loquac. Earring",
		ear2="Malignance Earring",
		body="Inyanga Jubbah +2",
		hands=WHM_Empy_Hand,
		ring1="Kishar Ring",
		ring2="Prolix Ring", --FC ring: MP+20/Enmity-3/Fast Cast (correct for FC contexts)
		back="Swith Cape +1", --"Perimede Cape",
		waist="Witful Belt", --"Embla Sash",
		legs=WHM_Empy_Legs,
		feet="Regal Pumps +1"
		}
		
	sets.midcast.StatusRemoval.DT = {
		main="Yagrush",			--Daybreak
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
		head=WHM_Empy_Head,
		neck="Loricate Torque +1",
		ear1="Sanare Earring",
		ear2="Halasz Earring",
		body="Bunzi's Robe",
		hands=WHM_Empy_Hand,
		ring1="Murky Ring",
		ring2="Freke Ring",
		back=gear.jse_MND_FC,
		waist="Emphatikos Rope",		
		legs=WHM_Empy_Legs,
		feet=WHM_AF_Feet
		}

	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Clr. Torque +2"})
	sets.midcast.Erase.DT = set_combine(sets.midcast.StatusRemoval.DT, {neck="Clr. Torque +2"})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {
		main="Gada", --your aug: Enh dur+6/MaAcc+9/DMG+9 on top of base Cure+18%/all skills+18
		sub="Ammurapi Shield",					
		ammo="Pemphredo Tathlum",
		head=gear.telchine_enh_head,					
		neck="Incanter's Torque", 	--"Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Mimir Earring",					
		ear2="Andoaa Earring",					
		body=gear.telchine_enh_body,					
		hands=gear.telchine_enh_hands,				
		ring1=Stikini_ring1,
		ring2=Stikini_ring2,
		back="Solemnity Cape",--"Solemnity Cape",					--"Mending Cape",
		waist="Embla Sash",
		legs=gear.telchine_enh_legs,				
		feet=WHM_AF_Feet
		}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",legs="Doyen Pants", waist="Siegel Sash"})
	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet=WHM_Empy_Feet})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod",						
		sub="Ammurapi Shield",				
		neck="Incanter's Torque", 
		head="Chironic Hat",
		--hands="Regal Cuffs",
		legs="Shedir Seraweels",				
		waist="Emphatikos Rope",					
		feet=WHM_AF_Feet
		})
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		main="Bolelabunga",						
		sub="Ammurapi Shield",			
		ammo="Pemphredo Tathlum",
		neck="Incanter's Torque", 
		head="Inyanga Tiara +2",
		body=WHM_Relic_Body,
		hands=WHM_Empy_Hand,
		legs=WHM_AF_Legs,
		waist="Embla Sash",
		feet=gear.telchine_enh_feet,
		back="Solemnity Cape"
		})
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.BarElement = {
		main="Daybreak", --main="Beneficus",	--Cuijatender Altepa abyssea
		ammo="Pemphredo Tathlum",
		sub="Ammurapi Shield",
		head=WHM_Empy_Head,
		neck="Incanter's Torque", 
		ear1="Mimir Earring",						
		ear2="Andoaa Earring",						
		body=WHM_Empy_Body,
		hands=WHM_Empy_Hand,
		ring1=Stikini_ring1,
		ring2=Stikini_ring2,
		back="Alaunus's Cape",
		waist="Embla Sash",
		legs=WHM_Relic_Legs,
		feet=WHM_Empy_Feet
		}
	
	sets.midcast.BarStatus = set_combine(sets.midcast['Enhancing Magic'], {neck="Sroda Necklace"})

	sets.Self_Refresh = {back="Solemnity Cape",waist="Gishdubar Sash",feet="Inspirited Boots"} --V1 FIX: Grapevine Cape NOT IN INVENTORY; Solemnity=Cure+7%/DT-4%
	sets.Refresh_Received = {back="Solemnity Cape",waist="Gishdubar Sash",feet="Inspirited Boots"} --V1 FIX: Grapevine not owned

	sets.midcast.Impact = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield", 
		ammo="Pemphredo Tathlum",
		head=empty,
		neck="Null Loop",
		ear1="Gwati Earring",
		ear2="Malignance Earring",
		body="Twilight Cloak", --"Crepuscular Cloak",
		hands=WHM_Empy_Hand,
		ring1=Stikini_ring1,
		ring2="Metamor. Ring +1",
		back="Null Shawl",
		waist="Null Belt",
		legs=WHM_Empy_Legs,
		feet=WHM_Empy_Feet
		}
		
	sets.midcast['Elemental Magic'] = {
		main="Bunzi's Rod",
		sub="Culminus",					
		ammo="Ghastly Tathlum +1",
		head="Bunzi's Hat",
		neck="Sibyl Scarf",			--"Saevus Pendant +1"
		ear1="Friomisi Earring",
		ear2="Malignance Earring",
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		ring1="Freke Ring",			--freke
		ring2="Metamor. Ring +1",
		back="Null Shawl",
		waist="Null Belt",					--"Sacro Cord"
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots"
		}

	sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="Bunzi's Hat",neck="Null Loop",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Freke Ring",ring2="Metamor. Ring +1",
		back="Null Shawl",waist="Null Belt",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.midcast['Divine Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head=WHM_Empy_Head,
		neck="Null Loop",
		ear1="Gwati Earring",
		ear2="Malignance Earring",
		body=WHM_Empy_Body,
		hands=WHM_Empy_Hand,
		ring1=Stikini_ring1,
		ring2="Metamor. Ring +1",
		back="Null Shawl",
		waist="Null Belt",
		legs=WHM_Empy_Legs,
		feet=WHM_Empy_Feet
		}
		
	sets.midcast.Repose = {
		main="Daybreak",
		sub="Ammurapi Shield", 
		ammo="Hydrocera",
		head=WHM_AF_Head,
		neck="Incanter's Torque",--"Null Loop",
		ear1="Gwati Earring",
		ear2="Malignance Earring",
		body=WHM_AF_Body,
		hands=WHM_Relic_Hand,
		ring1=Stikini_ring1,
		ring2="Metamor. Ring +1",
		back="Null Shawl",
		waist="Luminary Sash",
		legs=WHM_AF_Legs,
		feet=WHM_AF_Feet
		}
		
	sets.midcast.Holy = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="C. Palug Crown",
		neck="Sibyl Scarf", --V1 FIX: Saevus Pendant +1 NOT IN INVENTORY; Sibyl=INT+10/MAB+10
		ear1="Gwati Earring",
		ear2="Malignance Earring",
		body="Bunzi's Robe", --V1 FIX: Shamash Robe NOT IN INVENTORY; Bunzi Robe BIS WHM nuke body
		hands="Bunzi's Gloves",
		ring1="Freke Ring",
		ring2="Metamor. Ring +1",
		back=gear.jse_MND_FC,
		waist="Sacro Cord",
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots"
		}
		
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",body="Bunzi's Robe",hands="Bunzi's Gloves",ring2="Mujin Band",legs="Bunzi's Pants",feet="Bunzi's Sabots"}

	sets.midcast['Dark Magic'] = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",			
		ammo="Pemphredo Tathlum",
		head=WHM_Empy_Head,
		neck="Erra Pendant",			--"Null Loop"
		ear1="Gwati Earring",
		ear2="Malignance Earring",
		body=WHM_Empy_Body,
		hands=WHM_Empy_Hand,
		ring1=Stikini_ring1,
		ring2="Metamor. Ring +1",
		back="Null Shawl",			--"Null Shawl" aurist's cape +1
		waist="Null Belt",
		legs=WHM_Empy_Legs,
		feet=WHM_Empy_Feet
		}

    sets.midcast.Drain = {
		main="Rubicundity",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Erra Pendant",
		ear1="Gwati Earring",
		ear2="Malignance Earring",
		body=WHM_Empy_Body,
		hands=WHM_Empy_Hand, --BUG FIX: gear.chironic_aspir_gloves undefined for WHM; Ebers Mitts+3 sub
		ring1=Stikini_ring1,
		ring2="Metamor. Ring +1",
		back="Aurist's Cape +1",
		waist="Null Belt",
		legs=WHM_Empy_Legs, --BUG FIX: gear.chironic_aspir_legs undefined for WHM; Ebers Pant+3 sub
		feet=WHM_Empy_Feet
		}

    sets.midcast.Drain.Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Null Loop",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Ebers Bliaut +3",hands="Ebers Mitts +3",ring1=Stikini_ring1,ring2="Metamor. Ring +1",
		back="Null Shawl",waist="Null Belt",legs="Ebers Pant. +3",feet="Ebers Duckbills +3"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {
		main=gear.grioavolr_fc_staff,
		sub="Clerisy Strap",
		ammo="Hasty Pinion +1",
		head="Bunzi's Hat",
		neck="Clr. Torque +2", --MP+50/Cure potency+10%/Erase+1 [Path A R24]
		ear1="Gwati Earring",
		ear2="Malignance Earring",
		body="Inyanga Jubbah +2",
		hands=gear_fanatic_fc, --Fanatic Gloves FC aug: defined in Mrfiend-Items.lua
		ring1="Kishar Ring",
		ring2="Prolix Ring", --FC ring: MP+20/Enmity-3/FC (NOT enh dur)
		back="Aurist's Cape +1", --"Alaunus's Cape",
		waist="Embla Sash",
		legs="Aya. Cosciales +2",
		feet="Regal Pumps +1"
		}

	sets.midcast.Stun.Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",head="Ebers Cap +3",neck="Null Loop",ear1="Gwati Earring",ear2="Malignance Earring",body="Ebers Bliaut +3",hands="Ebers Mitts +3",ring1="Stikini Ring +1",ring2="Metamor. Ring +1",back="Null Shawl",waist="Null Belt",legs="Ebers Pant. +3",feet="Ebers Duckbills +3"}
		
	sets.midcast.Dispel = {
		main="Daybreak",
		sub="Ammurapi Shield",			--"Ammurapi Shield"
		ammo="Pemphredo Tathlum",
		head=WHM_Empy_Head,
		neck="Incanter's Torque", --"Null Loop",
		ear1="Gwati Earring",
		ear2="Malignance Earring",
		body=WHM_Empy_Body,
		hands=WHM_Empy_Hand,
		ring1=Stikini_ring1,
		ring2="Metamor. Ring +1",
		back="Aurist's Cape +1",				--"Null Shawl"
		waist="Null Belt",
		legs=WHM_Empy_Legs,
		feet=WHM_Empy_Feet
		}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})

	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",							--"Daybreak",
		sub="Ammurapi Shield",						--Thuellaic Ecu +1 "Ammurapi Shield
		ammo="Pemphredo Tathlum",						--"Pemphredo Tathlum"			
		head=WHM_AF_Head,
		neck="Null Loop",							--"Null Loop", Erra Pendant
		ear1="Malignance Earring",							--Ebers Earring +2 Gwati Earring
		ear2="Ebers Earring +1",						--Regal Earring
		body=WHM_AF_Body,
		hands="Kaykaus Cuffs +1",
		ring1=Stikini_ring1,
		ring2=Stikini_ring2,
		back="Aurist's Cape +1",			
		waist="Obstin. Sash",				--"Obstinate Sash", "Null Belt"
		legs=gear.chironic_macc_legs,				--get 30macc
		feet=WHM_AF_Feet
		}

	sets.midcast['Enfeebling Magic'].Resistant = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head=WHM_AF_Head,
		neck="Erra Pendant",
		ear1="Malignance Earring",
		ear2="Ebers Earring +1",
		body=WHM_AF_Body,
		hands=WHM_AF_Hand,
		ring1=Stikini_ring1,
		ring2="Metamor. Ring +1",
		back="Null Shawl", --"Aurist's Cape +1",					--"Null Shawl"
		waist="Null Belt",
		legs=gear.chironic_macc_legs,
		feet=WHM_AF_Feet
		}
		
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {
			ammo="Per. Lucky Egg",
			feet=WHM_Empy_Feet, --BUG FIX: gear.chironic_treasure_feet undefined for WHM
			waist="Chaac Belt"
			})
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'])

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets

		sets.resting ={
		main="Mpaca's Staff",
		sub="Clerisy Strap",
		ammo="Impatiens",
		head="Bunzi's Hat",					--head="Bunzi's Hat",
		neck="Sibyl Scarf",					--neck="Clr. Torque +1",
		ear1="Sanare Earring",
		ear2="Ethereal Earring",
		body=WHM_Empy_Body,
		hands=WHM_AF_Hand,				--hands="Fanatic Gloves",
		ring1=Stikini_ring1,
		ring2=Stikini_ring2,				--ring2="Lebeche Ring",
		back="Null Shawl",				--back="Perimede Cape", Null Shawl Alaunus's Cape
		waist="Null Belt",
		legs="Assid. Pants +1",			--Assid. Pants +1
		feet="Regal Pumps +1"				--feet="Regal Pumps +1"
		}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
		
--[[		sets.idle = {
		main=gear.grioavolr_fc_staff,		--main=gear.grioavolr_fc_staff,
		sub="Clerisy Strap",					--"Clerisy Strap"
		ammo="Impatiens",
		head="Bunzi's Hat",					--head="Bunzi's Hat",
		neck="Sibyl Scarf",					--neck="Clr. Torque +1",
		ear1="Sanare Earring",
		ear2="Malignance Earring",
		body=WHM_Empy_Body,
		hands="Volte Gloves",				--hands="Fanatic Gloves",
		ring1="Stikini Ring +1",						--ring2="Lebeche Ring",
		back="Perimede Cape",				--back="Perimede Cape", Alaunus's Cape
		waist="Null Belt",				--"Witful Belt"
		ring2="Stikini Ring +1",
		legs="Inyanga Shalwar +2",
		feet="Bunzi's Sabots"				--feet="Regal Pumps +1"
		}]]
	sets.idle = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Eabani Earring",
		ear2=WHM_Empy_Ear,
		body=WHM_Empy_Body,
		hands="Bunzi's Gloves",
		ring1=Stikini_ring1,
		ring2="Shadow Ring",
		back="Moonlight Cape",					--"Null Shawl"
		waist="Fucho-no-obi", --"Plat. Mog. Belt",
		legs=WHM_Empy_Legs,
		feet=WHM_Empy_Feet
		}		
		sets.idle.Town = set_combine(sets.idle, {feet="Herald's Gaiters",ring2="Shneddick Ring"})
		sets.idle.Field = set_combine(sets.idle, {feet="Herald's Gaiters",ring2="Shneddick Ring"})
		
	sets.idle.PDT = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		ear1="Sanare Earring",
		ear2=WHM_Empy_Ear,
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Defending Ring",
		ring2="Shadow Ring",
		back="Moonlight Cape",			--"Shadow Mantle"
		waist="Null Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
		
	sets.idle.MDT = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Sanare Earring",
		ear2=WHM_Empy_Ear,
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		ring1="Defending Ring",
		ring2="Shadow Ring",
		back="Null Shawl",					--"Null Shawl"
		waist="Null Belt",
		legs=WHM_Empy_Legs,
		feet=WHM_Empy_Feet
		}
		
	sets.idle.MEVA = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Sanare Earring",
		ear2=WHM_Empy_Ear,
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		ring1="Warden's Ring",
		ring2="Purity Ring",
		back="Moonlight Cape",
		waist="Null Belt",
		legs=WHM_Empy_Legs,
		feet=WHM_Empy_Feet
		}
		
	-- Situational Idle sets
    sets.Kiting = {feet="Herald's Gaiters",ring2="Shneddick Ring"}
    sets.latent_refresh = {
		--main="Queller Rod",
		body=WHM_Empy_Body,
		waist="Fucho-no-obi",
		ring1=Stikini_ring1,
		ring2=Stikini_ring2,
		hands="Volte Gloves",
		--head="Inyanga Tiara +2"
		}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {
		body=WHM_Empy_Body,
		waist="Fucho-no-obi",
		ring1=Stikini_ring1,
		ring2=Stikini_ring2,
		hands="Volte Gloves",
		}
	sets.NightIdle = {
		body=WHM_Empy_Body,
		waist="Fucho-no-obi",
		ring1=Stikini_ring1,
		ring2=Stikini_ring2,
		hands="Volte Gloves",
		}

    -- Defense sets

	sets.defense.PDT = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		ear1="Sanare Earring",
		ear2=WHM_Empy_Ear,
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Defending Ring",
		ring2="Shadow Ring",
		back="Moonlight Cape",
		waist="Null Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}

	sets.defense.MDT = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Sanare Earring",
		ear2=WHM_Empy_Ear,
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		ring1="Defending Ring",
		ring2="Shadow Ring",
		back="Moonlight Cape",
		waist="Null Belt",
		legs=WHM_Empy_Legs,
		feet=WHM_Empy_Feet
		}

    sets.defense.MEVA = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Sanare Earring",
		ear2=WHM_Empy_Ear,
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		ring1="Warden's Ring",
		ring2="Purity Ring",
		back="Moonlight Cape",
		waist="Null Belt",
		legs=WHM_Empy_Legs,
		feet=WHM_Empy_Feet
		}
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
		main="Maxentius",					--Rubicundity --main="Maxentius",
		sub="Ammurapi Shield",					--sub="Genmei Shield",	 Sors Shield
		ammo="Amar Cluster", --"Hasty Pinion +1",				--ammo="Staunch Tathlum", "Amar Cluster"
		head="Bunzi's Hat",					--head="Nyame Helm", "Bunzi's Hat"
		neck="Null Loop", --"Sanctity Necklace",					--"Null Loop", "Sanctity Necklace" Combatants Torque
		ear1="Cessance Earring", --"Dedition Earring",				--"Brutal Earring", Telos Earring
		ear2="Telos Earring",				--"Dedition Earring" Cessance Earring
		body="Nyame Mail",--WHM_Empy_Body,						--Kaykaus Bliaut +1 "Nyame Mail",	
		hands="Gazu Bracelets +1",				--"Nyame Gauntlets", "Bunzi's Gloves"
		ring1=Chirich_ring1,
		ring2=Chirich_ring2,				--Defending Ring
		back="Null Shawl",						--back="Null Shawl", Alaunus's Cape
		waist="Null Belt", --"Windbuffet Belt +1",						--waist="Null Belt", Cetl Belt Grunfeld rope
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
		
    sets.engaged.Acc = {main="Maxentius",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Null Loop",ear1="Crep. Earring",ear2="Telos Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.engaged.DW = 
		{
		--main="Maxentius",sub="Genmei Shield",
		ammo="Amar Cluster", --"Hasty Pinion +1",				--ammo="Staunch Tathlum", "Amar Cluster"
		head="Bunzi's Hat",					--head="Nyame Helm", "Bunzi's Hat"
		neck="Null Loop", --"Sanctity Necklace",					--"Null Loop", "Sanctity Necklace" Combatants Torque
		ear1="Cessance Earring", --"Dedition Earring",				--"Brutal Earring", Telos Earring
		ear2="Telos Earring",				--"Dedition Earring" Cessance Earring
		body="Nyame Mail",--WHM_Empy_Body,						--Kaykaus Bliaut +1 "Nyame Mail",	
		hands="Gazu Bracelets +1",				--"Nyame Gauntlets", "Bunzi's Gloves"
		ring1=Chirich_ring1,
		ring2=Chirich_ring2,				--Defending Ring
		back="Null Shawl",						--back="Null Shawl", Alaunus's Cape
		waist="Windbuffet Belt +1", --"Null Belt", --"Windbuffet Belt +1",						--waist="Null Belt", Cetl Belt Grunfeld rope
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
		

    sets.engaged.DW.Acc = {--main="Maxentius",sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Null Loop",ear1="Suppanomimi",ear2="Telos Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands=WHM_Empy_Hand,back="Mending Cape"}
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	sets.buff['Afflatus Solace'] ={feet=WHM_Relic_Feet,waist="Embla Sash"}

	sets.HPDown = {
		main="Queller Rod",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Pixie Hairpin +1",
		neck="Loricate Torque +1",
		ear1="Mendi. Earring", --V1 FIX: Hirudinea Earring NOT IN INVENTORY; Mendi=Cure+5%/cast-5%
		ear2="Ethereal Earring",
		body="Councilor's Garb",
		hands="Hieros Mittens",
		ring1="Defending Ring",
		ring2="Defending Ring", --V1 FIX: Persis Ring NOT IN INVENTORY; Defending Ring=DT-10%
		back="Null Shawl",
		waist="Null Belt",
		legs="",
		feet=""}

	sets.HPCure = {
		main="Queller Rod", --your aug: Heal skill+15/Cure potency+10%/Cure cast-7%
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head=WHM_Empy_Head,
		neck="Nodens Gorget", --Stoneskin+30/Cure potency+5%
		ear1="Etiolation Earring",
		ear2="Odnowa Earring +1",
		body=WHM_Empy_Body,
		hands=WHM_AF_Hand, --V1 FIX: Bokwus Gloves NOT IN INVENTORY; Theo.Mitts+4: Cure potency II+4%/Heal+22
		ring1="Sirona's Ring",
		ring2="Lebeche Ring",
		back=gear.jse_MND_Cure,
		waist="Eschan Stone",
		legs=WHM_Relic_Legs,
		feet=WHM_Empy_Feet
		}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 5)
end

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function user_job_lockstyle()
	if player.sub_job == 'SCH' then
		if state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
			windower.chat.input('/lockstyleset 016')
		elseif state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
			windower.chat.input('/lockstyleset 016')
		else
			windower.chat.input('/lockstyleset 016')
		end
	else
		windower.chat.input('/lockstyleset 016')
	end
end

