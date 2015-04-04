package investmvc.security

class Expert {

	static belongsTo = [user: User]

	String name
	String chartType
	String mathematicalMethods
	int numberOfCandles

    static constraints = {

    	chartType(blank:false, inList:["M1", "M5", "H1"] )
    	mathematicalMethods(blank:false, inList:["Correlacao", "Fibonacci", "Mínimos Quadrados"] )
    }
}
