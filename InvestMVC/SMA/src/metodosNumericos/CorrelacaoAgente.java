package metodosNumericos;

import comportamentosComuns.EnviarCorrelacao;
import comportamentosComuns.RegistrarNoDF;

import jade.core.*;
import jade.wrapper.AgentController;
import jade.wrapper.StaleProxyException;

public class CorrelacaoAgente extends Agent{

	private static final long serialVersionUID = -7919542083794177881L;
	
	protected void setup(){
		addBehaviour(new RegistrarNoDF("MetodoNumerico", "Correlacao"));
		addBehaviour(new EnviarCorrelacao());
	}
	
	protected void takeDown(){
		System.out.println("Agente morto "+ this.getLocalName());
		try {
			String nome = "Correlacao "+Math.random();
			AgentController agente = this.getContainerController().createNewAgent(nome, "agenteQ.AgenteQ", null);
			agente.start();
		} catch (StaleProxyException e) {
			e.printStackTrace();
		}
	}

}