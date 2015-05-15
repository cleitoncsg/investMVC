package investmvc.security

class Expert {

	static hasMany = [mathematicalMethods: String]

	String name
	String chartType
	List mathematicalMethods
	int numberOfCandles

    static constraints = {

    	chartType(blank:false, inList:["M1", "M5", "H1"] )
    }
}
	