package comportamentosComuns;

import java.io.IOException;

import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;

public class Vender extends CyclicBehaviour {
	private static final long serialVersionUID = -6907071223712349071L;
//	double alavanca = LeituraArquivo.lerAlavancaProlog();
	
	@Override
	public void action() {
		ACLMessage msg = myAgent.receive();
		if(msg !=null){
			System.out.println("------------------------------------");
			System.out.println("O mercado está caindo");
			System.out.println("Hora de Vender com a alavanca" + 0.1);
			System.out.println("------------------------------------");
			try {
				EscreveArquivo.escreveDecisao("vender", 0.1);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else block();
	}
}
