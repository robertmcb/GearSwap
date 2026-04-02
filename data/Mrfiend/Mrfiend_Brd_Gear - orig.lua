function character_user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','NoRefresh','DT')
--	state.Weapons:options('None','Naegling','Aeneas','DualWeapons','DualNaegling','DualTauret','DualAeolian')
	state.Weapons:options('NaegTP','NaeglCrep','Aeneas','Carn','CarnCrep','TauretGleti','CrepTP','DualWeapons','DualAeneas')



	autows_list = {
	['Naegling']='Savage Blade',
	['Kaja']='Savage Blade',
	['Trial']='Mordant Rime',
	['Aeneas']='Rudra\'s Storm',
	['DualWeapons']='Rudra\'s Storm',
	['Prime']='Rudra\'s Storm',
--	['DualWeapons']='Savage Blade',
	['DualNaegling']='Savage Blade'
--	['DualTauret']='Evisceration',
 --   ['DualAeolian']='Aeolian Edge',

	 }



--make these
	gear.melee_jse_back ={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Damage taken-5%',}}  --usenullshawlinstead
	gear.melee_jse_back_ws_str = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
	gear.melee_jse_back_ws_chr = { name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%',}}
	gear.melee_jse_back_ws_dex = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}} 
	gear.melee_jse_back_tp ={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}} --usenullshawlinstead
	gear.magic_jse_back ={name="Intarabus's Cape",augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}} --need to make this
	
	gear.linos_ws = { name="Linos", augments={'Accuracy+14 Attack+14','Weapon skill damage +3%','STR+4 CHR+4',}}
	gear.linos_stp = { name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}}
	gear.linos_maacc = { name="Linos", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Mag. Acc."+15',}} --need to make this
	
	BRD_Relic_Head		= "Bihu Roundlet +4"
	BRD_Relic_Body		= "Bihu Justaucorps +4"
	BRD_Relic_Hand		= "Bihu Cuffs +4"
	BRD_Relic_Legs		= "Bihu Cannions +4"
	BRD_Relic_Feet		= "Bihu Slippers +4"

	BRD_AF_Head			= "Brioso Roundlet +4"
	BRD_AF_Body			= "Brioso Justaucorps +4"
	BRD_AF_Hand			= "Brioso Cuffs +4"
	BRD_AF_Legs			= "Brioso Cannions +4"     
	BRD_AF_Feet			= "Brioso Slippers +4"

	BRD_Empy_Head		= "Fili Calot +3"
	BRD_Empy_Body		= "Fili Hongreline +3"
	BRD_Empy_Hand		= "Fili Manchettes +3"
	BRD_Empy_Legs		= "Fili Rhingrave +3"
	BRD_Empy_Feet		= "Fili Cothurnes +3"
	BRD_Empy_Ear2		= "Fili Earring +1"

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'   --Miracle Cheer
	info.DummySongInstrument = 'Daurdabla'
	--info.ExtraSongInstrument = 'Terpander'
	info.LullabySongInstrument = 'Daurdabla'
	--info.PrecastSongInstrument = 'Gjallarhorn'
	
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	--[[//Bind keys
//Bind syntax is "bind <key> <up> <command>
// ^ represents control- and ! is alt, eg !1 is alt-1]]

	-- Additional local binds
    send_command('bind ^c gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')
	send_command('bind !f7 gs c cycle CarnMode')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons 
	sets.weapons.Aeneas = {main="Aeneas",sub="Genmei Shield"}
	sets.weapons.Carn   = {main="Carnwenhan", sub="Genmei Shield"}
	sets.weapons.NaegTern = {main="Naegling",sub="Ternion Dagger +1"}
	sets.weapons.TauretTern = {main="Tauret",sub="Ternion Dagger +1"}
	sets.weapons.DualWeapons = {main="Aeneas",sub="Crepuscular Knife"}   
	sets.weapons.DualAeneas = {main="Aeneas",sub="Fusetto +3"}
	sets.weapons.NaegTP = {main="Naegling",sub="Fusetto +3"}
	sets.weapons.NaeglCrep = {main="Naegling",sub="Crepuscular Knife"}
	--sets.weapons.TauretTP = {main="Tauret",sub="Fusetto +3"}
	sets.weapons.TauretGleti = {main="Tauret",sub="Gleti's Knife"}
	--sets.weapons.KaliDW = {main=gear.kali_skill, sub=gear.kali_skill2}
	sets.weapons.Prime ={main="Mpu Gandring",sub="Crepuscular Knife"}
	--sets.weapons.Trial ={main="Carnwenhan", sub="Crepuscular Knife"}
	sets.weapons.CrepTP = {main="Crepuscular Knife", sub="Fusetto +3"}
	sets.weapons.CrepAcc = {main="Crepuscular Knife", sub="Aeneas"}
	sets.weapons.CarnCrep={main="Carnwenhan", sub="Crepuscular Knife"}




    sets.buff.Sublimation = {waist="Embla Sash"} 
    sets.buff.DTSublimation = {waist="Embla Sash"}
	sets.buff.Sleep = {main="Mpu Gandring"}
	sets.WakeUpWeapons = {sub="Mpu Gandring"}
	-- Precast Sets

	-- Fast cast sets for spells
		
	sets.precast.FC = {
		main=gear.grioavolr_fc_staff,			--main=gear.grioavolr_fc_staff,
		sub="Enki Strap",				--sub="Clerisy Strap +1",
		range= "Gjallarhorn",				
		head=BRD_Empy_Head,				--head="Bunzi's Hat",
		neck="Voltsurge Torque",				--Loricate Torque +1
		ear1="Etiolation Earring", 
		ear2=BRD_Empy_Ear2, --"Loquac. Earring",						-- Fili Earring +2
		body="Inyanga Jubbah +2",		--body="Inyanga Jubbah +2",
		hands=gear.gande_hands_brd, --"Leyline Gloves",				
		ring1="Kishar Ring",
		ring2="Murky Ring", --"Lebeche Ring",				
		back="Fi Follet Cape +1", --//"Swith Cape +1",				--back=gear.fc_jse_back,
		waist="Embla Sash",						--Flume Belt +1 Embla Sash
		legs="Aya. Cosciales +2", --gear.chironic_fc_legs,				--legs="Aya. Cosciales +2", Kaykaus Tights +1
		feet=BRD_Empy_Feet, --BRD_Relic_Feet						-- BRD_Empy_Feet
		}
		
	sets.precast.FC.BardSong = {
		range= "Gjallarhorn",				
		head=BRD_Empy_Head,				--head="Bunzi's Hat",
		neck="Voltsurge Torque",				--Loricate Torque +1
		ear1="Etiolation Earring", 
		ear2=BRD_Empy_Ear2, --"Loquac. Earring",						-- Fili Earring +2
		body="Inyanga Jubbah +2",		--body="Inyanga Jubbah +2",
		hands=gear.gande_hands_brd, --"Leyline Gloves",				
		ring1="Kishar Ring",
		ring2="Murky Ring", --"Lebeche Ring",				
		back="Fi Follet Cape +1", --//"Swith Cape +1",				--back=gear.fc_jse_back,
		waist="Embla Sash",						--Flume Belt +1 Embla Sash
		legs="Aya. Cosciales +2", --gear.chironic_fc_legs,				--legs="Aya. Cosciales +2", Kaykaus Tights +1
		feet=BRD_Empy_Feet, --BRD_Relic_Feet						-- BRD_Empy_Feet
		}

		
	sets.precast.FC.DT = {
		range= "Gjallarhorn",				
		head=BRD_Empy_Head,				--head="Bunzi's Hat",
		neck="Loricate Torque +1", --"Voltsurge Torque",				--Loricate Torque +1
		ear1="Etiolation Earring", 
		ear2=BRD_Empy_Ear2, --"Loquac. Earring",						-- Fili Earring +2
		body="Inyanga Jubbah +2",		--body="Inyanga Jubbah +2",
		hands=gear.gande_hands_brd, --"Leyline Gloves",				
		ring1="Kishar Ring",
		ring2="Murky Ring", --"Lebeche Ring",				
		back="Fi Follet Cape +1", --//"Swith Cape +1",				--back=gear.fc_jse_back,
		waist="Embla Sash",						--Flume Belt +1 Embla Sash
		legs="Aya. Cosciales +2", --gear.chironic_fc_legs,				--legs="Aya. Cosciales +2", Kaykaus Tights +1
		feet=BRD_Empy_Feet, --BRD_Relic_Feet						-- BRD_Empy_Feet
		}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
		sub="Genmei Shield"
		})

	sets.precast.FC.SongDebuff= set_combine(sets.precast.FC.BardSong, { range = "Gjallarhorn" })
	sets.precast.FC.SongDebuff.Resistant= set_combine(sets.precast.FC.BardSong, { range = "Gjallarhorn" })
	sets.precast.FC.Lullaby= set_combine(sets.precast.FC.BardSong, { range = "Gjallarhorn" })
	sets.precast.FC.Lullaby.Resistant= set_combine(sets.precast.FC.BardSong, { range = "Gjallarhorn" })
	sets.precast.FC['Horde Lullaby']= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC['Horde Lullaby'].Resistant= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC['Horde Lullaby'].AoE= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC['Horde Lullaby II']= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC['Horde Lullaby II'].Resistant= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC['Horde Lullaby II'].AoE= set_combine(sets.precast.FC.BardSong, { range = "Daurdabla" })
	sets.precast.FC.Mazurka= set_combine(sets.precast.FC.BardSong, { range = "Marsyas" }) --range = "Marsyas"
	sets.precast.FC['Honor March']= set_combine(sets.precast.FC.BardSong, { range = "Marsyas" })
	sets.precast.FC['Goddess\'s Hymnus']= set_combine(sets.precast.FC.BardSong, { range = "Marsyas" })

	-- Dedicated Dummy Songs
	sets.precast.FC['Scop\'s Operetta']				= set_combine(sets.precast.FC.BardSong, {range = info.ExtraSongInstrument})
	sets.precast.FC['Puppet\'s Operetta']			= set_combine(sets.precast.FC.BardSong, {range = info.ExtraSongInstrument})
	sets.precast.FC['Gold Capriccio']				= set_combine(sets.precast.FC.BardSong, {range = info.ExtraSongInstrument})
	sets.precast.FC['Fowl Aubade']					= set_combine(sets.precast.FC.BardSong, {range = info.ExtraSongInstrument})
	sets.precast.FC['Warding Round']				= set_combine(sets.precast.FC.BardSong, {range = info.ExtraSongInstrument})

	sets.precast.FC.Daurdabla 	= set_combine(sets.precast.FC.BardSong, {range = info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy	= sets.precast.FC.Daurdabla
	
		
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet=BRD_Relic_Feet}
	sets.precast.JA.Troubadour = {body=BRD_Relic_Body}			--{body="Bihu Jstcorps +1"}
	sets.precast.JA['Soul Voice'] = {legs=BRD_Relic_Legs}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		range=gear.linos_ws,		--ammo="Aurgelmir Orb +1",
		head="Nyame Helm",
		neck="Bard's Charm +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",			--Brutal Earring
		body=BRD_Relic_Body, --"Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Ephramad's Ring",					--ring1="Ramuh Ring +1",
		ring2="Beithir Ring",				--ring2="Ilabrat Ring",
		back=gear.melee_jse_back_ws_str,
		waist="Grunfeld Rope",				--waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
		
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		range=gear.linos_ws,		--ammo="Aurgelmir Orb +1",
		head="Nyame Helm",
		neck="Bard's Charm +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",			--Brutal Earring
		body=BRD_Relic_Body, --"Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Ephramad's Ring",					--ring1="Ramuh Ring +1",
		ring2="Beithir Ring",				--ring2="Ilabrat Ring",
		back=gear.melee_jse_back_ws_str,
		waist="Grunfeld Rope",				--waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		})
		
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		--ammo="Aurgelmir Orb +1",
		range=gear.linos_ws,
		head="Nyame Helm",					--"Nyame Helm",
		neck="Bard's Charm +2",				--Bard's Charm +2 Caro Necklace
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",				--ear2="Ishvara Earring", Brutal Earring
		body=BRD_Relic_Body,
		hands="Nyame Gauntlets",			--"Nyame Gauntlets" BRD_Relic_Hand,
		ring1="Ephramad's Ring", --"Sroda Ring",				--ring1="Rufescent Ring", Chirich Ring +1
		ring2="Epaminondas's Ring",				--ring2="Ilabrat Ring",
		back=gear.melee_jse_back_ws_str,			--back=gear.melee_jse_back,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",				--"Nyame Flanchard" BRD_Relic_Legs,
		feet="Nyame Sollerets"			--"Nyame Sollerets"
		})
		
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {
		--ammo="Aurgelmir Orb +1",
		range=gear.linos_ws,
		head="Nyame Helm",				--head="Cath Palug Crown",
		neck="Baetyl Pendant",					--neck="Baetyl Pendant", --warder of love
		ear1="Moonshade Earring",
		ear2="Friomisi Earring",
		body="Nyame Mail", --"Chironic Doublet",				--body="Chironic Doublet",
		hands="Nyame Gauntlets",		--hands=gear.chironic_enfeeble_hands,
		ring1="Shiva Ring +1",				--ring1="Metamorph Ring +1",
		ring2="Epaminondas's Ring",					--ring2="Shiva Ring +1",
		back=gear.melee_jse_back_ws_dex,				--back=gear.melee_jse_back,
		waist="Refoccilation Stone",			--waist="Refoccilation Stone", --warder of hope
		legs="Nyame Flanchard",				--"Nyame Flanchard" BRD_Relic_Legs,
		feet="Nyame Sollerets"			--"Nyame Sollerets"
		})
		
	sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.precast.WS, {
		--ammo="Aurgelmir Orb +1",
		range=gear.linos_ws,
		head="Nyame Helm",
		neck="Bard's Charm +2",
		ear1="Moonshade Earring",
		ear2="Domin. Earring +1",				--ear2="Ishvara Earring",
		body=BRD_Relic_Body,					--BRD_Relic_Body "Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Ilabrat Ring", --"Chirich Ring +1",				--ring1="Rufescent Ring", Epaminoda's Ring
		ring2="Epaminondas's Ring",				--ring2="Ilabrat Ring",
		back=gear.melee_jse_back_ws_dex,			--back=gear.melee_jse_back, Kentarch Belt +1
		waist="Kentarch Belt +1",				--Kentarch Belt +1
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		})

sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
		--ammo="Aurgelmir Orb +1",
		range=gear.linos_ws,
		head="Blistering Sallet +1",
		neck="Bard's Charm +2",
		ear1="Moonshade Earring",
		ear2="Mache Earring +1",				--ear2="Ishvara Earring",
		body=BRD_Relic_Body,					--BRD_Relic_Body "Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Ilabrat Ring", --"Cacoethic Ring +1",				--ring1="Rufescent Ring", Epaminoda's Ring cacoethic+1
		ring2="Begrudging Ring",				--ring2="Ilabrat Ring",
		back=gear.melee_jse_back_ws_dex,			--back=gear.melee_jse_back, Kentarch Belt +1
		waist="Fotia Belt",				--Kentarch Belt +1
		legs="Jokushu Haidate",
		feet="Nyame Sollerets"
		})
	sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS, {
		--ammo="Aurgelmir Orb +1",
		range=gear.linos_ws,
		head="Nyame Helm",						--"Nyame Helm",
		neck="Bard's Charm +2",
		ear1="Regal Earring",			--regal earring
		ear2="Ishvara Earring", --"Moonshade Earring",				--ear2="Ishvara Earring",
		body=BRD_Relic_Body,					-- "Nyame Mail",
		hands="Nyame Gauntlets",				--,
		ring1="Metamor. Ring +1",				--ring1="Rufescent Ring", Epaminoda's Ring
		ring2="Epaminondas's Ring",				--ring2="Ilabrat Ring", "Metamor. Ring +1"
		back=gear.melee_jse_back_ws_chr,			--back=gear.melee_jse_back, Kentarch Belt +1
		waist="Sailfi Belt +1",-- Sailfi Belt +1
		legs="Nyame Flanchard",				--BRD_Relic_Legs "Nyame Flanchard"
		feet="Nyame Sollerets"
		})
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}   --{ear1="Ishvara Earring",ear2="Telos Earring",} Lugra Earring +1
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	-- Midcast Sets
	sets.midcast = {
		main="Carnwenhan" ,--gear.kali_skill,
		range="Gjallarhorn", 			
		head=BRD_Empy_Head,					--
		neck="Mnbw. Whistle +1",				--
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body=BRD_Empy_Body,					--
		hands=BRD_Empy_Hand,					--
		ring1=Stikini_ring1,
		ring2=Stikini_ring2,
		back="Swith Cape +1",				--back=gear.magic_jse_back,
		waist="Kobo Obi",					--waist="Kobo Obi"
		legs="Inyanga Shalwar +2",			--legs="Inyanga Shalwar +2",
		feet=BRD_AF_Feet					
		}
		
	-- General set for recast times.
	sets.midcast.FastRecast = {
	--	main=gear.grioavolr_fc_staff,
	--	sub="Clerisy Strap",
		--range="Terpander",						--ammo="Hasty Pinion +1",
	--	ammo="Hasty Pinion +1",
		head=BRD_Empy_Head,			--head="Bunzi's Hat", head=BRD_Empy_Head,	
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",				--body="Inyanga Jubbah +2",
		hands="Leyline Gloves",					--hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Lebeche Ring",					--ring2="Lebeche Ring",
		back="Swith Cape +1",				--back=gear.magic_jse_back,
		waist="Witful Belt",
		legs="Aya. Cosciales +2", --gear.chironic_fc_legs,				--legs="Aya. Cosciales +2", Kaykaus Tights +1
		feet=BRD_Relic_Feet					
		}


	
	-- Gear to enhance certain classes of songs
	sets.midcast.Madrigal 						= { head = BRD_Empy_Head, back=gear.magic_jse_back, feet=BRD_Empy_Feet }
	sets.midcast.Minuet 						= { body = BRD_Empy_Body }
	sets.midcast.March 							= { hands = BRD_Empy_Hand }
	sets.midcast.Ballad 						={ range="Miracle Cheer"}--,legs = BRD_Empy_Legs }	
	sets.midcast['Sentinel\'s Scherzo'] 		= { feet = BRD_Empy_Feet }
	sets.midcast.Prelude						= { feet = BRD_Empy_Feet, back=gear.magic_jse_back }
	
	sets.midcast.Paeon = set_combine(sets.precast.FC.BardSong,{range=info.ExtraSongInstrument,ammo=empty})
	sets.midcast['Army\'s Paeon VI']=set_combine(sets.precast.FC.BardSong,{range=info.ExtraSongInstrument,ammo=empty})
	sets.midcast['Army\'s Paeon V']=set_combine(sets.precast.FC.BardSong,{range=info.ExtraSongInstrument,ammo=empty})
	sets.midcast['Army\'s Paeon IV']=set_combine(sets.precast.FC.BardSong,{range=info.ExtraSongInstrument,ammo=empty})
	sets.midcast['Army\'s Paeon III']=set_combine(sets.precast.FC.BardSong,{range=info.ExtraSongInstrument,ammo=empty})
	
	sets.midcast.Etude							= { head = "Mousai Turban +1" }
	sets.midcast.Threnody						= { body = "Mousai Manteel +1" }
	sets.midcast.Carol 							= { hands = "Mousai Gages +1" }
	sets.midcast.Minne 							= { legs = "Mousai Seraweels +1" }
	sets.midcast.Mambo							= { feet = "Mousai Crackows +1" }

	sets.midcast.Lullaby = {
		range="Marsyas",
		head=BRD_AF_Head, 
		hands=BRD_AF_Hand, 
		body=BRD_Empy_Body, 
		legs="Inyanga Shalwar +2",
		feet=BRD_AF_Feet, 
		range="Gjallarhorn", 
		neck="Mnbw. Whistle +1", 
		waist="Acuity Belt +1",
		ear1="Gersemi Earring",
		ear2="Regal Earring",
		ring1=Stikini_ring1,
		ring2=Stikini_ring2,
		back="Aurist's Cape +1", --"Swith Cape +1",
		} 
	sets.midcast.Lullaby.Resistant = {range=info.LullabySongInstrument}
	sets.midcast['Horde Lullaby'] = {
			head=BRD_AF_Head,
			neck="Mnbw. Whistle +1",
			hands=BRD_AF_Hand,
			body=BRD_AF_Body,
			feet=BRD_AF_Feet,
			range=info.LullabySongInstrument, --{range="Marsyas"}
			ring1=Stikini_ring1,
			back="Aurist's Cape +1", --"Swith Cape +1",
			waist="Acuity Belt +1",
			ear1="Gersemi Earring",
			ear2="Regal Earring"
			}
	sets.midcast['Horde Lullaby'].Resistant = {head=BRD_AF_Head,hands=BRD_AF_Hand,body=BRD_AF_Body,feet=BRD_Relic_Feet,range=info.LullabySongInstrument,ring1=Stikini_ring1,waist="Harfner's Sash"}
	sets.midcast['Horde Lullaby'].AoE = {
			head=BRD_AF_Head,
			neck="Mnbw. Whistle +1",
			hands=BRD_AF_Hand,
			body=BRD_AF_Body,
			feet=BRD_AF_Feet,
			range=info.LullabySongInstrument, --{range="Marsyas"}
			ring1=Stikini_ring1,
			back="Aurist's Cape +1", --"Swith Cape +1",
			waist="Harfner's Sash"
			}
	sets.midcast['Horde Lullaby II'] = {
			main="Carnwenhan",
			sub="Ammurapi Shield",
			head=BRD_AF_Head,
			hands="Inyanga Dastanas +2", --BRD_Empy_Hand,
			body=BRD_AF_Body, --BRD_Empy_Body, --BRD_AF_Body,
			legs="Inyanga Shalwar +2", --
			feet=BRD_Relic_Feet, --BRD_AF_Feet,
			range=info.LullabySongInstrument, --{range="Marsyas"}
			ring1=Stikini_ring1,
			ring2=Stikini_ring2,
			neck="Mnbw. Whistle +1",
			back="Aurist's Cape +1", --"Swith Cape +1",
			waist="Harfner's Sash",
			ear1="Gersemi Earring",
			ear2="Regal Earring"
			} 
	sets.midcast['Horde Lullaby II'].Resistant = {head=BRD_AF_Head,hands=BRD_AF_Hand,body=BRD_AF_Body,feet=BRD_Relic_Feet,range=info.LullabySongInstrument,ring1=Stikini_ring1}
	sets.midcast['Horde Lullaby II'].AoE = {
			head=BRD_AF_Head,
			hands=BRD_Empy_Hand,
			body=BRD_AF_Body,
			feet=BRD_AF_Feet,
			range=info.LullabySongInstrument, --{range="Marsyas"}
			ring1=Stikini_ring1,
			ring2=Stikini_ring2,
			neck="Mnbw. Whistle +1",
			back="Aurist's Cape +1", --"Swith Cape +1",
			waist="Harfner's Sash",
			ear1="Gersemi Earring",
			ear2="Regal Earring"
			} 
	sets.midcast['Magic Finale'] 				= { range = "Gjallarhorn" }
	sets.midcast.Mazurka 						= { range = "Gjallarhorn" }	
	sets.midcast['Goddess\'s Hymnus']			= { range = "Marsyas" }	

	sets.midcast['Honor March'] 				= set_combine(sets.midcast.March, { range = "Marsyas" })
	
	
		-- Dedicated Dummy Songs
	sets.midcast['Scop\'s Operetta']			= {range = info.ExtraSongInstrument}
	sets.midcast['Puppet\'s Operetta']			= {range = info.ExtraSongInstrument}
	sets.midcast['Gold Capriccio']				= {range = info.ExtraSongInstrument}
	sets.midcast['Fowl Aubade']					= {range = info.ExtraSongInstrument}
	sets.midcast['Warding Round']				= {range = info.ExtraSongInstrument}
	
	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {

		main="Carnwenhan", --gear.kali_skill,
		range="Gjallarhorn", 			
		head=BRD_Empy_Head,					--
		neck="Mnbw. Whistle +1",				--
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body=BRD_Empy_Body,					--
		hands=BRD_Empy_Hand,					--
		ring1=Stikini_ring1,
		ring2=Stikini_ring2,
		back="Swith Cape +1",				--back=gear.magic_jse_back,
		waist="Kobo Obi",					
		legs="Inyanga Shalwar +2",			
		feet=BRD_AF_Feet					
		}
		
	sets.midcast.SongEffect.DW = {main="Carnwenhan", --gear.kali_skill,
									sub=gear.kali_skill2
									} --Only weapons in this set. This set is overlayed onto  SongEffect

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
		main="Carnwenhan", --gear.kali_skill,
		sub="Ammurapi Shield",
		range="Marsyas",
		ammo=empty,
		head=BRD_AF_Head,				--head="Inyanga Tiara +2",
		neck="Mnbw. Whistle +1",				--neck="Mnbw. Whistle +1",
		ear1="Regal Earring", --"Hermetic Earring",				--ear1="Regal Earring",
		ear2=BRD_Empy_Ear2,				--ear2="Digni. Earring",
		body=BRD_Empy_Body, --BRD_AF_Body,			--body="Fili Hongreline +1",
		hands=BRD_Empy_Hand,			--hands="Inyan. Dastanas +2",
		ring1="Metamor. Ring +1",			--ring1="Metamorph Ring +1"
		ring2=Stikini_ring2,
		back="Aurist's Cape +1", --gear.magic_jse_back,			--back=gear.magic_jse_back,
		waist="Acuity Belt +1",				--waist="Acuity Belt +1",
		legs=BRD_Empy_Legs, --BRD_AF_Legs,			--legs="Inyanga Shalwar +2",
		feet=BRD_AF_Feet				--feet="Brioso Slippers +2"  Bihu Slippers +1
		}
		
	sets.midcast.SongDebuff.DW = {
		main="Carnwenhan", --gear.kali_skill,
		sub=gear.kali_skill2} --Only weapons in this set. This set is overlayed onto  SongDebuff

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {
		main="Daybreak",
		sub="Ammurapi Shield",
		range="Gjallarhorn",
		ammo=empty,
		head="Bunzi's Hat",				--head="Inyanga Tiara +2",
		neck="Mnbw. Whistle +1",				--neck="Mnbw. Whistle +1",
		ear1="Enchntr. Earring +1",				--ear1="Regal Earring",
		ear2="Loquac. Earring",				--ear2="Digni. Earring",
		body=BRD_Empy_Body,			--body="Inyanga Jubbah +2",
		hands=BRD_Empy_Hand,			--hands="Inyan. Dastanas +2",
		ring1="Metamorph Ring +1",				
		ring2=Stikini_ring2,
		back=gear.magic_jse_back,				--back=gear.magic_jse_back,
		waist="Acuity Belt +1",					
		legs="Inyanga Shalwar +2",				
		feet=BRD_Relic_Feet
		}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {
		range="Gjallarhorn",
		head=BRD_Empy_Head,				
		neck="Mnbw. Whistle +1",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body=BRD_Empy_Body,			--body="Inyanga Jubbah +2",
		hands="Bewegt Cuffs", 			--hands="Gendewitha Gages +1",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
		back=gear.magic_jse_back,			--back=gear.magic_jse_back,
		waist="Witful Belt",
		legs=BRD_Empy_Legs,				
		feet=BRD_Relic_Feet
		}
	sets.midcast.SongRecast.DW = set_combine(sets.midcast.SongRecast,{})
	
	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
		main="Daybreak",
		sub="Ammurapi Shield",				--Curatio Grip
		ammo="Pemphredo Tathlum",
        head="Bunzi's Hat",
		neck="Voltsurge Torque",
		ear1="Mendicant's Earring",
        body="Bunzi's Robe",
		hands="Kaykaus Cuffs +1",
		ring1="Naji's Loop",
		ring2="Menelaus's Ring",
        back="Solemnity Cape", --"Tempered Cape +1",
		waist="Witful Belt",
		legs="Bunzi's Pants",
		feet=BRD_Relic_Feet
		}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield", --"Fulcio Grip",
		ammo="Hasty Pinion +1",
		head=BRD_AF_Head,
		neck="Voltsurge Torque",
		ear1="Andoaa Earring",
		ear2="Gifted Earring",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		ring1=Stikini_ring1,
		ring2=Stikini_ring2,
		back=gear.magic_jse_back,
		waist="Embla Sash",
		legs=BRD_AF_Legs,
		feet=BRD_AF_Feet
		}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",
		ear2="Earthcry Earring",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
		})
		
	sets.midcast['Elemental Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
		body="Chironic Doublet",
		hands="Volte Gloves",
		ring1="Shiva Ring +1",
		ring2=Stikini_ring2, --"Shiva Ring +1",
		back="Aurist's Cape +1", --,back="Toro Cape",
		waist="Refoccilation Stone", --"Sekhmet Corset",
		legs="Bunzi's Pants", --"Gyve Trousers",
		feet=gear.chironic_nuke_feet
		}
		
	sets.midcast['Elemental Magic'].Resistant = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Regal Earring", --"Crematio Earring",
		body="Chironic Doublet",
		hands="Volte Gloves",
		ring1="Shiva Ring +1",
		ring2=Stikini_ring2, --"Shiva Ring +1",
		back="Aurist's Cape +1", --,back="Toro Cape",
		waist="Refoccilation Stone", --"Yamabuki-no-Obi",
		legs="Gyve Trousers",
		feet=gear.chironic_nuke_feet
		}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		neck="Debilis Medallion",
		hands="Hieros Mittens",
		back="Solemnity Cape",--"Oretan. Cape +1",
		ring1="Haoma's Ring",
		ring2="Menelaus's Ring",
		waist="Witful Belt",
		feet="Vanya Clogs"
		})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,
																		sub="Clerisy Strap"--"Clemency Grip"
																		})

	-- Resting sets
	sets.resting = {
		--main="Chatoyant Staff",
		--sub="Umbra Strap",
		range="Terpander",
		head=BRD_Empy_Head, --empty,
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",			--ear1="Etiolation Earring",
		ear2=BRD_Empy_Ear2, --"Ethereal Earring",			--ear2="Ethereal Earring",
		body=BRD_Empy_Body, --"Respite Cloak",				--body="Respite Cloak",Furious Arundmite-SihgGates-
		hands=gear.chironic_refresh_hands,		--hands=gear.chironic_refresh_hands,
		ring1="Murky Ring",				--ring1="Defending Ring",
		ring2="Shadow Ring", --"Dark Ring",					--ring2="Dark Ring",
		back="Moonlight Cape",					--back="Umbra Cape",
		waist="Null Belt",					--waist="Flume Belt +1",
		legs="Assid. Pants +1",				--legs="Assid. Pants +1",
		feet=gear.chironic_refresh_feet		--feet=gear.chironic_refresh_feet
		}
	
	sets.idle = {
	--	main="Mpaca's Staff",				--main="Mpaca's Staff",
	--	sub="Enki Strap",					--sub="Umbra Strap",
		range="Terpander",
		--ammo="Staunch Tathlum",
		head=BRD_Empy_Head,				--"Nyame Helm"
		neck="Loricate Torque +1",
		ear1="Eabani Earring",			--ear1="Etiolation Earring",
		ear2=BRD_Empy_Ear2,			--ear2="Ethereal Earring",
		body=BRD_Empy_Body, --"Bunzi's Robe",					--body="Respite Cloak",
		hands=BRD_Empy_Hand,			--hands=gear.chironic_refresh_hands, "Nyame Gauntlets"
		ring1="Murky Ring",
		ring2=Stikini_ring2,
		back="Moonlight Cape",					--back="Umbra Cape",
		waist="Null Belt",					--waist="Flume Belt +1",
		legs=BRD_Empy_Legs,				--legs="Assid. Pants +1", "Nyame Flanchard"
		feet=BRD_Empy_Feet				--feet=gear.chironic_refresh_feet "Nyame Sollerets"
		}
		
	sets.idle.DW = {
	--	main="Mpaca's Staff",				--main="Mpaca's Staff",
	--	sub="Enki Strap",					--sub="Umbra Strap",
		range="Terpander",
		--ammo="Staunch Tathlum",
		head=BRD_Empy_Head,				--"Nyame Helm"
		neck="Loricate Torque +1",
		ear1="Eabani Earring",			--ear1="Etiolation Earring",
		ear2=BRD_Empy_Ear2,			--ear2="Ethereal Earring",
		body="Bunzi's Robe",					--body="Respite Cloak",
		hands=BRD_Empy_Hand,			--hands=gear.chironic_refresh_hands, "Nyame Gauntlets"
		ring1="Murky Ring",
		ring2=Stikini_ring2,
		back="Moonlight Cape",					--back="Umbra Cape",
		waist="Null Belt",					--waist="Flume Belt +1",
		legs=BRD_Empy_Legs,				--legs="Assid. Pants +1", "Nyame Flanchard"
		feet=BRD_Empy_Feet				--feet=gear.chironic_refresh_feet "Nyame Sollerets"
		}
		
	sets.idle.NoRefresh = {
		--main="Mpaca's Staff",				--main="Mpaca's Staff",
		--sub="Enki Strap",					--sub="Umbra Strap", Umbra Strap
		range="Terpander",
		--ammo="Staunch Tathlum",
		head=BRD_Empy_Head,				--"Nyame Helm"
		neck="Loricate Torque +1",
		ear1="Eabani Earring",			--ear1="Etiolation Earring",
		ear2=BRD_Empy_Ear2,			--ear2="Ethereal Earring",
		body="Bunzi's Robe",					--body="Respite Cloak",
		hands=BRD_Empy_Hand,			--hands=gear.chironic_refresh_hands, "Nyame Gauntlets"
		ring1="Defending Ring",
		ring2=Stikini_ring2,
		back="Moonlight Cape",					--back="Umbra Cape",
		waist="Null Belt",					--waist="Flume Belt +1",
		legs=BRD_Empy_Legs,				--legs="Assid. Pants +1", "Nyame Flanchard"
		feet=BRD_Empy_Feet				--feet=gear.chironic_refresh_feet "Nyame Sollerets"
		}

	sets.idle.DT = {
		main="Daybreak",
		sub="Genmei Shield",
		range="Terpander",
		--ammo="Staunch Tathlum",			--ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Alabaster Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Murky Ring",				--ring1="Defending Ring",
		ring2="Shadow Ring",				--ring2="Shadow Ring",
		back="Moonlight Cape",
		waist="Carrier's Sash",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
	
	-- Defense sets

	sets.defense.PDT = {
		--main="Terra's Staff", 				--main="Terra's Staff"
		--sub="Umbra Strap",					--sub="Umbra Strap",
		--range="Terpander",		--ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		ear1="Eabani Earring",				--ear1="Etiolation Earring",
		ear2="Sanare Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Warden's Ring",				--ring1="Defending Ring",
		ring2="Gelatinous Ring +1",				--ring2="Shadow Ring",
		back="Moonlight Cape",
		waist="Carrier's Sash",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}

	sets.defense.MDT = {
		--main="Terra's Staff", 
		--sub="Umbra Strap",
		--range="Terpander",			--ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		--neck="Loricate Torque +1",
		neck="Bard's Charm +2",
		ear1="Eabani Earring",			--ear1="Etiolation Earring",
		ear2="Sanare Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		--ring1="Defending Ring",			--ring1="Defending Ring",
		ring1="Petrov Ring",
		--ring2="Shadow Ring",
		ring2=Chirich_ring2,
		back="Moonlight Cape",
		waist="Carrier's Sash",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}

	sets.Kiting = {feet=BRD_Empy_Feet}  
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}    --Abyssic Cluster
	sets.idle.Town = set_combine(sets.idle, {feet=BRD_Empy_Feet,ring2="Shneddick Ring"})
	sets.idle.Field = set_combine(sets.idle, {feet=BRD_Empy_Feet,ring2="Shneddick Ring"})

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {
		range=gear.linos_stp,		--ammo="Aurgelmir Orb +1",
		head="Blistering Sallet +1", --"Bunzi's Hat",				--BRD_Empy_Head
		neck="Bard's Charm +2",
		ear1="Cessance Earring",
		ear2="Telos Earring",			--"Brutal Earring" Cessance Earring
		body="Perfection Plate.",			
		hands="Perfection Gauntlets", --"Gazu Bracelets +1",  
		ring1=Chirich_ring1,
		ring2=Chirich_ring2,
		back="Null Shawl", 
		waist="Reiki Yotai", --"Kentarch Belt +1",					--"Sailfi Belt +1", Null Belt
		legs="Perfection Brais", --BRD_AF_Legs,				--"Aya. Cosciales +2" BRD_AF_Legs
		feet="Perfection Sab." --"Nyame Sollerets" --"Volte Spats" --"Nyame Sollerets"				--feet="Battlecast Gaiters"
		}

	sets.engaged.DT = {
	--	main="Aeneas",						--main="Aeneas",
		sub="Genmei Shield",					--sub="Genmei Shield",
		range=gear.linos_stp,		--ammo="Aurgelmir Orb +1",
		ammo=Empty,
		head="Bunzi's Hat", --"Fili Calot +3",
		body="Perfection Plate.",
		hands="Perfection Gauntlets", --"Gazu Bracelets +1",
		legs="Perfection Brais", --BRD_Empy_Legs,
		feet="Perfection Sab.", --"Nyame Sollerets", --"Volte Spats",
		neck="Bard's Charm +2",
		waist="Kentarch Belt +1", --"Windbuffet Belt +1",
		ear1="Telos Earring",
		ear2="Crepuscular Earring", --"Cessance Earring",
		ring1="Moonlight Ring", --"Defending Ring",
		ring2="Moonbeam Ring",
		back="Null Shawl",
		}
	sets.engaged.Acc = {
		range=gear.linos_stp,		--ammo="Aurgelmir Orb +1",
		head="Blistering Sallet +1", --"Bunzi's Hat",				--BRD_Empy_Head
		neck="Bard's Charm +2",
		ear1="Cessance Earring",
		ear2="Telos Earring",			--"Brutal Earring" Cessance Earring
		body="Perfection Plate.",			
		hands="Gazu Bracelets +1",  
		ring1=Chirich_ring1,
		ring2=Chirich_ring2,
		back="Null Shawl", 
		waist="Reiki Yotai", --"Kentarch Belt +1",					--"Sailfi Belt +1", Null Belt
		legs="Perfection Brais", --BRD_AF_Legs,				--"Aya. Cosciales +2" BRD_AF_Legs
		feet="Perfection Sab." --"Nyame Sollerets" --"Volte Spats" --"Nyame Sollerets"				--feet="Battlecast Gaiters"
		}
		
		
	sets.engaged.DW = {
		range=gear.linos_stp,		--ammo="Aurgelmir Orb +1",
		head="Bunzi's Hat", --"Blistering Sallet +1", --"Bunzi's Hat",				--BRD_Empy_Head
		neck="Bard's Charm +2",
		ear1="Cessance Earring",
		ear2="Telos Earring",			--"Brutal Earring" Cessance Earring
		body="Perfection Plate.",			
		hands="Perfection Gauntlets", --"Gazu Bracelets +1",  
		ring1="Moonlight Ring", --Chirich_ring1,
		ring2=Chirich_ring2,
		back=gear.melee_jse_back, --"Null Shawl", 
		waist="Reiki Yotai", --"Kentarch Belt +1",					--"Sailfi Belt +1", Null Belt
		legs="Perfection Brais", --"Nyame Flanchard", --BRD_AF_Legs,				--"Aya. Cosciales +2" BRD_AF_Legs
		feet="Perfection Sab." --"Volte Spats" --"Nyame Sollerets"				--feet="Battlecast Gaiters"
		}
			
		
	sets.engaged.DW.DT = {  --45pdt/50mdt
		range=gear.linos_stp,		--ammo="Aurgelmir Orb +1",
		ammo=Empty,
		head="Bunzi's Hat", --"Fili Calot +3",
		body="Perfection Plate.", --"Nyame Mail", --"Ayanmo Corazza +2",
		hands="Perfection Gauntlets", --"Bunzi's Gloves", --"Gazu Bracelets +1",  
		legs="Perfection Brais", --"Nyame Flanchard", --BRD_Empy_Legs,
		feet="Perfection Sab.", --"Nyame Sollerets", --"Volte Spats",
		neck="Bard's Charm +2",
		waist="Kentarch Belt +1", --"Sailfi Belt +1", --"Kentarch Belt +1", --"Windbuffet Belt +1",
		ear1="Telos Earring",
		ear2="Alabaster Earring", --"Crepuscular Earring", --"Cessance Earring",
		ring1="Moonlight Ring", --"Defending Ring",
		ring2="Moonbeam Ring", --Chirich_ring2,
		back=gear.melee_jse_back, --"Null Shawl",
		}
		
	sets.engaged.DW.Acc = {
		range=gear.linos_stp,		--ammo="Aurgelmir Orb +1",
		head="Bunzi's Hat", --"Blistering Sallet +1", --"Bunzi's Hat",				--BRD_Empy_Head
		neck="Bard's Charm +2",
		ear1="Eabani earring", --"Cessance Earring",
		ear2="Telos Earring",			--"Brutal Earring" Cessance Earring
		body="Perfection Plate.",			
		hands="Gazu Bracelets +1",  
		ring1="Moonlight Ring", --Chirich_ring1,
		ring2=Chirich_ring2,
		back=gear.melee_jse_back, --"Null Shawl", 
		waist="Reiki Yotai", --"Kentarch Belt +1",					--"Sailfi Belt +1", Null Belt
		legs="Perfection Brais", --"Nyame Flanchard", --BRD_AF_Legs,				--"Aya. Cosciales +2" BRD_AF_Legs
		feet="Perfection Sab." --"Volte Spats" --"Nyame Sollerets"				--feet="Battlecast Gaiters"
		}
		
	sets.engaged.DW.Acc.DT = {
		--main="Aeneas",
		--sub="Blurred Knife +1",
		range=gear.linos_stp,
		head="Nyame Helm",
		neck="Bard's Charm +2", --"Combatant's Torque",				--neck="Combatant's Torque",
		ear1="Suppanomimi",						--ear1="Suppanomimi",
		ear2="Telos Earring",					--ear2="Telos Earring",
		body="Perfection Plate.",
		hands="Perfection Gauntlets", --"Nyame Gauntlets",
		ring1="Defending Ring",					--ring1="Defending Ring",
		ring2="Ilabrat Ring",					--ring2="Ilabrat Ring",
		back=gear.melee_jse_back,				--back=gear.melee_jse_back,
		waist="Reiki Yotai",					--waist="Reiki Yotai",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 14)
end


function user_job_lockstyle()
	windower.chat.input('/lockstyleset 020')
end


