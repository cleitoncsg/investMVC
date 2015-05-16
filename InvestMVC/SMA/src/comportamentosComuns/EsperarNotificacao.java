package comportamentosComuns;

import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;

public class EsperarNotificacao extends CyclicBehaviour {
	private static final long serialVersionUID = 2869779422034355018L;

	@Override
	public void action() {
		ACLMessage msg = myAgent.receive();
		if(msg !=null){
			String conteudo = msg.getContent();
			if(conteudo.equalsIgnoreCase("oportunidade")){
				myAgent.addBehaviour(new NotificarNegociadores());
			}
		}
		else block();

	}

}
