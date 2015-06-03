package metodosNumericos;

import java.io.IOException;

import comportamentosComuns.EnviarCorrelacao;
import comportamentosComuns.RegistrarNoDF;
import comportamentosComuns.ReiniciaSistema;

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
		try {
			ReiniciaSistema.reiniciaSMA(this);
		} catch (StaleProxyException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}