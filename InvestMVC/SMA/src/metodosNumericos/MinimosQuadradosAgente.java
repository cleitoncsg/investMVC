package metodosNumericos;

import java.io.IOException;

import comportamentosComuns.EnviaMinimosQuadrados;
import comportamentosComuns.RegistrarNoDF;
import comportamentosComuns.ReiniciaSistema;

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
		try {
			ReiniciaSistema.reiniciaSMA(this);
		} catch (StaleProxyException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
