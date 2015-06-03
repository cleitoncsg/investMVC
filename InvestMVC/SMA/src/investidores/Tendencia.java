package investidores;

import java.io.IOException;

import comportamentosComuns.EsperarNotificacao;
import comportamentosComuns.RegistrarNoDF;
import comportamentosComuns.ReiniciaSistema;

import jade.core.Agent;
import jade.wrapper.StaleProxyException;

public class Tendencia extends Agent {
	private static final long serialVersionUID = 1340463054278418604L;

	protected void setup() {	
		addBehaviour(new RegistrarNoDF("VerificaTedencia", "Tendencia"));
		addBehaviour(new EsperarNotificacao());
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
