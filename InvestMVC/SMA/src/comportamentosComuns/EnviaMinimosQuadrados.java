package comportamentosComuns;

import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;

public class EnviaMinimosQuadrados extends CyclicBehaviour {

	private static final long serialVersionUID = 7180922771811478672L;
	private ACLMessage resposta;
	
	@Override
	public void action() {
		ACLMessage msg = myAgent.receive();
		if(msg !=null){
			resposta= msg.createReply();
			System.out.println("O agente "+msg.getSender().getName() + "está se comunicando");
			String conteudo = msg.getContent();
			
			if(conteudo.equalsIgnoreCase("Pedido de informação")){
				
				resposta.setContent("Resposta Minimos Quadrados (para ser completada)");
				myAgent.send(resposta);
			}
		}
		else block();
	}

}
