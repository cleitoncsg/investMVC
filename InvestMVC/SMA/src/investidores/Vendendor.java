package investidores;

import comportamentosComuns.RegistrarNoDF;
import comportamentosComuns.Vender;

import jade.core.Agent;

public class Vendendor extends Agent {
	private static final long serialVersionUID = 5566772927053431524L;
	
	protected void setup() {
		addBehaviour(new RegistrarNoDF("Vender", "Vendendor"));
		addBehaviour(new Vender());
	}

}
