StartupLoader default executeAtomicItems: {
	StartupAction
	name: 'Installing DFlow with auto-export enabled'
	code: [
		Gofer new
		smalltalkhubUser: 'RobertoMinelli' project: 'DevFlow';
		package: 'ConfigurationOfDevFlow';
		load.
		(Smalltalk at: #ConfigurationOfDevFlow) perform: #loadAsUser.
		(Smalltalk at: #DFSettings) perform: #autoExportOnQuitEnabled: with: (true).
	]
runOnce: true
}
