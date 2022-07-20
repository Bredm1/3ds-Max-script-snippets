fn MULTIMAT_DIFF mat_num precent = (
	-- // INPUT VARIABLE EXPLANATION \\ --
	-- !mat_num! = number of the target slot by the mat browser //////   !precent! = the wanted selfilum value --
	mat_ID = meditMaterials[mat_num] -- put the selected multimat in a variable
		
	sub_mat_num = mat_ID.count -- get te number of contained material inside the multimaterial
		
	for i in 1 to sub_mat_num do (
			
		meditMaterials[mat_num].materialList[i].texmap_diffuse_multiplier = precent
		-- sets the selfilum in all contained material
	)
)

fn SINGLEMAT_DIFF mat_num precent = (
		
	-- // INPUT VARIABLE EXPLANATION \\ --
	-- !mat_num! = number of the target slot by the mat browser //////   !precent! = the wanted selfilum value --
		
	mat_ID = meditMaterials[mat_num] -- put the selected multimat in a variable
			
	meditMaterials[mat_num].texmap_diffuse_multiplier = precent
	-- sets the selfilum in all contained material
)


fn DO_IN_ALL_MAT prec =(
	
	for i in 1 to 24 do (
		
		try(SINGLEMAT_DIFF i prec) catch()
		
		try(MULTIMAT_DIFF i prec) catch()
		
		
	)
	
	print "All setted"
	
)

DO_IN_ALL_MAT 100