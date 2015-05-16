package metodosNumericos;

import comportamentosComuns.EnviaMinimosQuadrados;
import comportamentosComuns.RegistrarNoDF;

import jade.core.*;

public class MinimosQuadradosAgente extends Agent {
	private static final long serialVersionUID = 347281249379580532L;
	
	protected void setup() {
		addBehaviour(new RegistrarNoDF("MetodoNumerico", "MinimosQuadrados"));
		addBehaviour(new EnviaMinimosQuadrados());
	} 

}
