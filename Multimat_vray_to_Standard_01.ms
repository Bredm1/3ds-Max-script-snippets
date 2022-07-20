try(DestroyDialog VRAY_TO_STANDARD_CONVERTER)catch()


-- /// GUI CREATION \\\
rollout VRAY_TO_STANDARD_CONVERTER "Vray To Standard" width:252 height:90
(
	
	groupBox CONVERTER_GUI_GBOX "Convert to Standard:" width:120 height:80 pos:[1,2]
	
	spinner MATERIAL_NUMBER_CONV "Material Slot:" range:[1,24,1] type:#integer pos:[6,20] fieldwidth: 35
	
	spinner BUMP_AMOUNT_CONV "BUMP:" range:[1,500,30] type:#integer pos:[23,45] fieldwidth: 35
	
	
	
	groupBox USER_BUMP_GUI_GBOX "Set Bump:" width:120 height:80 pos:[131,2]
	
	spinner MATERIAL_NUMBER_BUMP "Material Slot:" range:[1,24,1] type:#integer pos:[136,20] fieldwidth: 35
	
	spinner BUMP_AMOUNT "BUMP:" range:[1,500,30] type:#integer pos:[153,45] fieldwidth: 35
	

	fn MULTIMAT_VRAY_TO_STAND mat_num precent= (
		-- // INPUT VARIABLE EXPLANATION \\ --
		-- !mat_num! = number of the target slot by the mat browser //////   !precent! = the wanted selfilum value --
		mat_ID = meditMaterials[mat_num] -- put the selected multimat in a variable
			
		sub_mat_num = mat_ID.count -- get te number of contained material inside the multimaterial
			
		for i in 1 to sub_mat_num do (
			
				
			copy_diff_map = meditMaterials[mat_num].materialList[i].texmap_diffuse
				
			meditMaterials[mat_num].materialList[i] = Standardmaterial ()
				
			meditMaterials[mat_num].materialList[i].diffuseMap = copy_diff_map
				
			meditMaterials[mat_num].materialList[i].bumpMap = copy_diff_map
				
			meditMaterials[mat_num].materialList[i].bumpMapAmount = precent
			
		)
	)

	fn MULTIMAT_BUMP mat_num precent = (
		-- // INPUT VARIABLE EXPLANATION \\ --
		-- !mat_num! = number of the target slot by the mat browser //////   !precent! = the wanted selfilum value --
		mat_ID = meditMaterials[mat_num] -- put the selected multimat in a variable
			
		sub_mat_num = mat_ID.count -- get te number of contained material inside the multimaterial
			
		for i in 1 to sub_mat_num do (
				
			meditMaterials[mat_num].materialList[i].bumpMapAmount = precent
			-- sets the selfilum in all contained material
		)
	)
	
	on BUMP_AMOUNT_CONV changed spinVal do
	(
		MULTIMAT_VRAY_TO_STAND MATERIAL_NUMBER_CONV.value spinVal
	)
	
	on BUMP_AMOUNT changed spinVal do
	(
		MULTIMAT_BUMP MATERIAL_NUMBER_BUMP.value spinVal
	)
	
)

createDialog VRAY_TO_STANDARD_CONVERTER

