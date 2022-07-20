-- Deactivates the seleced modifiers

fn _MODOFF_ =(
	for i in selection do (
		if superClassOf i == GeometryClass then(
			print i
			try i.modifiers[#Morpher].Autoload_of_targets = 0 catch()
			
			try i.modifiers[#Shell].enabled = false catch()
			
			try i.modifiers[#TurboSmooth].enabled = false catch()
		)
	)
)


fn _MODON_ =(
	for i in selection do (
		if superClassOf i == GeometryClass then(
			print i
			try i.modifiers[#Morpher].Autoload_of_targets = 1 catch()
			
			try i.modifiers[#Shell].enabled = true catch()
			
			try i.modifiers[#TurboSmooth].enabled = true catch()
		)
	)
)



try(DestroyDialog Scene_Turbo)catch()

rollout Scene_Turbo "Off Modi"(
	
	button MOD_OFF "Mod Off"
	button MOD_ON "Mod On"
	
	on MOD_OFF pressed do(
		_MODOFF_()
	)
	
	on MOD_ON pressed do(
		_MODON_()
	)
	
)

createDialog Scene_Turbo 120 60
