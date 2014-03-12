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
	name: 'Installing Roassal'
	code: [
		Gofer new smalltalkhubUser: 'ObjectProfile'
        project: 'Roassal';
        package: 'ConfigurationOfRoassal';
        load.
      (Smalltalk at: #ConfigurationOfRoassal) load.
	]
runOnce: true
}
