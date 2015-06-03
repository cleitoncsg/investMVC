package investidores;

import java.io.IOException;

import comportamentosComuns.RegistrarNoDF;
import comportamentosComuns.ReiniciaSistema;
import comportamentosComuns.Vender;

import jade.core.Agent;
import jade.wrapper.StaleProxyException;

public class Vendendor extends Agent {
	private static final long serialVersionUID = 5566772927053431524L;
	
	protected void setup() {
		addBehaviour(new RegistrarNoDF("Vender", "Vendendor"));
		addBehaviour(new Vender());
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
