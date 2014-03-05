StartupLoader default executeAtomicItems: {
StartupAction
	name: 'Fonts setup'
	code: [
	FreeTypeSystemSettings loadFt2Library: true.
	FreeTypeFontProvider current updateFromSystem.
	 
	StandardFonts
	codeFont: (LogicalFont familyName: 'Inconsolata' pointSize: 12) ]
	runOnce: true
}
