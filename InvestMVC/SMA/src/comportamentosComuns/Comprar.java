package comportamentosComuns;

import java.io.IOException;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;


public class Comprar extends CyclicBehaviour {
	private static final long serialVersionUID = 8117839713833938344L;
//	double alavanca = LeituraArquivo.lerAlavancaProlog();
	@Override
	public void action() {
		ACLMessage msg = myAgent.receive();
		if(msg !=null){
			try {
			//RodarComandos.rodarComandoNoTerminal("./baseDeConhecimento");
			//para compilar um arquivo .pl:
			//% swipl -o exe -g meuFato -c hello.pl
			//% ./myexe
			
			System.out.println("------------------------------------");
			System.out.println("O mercado está subindo");
			System.out.println("Hora de Comprar com a alavanca" + 0.1);
			System.out.println("------------------------------------");
			
				EscreveArquivo.escreveDecisao("comprar", 0.1);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else block();
	}

}
