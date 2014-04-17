StartupLoader default executeAtomicItems: {
	StartupAction
		name: 'Squeak-source mirror'
		code: [
			Gofer new url: 'http://dsal.cl/squeaksource/ObjectsAsMethodsWrap'; package: 'ObjectAsMethodWrapper'; load.
			Gofer new url: 'http://dsal.cl/squeaksource/MonticelloRedirect'; package: 'MontiRedirect'; load.
			MRManager redirectFrom: 'http://www.squeaksource.com/' to: 'http://dsal.cl/squeaksource/'.
		]
	runOnce: true.

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
	runOnce: true.
	
	StartupAction
	name: 'Installing HacknEyed'
	code: [
		Gofer new
      	    url: 'http://smalltalkhub.com/mc/LorenzoBaracchi/hackneyed/main';
      	    package: 'ConfigurationOfHackneyed';
      	    load.
      (Smalltalk at: #ConfigurationOfHackneyed) loadDevelopment.
	]
runOnce: true
}
