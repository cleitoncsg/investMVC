package metodosNumericos;

import java.io.IOException;

import jade.core.Agent;
import jade.wrapper.AgentController;
import jade.wrapper.StaleProxyException;
import comportamentosComuns.EnviarFibonacci;
import comportamentosComuns.RegistrarNoDF;
import comportamentosComuns.ReiniciaSistema;


public class FibonacciAgente extends Agent {

	private static final long serialVersionUID = -8500895218453943954L;

	protected void setup() {
		
		addBehaviour(new RegistrarNoDF("MetodoNumerico", "Fibonacci"));
		addBehaviour(new EnviarFibonacci());
	}
	
	protected void takeDown(){
		try {
			ReiniciaSistema.reiniciaSMA(this);
		} catch (StaleProxyException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
