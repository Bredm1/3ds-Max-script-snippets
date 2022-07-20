select $*
for i in (selection as array) do
	(
		LayerManager.newLayerFromName i.layer.name
		st=LayerManager.getLayerFromName i.layer.name
		st.addnode i
	)
