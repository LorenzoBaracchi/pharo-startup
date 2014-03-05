StartupLoader default executeAtomicItems: {
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
