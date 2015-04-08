package metodosNumericos;

import jade.core.Agent;
import comportamentosComuns.EnviarFibonacci;
import comportamentosComuns.RegistrarNoDF;


public class FibonacciAgente extends Agent {

	private static final long serialVersionUID = -8500895218453943954L;

	protected void setup() {
		
		addBehaviour(new RegistrarNoDF("MetodoNumerico", "Fibonacci"));
		addBehaviour(new EnviarFibonacci());
	}
}
