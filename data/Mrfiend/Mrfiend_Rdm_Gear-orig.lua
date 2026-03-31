function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Match','Cap')
	state.CastingMode:options('Normal','Resistant','Proc','SIRD')
    state.IdleMode:options('Normal','PDT','MDT','MEVA','Aminon')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.BuffWeaponsMode = M{'Always','Never'}
	state.AutoBuffMode = M{['description'] = 'Auto Buff Mode','Off','Auto','AutoMelee','AutoMage'}
	state.Weapons:options('None','Naegling','Maxentius','Crocea','Tauret','EnspellOnly','DualWeapons','DualWeaponsAcc','NaeglCrep',
							'DualMaxentiusTP','DualMaxAcc','DualCrocea','DualCroceaTP'--'DualMaxentiusAcc','DualAeolian','DualEnspellOnly'
							)
	state.WeaponSets:options('Default','Dual','Proc','Dynamis','Sortie')

	weapon_sets = {
		['Default'] = {'None','Naegling','Maxentius','Crocea','Tauret','EnspellOnly'},
		['Dual'] = {'None','DualWeapons','NaeglCrep','DualWeaponsAcc',
					'DualMaxentiusTP', 'DualMaxAcc','DualCrocea', 'DualAeolian', --,'DualCrocCre','DualCroceaTP','DualMaxentiusAcc','DualAeolian',
					'DualEnspellOnly','DualEnspellOnlyCRoc'
					},
		
		['Dynamis'] = {'DualCroceaSavageBlade','DualCrocea','DualCrocCre','DualTauretCrocea','DualAeolian'},
		['Proc'] = {'ProcSword','ProcDagger','DualProcSword','DualProcDagger'},
		['Sortie']  = {'None','DualWeapons','DualMaxentiusTP','DualMaxentiusAcc','DualCrocea','DualCroceaTP'},
	}

	default_weapons = 'Naegling'
	default_dual_weapons = 'DualWeapons'

	autows_list =  {['Naegling']='Savage Blade',['Maxentius']='Black Halo',['Crocea']='Sanguine Blade',['Tauret']='Aeolian Edge',['DualWeapons']='Savage Blade',['DualWeaponsAcc']='Savage Blade',
					['DualMaxentius']='Black Halo',['DualMaxentiusAcc']='Black Halo',['DualEvisceration']='Evisceration',['DualCrocea']='Sanguine Blade',['DualClubs']='Black Halo',
					['DualAeolian']='Aeolian Edge',['DualPrime']='Exenterator',['DualCroceaSavageBlade']="Savage Blade",['CroceaDaybreak']="Seraph Blade",["DualTauretCrocea"]="Aeolian Edge",["DualTrialTP"]='Savage Blade'}
	trust_list = {"Joachim","Ulmia","Qultada","Yoran-Oran (UC)","Selh'teus"}

	gear.obi_high_nuke_back = "Toro Cape"
	gear.obi_high_nuke_waist = "Refoccilation Stone"


--Interim generic use of ambucape
gear.mnd_enfeebling_jse_back = {name="Sucellos's Cape",augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Haste+10','Damage taken-5%',}, bag="Wardrobe 7"}
gear.str_wsd_jse_back = {name="Sucellos's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',},bag="Wardrobe"}
gear.physical_mnd_wsd_jse_back	=  {name="Sucellos's Cape",augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',},bag="Wardrobe"}
gear.int_enfeebling_jse_back = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Haste+10','Spell interruption rate down-10%',}}
gear.magical_mnd_wsd_jse_back = {name="Sucellos's Cape",augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Haste+10','Damage taken-5%',},bag="Wardrobe 7"} 
gear.int_wsd_jse_back = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Haste+10','Spell interruption rate down-10%',}} --make w/int/wsd
gear.nuke_jse_back = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Haste+10','Spell interruption rate down-10%',}}
gear.dw_jse_back = {name="Sucellos's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}, bag="Wardrobe 2"}
gear.dex_wsd = {name="Sacro Mantle"}



--[[ --merlinic and chironic augs and psycloth lappas below - but are in the _items.lua file
gear.grioavolr_fc_staff = { name="Grioavolr", augments={'"Fast Cast"+7','MP+54','Mag. Acc.+5','Magic Damage +3',}}
gear.chironic_nuke_body = { name="Chironic Doublet", augments={'"Fast Cast"+3','INT+5','Mag. Acc.+9',}}
gear.chironic_macc_legs = { name="Chironic Hose", augments={'Mag. Acc.+30','"Fast Cast"+6','"Mag.Atk.Bns."+10',}, bag="Wardrobe 4",}
gear.chironic_fc_legs = { name="Chironic Hose", augments={'Mag. Acc.+24','"Fast Cast"+7','"Mag.Atk.Bns."+15',}, bag="Wardrobe 5",}
gear.merlinic_occult_hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+5','MND+4','Mag. Acc.+15',}}
gear.merlinic_occult_feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+4','VIT+9',}}
gear.merlinic_nuke_head = { name="Merlinic Hood", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+4','Mag. Acc.+10',}}
gear.merlinic_refresh_feet = { name="Merlinic Crackows", augments={'Pet: INT+1','Magic dmg. taken -3%','"Refresh"+2','Accuracy+2 Attack+2',}, bag="Wardrobe 2",}
gear.merlinic_fc_head = { name="Merlinic Hood", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+4','Mag. Acc.+10',}}
gear.merlinic_fc_feet= { name="Merlinic Crackows", augments={'Mag. Acc.+16','"Fast Cast"+6','MND+2',},bag="Wardrobe 6",}
gear.merlinic_fc_legs = { name="Merlinic Shalwar", augments={'"Fast Cast"+7','Mag. Acc.+10',}}
psycloth lapps = path B
]]


	--make these capes

--	gear.physical_mnd_wsd_jse_back = {name="Sucellos's Cape",augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}}
--  gear.nuke_jse_back = {name="Sucellos's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}	
	
	--[[these maybe
	
	gear.magical_mnd_wsd_jse_back = {name="Sucellos's Cape",augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-3%',}} --sanguine/seraph
	gear.int_wsd_jse_back = {name="Sucellos's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}} --blackhalo
	gear.dw_jse_back = {name="Sucellos's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}}
	]]
	
	RDM_Relic_Head		= "Viti. Chapeau +4" 
	RDM_Relic_Body		= "Viti. Tabard +4"  
	RDM_Relic_Hand		= "Viti. Gloves +4"  
	RDM_Relic_Legs		= "Viti. Tights +4" 
	RDM_Relic_Feet		= "Viti. Boots +4"   

	RDM_AF_Head			= "Atro. Chapeau +4"  
	RDM_AF_Body			= "Atrophy Tabard +4"  
	RDM_AF_Hand			= "Atro. Gloves +4"  
	RDM_AF_Legs			= "Atrophy Tights +4"   
	RDM_AF_Feet			= "Atro. Boots +3"   

	RDM_Empy_Head		= "Leth. Chappel +3"  
	RDM_Empy_Body		= "Lethargy Sayon +3"    
	RDM_Empy_Hand		= "Leth. Ganth. +3" 
	RDM_Empy_Legs		= "Leth. Fuseau +3"    
	RDM_Empy_Feet		= "Leth. Houseaux +3"   
	RDM_Empy_Ear2		= "Lethargy Earring +1"  --augs: acc12/maac12 +4%DA
	
		-- Additional local binds
		-- ^ = cntrl
		-- ! = alt
		-- @ = winkey
	send_command('bind @` gs c cycle ElementalMode')
	send_command('bind ^` gs c scholar dark')
	send_command('bind !` gs c scholar light')
	send_command('bind !backspace input /ja "Composure" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind @backspace input /ja "Spontaneity" <t>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Initialize;gs c set unlockweapons false')
	--send_command('bind ^q gs c set weapons DualEnspellOnly;gs c set unlockweapons true')
	send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Initialize;gs c set unlockweapons false')
	send_command('bind ^q gs c toggle unlockweapons')
	send_command('bind !r gs c set skipprocweapons true;gs c set weaponsets Default;gs c reset weaponskillmode;gs c weapons none')
	send_command('bind !q gs c set skipprocweapons false;gs c set weaponsets proc;gs c set weaponskillmode proc;gs c set weapons DualProcSword')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Naegling = {main="Naegling",sub="Sacro Bulwark",range=empty}
	sets.weapons.Crocea = {main="Crocea Mors",sub="Ammurapi Shield",range=empty}
	sets.weapons.Maxentius = {main="Maxentius",sub="Ammurapi Shield",range=empty}
	sets.weapons.Tauret = {main="Tauret",sub="Ammurapi Shield",range=empty}
	sets.weapons.DualWeapons = {main="Naegling",sub="Thibron",range=empty}
	sets.weapons.DualWeaponsAcc = {main="Naegling",sub="Ternion Dagger +1",range=empty}
	sets.weapons.DualPrime = {main="Mpu Gandring",sub="Gleti's Knife",range=empty}
	sets.weapons.DualEvisceration = {}
	sets.weapons.DualCrocea = {main="Crocea Mors",sub="Daybreak",range=empty}
	sets.weapons.DualCroceaTP = {main="Crocea Mors",sub="Thibron",range=empty}
	sets.weapons.DualCrocCre = {main="Crocea Mors",sub="Crepuscular Knife",range=empty}
	sets.weapons.DualAeolian = {main="Tauret",sub="Thibron",range=empty}
	sets.weapons.DualProcSword = {main="Demers. Degen +1",sub="Crepuscular Knife",range=empty}
	sets.weapons.ProcSword = {main="Demers. Degen +1",sub="Ammurapi Shield",range=empty}
	sets.weapons.ProcDagger = {main="Blurred Knife +1",sub="Ammurapi Shield",range=empty}
	sets.weapons.DualProcDagger = {main="Blurred Knife +1",sub="Demers. Degen +1",range=empty}
	sets.weapons.EnspellOnly = {main="Qutrub Knife",sub="Ammurapi Shield"}
	sets.weapons.DualEnspellOnly = {main="Qutrub Knife",sub="Wind Knife"}
	sets.weapons.DualEnspellOnlyCRoc = {main="Crocea Mors",sub="Archduke's Sword"}
	sets.weapons.DualBow = {}
	sets.weapons.BowMacc = {}
	sets.weapons.DualMaxentiusTP = {main="Maxentius",sub="Thibron",range=empty}
	sets.weapons.DualMaxAcc = {main="Maxentius",sub="Ternion Dagger +1",range=empty}
	sets.weapons.NaeglCrep = {main="Naegling",sub="Crepuscular Knife"}
	sets.weapons.None ={}
	
	--Temporary Weapon Sets for Dynamis RP
	sets.weapons.DualCroceaSavageBlade = {main="Crocea Mors",sub="Thibron"}
	sets.weapons.DualTauretCrocea = {main="Tauret",sub="Crocea Mors"}
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body=RDM_Relic_Body}
	
	-- Steps (Pure Acc)
    sets.precast.Step = {ammo="Hasty Pinion +1",
		head="Malignance Chapeau",neck="Null Loop",ear1="Zennaroi Earring",ear2="Crepuscular Earring",
		body="Malignance Tabard",hands="Malignance Gloves",left_ring="Cacoethic Ring +1",right_ring=Chirich_ring2,
		back="Null Shawl",waist="Null Belt",legs="Malignance Tights",feet="Malignance Boots"}

	-- Violent Flourish (Macc & Acc)
    sets.precast.JA['Violent Flourish'] = {ammo="Regal Gem",--Or range="Ullr" but swapping to this makes you lose TP.
		head=RDM_Empy_Head,neck="Null Loop",ear1="Malignance Earring",ear2="Crepuscular Earring",
		body="Malignance Tabard",hands=RDM_Empy_Hand,left_ring=Stikini_left_ring,right_ring="Metamorph Ring +1",
		back="Null Shawl",waist="Null Belt",legs=RDM_Empy_Legs,feet=RDM_Empy_Feet}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {legs="Dashing Subligar"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	sets.precast.FC = {	
		main="Crocea Mors", 
		sub="Sacro Bulwark", --"Ammurapi Shield", --"Sacro Bulwark",
		ammo="Impatiens", 
		head=RDM_AF_Head, 
		neck="Voltsurge Torque", 
		ear1="Malignance Earring",
		ear2=RDM_Empy_Ear2, 
		body=RDM_Relic_Body, 
		hands=RDM_Empy_Hand, 
		left_ring="Kishar Ring", 
		right_ring="Murky Ring", --"Lebeche Ring",
		back="Fi Follet Cape +1", --"Perimede Cape",
		waist="Witful Belt",
		legs=gear.chironic_fc_legs, 
		feet=gear.merlinic_fc_feet 
		}
		
		sets.precast.FC.DW = {	
		main="Crocea Mors", 
		sub="Sacro Bulwark", --"Ammurapi Shield", --"Sacro Bulwark",
		ammo="Impatiens", 
		head=RDM_AF_Head, 
		neck="Voltsurge Torque", 
		ear1="Malignance Earring",
		ear2=RDM_Empy_Ear2, 
		body=RDM_Relic_Body, 
		hands="Leyline Gloves",
		left_ring="Kishar Ring", --"Defending Ring",
		right_ring="Murky Ring",
		back="Fi Follet Cape +1", --"Perimede Cape",
		waist="Witful Belt",
		legs=gear.chironic_fc_legs, 
		feet=gear.merlinic_fc_feet 
		}
		
	sets.precast.FC.DT = {
		main="Sakpata's Sword",
		sub="Sacro Bulwark",
		ammo="Impatiens",
		head=RDM_AF_Head,
		neck="Loricate Torque +1",
		ear1="Malignance Earring",
		ear2=RDM_Empy_Ear2,
		body=RDM_Relic_Body,
		hands="Nyame Gauntlets",
		left_ring="Murky Ring",
		right_ring="Lebeche Ring",
		back="Fi Follet Cape +1", --"Perimede Cape",
		waist="Witful Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}

	sets.precast.FullFC = {
		main=gear.grioavolr_fc_staff,
		sub="Clerisy Strap",
		ammo="Impatiens",
		head=RDM_AF_Head,
		neck="Voltsurge Torque", --"Orunmila's Torque",
		ear1="Malignance Earring",
		ear2=RDM_Empy_Ear2,
		body=RDM_Relic_Body,
		hands="Gende. Gages +1",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back="Fi Follet Cape +1", --"Perimede Cape",
		waist="Witful Belt",
		legs="Aya. Cosciales +2",
		feet=gear.merlinic_fc_feet
		}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FullFC, {head=empty,body="Twilight Cloak",
	--body="Crepuscular Cloak"
	})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
		sub="Ammurapi Shield" --"Sacro Bulwark"
		})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		range=empty,
		ammo="Oshasha's Treatise",
		head=RDM_Relic_Head,
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		left_ring="Sroda Ring",
		right_ring="Ephramad's ring",
		back=gear.str_wsd_jse_back,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet=RDM_Empy_Feet
		}
		
	sets.precast.WS.Proc = 	{ammo="Hasty Pinion +1",
		head="Malignance Chapeau",neck="Null Loop",ear1="Zennaroi Earring",ear2="Crepuscular Earring",
		body="Malignance Tabard",hands="Malignance Gloves",left_ring="Cacoethic Ring +1",right_ring=Chirich_ring2,
		back="Null Shawl",waist="Null Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {
			ranged=Empty,
			ammo="Coiste Bodhar",
			head=RDM_Relic_Head,
			body=RDM_Empy_Body,
			hands=RDM_AF_Hand,
			legs=RDM_Empy_Legs,
			feet=RDM_Empy_Feet,
			neck="Rep. Plat. Medal",
			waist="Fotia Belt",
			ear1="Malignance Earring",
			ear2="Moonshade Earring",
			left_ring="Metamor. Ring +1",
			right_ring="Ephramad's ring",
			back=gear.physical_mnd_wsd_jse_back,
		}
		
	sets.precast.WS['Requiescat'].CAP=set_combine(sets.precast.WS['Requiescat'],{
		-- OPTIMIZED: When attack capped, swap to accuracy/WSD pieces
		neck="Dls. Torque +2",     -- WSD+5% on cap replaces Rep. Plat. Medal
		hands=RDM_AF_Hand,          -- Atro. Gloves +4: MND+16/acc/WSD vs Empy for capped attack
		ammo="Crepuscular Pebble",  -- Atk->Acc/WSD trade
		})

	sets.precast.WS['Chant Du Cygne'] = {
		ranged=Empty,
		ammo="Aurgelmir Orb +1",
		head="Blistering Sallet +1",
		body="Nyame Mail", --"Malignance Tabard",
		hands="Malignance Gloves",
		legs="Zoar Subligar +1",
		feet="Leth. Houseaux +3",
		neck="Rep. Plat. Medal",
		waist="Fotia Belt",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
		right_ring="Begrudging Ring", --"Ilabrat Ring",
		left_ring="Ephramad's ring",
		back="Sacro Mantle",--gear.str_wsd_jse_back,
		}
	sets.precast.WS['Chant Du Cygne'].CAP = set_combine(sets.precast.WS['Chant Du Cygne'],{})
		
	sets.precast.WS['Evisceration'] = {
		range=gear.empty,
		ammo="Coiste Bodhar",
		head="Blistering Sallet +1",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		right_ring="Epaminondas's Ring",
		left_ring="Begrudging Ring",
		back=gear.dex_wsd, --gear.str_wsd_jse_back,
		waist="Fotia Belt",
		legs="Zoar Subligar +1", --"Nyame Flanchard",
		feet=RDM_Empy_Feet
		}
		
	sets.precast.WS['Evisceration'].CAP = set_combine(sets.precast.WS['Evisceration'],{
		-- OPTIMIZED: When attack capped, swap neck to Dls. Torque +2 (WSD path)
		neck="Dls. Torque +2",
		ammo="Crepuscular Pebble",
		})
	

	sets.precast.WS['Savage Blade'] = {
		ranged=Empty,
		ammo="Coiste Bodhar", --"Oshasha's Treatise",
		head=RDM_Relic_Head,
		body="Nyame Mail",
		hands="Nyame Gauntlets", --RDM_AF_Hand,
		legs="Nyame Flanchard",
		feet=RDM_Empy_Feet,
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1", --"Fotia Belt", --"Kentarch Belt +1", --fotia belt
		ear1="Ishvara Earring", --"Sherida Earring",
		ear2="Moonshade Earring",
		left_ring="Ephramad's ring",
		right_ring="Epaminondas's Ring",
		back=gear.str_wsd_jse_back,
		}
	sets.precast.WS['Savage Blade'].CAP = {
		ranged=Empty,
		ammo="Crepuscular Pebble", --"Coiste Bodhar", --"Oshasha's Treatise",
		head=RDM_Relic_Head,
		body="Nyame Mail",
		hands=RDM_AF_Hand,
		legs="Nyame Flanchard",
		feet=RDM_Empy_Feet,
		neck="Dls. Torque +2", 
		waist="Sailfi Belt +1", --"Fotia Belt", --"Kentarch Belt +1", --fotia belt
		ear1="Ishvara Earring", --"Sherida Earring",
		ear2="Moonshade Earring",
		left_ring="Ephramad's ring",
		right_ring="Epaminondas's Ring",--"Sroda Ring",
		back=gear.str_wsd_jse_back,
		}
		
	sets.precast.WS['Black Halo'] = {
		ranged=Empty,
		ammo="Coiste Bodhar", --"Crepuscular Pebble", --"Oshasha's Treatise",
		head=RDM_Relic_Head,
		body="Nyame Mail",
		hands="Nyame Gauntlets", --RDM_AF_Hand,
		legs="Nyame Flanchard",
		feet=RDM_Empy_Feet,
		neck="Rep. Plat. Medal", --"Dls. Torque +2", --"Null Loop",
		waist="Sailfi Belt +1", --"Kentarch Belt +1",
		ear1="Regal Earring", --"Domin. Earring +1",
		ear2="Moonshade Earring",
		right_ring="Epaminondas's Ring", --"Sroda Ring", --"Epaminondas's Ring",
		left_ring="Ephramad's ring",
		back=gear.str_wsd_jse_back, --gear.physical_mnd_wsd_jse_back,
		}

	sets.precast.WS['Black Halo'].CAP = {
		ranged=Empty,
		ammo="Crepuscular Pebble", --"Oshasha's Treatise",
		head=RDM_Relic_Head,
		body="Nyame Mail", --"Bunzi's Robe", --,
		hands=RDM_AF_Hand,
		legs="Nyame Flanchard",
		feet=RDM_Empy_Feet,
		neck="Dls. Torque +2", --"Null Loop",
		waist="Sailfi Belt +1", --"Kentarch Belt +1",
		ear1="Regal Earring", --"Domin. Earring +1",
		ear2="Moonshade Earring",
		right_ring="Epaminondas's Ring",
		left_ring="Ephramad's ring",
		back=gear.physical_mnd_wsd_jse_back,
		}

	sets.precast.WS['Sanguine Blade'] = {
			ranged=Empty,
			ammo="Sroda Tathlum",
			head="Pixie Hairpin +1",
			body="Nyame Mail", --RDM_Empy_Body,
			hands="Jhakri Cuffs +2", --RDM_Empy_Hand,
			legs="Nyame Flanchard", --RDM_Empy_Legs,
			feet=RDM_Empy_Feet,
			neck="Baetyl Pendant",
			waist="Orpheus's Sash", --"Fotia Belt",
			ear1="Malignance Earring",
			ear2="Regal Earring",
			left_ring="Freke Ring",
			right_ring="Epaminondas's Ring",
			back=gear.physical_mnd_wsd_jse_back,
		}
	
	sets.precast.WS['Sanguine Blade'].CAP = set_combine(sets.precast.WS['Sanguine Blade'], {
		-- OPTIMIZED: Sanguine capped - at higher buff levels swap to more INT/MND gear
		ammo="Sroda Tathlum",  -- MAB floor; keep
		-- Note: Sanguine scales on INT-MND diff vs target; MND cape already optimal
		})
		
	sets.precast.WS['Seraph Blade'] = {
			ranged=Empty,
			ammo="Sroda Tathlum",
			head=RDM_Empy_Head,
			body="Nyame Mail", --RDM_Empy_Body,
			hands=RDM_Empy_Hand,
			legs="Nyame Flanchard", --RDM_Empy_Legs,
			feet=RDM_Empy_Feet,
			neck="Sanctity Necklace", --"Warder's Charm +1", --"Baetyl Pendant",
			waist="Orpheus's Sash", --"Fotia Belt", --"Sacro Cord", --"Fotia Belt",
			ear1="Malignance Earring",
			ear2="Moonshade Earring",
			left_ring="Freke Ring",
			right_ring="Epaminondas's Ring",
			back=gear.physical_mnd_wsd_jse_back,
		}
	sets.precast.WS['Seraph Blade'].CAP = set_combine(sets.precast.WS['Seraph Blade'], {
		-- OPTIMIZED: Seraph Blade is MND-based magical WS. At cap swap neck for MAB
		neck="Baetyl Pendant", -- more MAB when macc confirmed
		})
		
	sets.precast.WS['Shining Strike'] = sets.precast.WS['Seraph Blade'] 
	sets.precast.WS['Flash Nova'] = sets.precast.WS['Seraph Blade'] 
		
	sets.precast.WS['Aeolian Edge'] = {
			ranged=Empty,
			ammo="Sroda Tathlum",
			head=RDM_Empy_Head,
			body="Nyame Mail", --RDM_Empy_Body,
			hands="Jhakri Cuffs +2",
			legs=RDM_Empy_Legs,
			feet=RDM_Empy_Feet,
			neck="Sibyl Scarf",
			waist="Orpheus's Sash", --"Sacro Cord", --"Fotia Belt",
			ear1="Moonshade Earring",
			ear2="Malignance Earring",
			left_ring="Freke Ring",
			right_ring="Epaminondas's Ring",
			back=gear.dex_wsd, --gear.int_wsd_jse_back,
		}
		
	sets.precast.WS['Aeolian Edge'].CAP = set_combine(sets.precast.WS['Aeolian Edge'], {
		-- OPTIMIZED: Aeolian capped - swap neck to Sibyl Scarf or Baetyl Pendant depending on MB vs no-MB
		-- At attack cap, Moonshade Earring TP bonus becomes less valuable if already at 3000 TP
		ammo="Sroda Tathlum",   -- keep; Sroda helps INT/MAB floor
		})
		
	sets.precast.WS['Red Lotus Blade'] = {		
			ranged=Empty,
			ammo="Sroda Tathlum",
			head=RDM_Empy_Head,
			body="Nyame Mail", --RDM_Empy_body,
			hands="Jhakri Cuffs +2", --RDM_Empy_Hand,
			legs="Nyame Flanchard", --RDM_Empy_Legs,
			feet=RDM_Empy_Feet,
			neck="Sibyl Scarf",
			waist="Orpheus's Sash", --"Sacro Cord", --"Fotia Belt",
			ear1="Malignance Earring",
			ear2="Moonshade Earring",
			left_ring="Freke Ring",
			right_ring="Epaminondas's Ring",
			back=gear.int_wsd_jse_back --gear.str_wsd_jse_back,
		}
	sets.precast.WS['Red Lotus Blade'].CAP = set_combine(sets.precast.WS['Red Lotus Blade'],{
		-- OPTIMIZED: At attack/magic acc cap, swap neck for more MAB
		neck="Baetyl Pendant",  -- MAB > Sibyl Scarf when macc is confirmed sufficient
		})

	sets.precast.WS['Burning Blade'] = {		
			ranged=Empty,
			ammo="Sroda Tathlum",
			head=RDM_Empy_Head,
			body="Nyame Mail", --RDM_Empy_body,
			hands="Jhakri Cuffs +2", --RDM_Empy_Hand,
			legs="Nyame Flanchard", --RDM_Empy_Legs,
			feet=RDM_Empy_Feet,
			neck="Sibyl Scarf",
			waist="Orpheus's Sash", --"Sacro Cord", --"Fotia Belt",
			ear1="Malignance Earring",
			ear2="Moonshade Earring",
			left_ring="Freke Ring",
			right_ring="Epaminondas's Ring",
			back=gear.int_wsd_jse_back --gear.str_wsd_jse_back,
		}

	sets.precast.WS['Burning Blade'].CAP = set_combine(sets.precast.WS['Burning Blade'],{
		-- OPTIMIZED: same logic as Red Lotus Blade - at cap swap neck for MAB
		neck="Baetyl Pendant",
		})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear2="Brutal Earring"}
	sets.AccMaxTP = {ear2="Telos Earring"}
	sets.MagicalMaxTP = {ear2="Friomisi Earring"}
	
	-- Midcast Sets

	-- Gear that converts elemental damage done to recover MP.	
	sets.midcast.FastRecast = {
		main="Crocea Mors", --"Sakpata's Sword",
		sub="Sacro Bulwark", --"Ammurapi Shield", --"Sacro Bulwark",
		ammo="Staunch Tathlum",
		head=RDM_AF_Head,
		neck="Loricate Torque +1",
		ear1="Malignance Earring",
		ear2=RDM_Empy_Ear2,
		body=RDM_Relic_Body,
		hands="Bunzi's Gloves",
		left_ring="Murky Ring",
		right_ring="Freke Ring",
		back=gear.mnd_enfeebling_jse_back,
		waist="Emphatikos Rope",
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots"
		}

	sets.midcast.Cure = {
		main="Daybreak",
		sub="Sacro Bulwark", --"Ammurapi Shield",
		range=gear.empty,
		ammo="Regal Gem",
        head="Kaykaus Mitra +1", --"Vanya Hood",
		neck="Incanter's Torque",
		ear1="Meili Earring",
		ear2="Mendi. Earring",
        body="Kaykaus Bliaut +1", --"Bunzi's Robe",
		hands="Kaykaus Cuffs +1", --"Gende. Gages +1",
		left_ring=Stikini_left_ring, --"Sirona's Ring",   --Abyvunkerl->Pascerpot trade crawlerfloatstone
		right_ring="Menelaus's Ring",
        back=gear.mnd_enfeebling_jse_back,
		waist="Bishop's Sash", --"Luminary Sash",
		legs=RDM_AF_Legs,
		feet="Kaykaus Boots +1", --"Vanya Clogs"
		}
		
    sets.midcast.LightWeatherCure = {
		main="Chatoyant Staff",
		sub="Curatio Grip",
		range=gear.empty,
		ammo="Regal Gem",
        head="Vanya Hood",
		neck="Incanter's Torque",
		ear1="Meili Earring",
		ear2="Mendi. Earring",
        body="Bunzi's Robe",
		hands="Gende. Gages +1",
		left_ring="Sirona's Ring",
		right_ring="Menelaus's Ring",
        back="Twilight Cape",
		waist="Hachirin-no-Obi",
		legs=RDM_AF_Legs,
		feet="Vanya Clogs"
		}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {
		main="Daybreak",
		sub="Sacro Bulwark",--"Ammurapi Shield",
		range=gear.empty,
		ammo="Regal Gem",
        head="Vanya Hood",
		neck="Incanter's Torque",
		ear1="Meili Earring",
		ear2="Mendi. Earring",
        body="Bunzi's Robe",
		hands="Gende. Gages +1",
		left_ring="Sirona's Ring",
		right_ring="Menelaus's Ring",
        back="Twilight Cape",
		waist="Luminary Sash", --"Hachirin-no-Obi",
		legs=RDM_AF_Legs,
		feet="Vanya Clogs"
		}
		
    sets.midcast.Cure.DT = {
		main="Daybreak",
		sub="Sacro Bulwark",--"Culminus",
		range=gear.empty,
		ammo="Staunch Tathlum",
        head="Kaykaus Mitra +1", --RDM_Empy_Head,
		neck="Loricate Torque +1",
		ear1="Alabaster Earring", --"Halasz Earring",
		ear2="Mendi. Earring",
        body="Bunzi's Robe",
		hands=gear.chironic_nuke_hands,
		left_ring="Defending Ring",
		right_ring="Murky Ring",
        back=gear.mnd_enfeebling_jse_back,
		waist="Emphatikos Rope",
		legs="Bunzi's Pants",
		feet="Kaykaus Boots +1", --"Bunzi's Sabots"
		}
		
	sets.midcast.Cursna = {
		main="Daybreak", --gear.grioavolr_fc_staff,
		sub="Ammurapi Shield", --"Curatio Grip", 
		range=gear.empty,
		ammo="Hasty Pinion +1",
        head="Vanya Hood",
		neck="Debilis Medallion",
		ear1="Meili Earring",
		ear2=RDM_Empy_Ear2,
        body=RDM_Relic_Body,
		hands="Hieros Mittens",
		left_ring="Haoma's Ring",
		right_ring="Menelaus's Ring",
        back="Oretan. Cape +1",
		waist="Bishop's Sash",
		legs=RDM_AF_Legs,
		feet="Vanya Clogs"
		}

	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
	
	sets.midcast['Enhancing Magic'] = {
		main="Colada",
		sub="Ammurapi Shield",
		ammo="Regal Gem", --"Staunch Tathlum", --"Regal Gem",
		head=gear.telchine_enh_head,
		neck="Dls. Torque +2",
		ear1="Malignance Earring", --"Mimir Earring", --"Andoaa Earring",
		ear2=RDM_Empy_Ear2,
		body=RDM_Relic_Body, --gear.telchine_enh_body, --"Viti. Tabard +3",
		hands=RDM_AF_Hand,
		left_ring="Murky Ring", --"Kishar Ring",
		right_ring="Prolix Ring", --"Lebeche Ring",
		back="Ghostfyre Cape", --"Ghostfyre Cape",
		waist="Embla Sash",
		legs=gear.telchine_enh_legs,
		feet=RDM_Empy_Feet --gear.telchine_enh_feet --"Leth. Houseaux +3"
		}
	sets.midcast['Enhancing Magic'].DW = {
		main="Colada",
		sub="Ammurapi Shield",}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.
	sets.buff.ComposureOther = {
		main="Colada",
		sub="Ammurapi Shield",
		ammo="Sapience Orb", --"Regal Gem",
		head=RDM_Empy_Head,
		hands=RDM_AF_Hand, --RDM_Empy_Hand,
		body=RDM_Empy_Body,
		legs=RDM_Empy_Legs,
		feet=RDM_Empy_Feet,
		ear1="Malignance Earring", --"Mimir Earring",--"Malignance Earring",
		ear2=RDM_Empy_Ear2,
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back="Ghostfyre Cape",
		waist="Embla Sash"
		}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell

	sets.EnhancingSkill = {
		main="Pukulatmuj +1",
		sub="Forfend +1",
		ammo="Sapience Orb", --"Staunch Tathlum", --"Staunch Tathlum",
		head="Befouled Crown",
		neck="Incanter's Torque",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		body=RDM_Relic_Body, --"Viti. Tabard +3",
		hands=RDM_Relic_Hand, --"Viti. Gloves +3",
		left_ring=Stikini_ring1,
		right_ring=Stikini_ring2,
		back="Ghostfyre Cape", --"Fi Follet Cape +1",
		waist="Olympus Sash",
		legs=RDM_AF_Legs,
		feet=RDM_Empy_Feet, --"Leth. Houseaux +3"
		}
		
	sets.midcast.Refresh = {
		main="Crocea Mors",
		sub="Ammurapi Shield",
		ammo="Sapience Orb",
		neck="Dls. Torque +2",
		ear1="Malignance Earring", --"Odnowa Earring +1",
		ear2=RDM_Empy_Ear2,
		waist="Embla Sash", --"Gishdubar Sash",
		back="Ghostfyre Cape",
		head="Amalric Coif +1", --gear.//_enh_head, --"Amalric Coif +1",
		body=RDM_AF_Body,
		hands=RDM_AF_Hand,
		legs=RDM_Empy_Legs,
		feet=RDM_Empy_Feet,
		left_ring="Kishar Ring", --"Defending Ring",
		right_ring="Prolix Ring" --"Gelatinous Ring +1",
		}
	sets.midcast.Refresh.DW = set_combine(sets.midcast.Refresh, {main="Crocea Mors",sub="Ammurapi Shield"})


	sets.midcast.Aquaveil = {
		head="Amalric Coif +1",
		waist="Emphatikos Rope",
		legs="Shedir Seraweels", 
		feet="Amalric Nails +1",
		ear1="Halasz Earring",
		ammo="Staunch Tathlum", 
		left_ring="Freke Ring", 
		right_ring="Murky Ring"
		} --hands="Regal Cuffs"
		
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.BarStatus = {neck="Sroda Necklace"}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Enspell = sets.EnhancingSkill
	sets.midcast.BoostStat = {hands=RDM_Relic_Hand}
	sets.midcast.Stoneskin = {main="Pukulatmuj +1",neck="Nodens Gorget",waist="Gishdubar Sash", ear1="Earthcry Earring"}
	sets.midcast.Protect = {right_ring="Sheltered Ring"}
	sets.midcast.Shell = {right_ring="Sheltered Ring"}
	sets.midcast.Regen = {main="Bolelabunga",sub="Ammurapi Shield"}
	
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {neck="Phalaina Locket",ear1="Meili Earring", 
	--"Etiolation Earring",
	right_ring="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",right_ring="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = set_combine(sets.midcast.Refresh, ({waist="Gishdubar Sash"}))
	sets.Self_Refresh.DW = set_combine(sets.midcast.Refresh.DW, ({waist="Gishdubar Sash"}))
	sets.Self_Phalanx = {
		main="Sakpata's Sword",
		sub="Ammurapi Shield",
		neck="Dls. Torque +2",
		ear1="Mimir Earring",
		ear2=RDM_Empy_Ear2,
		head="Taeon Chapeau",
		body="Taeon Tabard",
		hands="Taeon Gloves",
		back=gear.mnd_enfeebling_jse_back,
		waist="Embla Sash",
		legs="Taeon Tights",
		feet="Taeon Boots",
		ammo="Staunch Tathlum",
		left_ring="Murky Ring",--Stikini_left_ring,
		right_ring="Freke Ring" --Stikini_right_ring
		}
	sets.Self_Phalanx.DW = {
		main="Sakpata's Sword",
		sub="Ammurapi Shield",--"Egeking",
		neck="Dls. Torque +2",
		ear1="Mimir Earring",
		ear2=RDM_Empy_Ear2,
		head="Taeon Chapeau",
		body="Taeon Tabard",
		hands="Taeon Gloves",
		back=gear.mnd_enfeebling_jse_back,
		waist="Embla Sash",
		legs="Taeon Tights",
		feet="Taeon Boots",
		ammo="Staunch Tathlum",
		left_ring="Murky Ring",--Stikini_left_ring,
		right_ring="Freke Ring" --Stikini_right_ring
		}
	
	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		range=gear.empty,
		ammo="Regal Gem",
		head=RDM_Relic_Head, --RDM_Empy_Head,
		neck="Dls. Torque +2",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Snotra Earring", 
		body=RDM_Empy_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back, 
		waist="Luminary Sash", --"Obstinate Sash",
		legs=RDM_Empy_Legs,--gear.chironic_macc_legs, --RDM_Empy_Legs, --gear.chironic_macc_legs,
		feet=RDM_Relic_Feet
		}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Ullr",ammo=gear.empty,
		head=RDM_Empy_Head,neck="Null Loop",ear1="Regal Earring",ear2="Snotra Earring",
		body=RDM_AF_Body,hands=RDM_Empy_Hand,left_ring=Stikini_ring1,right_ring="Metamor. Ring +1",
		back="Null Shawl",waist="Null Belt",legs=gear.chironic_macc_legs,feet=RDM_Empy_Feet}
		
	sets.midcast['Enfeebling Magic'].DW = set_combine(sets.midcast['Enfeebling Magic'], {
		main="Maxentius",
		sub="Daybreak"
		})
		
	sets.midcast.Sleep = {
		main="Maxentius",
		sub="Ammurapi Shield",
		range=gear.empty, --"Ullr",
		ammo="Regal Gem", --gear.empty,
		head=RDM_Relic_Head, --RDM_AF_Head, --RDM_Relic_Head, --RDM_AF_Head,
		neck="Dls. Torque +2",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Snotra Earring", --"Snotra Earring",
		body=RDM_Empy_Body, --RDM_AF_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1, --"Kishar Ring", --Stikini_left_ring, --"Kishar Ring",
		right_ring=Stikini_ring2,--"Metamor. Ring +1",
		back=gear.int_enfeebling_jse_back, --gear.mnd_enfeebling_jse_back, --"Aurist's Cape +1", --"Null Shawl",
		waist="Obstinate Sash", --"Acuity Belt +1", --"Obstinate Sash",
		legs=RDM_Empy_Legs,
		feet=RDM_Empy_Feet
		} 
		
	sets.midcast.Bind = {
		main="Maxentius",
		sub="Ammurapi Shield",
		range="Ullr",
		ammo=gear.empty, --"Regal Gem", --gear.empty,
		head=RDM_Relic_Head,--RDM_AF_Head, --RDM_Relic_Head, --RDM_AF_Head,
		neck="Dls. Torque +2",
		ear1="Regal Earring",
		ear2="Snotra Earring", --"Snotra Earring",
		body=RDM_Empy_Body, --RDM_AF_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,--"Kishar Ring",
		right_ring=Stikini_ring2,--"Metamor. Ring +1",
		back=gear.int_enfeebling_jse_back, --gear.mnd_enfeebling_jse_back, "Aurist's Cape +1", --"Null Shawl",
		waist="Obstinate Sash",--"Luminary Sash", --"Acuity Belt +1", --"Obstinate Sash",
		legs=RDM_Empy_Legs,
		feet=RDM_Empy_Feet
		} 
		
	sets.midcast.Break = set_combine(sets.midcast.Sleep,{})
	sets.midcast['Dia III'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		range=gear.empty,
		ammo="Regal Gem", --gear.empty,
		head=RDM_Relic_Head,
		neck="Dls. Torque +2",
		ear1="Malignance Earring",
		ear2="Snotra Earring",
		body=RDM_Empy_Body, 
		hands=RDM_Empy_Hand,
		left_ring="Kishar Ring",
		right_ring=Stikini_ring2,
		back=gear.int_enfeebling_jse_back,
		waist="Rumination Sash", 
		legs="Malignance Tights",
		feet=RDM_Relic_Feet, 
		} 
	sets.midcast['Bio III'] = set_combine(sets.midcast.Sleep,{})

	sets.midcast.Inundation = set_combine(sets.midcast.Sleep,{})
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {legs=gear.merlinic_treasure_legs,feet=gear.chironic_treasure_feet})
	sets.midcast.Dia = set_combine(sets.midcast.Sleep, {})
	sets.midcast.Diaga = set_combine(sets.midcast.Sleep, {})
	sets.midcast.Bio = set_combine(sets.midcast.Sleep, {})
		
	sets.midcast.Sleep.Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Ullr",ammo=gear.empty,
		head=RDM_AF_Head,neck="Null Loop",ear1="Malignance Earring",ear2="Snotra Earring",
		body=RDM_AF_Body,hands=RDM_Empy_Hand,left_ring=Stikini_ring2,right_ring="Metamor. Ring +1",
		back="Null Shawl",waist="Null Belt",legs=gear.chironic_macc_legs,feet=RDM_Empy_Feet}
		
	sets.midcast.Bind.Resistant = sets.midcast.Sleep.Resistant
	sets.midcast.Break.Resistant = sets.midcast.Sleep.Resistant
	
	sets.midcast.Sleep.DW = set_combine(sets.midcast.Sleep,{main="Maxentius",sub="Ammurapi Shield"})
	sets.midcast.Bind.DW = sets.midcast.Sleep.DW
	sets.midcast.Break.DW = sets.midcast.Sleep.DW

	sets.midcast.Dispel = {
		main="Maxentius", --"Bunzi's Rod",
		sub="Ammurapi Shield",
		range=gear.empty, --"Ullr",
		ammo="Regal Gem", --gear.empty,
		head=RDM_AF_Head,
		neck="Dls. Torque +2",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Snotra Earring",
		body=RDM_AF_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring=Stikini_ring2,--"Metamor. Ring +1",
		back="Null Shawl",
		waist="Null Belt",
		legs=RDM_AF_Legs, --gear.chironic_macc_legs,
		feet=RDM_Relic_Feet, --RDM_Empy_Feet
		}
		
	sets.midcast.Dispel.DW = set_combine(sets.midcast.Dispel,{main="Maxentius", sub="Bunzi's Rod"})
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})
	sets.midcast.Dispelga.DW = {main="Daybreak",sub="Bunzi's Rod"}
	
	sets.midcast.Frazzle = {
		main="Daybreak",
		sub="Ammurapi Shield",
		range="Ullr", --gear.empty, --"Ullr",
		ammo=gear.empty, --"Regal Gem", --gear.empty,
		head=RDM_AF_Head,
		neck="Null Loop", --"Dls. Torque +2",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Snotra Earring",
		body=RDM_AF_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring=Stikini_ring2,--"Metamor. Ring +1",
		back="Null Shawl",
		waist="Null Belt",
		legs=RDM_AF_Legs, --gear.chironic_macc_legs,
		feet=RDM_Relic_Feet, --RDM_Empy_Feet
		}
		
	--sets.midcast.Distract = sets.midcast.Frazzle
	
	sets.midcast['Distract III'] = {
		main="Maxentius", --"Bunzi's Rod", --"Daybreak",
		sub="Ammurapi Shield",
		range="Ullr", --gear.empty,
		ammo=gear.empty, --"Regal Gem",
		head=RDM_Relic_Head,
		neck="Dls. Torque +2",
		ear1="Regal Earring", --"Vor Earring", --"Malignance Earring",
		ear2="Snotra Earring",
		body=RDM_AF_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring=Stikini_ring2,
		back=gear.mnd_enfeebling_jse_back, --"Null Shawl",
		waist="Rumination Sash", --"Luminary Sash", 
		legs="Psycloth Lappas", --RDM_AF_Legs,
		feet=RDM_Relic_Feet, --RDM_Empy_Feet
		}
		
	sets.midcast.Distract = {
		main="Maxentius", --"Bunzi's Rod", --"Daybreak",
		sub="Ammurapi Shield",
		range="Ullr", --gear.empty,
		ammo=gear.empty, --"Regal Gem",
		head=RDM_Relic_Head, --RDM_AF_Head,--RDM_Relic_Head,
		neck="Dls. Torque +2",
		ear1="Regal Earring", --"Vor Earring", --"Malignance Earring",
		ear2="Snotra Earring",
		body=RDM_AF_Body, --RDM_Empy_Body, --RDM_AF_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring=Stikini_ring2,
		back=gear.mnd_enfeebling_jse_back, --"Null Shawl",
		waist="Rumination Sash", --"Luminary Sash", 
		legs=RDM_Empy_Legs, --"Psycloth Lappas", --/gear.chironic_macc_legs,
		feet=RDM_Relic_Feet, --RDM_Empy_Feet
		}
		
	sets.midcast.Frazzle.Resistant = {
		main="Daybreak",
		sub="Ammurapi Shield",
		range="Ullr",
		ammo=gear.empty,
		head=RDM_AF_Head,
		neck="Null Loop",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Snotra Earring",
		body=RDM_AF_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring="Metamor. Ring +1",
		back="Null Shawl",
		waist="Null Belt",
		legs=gear.chironic_macc_legs,
		feet=RDM_Empy_Feet, --RDM_Empy_Feet
		}
		
	sets.midcast.Distract.Resistant = sets.midcast.Frazzle.Resistant
		
	
	sets.midcast.Frazzle.DW = set_combine(sets.midcast.Frazzle,{main="Maxentius",sub="Daybreak"})
	sets.midcast.Distract.DW = set_combine(sets.midcast.Distract,{main="Maxentius", sub="Ammurapi Shield"}) --sets.midcast.Frazzle.DW
	sets.midcast['Distract III'].DW = set_combine(sets.midcast['Distract III'], {main="Maxentius", sub="Ammurapi Shield"})
	
	
	sets.midcast['Frazzle III'] = {
		main="Maxentius", --"Bunzi's Rod", --"Daybreak",
		sub="Ammurapi Shield",
		range="Ullr", --gear.empty,
		ammo=gear.empty, --"Regal Gem",
		head=RDM_Relic_Head,
		neck="Dls. Torque +2",
		ear1="Regal Earring", --"Vor Earring", --"Malignance Earring",
		ear2="Snotra Earring",
		body=RDM_AF_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring=Stikini_ring2,
		back=gear.mnd_enfeebling_jse_back, --"Null Shawl",
		waist="Rumination Sash", --"Luminary Sash", 
		legs="Psycloth Lappas", --RDM_AF_Legs,
		feet=RDM_Relic_Feet, --RDM_Empy_Feet
		}
	sets.midcast['Frazzle III'].DW = set_combine(sets.midcast['Frazzle III'],{		main="Maxentius", -- "Daybreak",
		sub="Ammurapi Shield",})
	
	sets.midcast.Addle = {
		main="Daybreak",
		sub="Ammurapi Shield",
		range=gear.empty,
		ammo="Regal Gem",
		head=RDM_Relic_Head,
		neck="Dls. Torque +2",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Snotra Earring", 
		body=RDM_Empy_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back, 
		waist="Rumination Sash", --"Luminary Sash", 
		legs=RDM_Empy_Legs, --gear.chironic_macc_legs,
		feet=RDM_Relic_Feet
		}
		
	sets.midcast.Paralyze = set_combine(sets.midcast.Addle,{})
	sets.midcast.Slow = set_combine(sets.midcast.Addle,{})
	
	sets.midcast.Addle.Resistant = {main="Daybreak",sub="Ammurapi Shield",range="Ullr",ammo=gear.empty,
		head=RDM_Relic_Head,neck="Null Loop",ear1="Malignance Earring",ear2="Snotra Earring",
		body=RDM_Empy_Body,hands=RDM_Empy_Hand,left_ring=Stikini_ring1,right_ring="Metamor. Ring +1",
		back="Null Shawl",waist="Null Belt",legs=gear.chironic_macc_legs,feet=RDM_Empy_Feet}
		
	sets.midcast.Paralyze.Resistant = sets.midcast.Addle.Resistant
	sets.midcast.Slow.Resistant = sets.midcast.Addle.Resistant
	
	sets.midcast.Addle.DW = set_combine(sets.midcast.Addle,{main="Maxentius",sub="Daybreak"})
	sets.midcast.Paralyze.DW = set_combine(sets.midcast.Addle.DW,{})
	sets.midcast.Slow.DW = set_combine(sets.midcast.Addle.DW,{})
	
	sets.midcast.Gravity = {
		main="Maxentius",--"Bunzi's Rod",
		sub="Ammurapi Shield",
		range=gear.empty, --"Ullr", --gear.empty,
		ammo="Regal Gem",
		head=RDM_Relic_Head,--RDM_AF_Head, --RDM_Empy_Head,
		neck="Dls. Torque +2",
		ear1="Vor Earring", --"Malignance Earring",
		ear2="Snotra Earring", 
		body=RDM_Empy_Body, --RDM_AF_Body, --RDM_Empy_Body,
		hands=RDM_Empy_Hand, --RDM_AF_Hand,
		left_ring=Stikini_ring1,
		right_ring=Stikini_ring2, --"Metamor. Ring +1",
		back=gear.int_enfeebling_jse_back, --gear.mnd_enfeebling_jse_back, --gear.int_enfeebling_jse_back,  --Aurist's Cape +1
		waist="Luminary Sash", --"Rumination Sash", --"Null Belt", --"Lumniary Sash", --"Obstinate Sash",
		legs=RDM_Empy_Legs, --"Psycloth Lappas", --RDM_Empy_Legs, --RDM_AF_Legs, --RDM_Empy_Legs,
		feet=RDM_Relic_Feet, --RDM_Empy_Feet
		}
		
	sets.midcast.Gravity.Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",range=gear.empty,ammo="Regal Gem",
		head=RDM_Empy_Head,neck="Dls. Torque +2",ear1="Regal Earring",ear2="Snotra Earring",
		body=RDM_Empy_Body,hands=RDM_Empy_Hand,left_ring=Stikini_ring1,right_ring="Metamor. Ring +1",
		back=gear.int_enfeebling_jse_back,waist="Null Belt",legs=gear.chironic_macc_legs,feet=RDM_Empy_Feet}
		
	sets.midcast.Gravity.DW = set_combine(sets.midcast.Gravity,{main="Maxentius",sub="Daybreak"})
	--sets.midcast.Gravity.DW = {main="Bunzi's Rod",sub="Daybreak"}
	sets.midcast.Poison = set_combine(sets.midcast.Gravity,{})
	sets.midcast.Poison.Resistant = sets.midcast.Gravity.Resistant
	sets.midcast.Poison.DW = set_combine(sets.midcast.Gravity.DW,{})
	
	sets.midcast.Blind = set_combine(sets.midcast.Gravity,{})
	sets.midcast.Blind.Resistant = sets.midcast.Gravity.Resistant
	sets.midcast.Blind.DW = set_combine(sets.midcast.Gravity.DW,{})
	
	sets.midcast['Frazzle II'] = set_combine(sets.midcast.Gravity,{})
	
	
	sets.midcast.Silence = {
		main="Maxentius", --"Bunzi's Rod",
		sub="Ammurapi Shield",
		range=gear.empty, --"Ullr",
		ammo="Regal Gem", --gear.empty, --"Regal Gem", --gear.empty,
		head=RDM_Relic_Head,--RDM_AF_Head, --RDM_Relic_Head, --RDM_AF_Head,
		neck="Dls. Torque +2",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Snotra Earring", --"Snotra Earring",
		body=RDM_Empy_Body, --RDM_AF_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring=Stikini_ring2,--"Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back, --gear.int_enfeebling_jse_back, --gear.mnd_enfeebling_jse_back, "Aurist's Cape +1", --"Null Shawl",
		waist="Luminary Sash", --"Acuity Belt +1", --"Obstinate Sash",
		legs=RDM_Empy_Legs, --gear.chironic_macc_legs,
		feet=RDM_Empy_Feet --RDM_Relic_Feet, --RDM_Empy_Feet
		}
		
	sets.midcast.Silence.Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Ullr",ammo=gear.empty,
		head=RDM_AF_Head,neck="Null Loop",ear1="Regal Earring",ear2="Snotra Earring",
		body=RDM_AF_Body,hands=RDM_Empy_Hand,left_ring=Stikini_ring1,right_ring="Metamor. Ring +1",
		back="Null Shawl",waist="Null Belt",legs=gear.chironic_macc_legs,feet=RDM_Empy_Feet}
		
	sets.midcast.Silence.DW = set_combine(sets.midcast.Silence,{main="Maxentius",sub="Daybreak"})
	
	--After Bunzi's is augmented it will probably win on low-tier nukes.
	sets.midcast['Elemental Magic'] = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head=RDM_Empy_Head,
		neck="Sibyl Scarf", --"Baetyl Pendant",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Malignance Earring", --"Friomisi Earring",
		body=RDM_Empy_Body,
		hands=RDM_Empy_Hand,
		left_ring="Freke Ring",
		right_ring="Metamor. Ring +1",
		back=gear.nuke_jse_back,
		waist="Acuity Belt +1", --"Refoccilation Stone", --"Sacro Cord",
		legs=RDM_Empy_Legs,
		feet=RDM_Relic_Feet
		}
		
	sets.midcast['Elemental Magic'].DT = {
		main="Marin Staff +1", --"Bunzi's Rod",
		sub="Enki Strap", --"Ammurapi Shield",
		ammo="Staunch Tathlum",
		head=RDM_Empy_Head,
		neck="Loricate Torque +1",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Malignance Earring", --"Friomisi Earring",
		body=RDM_Empy_Body,
		hands=RDM_Empy_Hand,
		left_ring="Freke Ring",
		right_ring="Metamor. Ring +1",
		back=gear.nuke_jse_back,
		waist="Emphatikos Rope",
		legs="Bunzi's Pants",
		feet=RDM_Empy_Feet
		}
		
    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Ullr",ammo=gear.empty,
		head=RDM_Empy_Head,neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Friomisi Earring",
		body=RDM_Empy_Body,hands=RDM_Empy_Hand,left_ring="Freke Ring",right_ring="Metamor. Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs=RDM_Empy_Legs,feet=RDM_Empy_Feet}
		
    sets.midcast['Elemental Magic'].Proc = {
		main="Gleti's Knife",
		sub="Forfend +1",
		range=gear.empty,
		ammo="Regal Gem",
        head="Malignance Chapeau",
		neck="Null Loop",
		ear1="Snotra Earring",
		ear2=RDM_Empy_Ear2,
        body="Malignance Tabard",
		hands="Malignance Gloves",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
        back="Null Shawl",
		waist="Null Belt",
		legs="Malignance Tights",
		feet="Malignance Boots"
		}
		
	sets.midcast['Elemental Magic'].HighTierNuke = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head=RDM_Empy_Head,
		neck="Sibyl Scarf", --"Baetyl Pendant",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Malignance Earring", --"Friomisi Earring",
		body=RDM_Empy_Body,
		hands=RDM_Empy_Hand,
		left_ring="Freke Ring",
		right_ring="Metamor. Ring +1",
		back=gear.nuke_jse_back,
		waist="Acuity Belt +1", --"Refoccilation Stone", --"Sacro Cord",
		legs=RDM_Empy_Legs,
		feet=RDM_Relic_Feet
		}
		
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		range="Ullr",
		ammo=gear.empty,
		head=RDM_Empy_Head,
		neck="Sibyl Scarf",
		ear1="Malignance Earring",
		ear2="Friomisi Earring",
		body=RDM_Empy_Body,
		hands=RDM_Empy_Hand,
		left_ring="Freke Ring",
		right_ring="Metamor. Ring +1",
		back=gear.nuke_jse_back,
		waist="Acuity Belt +1",
		legs=RDM_Empy_Legs,
		feet=RDM_Empy_Feet
		}
		
	-- Gear that Recovers MP when nuking.
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Ea Hat +1",
		neck="Sibyl Scarf", --"Mizu. Kubikazari",
		body=RDM_Empy_Body,
		hands="Bunzi's Gloves",
		left_ring="Mujin Band",
		right_ring="Freke Ring",
		legs="Ea Slops",
		feet=RDM_Relic_Feet,
		back="Toro Cape", --gear.nuke_jse_back,
		waist="Acuity Belt +1",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Malignance Earring", --"Friomisi Earring",
		}
	sets.midcast['Elemental Magic'].DW = {
			main="Bunzi's Rod",
			sub="Ammurapi Shield" --,main="Bunzi's Rod",sub="Daybreak"}
			} 
		
--[[	sets.midcast.Impact = {
		main="Maxentius", --"Bunzi's Rod",
		sub="Ammurapi Shield",
		range=gear.empty,
		ammo="Regal Gem",
		head=gear.empty,
		neck="Null Loop",
		ear1="Malignance Earring",
		ear2="Snotra Earring",
		body="Twilight Cloak", --"Crepuscular Cloak",
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring="Metamor. Ring +1",
		back="Null Shawl",
		waist="Null Belt",
		legs=RDM_Empy_Legs,
		feet=RDM_Empy_Feet
		} ]]
		
sets.midcast.Impact = {
    main="Maxentius", --"Bunzi's Rod",
	sub="Ammurapi Shield",
	range=gear.empty,
	ammo="Regal Gem", --"Pemphredo Tathlum",
    body="Twilight Cloak", --"Crepuscular Cloak",
    hands=gear.merlinic_occult_hands,
    legs="Perdition Slops",
    feet=gear.merlinic_occult_feet,
    neck="Null Loop", --{ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt", --"Oneiros Rope",
    ear2="Regal Earring", --"Dedition Earring", --RDM_Empy_Ear2,--"Regal Earring",
    ear1="Sherida Earring", --"Malignance Earring",
    left_ring=Chirich_ring1, --Stikini_ring1,
    right_ring=Chirich_ring2, --Stikini_ring2,
    back="Aurist's Cape +1"
	}
	
	sets.midcast['Dark Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		range=gear.empty,
		ammo="Regal Gem",
		head=RDM_Empy_Head,
		neck="Null Loop",
		ear1="Regal Earring", --"Malignance Earring",
		ear2=RDM_Empy_Ear2, --"Malignance Earring", --"Friomisi Earring",
		body=RDM_Empy_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring="Metamor. Ring +1",
		back="Null Shawl",
		waist="Null Belt",
		legs=RDM_Empy_Legs,
		feet=RDM_Empy_Feet
		}

    sets.midcast.Drain = {
		main="Rubicundity",
		sub="Ammurapi Shield",
		range=gear.empty,
		ammo="Regal Gem",
        head="Pixie Hairpin +1", --RDM_Empy_Head, --"Pixie Hairpin +1",
		neck="Erra Pendant",
		ear1="Regal Earring", --"Malignance Earring",
		ear2="Malignance Earring", --"Friomisi Earring",
        body=gear.merlinic_aspir_body, --RDM_Empy_Body,
		hands=gear.merlinic_aspir_hands, --gear.chironic_aspir_gloves,
		left_ring="Evanescence Ring",
		right_ring=Stikini_ring2, --"Metamor. Ring +1",
        back="Null Shawl", --gear.nuke_jse_back,
		waist="Fucho-no-obi",
		legs=gear.merlinic_fc_legs, --gear.chironic_aspir_legs,
		feet=gear.merlinic_aspir_feet, --RDM_Empy_Feet
		}

	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast['Absorb-TP'] = {
		main="Maxentius",
		sub="Ammurapi Shield",
		range=gear.empty, --"Ullr",
		ammo="Regal Gem",
        head=RDM_AF_Head,
		neck="Null Loop",
		ear1="Malignance Earring",
		ear2=RDM_Empy_Ear2,
        body=RDM_Relic_Body,
		hands=RDM_Empy_Hand,
		left_ring="Kishar Ring",
		right_ring=Stikini_ring2,
        back="Null Shawl",
		waist="Null Belt",
		legs=RDM_Empy_Legs,
		feet=RDM_Empy_Feet
		}
		
	sets.midcast['Absorb-TP'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Ullr",ammo=gear.empty,
        head=RDM_AF_Head,neck="Null Loop",ear1="Malignance Earring",ear2="Leth. Earring +1",
        body=RDM_Empy_Body,hands=RDM_Empy_Hand,left_ring=Stikini_ring1,right_ring="Metamor. Ring +1",
        back="Null Shawl",waist="Null Belt",legs=RDM_Empy_Legs,feet=RDM_Empy_Feet}
		
	sets.midcast.Stun = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		range="Ullr",
		ammo=gear.empty,
        head=RDM_AF_Head,
		neck="Null Loop",
		ear1="Malignance Earring",
		ear2=RDM_Empy_Ear2,
        body=RDM_Relic_Body,
		hands=RDM_Empy_Hand,
		left_ring=Stikini_ring1,
		right_ring="Metamor. Ring +1",
        back=gear.mnd_enfeebling_jse_back,
		waist="Null Belt",
		legs=RDM_Empy_Legs,
		feet=RDM_Empy_Feet
		}

	sets.midcast.Stun.Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Ullr",ammo=gear.empty,
        head=RDM_AF_Head,neck="Null Loop",ear1="Malignance Earring",ear2=RDM_Empy_Ear2,
        body=RDM_Empy_Body,hands=RDM_Empy_Hand,left_ring=Stikini_ring1,right_ring="Metamor. Ring +1",
        back="Null Shawl",waist="Null Belt",legs=RDM_Empy_Legs,feet=RDM_Empy_Feet}
		
	sets.midcast.Stun.DW = {main="Bunzi's Rod",sub="Maxentius"}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands=RDM_Empy_Hand}
	
	sets.HPDown = {main="Mpaca's Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Pixie Hairpin +1",neck="Loricate Torque +1",ear1="Hirudinea Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",left_ring="Mephitas's Ring +1",right_ring="Metamor. Ring +1",
		back="Null Shawl",waist="Luminary Sash",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
    sets.HPCure = {main="Daybreak",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Nyame Helm",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Bunzi's Robe",hands="Bunzi's Gloves",left_ring="Sirona's Ring",right_ring="Kunaji Ring",
		back="Engulfer Cape +1",waist="Gishdubar Sash",legs="Nyame Flanchard",feet="Medium's Sabots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {
		main="Chatoyant Staff",
		sub="Enki Strap", --"Oneiros Grip",
		range=gear.empty,
		ammo="Impatiens",
		head=RDM_Relic_Head, --"Viti. Chapeau +3",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Ethereal Earring",
		body=RDM_Empy_Body,
		hands=RDM_Empy_Hand, --FIXED: gear.merlinic_refresh_hands is commented out/undefined in Items.lua; Empy hands used as fallback
		left_ring="Defending Ring",
		right_ring="Sheltered Ring",
		back="Null Shawl",
		waist="Null Belt",
		legs=RDM_Empy_Legs, --FIXED: gear.merlinic_refresh_legs is undefined; Empy legs used as fallback
		feet=gear.merlinic_refresh_feet
		}
	
	sets.Ballista = {main="Sakpata's Sword",sub="Sacro Bulwark",range=gear.empty,ammo="Staunch Tathlum",
		head="Bunzi's Hat",neck="Dls. Torque +2",ear1="Etiolation Earring",ear2=RDM_Empy_Ear2,
		body="Bunzi's Robe",hands="Bunzi's Gloves",left_ring="Shneddick Ring",right_ring="Shadow Ring",
		back="Null Shawl",waist="Null Belt",legs="Bunzi's Pants",feet=RDM_Empy_Feet}

	-- Idle sets
	sets.idle = {
		main="Daybreak", --"Mpaca's Staff",
		sub="Sacro Bulwark", --"Ammurapi Shield", --"Kaja Grip", --"Oneiros Grip",
		ammo="Staunch Tathlum", --"Amar Cluster", --"Homiliary",
		head=RDM_Relic_Head, --"Malignance Chapeau", --"Viti. Chapeau +3",
		neck="Loricate Torque +1", --"Sibyl Scarf",
		ear1="Etiolation Earring", --"Genmei Earring", --"Etiolation Earring",
		ear2="Alabaster Earring", --"Ethereal Earring",
		body=RDM_Empy_Body, --"Lethargy Sayon +3",
		hands=RDM_Empy_Hand,--"Volte Gloves", --gear.chironic_refresh_hands,
		left_ring=Stikini_ring1,
		right_ring="Murky Ring", --Stikini_ring2,
		back=gear.mnd_enfeebling_jse_back, --"Moonlight Cape", --"Null Shawl",
		waist="Null Belt", --"Fucho-no-obi", --"Null Belt",
		legs=RDM_Relic_Legs, --"Nyame Flanchard", --gear.merlinic_refresh_legs,
		feet="Nyame Sollerets"
		}
		
	sets.idle.PDT = {
		main="Daybreak",
		sub="Sacro Bulwark", --"Genmei shield", --"Sacro Bulwark",
		ammo="Staunch Tathlum",
		head=RDM_Relic_Head,
		neck="Loricate Torque +1",
		ear1="Alabaster Earring",
		ear2="Genmei Earring",
		body=RDM_Empy_Body,
		hands="Nyame Gauntlets",
		left_ring=Stikini_ring1,
		right_ring="Shadow Ring",
		back="Null Shawl",
		waist="Flume Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
		
	sets.idle.MDT = {
		main="Daybreak",
		sub="Sacro Bulwark",
		range=gear.empty,
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Etiolation Earring",
		ear2="Sanare Earring",
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Moonlight Cape", --"Engulfer Cape +1",
		waist="Null Belt",
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots"
		}
		
	sets.idle.MEVA = {
		main="Daybreak",
		sub="Sacro Bulwark",
		range=gear.empty,
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Etiolation Earring",
		ear2="Sanare Earring",
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Null Shawl",
		waist="Null Belt",
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots"
		}
		
	sets.idle.Aminon = {main="Daybreak",sub="Sacro Bulwark",range=gear.empty,ammo="Staunch Tathlum",
		head="Null Masque",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",left_ring="Defending Ring",right_ring="Shadow Ring",
		back="Null Shawl",waist="Null Belt",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
	
	-- Defense sets
	sets.defense.PDT = {
		main="Daybreak",
		sub="Sacro Bulwark",
		ammo="Staunch Tathlum",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Ethereal Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Shadow Mantle",
		waist="Plat. Mog. Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {
		main="Daybreak",
		sub="Sacro Bulwark",
		range=gear.empty,
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Etiolation Earring",
		ear2="Sanare Earring",
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Engulfer Cape +1",
		waist="Null Belt",
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots"
		}
		
    sets.defense.MEVA = {
		main="Daybreak",
		sub="Sacro Bulwark",
		range=gear.empty,
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Etiolation Earring",
		ear2="Sanare Earring",
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Null Shawl",
		waist="Null Belt",
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots"
		}
		
	sets.Kiting = {right_ring="Shneddick Ring"}
	sets.latent_refresh = {
		left_ring=Stikini_ring1,
		right_ring=Stikini_ring2,
		neck="Sibyl Scarf",
		waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {
			ranged=Empty,
			ammo="Coiste Bodhar", --"Aurgelmir Orb +1",
			head="Bunzi's Hat", --"Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights",
			feet="Carmine Greaves +1", --"Malignance Boots",
			neck="Anu Torque",
			waist="Windbuffet Belt +1",
			ear1="Sherida Earring",
			ear2="Telos Earring",
			left_ring=Chirich_ring1,
			right_ring=Chirich_ring2,
			back="Null Shawl",
		}
		
	sets.engaged.Acc = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Null Loop",ear1="Crep. Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",left_ring=Chirich_ring1,right_ring=Chirich_ring2,
		back="Null Shawl",waist="Null Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.DT = {
			ranged=Empty,
			ammo="Coiste Bodhar", --"Aurgelmir Orb +1",
			head="Bunzi's Hat", --"Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights", --"Nyame Flanchard", --"Malignance Tights",
			feet="Nyame Sollerets", --"Malignance Boots",
			neck="Anu Torque", --"Null Loop", --"Anu Torque",
			waist="Windbuffet Belt +1", --"Reiki Yotai",
			ear1="Sherida Earring",
			ear2="Telos Earring", --"Alabaster Earring", --"Dedition Earring", --"Eabani Earring", --"Telos Earring",
			left_ring="Petrov Ring", --Chirich_ring1, --"Defending Ring",
			right_ring="Murky Ring", --"Gelatinous Ring +1",
			back="Null Shawl",
		}
		
	sets.engaged.Acc.DT = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Null Loop",ear1="Crep. Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",left_ring="Defending Ring",right_ring=Chirich_ring2,
		back="Null Shawl",waist="Null Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW = {
			ranged=Empty,
			ammo="Coiste Bodhar", --"Aurgelmir Orb +1",
			head="Bunzi's Hat", --"Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights",
			feet="Carmine Greaves +1", --"Malignance Boots",
			neck="Anu Torque",
			waist="Kentarch Belt +1", --"Windbuffet Belt +1", --"Reiki Yotai", --"Windbuffet Belt +1",
			ear1="Sherida Earring",
			ear2="Telos Earring", --"Eabani Earring", --"Telos Earring",
			left_ring=Chirich_ring1,
			right_ring=Chirich_ring2,
			back=gear.dw_jse_back, --"Null Shawl",
		}
		
	sets.engaged.DW.Acc = {
			ammo="Coiste Bodhar",
			head="Malignance Chapeau",
			neck="Null Loop",
			ear1="Crep. Earring",
			ear2="Telos Earring",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			left_ring=Chirich_ring1,
			right_ring=Chirich_ring2,
			back=gear.dw_jse_back,
			waist="Null Belt",
			legs="Malignance Tights",
			feet="Malignance Boots"
	}
		
	sets.engaged.DW.DT = {
			ranged=Empty,
			ammo="Coiste Bodhar", --"Aurgelmir Orb +1", --, 
			head="Bunzi's Hat", --"Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights", --"Nyame Flanchard", --"Malignance Tights",
			feet="Malignance Boots",--"Nyame Sollerets", --"Malignance Boots",
			neck="Null Loop", --"Anu Torque",
			waist="Kentarch Belt +1", --"Windbuffet Belt +1", --"Reiki Yotai",
			ear1="Sherida Earring",
			ear2="Telos Earring", --"Alabaster Earring", --"Dedition Earring", --"Eabani Earring", --"Telos Earring",
			left_ring=Chirich_ring1, --"Defending Ring",
			right_ring="Murky Ring", --"Gelatinous Ring +1",
			back=gear.dw_jse_back, --"Null Shawl",
		}
		
	sets.engaged.DW.Acc.DT = {
			ammo="Coiste Bodhar",
			head="Bunzi's Hat",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights",
			feet="Malignance Boots",
			neck="Null Loop",
			waist="Null Belt", --"Reiki Yotai",
			ear1="Digni. Earring", --FIXED: was left_ear (wrong slot key; Selindrile uses ear1/ear2)
			ear2="Telos Earring", --FIXED: was right_ear
			left_ring=Chirich_ring1,
			right_ring="Murky Ring",
			back=gear.dw_jse_back, --"Null Shawl",
		}

	sets.engaged.EnspellOnly = {
		ammo="Sroda Tathlum",
		head="Umuthi Hat",
		neck="Sanctity Necklace", --"Null Loop",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
		body="Malignance Tabard",
		hands="Aya. Manopolas +2",
		left_ring=Chirich_ring1,
		right_ring=Chirich_ring2,
		back="Ghostfyre Cape",
		waist="Orpheus's Sash",
		legs=RDM_Relic_Legs, --"Malignance Tights",
		feet="Malignance Boots"
		}
		
	sets.engaged.EnspellOnly.Acc = {ammo="Sroda Tathlum",
		head="Malignance Chapeau",neck="Null Loop",ear1="Crep. Earring",ear2="Leth. Earring +1",
		body="Malignance Tabard",hands="Aya. Manopolas +2",left_ring="Cacoethic Ring +1",right_ring=Chirich_ring2,
		back="Null Shawl",waist="Orpheus's Sash",legs="Malignance Tights",feet="Malignance Boots"}		

	sets.engaged.DualEnspellOnly = {
		ammo="Sroda Tathlum",
		head="Umuthi Hat", --"Malignance Chapeau", --"Umuthi Hat",
		neck="Null Loop", --"Sanctity Necklace", --"Dls. Torque +2", --"Null Loop",
		ear1="Sherida Earring",
		ear2="Telos Earring", --"Suppanomimi",
		body="Malignance Tabard",
		hands="Aya. Manopolas +2",
		left_ring=Chirich_ring1,
		right_ring=Chirich_ring2,
		back="Null Shawl", --"Ghostfyre Cape", --"Ghostfyre Cape",
		waist="Orpheus's Sash",
		legs=RDM_Relic_Legs, --"Malignance Tights", --"Carmine Cuisses +1",
		feet="Malignance Boots"
		}
		
	sets.engaged.DualEnspellOnlyCRoc = {
		ammo="Sroda Tathlum",
		head="Umuthi Hat", --"Malignance Chapeau", --"Umuthi Hat",
		neck="Null Loop", --"Sanctity Necklace", --"Dls. Torque +2", --"Null Loop",
		ear1="Sherida Earring",
		ear2="Telos Earring", --"Suppanomimi",
		body="Malignance Tabard",
		hands="Aya. Manopolas +2",
		left_ring=Chirich_ring1,
		right_ring=Chirich_ring2,
		back="Null Shawl", --"Ghostfyre Cape", --"Ghostfyre Cape",
		waist="Orpheus's Sash",
		legs=RDM_Relic_Legs, --"Malignance Tights", --"Carmine Cuisses +1",
		feet="Malignance Boots"
		}
		
	sets.engaged.DualEnspellOnly.Acc = {ammo="Sroda Tathlum",
		head="Malignance Chapeau",neck="Null Loop",ear1="Crep. Earring",ear2="Leth. Earring +1",
		body="Malignance Tabard",hands="Aya. Manopolas +2",left_ring="Cacoethic Ring +1",right_ring=Chirich_ring2,
		back="Null Shawl",waist="Orpheus's Sash",legs=RDM_Relic_Legs,feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'SCH' then
		set_macro_page(1, 21)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 22)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1,1)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'DRK' then
		set_macro_page(6, 23)
	else
		set_macro_page(1, 1)
	end
end

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function user_job_lockstyle()
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		windower.chat.input('/lockstyleset 001')
	else
	windower.chat.input('/lockstyleset 002')
end
end


buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	When='Always'},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Idle'},
		{Name='Reraise',		Buff='Reraise',		SpellID=135,	When='Always'},
	},
	
	AutoMelee = {
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	When='Combat'},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	When='Combat'},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	When='Combat'},
		--{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	When='Combat'},
	},
	
	AutoMage = {
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	When='Always'},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	When='Always'},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	When='Always'},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		When='Always'},
		{Name='Blink',			Buff='Blink',			SpellID=53,		When='Always'},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		When='Always'},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		When='Always'},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		When='Always'},
	},
	
	Default = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Gain-MND',		Buff='MND Boost',		SpellID=491,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},

	MageBuff = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	FullMeleeBuff = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		--{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		--{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		--{Name='Barblizzard',	Buff='Barblizzard',		SpellID=61,		Reapply=false},
		--{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},		
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
	},
	
	MeleeBuff = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
	},

	Odin = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Enaero',			Buff='Enaero',			SpellID=102,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	HybridCleave = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Enthunder II',	Buff='Enthunder II',	SpellID=316,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
}