package metodosNumericos;

import comportamentosComuns.EnviaMinimosQuadrados;
import comportamentosComuns.RegistrarNoDF;

import jade.core.*;
import jade.wrapper.AgentController;
import jade.wrapper.StaleProxyException;

public class MinimosQuadradosAgente extends Agent {
	private static final long serialVersionUID = 347281249379580532L;
	
	protected void setup() {
		addBehaviour(new RegistrarNoDF("MetodoNumerico", "MinimosQuadrados"));
		addBehaviour(new EnviaMinimosQuadrados());
	}
	
	protected void takeDown(){
		System.out.println("Agente morto "+ this.getLocalName());
		try {
			String nome = "MinimosQuadrados "+Math.random();
			AgentController agente = this.getContainerController().createNewAgent(nome, "metodosNumericos.MinimosQuadradosAgente", null);
			agente.start();
		} catch (StaleProxyException e) {
			e.printStackTrace();
		}
	}
}
