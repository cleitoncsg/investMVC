package investidores;

import comportamentosComuns.Comprar;
import comportamentosComuns.RegistrarNoDF;
import jade.core.Agent;

public class Comprador extends Agent {
	private static final long serialVersionUID = 5566772927053431524L;
	
	protected void setup() {
		addBehaviour(new RegistrarNoDF("Comprar", "Comprador"));
		addBehaviour(new Comprar());
	}
}