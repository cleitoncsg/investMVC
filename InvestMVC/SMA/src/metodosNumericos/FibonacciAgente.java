package metodosNumericos;

import jade.core.Agent;
import jade.wrapper.AgentController;
import jade.wrapper.StaleProxyException;
import comportamentosComuns.EnviarFibonacci;
import comportamentosComuns.RegistrarNoDF;


public class FibonacciAgente extends Agent {

	private static final long serialVersionUID = -8500895218453943954L;

	protected void setup() {
		
		addBehaviour(new RegistrarNoDF("MetodoNumerico", "Fibonacci"));
		addBehaviour(new EnviarFibonacci());
	}
	
	protected void takeDown(){
		System.out.println("Agente morto "+ this.getLocalName());
		try {
			String nome = "Fibonacci "+Math.random();
			AgentController agente = this.getContainerController().createNewAgent(nome, "metodosNumericos.FibonacciAgente", null);
			agente.start();
		} catch (StaleProxyException e) {
			e.printStackTrace();
		}
	}
}
