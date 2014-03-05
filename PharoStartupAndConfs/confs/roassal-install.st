StartupLoader default executeAtomicItems: {
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
