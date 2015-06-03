package investidores;

import java.io.IOException;

import comportamentosComuns.Comprar;
import comportamentosComuns.RegistrarNoDF;
import comportamentosComuns.ReiniciaSistema;
import jade.core.Agent;
import jade.wrapper.StaleProxyException;

public class Comprador extends Agent {
	private static final long serialVersionUID = 5566772927053431524L;
	
	protected void setup() {
		addBehaviour(new RegistrarNoDF("Comprar", "Comprador"));
		addBehaviour(new Comprar());
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
