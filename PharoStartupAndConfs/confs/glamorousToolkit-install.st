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
	name: 'Installing HacknEyed'
	code: [
		Gofer new
			squeaksource: 'glamoroust'; 
			package: 'ConfigurationOfGlamoroust';
			load.
		(Smalltalk at: #ConfigurationOfGlamoroust)
			perform: #loadDevelopment.
	]
runOnce: true
}
