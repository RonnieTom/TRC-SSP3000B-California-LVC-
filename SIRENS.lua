--[[
---------------------------------------------------
LUXART VEHICLE CONTROL V3 (FOR FIVEM)
---------------------------------------------------
Coded by Lt.Caine
ELS Clicks by Faction
Additions by TrevorBarns
---------------------------------------------------
FILE: SIRENS.lua
PURPOSE: Associate specific sirens with specific
vehicles. Siren assignments. 
---------------------------------------------------
SIREN TONE TABLE: 
	ID- Generic Name	(SIREN STRING)									[vehicles.awc name]
	1 - Airhorn 		(SIRENS_AIRHORN)								[AIRHORN_EQD]
	2 - Wail 			(VEHICLES_HORNS_SIREN_1)						[SIREN_PA20A_WAIL]
	3 - Yelp 			(VEHICLES_HORNS_SIREN_2)						[SIREN_2]
	4 - Priority 		(VEHICLES_HORNS_POLICE_WARNING)					[POLICE_WARNING]
	5 - CustomA* 		(RESIDENT_VEHICLES_SIREN_WAIL_01)				[SIREN_WAIL_01]
	6 - CustomB* 		(RESIDENT_VEHICLES_SIREN_WAIL_02)				[SIREN_WAIL_02]
	7 - CustomC* 		(RESIDENT_VEHICLES_SIREN_WAIL_03)				[SIREN_WAIL_03]
	8 - CustomD* 		(RESIDENT_VEHICLES_SIREN_QUICK_01)				[SIREN_QUICK_01]
	9 - CustomE* 		(RESIDENT_VEHICLES_SIREN_QUICK_02)				[SIREN_QUICK_02]
	10 - CustomF* 		(RESIDENT_VEHICLES_SIREN_QUICK_03)				[SIREN_QUICK_03]
	11 - Powercall 		(VEHICLES_HORNS_AMBULANCE_WARNING)				[AMBULANCE_WARNING]
	12 - FireHorn	 	(VEHICLES_HORNS_FIRETRUCK_WARNING)				[FIRE_TRUCK_HORN]
	13 - Firesiren 		(RESIDENT_VEHICLES_SIREN_FIRETRUCK_WAIL_01)		[SIREN_FIRETRUCK_WAIL_01]
	14 - Firesiren2 	(RESIDENT_VEHICLES_SIREN_FIRETRUCK_QUICK_01)	[SIREN_FIRETRUCK_QUICK_01]
]]

RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_SAHP_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_SAHP_OLD', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_SAHP_BIKE', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSPD_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSSD_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSFD_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_SANFIRE_NEW', false)

SIRENS = {	
	--[[1]]	  { Name = 'Airhorn', 		String = 'SIRENS_AIRHORN', 								Ref = 0 }, --1
	--[[2]]	  { Name = 'Wail', 			String = 'VEHICLES_HORNS_SIREN_1', 						Ref = 0 }, --2
	--[[3]]	  { Name = 'Yelp', 			String = 'VEHICLES_HORNS_SIREN_2', 						Ref = 0 }, --3
	--[[4]]	  { Name = 'Priority', 		String = 'VEHICLES_HORNS_POLICE_WARNING', 				Ref = 0 }, --4
	--[[5]]	  { Name = 'CustomA', 		String = 'RESIDENT_VEHICLES_SIREN_WAIL_01', 			Ref = 0 }, --5
	--[[6]]	  { Name = 'CustomB', 		String = 'RESIDENT_VEHICLES_SIREN_WAIL_02', 			Ref = 0 }, --6
	--[[7]]	  { Name = 'CustomC', 		String = 'RESIDENT_VEHICLES_SIREN_WAIL_03', 			Ref = 0 }, --7
	--[[8]]	  { Name = 'CustomD', 		String = 'RESIDENT_VEHICLES_SIREN_QUICK_01', 			Ref = 0 }, --8
	--[[9]]	  { Name = 'CustomE',		String = 'RESIDENT_VEHICLES_SIREN_QUICK_02',			Ref = 0 }, --9
	--[[10]]  { Name = 'CustomF',		String = 'RESIDENT_VEHICLES_SIREN_QUICK_03', 			Ref = 0 }, --10
	--[[11]]  { Name = 'Powercall', 	String = 'VEHICLES_HORNS_AMBULANCE_WARNING', 			Ref = 0 }, --11
	--[[12]]  { Name = 'Fire Horn', 	String = 'VEHICLES_HORNS_FIRETRUCK_WARNING', 			Ref = 0 }, --12
	--[[13]]  { Name = 'Fire Yelp', 	String = 'RESIDENT_VEHICLES_SIREN_FIRETRUCK_WAIL_01', 	Ref = 0 }, --13
	--[[14]]  { Name = 'Fire Wail', 	String = 'RESIDENT_VEHICLES_SIREN_FIRETRUCK_QUICK_01', 	Ref = 0 }, --14
	-- START OF SAS --
	--[[15]]  { Name = 'Mastercom B Horn',         String = 'OISS_SSA_VEHAUD_LSPD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
	--[[16]]  { Name = 'Mastercom B Wail',         String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
	--[[17]]  { Name = 'Mastercom B Yelp',          String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
	--[[18]]  { Name = 'Mastercom B Priority',      String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
	--[[19]]  { Name = 'Mastercom B Alternative 1',        String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
	--[[20]]  { Name = 'Mastercom B Alternative 2',       String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
	--[[21]]  { Name = 'Old LSPD HORN',         String = 'OISS_SSA_VEHAUD_LSPD_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_LSPD_OLD_SOUNDSET'}, --21
	--[[22]]  { Name = 'Old LSPD ADAM',         String = 'OISS_SSA_VEHAUD_LSPD_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSPD_OLD_SOUNDSET'}, --22
	--[[23]]  { Name = 'Old LSPD BOY',          String = 'OISS_SSA_VEHAUD_LSPD_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSPD_OLD_SOUNDSET'}, --23
	--[[24]]  { Name = 'Old LSPD CHARLES',      String = 'OISS_SSA_VEHAUD_LSPD_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSPD_OLD_SOUNDSET'}, --24
	--[[25]]  { Name = 'Old LSPD DAVID',        String = 'OISS_SSA_VEHAUD_LSPD_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSPD_OLD_SOUNDSET'}, --25
	--[[26]]  { Name = 'Old LSPD EDWARD',       String = 'OISS_SSA_VEHAUD_LSPD_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSPD_OLD_SOUNDSET'}, --26
	--[[27]]  { Name = 'Smart Siren Horn',         String = 'OISS_SSA_VEHAUD_LSSD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'}, --27
	--[[28]]  { Name = 'Smart Siren Wail',         String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'}, --28
	--[[29]]  { Name = 'Smart Siren Yelp',          String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'}, --29
	--[[30]]  { Name = 'New LSSD CHARLES',      String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'}, --30
	--[[31]]  { Name = 'New LSSD DAVID',        String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'}, --31
	--[[32]]  { Name = 'New LSSD EDWARD',       String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'}, --32
	--[[33]]  { Name = 'Old LSSD HORN',         String = 'OISS_SSA_VEHAUD_LSSD_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_LSSD_OLD_SOUNDSET'}, --33
	--[[34]]  { Name = 'Old LSSD ADAM',         String = 'OISS_SSA_VEHAUD_LSSD_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSSD_OLD_SOUNDSET'}, --34
	--[[35]]  { Name = 'Old LSSD BOY',          String = 'OISS_SSA_VEHAUD_LSSD_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSSD_OLD_SOUNDSET'}, --35
	--[[36]]  { Name = 'Old LSSD CHARLES',      String = 'OISS_SSA_VEHAUD_LSSD_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSSD_OLD_SOUNDSET'}, --36
	--[[37]]  { Name = 'Old LSSD DAVID',        String = 'OISS_SSA_VEHAUD_LSSD_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSSD_OLD_SOUNDSET'}, --37
	--[[38]]  { Name = 'Old LSSD EDWARD',       String = 'OISS_SSA_VEHAUD_LSSD_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSSD_OLD_SOUNDSET'}, --38
	--[[39]]  { Name = 'New BCSO HORN',         String = 'OISS_SSA_VEHAUD_BCSO_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET'}, --39
	--[[40]]  { Name = 'Touchmaster Delta Horn',         String = 'OISS_SSA_VEHAUD_BCSO_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET'},
	--[[41]]  { Name = 'Touchmaster Delta Wail',         String = 'OISS_SSA_VEHAUD_BCSO_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET'},
	--[[42]]  { Name = 'Touchmaster Delta Yelp',          String = 'OISS_SSA_VEHAUD_BCSO_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET'},
	--[[43]]  { Name = 'Touchmaster Delta Priority',      String = 'OISS_SSA_VEHAUD_BCSO_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET'},
	--[[44]]  { Name = 'Touchmaster Delta Alternative',        String = 'OISS_SSA_VEHAUD_BCSO_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET'},
	--[[45]]  { Name = 'Old BCSO HORN',         String = 'OISS_SSA_VEHAUD_BCSO_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_BCSO_OLD_SOUNDSET'}, --45
	--[[46]]  { Name = 'Old BCSO ADAM',         String = 'OISS_SSA_VEHAUD_BCSO_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_BCSO_OLD_SOUNDSET'}, --46
	--[[47]]  { Name = 'Old BCSO BOY',          String = 'OISS_SSA_VEHAUD_BCSO_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_BCSO_OLD_SOUNDSET'}, --47
	--[[48]]  { Name = 'Old BCSO CHARLES',      String = 'OISS_SSA_VEHAUD_BCSO_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_BCSO_OLD_SOUNDSET'}, --48
	--[[49]]  { Name = 'Old BCSO DAVID',        String = 'OISS_SSA_VEHAUD_BCSO_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_BCSO_OLD_SOUNDSET'}, --49
	--[[50]]  { Name = 'Old BCSO EDWARD',       String = 'OISS_SSA_VEHAUD_BCSO_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_BCSO_OLD_SOUNDSET'}, --50
	--[[51]]  { Name = 'Cencom Sapphire Horn',         String = 'OISS_SSA_VEHAUD_SAHP_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'}, --51
	--[[52]]  { Name = 'Cencom Sapphire Wail',         String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'}, --52
	--[[53]]  { Name = 'Cencom Sapphire Yelp',          String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'}, --53
	--[[54]]  { Name = 'Cencom Sapphire Priority',      String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'}, --54
	--[[55]]  { Name = 'Cencom Sapphire Hi-Lo',        String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'}, --55
	--[[56]]  { Name = 'New SAHP EDWARD',       String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'}, --56
	--[[57]]  { Name = 'Old HP Horn',         String = 'OISS_SSA_VEHAUD_SAHP_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_SAHP_OLD_SOUNDSET'}, --57
	--[[58]]  { Name = 'Old HP Wail',         String = 'OISS_SSA_VEHAUD_SAHP_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_SAHP_OLD_SOUNDSET'}, --58
	--[[59]]  { Name = 'Old HP Yelp',          String = 'OISS_SSA_VEHAUD_SAHP_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_SAHP_OLD_SOUNDSET'}, --59
	--[[60]]  { Name = 'Old SAHP CHARLES',      String = 'OISS_SSA_VEHAUD_SAHP_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_SAHP_OLD_SOUNDSET'}, --60
	--[[61]]  { Name = 'Old SAHP DAVID',        String = 'OISS_SSA_VEHAUD_SAHP_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_SAHP_OLD_SOUNDSET'}, --61
	--[[62]]  { Name = 'Old SAHP EDWARD',       String = 'OISS_SSA_VEHAUD_SAHP_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_SAHP_OLD_SOUNDSET'}, --62
	--[[63]]  { Name = 'New HP Horn',        String = 'OISS_SSA_VEHAUD_SAHP_BIKE_HORN',            Ref = 'OISS_SSA_VEHAUD_SAHP_BIKE_SOUNDSET'}, --63
	--[[64]]  { Name = 'New HP Wail',        String = 'OISS_SSA_VEHAUD_SAHP_BIKE_SIREN_ADAM',      Ref = 'OISS_SSA_VEHAUD_SAHP_BIKE_SOUNDSET'}, --64
	--[[65]]  { Name = 'New HP Yelp',         String = 'OISS_SSA_VEHAUD_SAHP_BIKE_SIREN_BOY',       Ref = 'OISS_SSA_VEHAUD_SAHP_BIKE_SOUNDSET'}, --65
	--[[66]]  { Name = 'New HP Evacuate Tone',     String = 'OISS_SSA_VEHAUD_SAHP_BIKE_SIREN_CHARLES',   Ref = 'OISS_SSA_VEHAUD_SAHP_BIKE_SOUNDSET'}, --66
	--[[67]]  { Name = 'Bike SAHP DAVID',       String = 'OISS_SSA_VEHAUD_SAHP_BIKE_SIREN_DAVID',     Ref = 'OISS_SSA_VEHAUD_SAHP_BIKE_SOUNDSET'}, --67
	--[[68]]  { Name = 'Bike SAHP EDWARD',      String = 'OISS_SSA_VEHAUD_SAHP_BIKE_SIREN_EDWARD',    Ref = 'OISS_SSA_VEHAUD_SAHP_BIKE_SOUNDSET'}, --68
	--[[69]]  { Name = 'New NOOSE HORN',        String = 'OISS_SSA_VEHAUD_NOOSE_NEW_HORN',            Ref = 'OISS_SSA_VEHAUD_NOOSE_NEW_SOUNDSET'}, --69
	--[[70]]  { Name = 'New NOOSE ADAM',        String = 'OISS_SSA_VEHAUD_NOOSE_NEW_SIREN_ADAM',      Ref = 'OISS_SSA_VEHAUD_NOOSE_NEW_SOUNDSET'}, --70
	--[[71]]  { Name = 'New NOOSE BOY',         String = 'OISS_SSA_VEHAUD_NOOSE_NEW_SIREN_BOY',       Ref = 'OISS_SSA_VEHAUD_NOOSE_NEW_SOUNDSET'}, --71
	--[[72]]  { Name = 'New NOOSE CHARLES',     String = 'OISS_SSA_VEHAUD_NOOSE_NEW_SIREN_CHARLES',   Ref = 'OISS_SSA_VEHAUD_NOOSE_NEW_SOUNDSET'}, --72
	--[[73]]  { Name = 'New NOOSE DAVID',       String = 'OISS_SSA_VEHAUD_NOOSE_NEW_SIREN_DAVID',     Ref = 'OISS_SSA_VEHAUD_NOOSE_NEW_SOUNDSET'}, --73
	--[[74]]  { Name = 'New NOOSE EDWARD',      String = 'OISS_SSA_VEHAUD_NOOSE_NEW_SIREN_EDWARD',    Ref = 'OISS_SSA_VEHAUD_NOOSE_NEW_SOUNDSET'}, --74
	--[[75]]  { Name = 'Old NOOSE HORN',        String = 'OISS_SSA_VEHAUD_NOOSE_OLD_HORN',            Ref = 'OISS_SSA_VEHAUD_NOOSE_OLD_SOUNDSET'}, --75
	--[[76]]  { Name = 'Old NOOSE ADAM',        String = 'OISS_SSA_VEHAUD_NOOSE_OLD_SIREN_ADAM',      Ref = 'OISS_SSA_VEHAUD_NOOSE_OLD_SOUNDSET'}, --76
	--[[77]]  { Name = 'Old NOOSE BOY',         String = 'OISS_SSA_VEHAUD_NOOSE_OLD_SIREN_BOY',       Ref = 'OISS_SSA_VEHAUD_NOOSE_OLD_SOUNDSET'}, --77
	--[[78]]  { Name = 'Old NOOSE CHARLES',     String = 'OISS_SSA_VEHAUD_NOOSE_OLD_SIREN_CHARLES',   Ref = 'OISS_SSA_VEHAUD_NOOSE_OLD_SOUNDSET'}, --78
	--[[79]]  { Name = 'Old NOOSE DAVID',       String = 'OISS_SSA_VEHAUD_NOOSE_OLD_SIREN_DAVID',     Ref = 'OISS_SSA_VEHAUD_NOOSE_OLD_SOUNDSET'}, --79
	--[[80]]  { Name = 'Old NOOSE EDWARD',      String = 'OISS_SSA_VEHAUD_NOOSE_OLD_SIREN_EDWARD',    Ref = 'OISS_SSA_VEHAUD_NOOSE_OLD_SOUNDSET'}, --80
	--[[81]]  { Name = 'Federal Signal Smart Horn',          String = 'OISS_SSA_VEHAUD_FIB_NEW_HORN',              Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},  --81
	--[[82]]  { Name = 'Federal Signal Smart Wail',          String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_ADAM',        Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},  --82
	--[[83]]  { Name = 'Federal Signal Smart Yelp',           String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_BOY',         Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},  --83
	--[[84]]  { Name = 'Federal Signal Smart Priority',       String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_CHARLES',     Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},  --84
	--[[85]]  { Name = 'Federal Signal Smart Hi-Lo',         String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_DAVID',       Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},  --85
	--[[86]]  { Name = 'New FIB EDWARD',        String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_EDWARD',      Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},  --86
	--[[87]]  { Name = 'Old FIB HORN',          String = 'OISS_SSA_VEHAUD_FIB_OLD_HORN',              Ref = 'OISS_SSA_VEHAUD_FIB_OLD_SOUNDSET'},  --87
	--[[88]]  { Name = 'Old FIB ADAM',          String = 'OISS_SSA_VEHAUD_FIB_OLD_SIREN_ADAM',        Ref = 'OISS_SSA_VEHAUD_FIB_OLD_SOUNDSET'},  --88
	--[[89]]  { Name = 'Old FIB BOY',           String = 'OISS_SSA_VEHAUD_FIB_OLD_SIREN_BOY',         Ref = 'OISS_SSA_VEHAUD_FIB_OLD_SOUNDSET'},  --89
	--[[90]]  { Name = 'Old FIB CHARLES',       String = 'OISS_SSA_VEHAUD_FIB_OLD_SIREN_CHARLES',     Ref = 'OISS_SSA_VEHAUD_FIB_OLD_SOUNDSET'},  --90
	--[[91]]  { Name = 'Old FIB DAVID',         String = 'OISS_SSA_VEHAUD_FIB_OLD_SIREN_DAVID',       Ref = 'OISS_SSA_VEHAUD_FIB_OLD_SOUNDSET'},  --91
	--[[92]]  { Name = 'Old FIB EDWARD',        String = 'OISS_SSA_VEHAUD_FIB_OLD_SIREN_EDWARD',      Ref = 'OISS_SSA_VEHAUD_FIB_OLD_SOUNDSET'},  --92
	--[[93]]  { Name = 'New RHPD HORN',         String = 'OISS_SSA_VEHAUD_RHPD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_RHPD_NEW_SOUNDSET'}, --93
	--[[94]]  { Name = 'New RHPD ADAM',         String = 'OISS_SSA_VEHAUD_RHPD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_RHPD_NEW_SOUNDSET'}, --94
	--[[95]]  { Name = 'New RHPD BOY',          String = 'OISS_SSA_VEHAUD_RHPD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_RHPD_NEW_SOUNDSET'}, --95
	--[[96]]  { Name = 'New RHPD CHARLES',      String = 'OISS_SSA_VEHAUD_RHPD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_RHPD_NEW_SOUNDSET'}, --96
	--[[97]]  { Name = 'New RHPD DAVID',        String = 'OISS_SSA_VEHAUD_RHPD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_RHPD_NEW_SOUNDSET'}, --97
	--[[98]]  { Name = 'New RHPD EDWARD',       String = 'OISS_SSA_VEHAUD_RHPD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_RHPD_NEW_SOUNDSET'}, --98
	--[[99]]  { Name = 'Old RHPD HORN',         String = 'OISS_SSA_VEHAUD_RHPD_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_RHPD_OLD_SOUNDSET'}, --99
	--[[100]]  { Name = 'Old RHPD ADAM',        String = 'OISS_SSA_VEHAUD_RHPD_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_RHPD_OLD_SOUNDSET'}, --100
	--[[101]]  { Name = 'Old RHPD BOY',         String = 'OISS_SSA_VEHAUD_RHPD_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_RHPD_OLD_SOUNDSET'}, --101
	--[[102]]  { Name = 'Old RHPD CHARLES',     String = 'OISS_SSA_VEHAUD_RHPD_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_RHPD_OLD_SOUNDSET'}, --102
	--[[103]]  { Name = 'Old RHPD DAVID',       String = 'OISS_SSA_VEHAUD_RHPD_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_RHPD_OLD_SOUNDSET'}, --103
	--[[104]]  { Name = 'Old RHPD EDWARD',      String = 'OISS_SSA_VEHAUD_RHPD_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_RHPD_OLD_SOUNDSET'}, --104
	--[[105]]  { Name = 'New DPPD HORN',        String = 'OISS_SSA_VEHAUD_DPPD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_DPPD_NEW_SOUNDSET'}, --105
	--[[106]]  { Name = 'New DPPD ADAM',        String = 'OISS_SSA_VEHAUD_DPPD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_DPPD_NEW_SOUNDSET'}, --106
	--[[107]]  { Name = 'New DPPD BOY',         String = 'OISS_SSA_VEHAUD_DPPD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_DPPD_NEW_SOUNDSET'}, --107
	--[[108]]  { Name = 'New DPPD CHARLES',     String = 'OISS_SSA_VEHAUD_DPPD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_DPPD_NEW_SOUNDSET'}, --108
	--[[109]]  { Name = 'New DPPD DAVID',       String = 'OISS_SSA_VEHAUD_DPPD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_DPPD_NEW_SOUNDSET'}, --109
	--[[110]]  { Name = 'New DPPD EDWARD',      String = 'OISS_SSA_VEHAUD_DPPD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_DPPD_NEW_SOUNDSET'}, --110
	--[[111]]  { Name = 'Old DPPD HORN',        String = 'OISS_SSA_VEHAUD_DPPD_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_DPPD_OLD_SOUNDSET'}, --111
	--[[112]]  { Name = 'Old DPPD ADAM',        String = 'OISS_SSA_VEHAUD_DPPD_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_DPPD_OLD_SOUNDSET'}, --112
	--[[113]]  { Name = 'Old DPPD BOY',         String = 'OISS_SSA_VEHAUD_DPPD_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_DPPD_OLD_SOUNDSET'}, --113
	--[[114]]  { Name = 'Old DPPD CHARLES',     String = 'OISS_SSA_VEHAUD_DPPD_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_DPPD_OLD_SOUNDSET'}, --114
	--[[115]]  { Name = 'Old DPPD DAVID',       String = 'OISS_SSA_VEHAUD_DPPD_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_DPPD_OLD_SOUNDSET'}, --115
	--[[116]]  { Name = 'Old DPPD EDWARD',      String = 'OISS_SSA_VEHAUD_DPPD_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_DPPD_OLD_SOUNDSET'}, --116
	--[[117]]  { Name = 'New LSIA HORN',        String = 'OISS_SSA_VEHAUD_LSIA_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_LSIA_NEW_SOUNDSET'}, --117
	--[[118]]  { Name = 'New LSIA ADAM',        String = 'OISS_SSA_VEHAUD_LSIA_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSIA_NEW_SOUNDSET'}, --118
	--[[119]]  { Name = 'New LSIA BOY',         String = 'OISS_SSA_VEHAUD_LSIA_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSIA_NEW_SOUNDSET'}, --119
	--[[120]]  { Name = 'New LSIA CHARLES',     String = 'OISS_SSA_VEHAUD_LSIA_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSIA_NEW_SOUNDSET'}, --120
	--[[121]]  { Name = 'New LSIA DAVID',       String = 'OISS_SSA_VEHAUD_LSIA_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSIA_NEW_SOUNDSET'}, --121
	--[[122]]  { Name = 'New LSIA EDWARD',      String = 'OISS_SSA_VEHAUD_LSIA_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSIA_NEW_SOUNDSET'}, --122
	--[[123]]  { Name = 'Old LSIA HORN',        String = 'OISS_SSA_VEHAUD_LSIA_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_LSIA_OLD_SOUNDSET'}, --123
	--[[124]]  { Name = 'Old LSIA ADAM',        String = 'OISS_SSA_VEHAUD_LSIA_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSIA_OLD_SOUNDSET'}, --124
	--[[125]]  { Name = 'Old LSIA BOY',         String = 'OISS_SSA_VEHAUD_LSIA_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSIA_OLD_SOUNDSET'}, --125
	--[[126]]  { Name = 'Old LSIA CHARLES',     String = 'OISS_SSA_VEHAUD_LSIA_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSIA_OLD_SOUNDSET'}, --126
	--[[127]]  { Name = 'Old LSIA DAVID',       String = 'OISS_SSA_VEHAUD_LSIA_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSIA_OLD_SOUNDSET'}, --127
	--[[128]]  { Name = 'Old LSIA EDWARD',      String = 'OISS_SSA_VEHAUD_LSIA_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSIA_OLD_SOUNDSET'}, --128
	--[[129]]  { Name = 'New LSPP HORN',        String = 'OISS_SSA_VEHAUD_LSPP_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_LSPP_NEW_SOUNDSET'}, --129
	--[[130]]  { Name = 'New LSPP ADAM',        String = 'OISS_SSA_VEHAUD_LSPP_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSPP_NEW_SOUNDSET'}, --130
	--[[131]]  { Name = 'New LSPP BOY',         String = 'OISS_SSA_VEHAUD_LSPP_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSPP_NEW_SOUNDSET'}, --131
	--[[132]]  { Name = 'New LSPP CHARLES',     String = 'OISS_SSA_VEHAUD_LSPP_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSPP_NEW_SOUNDSET'}, --132
	--[[133]]  { Name = 'New LSPP DAVID',       String = 'OISS_SSA_VEHAUD_LSPP_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSPP_NEW_SOUNDSET'}, --133
	--[[134]]  { Name = 'New LSPP EDWARD',      String = 'OISS_SSA_VEHAUD_LSPP_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSPP_NEW_SOUNDSET'}, --134
	--[[135]]  { Name = 'Old LSPP HORN',        String = 'OISS_SSA_VEHAUD_LSPP_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_LSPP_OLD_SOUNDSET'}, --135
	--[[136]]  { Name = 'Old LSPP ADAM',        String = 'OISS_SSA_VEHAUD_LSPP_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSPP_OLD_SOUNDSET'}, --136
	--[[137]]  { Name = 'Old LSPP BOY',         String = 'OISS_SSA_VEHAUD_LSPP_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSPP_OLD_SOUNDSET'}, --137
	--[[138]]  { Name = 'Old LSPP CHARLES',     String = 'OISS_SSA_VEHAUD_LSPP_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSPP_OLD_SOUNDSET'}, --138
	--[[139]]  { Name = 'Old LSPP DAVID',       String = 'OISS_SSA_VEHAUD_LSPP_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSPP_OLD_SOUNDSET'}, --139
	--[[140]]  { Name = 'Old LSPP EDWARD',      String = 'OISS_SSA_VEHAUD_LSPP_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSPP_OLD_SOUNDSET'}, --140
	--[[141]]  { Name = 'Air Horn',        String = 'OISS_SSA_VEHAUD_LSFD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'}, --141
	--[[142]]  { Name = 'Wail',        String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'}, --142
	--[[143]]  { Name = 'Siren 1',         String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'}, --143
	--[[144]]  { Name = 'Siren 2',     String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'}, --144
	--[[145]]  { Name = 'Powercall',       String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'}, --145
	--[[146]]  { Name = 'New LSFD EDWARD',      String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'}, --146
	--[[147]]  { Name = 'Old LSFD HORN',        String = 'OISS_SSA_VEHAUD_LSFD_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_LSFD_OLD_SOUNDSET'}, --147
	--[[148]]  { Name = 'Old LSFD ADAM',        String = 'OISS_SSA_VEHAUD_LSFD_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSFD_OLD_SOUNDSET'}, --148
	--[[149]]  { Name = 'Old LSFD BOY',         String = 'OISS_SSA_VEHAUD_LSFD_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSFD_OLD_SOUNDSET'}, --149
	--[[150]]  { Name = 'Old LSFD CHARLES',     String = 'OISS_SSA_VEHAUD_LSFD_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSFD_OLD_SOUNDSET'}, --150
	--[[151]]  { Name = 'Old LSFD DAVID',       String = 'OISS_SSA_VEHAUD_LSFD_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSFD_OLD_SOUNDSET'}, --151
	--[[152]]  { Name = 'Old LSFD EDWARD',      String = 'OISS_SSA_VEHAUD_LSFD_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSFD_OLD_SOUNDSET'}, --152
	--[[153]]  { Name = 'New LSCOFD HORN',      String = 'OISS_SSA_VEHAUD_LSCOFD_NEW_HORN',           Ref = 'OISS_SSA_VEHAUD_LSCOFD_NEW_SOUNDSET'}, --153
	--[[154]]  { Name = 'New LSCOFD ADAM',      String = 'OISS_SSA_VEHAUD_LSCOFD_NEW_SIREN_ADAM',     Ref = 'OISS_SSA_VEHAUD_LSCOFD_NEW_SOUNDSET'}, --154
	--[[155]]  { Name = 'New LSCOFD BOY',       String = 'OISS_SSA_VEHAUD_LSCOFD_NEW_SIREN_BOY',      Ref = 'OISS_SSA_VEHAUD_LSCOFD_NEW_SOUNDSET'}, --155
	--[[156]]  { Name = 'New LSCOFD CHARLES',   String = 'OISS_SSA_VEHAUD_LSCOFD_NEW_SIREN_CHARLES',  Ref = 'OISS_SSA_VEHAUD_LSCOFD_NEW_SOUNDSET'}, --156
	--[[157]]  { Name = 'New LSCOFD DAVID',     String = 'OISS_SSA_VEHAUD_LSCOFD_NEW_SIREN_DAVID',    Ref = 'OISS_SSA_VEHAUD_LSCOFD_NEW_SOUNDSET'}, --157
	--[[158]]  { Name = 'New LSCOFD EDWARD',    String = 'OISS_SSA_VEHAUD_LSCOFD_NEW_SIREN_EDWARD',   Ref = 'OISS_SSA_VEHAUD_LSCOFD_NEW_SOUNDSET'}, --158
	--[[159]]  { Name = 'Old LSCOFD HORN',      String = 'OISS_SSA_VEHAUD_LSCOFD_OLD_HORN',           Ref = 'OISS_SSA_VEHAUD_LSCOFD_OLD_SOUNDSET'}, --159
	--[[160]]  { Name = 'Old LSCOFD ADAM',      String = 'OISS_SSA_VEHAUD_LSCOFD_OLD_SIREN_ADAM',     Ref = 'OISS_SSA_VEHAUD_LSCOFD_OLD_SOUNDSET'}, --160
	--[[161]]  { Name = 'Old LSCOFD BOY',       String = 'OISS_SSA_VEHAUD_LSCOFD_OLD_SIREN_BOY',      Ref = 'OISS_SSA_VEHAUD_LSCOFD_OLD_SOUNDSET'}, --161
	--[[162]]  { Name = 'Old LSCOFD CHARLES',   String = 'OISS_SSA_VEHAUD_LSCOFD_OLD_SIREN_CHARLES',  Ref = 'OISS_SSA_VEHAUD_LSCOFD_OLD_SOUNDSET'}, --162
	--[[163]]  { Name = 'Old LSCOFD DAVID',     String = 'OISS_SSA_VEHAUD_LSCOFD_OLD_SIREN_DAVID',    Ref = 'OISS_SSA_VEHAUD_LSCOFD_OLD_SOUNDSET'}, --163
	--[[164]]  { Name = 'Old LSCOFD EDWARD',    String = 'OISS_SSA_VEHAUD_LSCOFD_OLD_SIREN_EDWARD',   Ref = 'OISS_SSA_VEHAUD_LSCOFD_OLD_SOUNDSET'}, --164
	--[[165]]  { Name = 'New BCFD HORN',        String = 'OISS_SSA_VEHAUD_BCFD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_BCFD_NEW_SOUNDSET'}, --165
	--[[166]]  { Name = 'New BCFD ADAM',        String = 'OISS_SSA_VEHAUD_BCFD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_BCFD_NEW_SOUNDSET'}, --166
	--[[167]]  { Name = 'New BCFD BOY',         String = 'OISS_SSA_VEHAUD_BCFD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_BCFD_NEW_SOUNDSET'}, --167
	--[[168]]  { Name = 'New BCFD CHARLES',     String = 'OISS_SSA_VEHAUD_BCFD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_BCFD_NEW_SOUNDSET'}, --168
	--[[169]]  { Name = 'New BCFD DAVID',       String = 'OISS_SSA_VEHAUD_BCFD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_BCFD_NEW_SOUNDSET'}, --169
	--[[170]]  { Name = 'New BCFD EDWARD',      String = 'OISS_SSA_VEHAUD_BCFD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_BCFD_NEW_SOUNDSET'}, --170
	--[[171]]  { Name = 'Old BCFD HORN',        String = 'OISS_SSA_VEHAUD_BCFD_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET'}, --171
	--[[172]]  { Name = 'Old BCFD ADAM',        String = 'OISS_SSA_VEHAUD_BCFD_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET'}, --172
	--[[173]]  { Name = 'Old BCFD BOY',         String = 'OISS_SSA_VEHAUD_BCFD_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET'}, --173
	--[[174]]  { Name = 'Old BCFD CHARLES',     String = 'OISS_SSA_VEHAUD_BCFD_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET'}, --174
	--[[175]]  { Name = 'Old BCFD DAVID',       String = 'OISS_SSA_VEHAUD_BCFD_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET'}, --175
	--[[176]]  { Name = 'Old BCFD EDWARD',      String = 'OISS_SSA_VEHAUD_BCFD_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_BCFD_OLD_SOUNDSET'}, --176
	--[[177]]  { Name = 'Air Horn',     String = 'OISS_SSA_VEHAUD_SANFIRE_NEW_HORN',          Ref = 'OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET'}, --177
	--[[178]]  { Name = 'Wail',     String = 'OISS_SSA_VEHAUD_SANFIRE_NEW_SIREN_ADAM',    Ref = 'OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET'}, --178
	--[[179]]  { Name = 'Yelp',      String = 'OISS_SSA_VEHAUD_SANFIRE_NEW_SIREN_BOY',     Ref = 'OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET'}, --179
	--[[180]]  { Name = 'Hi-Lo',  String = 'OISS_SSA_VEHAUD_SANFIRE_NEW_SIREN_CHARLES', Ref = 'OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET'}, --180
	--[[181]]  { Name = 'New SanFire DAVID',    String = 'OISS_SSA_VEHAUD_SANFIRE_NEW_SIREN_DAVID',   Ref = 'OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET'}, --181
	--[[182]]  { Name = 'New SanFire EDWARD',   String = 'OISS_SSA_VEHAUD_SANFIRE_NEW_SIREN_EDWARD',  Ref = 'OISS_SSA_VEHAUD_SANFIRE_NEW_SOUNDSET'}, --182
	--[[183]]  { Name = 'Old SanFire HORN',     String = 'OISS_SSA_VEHAUD_SANFIRE_OLD_HORN',          Ref = 'OISS_SSA_VEHAUD_SANFIRE_OLD_SOUNDSET'}, --183
	--[[184]]  { Name = 'Old SanFire ADAM',     String = 'OISS_SSA_VEHAUD_SANFIRE_OLD_SIREN_ADAM',    Ref = 'OISS_SSA_VEHAUD_SANFIRE_OLD_SOUNDSET'}, --184
	--[[185]]  { Name = 'Old SanFire BOY',      String = 'OISS_SSA_VEHAUD_SANFIRE_OLD_SIREN_BOY',     Ref = 'OISS_SSA_VEHAUD_SANFIRE_OLD_SOUNDSET'}, --185
	--[[186]]  { Name = 'Old SanFire CHARLES',  String = 'OISS_SSA_VEHAUD_SANFIRE_OLD_SIREN_CHARLES', Ref = 'OISS_SSA_VEHAUD_SANFIRE_OLD_SOUNDSET'}, --186
	--[[187]]  { Name = 'Old SanFire DAVID',    String = 'OISS_SSA_VEHAUD_SANFIRE_OLD_SIREN_DAVID',   Ref = 'OISS_SSA_VEHAUD_SANFIRE_OLD_SOUNDSET'}, --187
	--[[188]]  { Name = 'Old SanFire EDWARD',   String = 'OISS_SSA_VEHAUD_SANFIRE_OLD_SIREN_EDWARD',  Ref = 'OISS_SSA_VEHAUD_SANFIRE_OLD_SOUNDSET'}, --188
	--[[189]]  { Name = 'New SAMS HORN',        String = 'OISS_SSA_VEHAUD_SAMS_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_SAMS_NEW_SOUNDSET'}, --189
	--[[190]]  { Name = 'New SAMS ADAM',        String = 'OISS_SSA_VEHAUD_SAMS_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_SAMS_NEW_SOUNDSET'}, --190
	--[[191]]  { Name = 'New SAMS BOY',         String = 'OISS_SSA_VEHAUD_SAMS_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_SAMS_NEW_SOUNDSET'}, --191
	--[[192]]  { Name = 'New SAMS CHARLES',     String = 'OISS_SSA_VEHAUD_SAMS_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_SAMS_NEW_SOUNDSET'}, --192
	--[[193]]  { Name = 'New SAMS DAVID',       String = 'OISS_SSA_VEHAUD_SAMS_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_SAMS_NEW_SOUNDSET'}, --193
	--[[194]]  { Name = 'New SAMS EDWARD',      String = 'OISS_SSA_VEHAUD_SAMS_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_SAMS_NEW_SOUNDSET'}, --194
	--[[195]]  { Name = 'Old SAMS HORN',        String = 'OISS_SSA_VEHAUD_SAMS_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_SAMS_OLD_SOUNDSET'}, --195
	--[[196]]  { Name = 'Old SAMS ADAM',        String = 'OISS_SSA_VEHAUD_SAMS_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_SAMS_OLD_SOUNDSET'}, --196
	--[[197]]  { Name = 'Old SAMS BOY',         String = 'OISS_SSA_VEHAUD_SAMS_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_SAMS_OLD_SOUNDSET'}, --197
	--[[198]]  { Name = 'Old SAMS CHARLES',     String = 'OISS_SSA_VEHAUD_SAMS_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_SAMS_OLD_SOUNDSET'}, --198
	--[[199]]  { Name = 'Old SAMS DAVID',       String = 'OISS_SSA_VEHAUD_SAMS_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_SAMS_OLD_SOUNDSET'}, --199
	--[[200]]  { Name = 'Old SAMS EDWARD',      String = 'OISS_SSA_VEHAUD_SAMS_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_SAMS_OLD_SOUNDSET'}, --200
	--[[201]]  { Name = 'USFS HORN',            String = 'OISS_SSA_VEHAUD_USFS_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_USFS_NEW_SOUNDSET'}, --201
	--[[202]]  { Name = 'USFS ADAM',            String = 'OISS_SSA_VEHAUD_USFS_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_USFS_NEW_SOUNDSET'}, --202
	--[[203]]  { Name = 'USFS BOY',             String = 'OISS_SSA_VEHAUD_USFS_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_USFS_NEW_SOUNDSET'}, --203
	--[[204]]  { Name = 'USFS CHARLES',         String = 'OISS_SSA_VEHAUD_USFS_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_USFS_NEW_SOUNDSET'}, --204
	--[[205]]  { Name = 'USFS DAVID',           String = 'OISS_SSA_VEHAUD_USFS_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_USFS_NEW_SOUNDSET'}, --205
	--[[206]]  { Name = 'USFS EDWARD',          String = 'OISS_SSA_VEHAUD_USFS_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_USFS_NEW_SOUNDSET'}, --206
	--[[207]]  { Name = 'USFS HORN',            String = 'OISS_SSA_VEHAUD_USFS_OLD_HORN',             Ref = 'OISS_SSA_VEHAUD_USFS_OLD_SOUNDSET'}, --207
	--[[208]]  { Name = 'USFS ADAM',            String = 'OISS_SSA_VEHAUD_USFS_OLD_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_USFS_OLD_SOUNDSET'}, --208
	--[[209]]  { Name = 'USFS BOY',             String = 'OISS_SSA_VEHAUD_USFS_OLD_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_USFS_OLD_SOUNDSET'}, --209
	--[[210]]  { Name = 'USFS CHARLES',         String = 'OISS_SSA_VEHAUD_USFS_OLD_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_USFS_OLD_SOUNDSET'}, --210
	--[[211]]  { Name = 'USFS DAVID',           String = 'OISS_SSA_VEHAUD_USFS_OLD_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_USFS_OLD_SOUNDSET'}, --211
	--[[212]]  { Name = 'USFS EDWARD',          String = 'OISS_SSA_VEHAUD_USFS_OLD_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_USFS_OLD_SOUNDSET'}, --212
	--[[213]]  { Name = 'Misc. ADAM',           String = 'OISS_SSA_VEHAUD_ETC_ADAM',                  Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --213
	--[[214]]  { Name = 'Misc. BOY',            String = 'OISS_SSA_VEHAUD_ETC_BOY',                   Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --214
	--[[215]]  { Name = 'Misc. CHARLES',        String = 'OISS_SSA_VEHAUD_ETC_CHARLES',               Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --215
	--[[216]]  { Name = 'Misc. DAVID',          String = 'OISS_SSA_VEHAUD_ETC_DAVID',                 Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --216
	--[[217]]  { Name = 'Misc. EDWARD',         String = 'OISS_SSA_VEHAUD_ETC_EDWARD',                Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --217
	--[[218]]  { Name = 'Misc. FRANK',          String = 'OISS_SSA_VEHAUD_ETC_FRANK',                 Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --218
	--[[219]]  { Name = 'Misc. GEORGE',         String = 'OISS_SSA_VEHAUD_ETC_GEORGE',                Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --219
	--[[220]]  { Name = 'Misc. HENRY',          String = 'OISS_SSA_VEHAUD_ETC_HENRY',                 Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --220
	--[[221]]  { Name = 'Misc. IDA',            String = 'OISS_SSA_VEHAUD_ETC_IDA',                   Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --221
	--[[222]]  { Name = 'Misc. JOHN',           String = 'OISS_SSA_VEHAUD_ETC_JOHN',                  Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --222
	--[[223]]  { Name = 'Misc. KING',           String = 'OISS_SSA_VEHAUD_ETC_KING',                  Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --223
	--[[224]]  { Name = 'Misc. LINCOLN',        String = 'OISS_SSA_VEHAUD_ETC_LINCOLN',               Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --224
	--[[225]]  { Name = 'Misc. MARY',           String = 'OISS_SSA_VEHAUD_ETC_MARY',                  Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --225
	--[[226]]  { Name = 'Misc. NANCY',          String = 'OISS_SSA_VEHAUD_ETC_NANCY',                 Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --226
	--[[227]]  { Name = 'Misc. OCEAN',          String = 'OISS_SSA_VEHAUD_ETC_OCEAN',                 Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --227
	--[[228]]  { Name = 'Misc. PAUL',           String = 'OISS_SSA_VEHAUD_ETC_PAUL',                  Ref = 'OISS_SSA_VEHAUD_ETC_SOUNDSET'}, --228
}

--ASSIGN SIRENS TO VEHICLES
SIREN_ASSIGNMENTS = {
	--['<gameName>'] = {tones},
	['DEFAULT'] = { 1, 2, 3, 4 },
	['FIRETRUK'] = { 12, 13, 14, 11 },
	['AMBULAN'] = { 1, 2, 3, 4, 11 },
	['LGUARD'] = { 1, 2, 3, 4, 11 },
	['STATE'] = { 51, 52, 53, 54, 55},
	['SHERIFF'] = { 40, 41, 42, 43, 44 },
	['POLICE'] = { 15, 16, 17, 18, 19, 20 },
	['FIRE'] = { 141, 142, 143, 145 },
	['LAPD'] = { 27, 28, 29, 18 },
	['LASD'] = { 27, 28, 29, 18},
	['LAFD'] = { 177, 178, 179, 180 },
	['LAFD2'] = { 51, 142, 178, 179, 180 },
	['CHPNEW'] = { 63, 64, 65, 66 },
	['CHPOLD'] = { 57, 58, 59, 66 },
	['SEU'] = { 27, 28, 29, 18, 58, 59, 66 },
	['JDC'] = { 27, 28, 29, 18, 58, 59, 66 },
	['SECURITY'] = { 51, 64, 65, 18, 19 },
	['gwf450'] = { 51, 52, 53, 54, 55},
	['dhsf450'] = { 51, 52, 53, 54, 55},
	-- CHP
	['CHP18D'] = { 63, 64, 65, 66 },
	['chp20fpiu'] = { 63, 64, 65, 66 },
	['chp16fpiu'] = { 57, 58, 59, 66 },
	-- ['safr_engine13'] = { 51, 142, 178, 179, 180 },

	-- LAFD----------

	-- RA
	['20ramambo'] = { 177, 178, 179, 180 },
    -- ENG
    ['deanfleetengine4'] = { 51, 142, 178, 179, 180 },
    --USAR
    ['seawalkin'] = { 51, 142, 178, 179, 180 },
    ['vrescuewi'] = { 51, 142, 178, 179, 180 },
	-- SW
	['Squadcc'] = { 177, 178, 179, 180 },
	['Squad1'] = { 177, 178, 179, 180 },
    -- FR
	['lacofd16squad'] = { 177, 178, 179, 180 },

	-- LAPD
	['lapd5b'] = { 27, 28, 29, 18 },
	['83727'] = { 27, 28, 29, 18 },
	['84361'] = { 27, 28, 29, 18 },
	['85734'] = { 27, 28, 29, 18 },
	['86385'] = { 27, 28, 29, 18 },
	['86399'] = { 27, 28, 29, 18 },
	['86486'] = { 27, 28, 29, 18 },
	['87136'] = { 27, 28, 29, 18 },
	['hybridfpis'] = { 27, 28, 29, 18 },	
	['lapdfpis'] = { 27, 28, 29, 18 },
	['lapdfpis2'] = { 27, 28, 29, 18 },	

	-- LASD
	['lasd11'] = { 27, 28, 29, 18},
}
